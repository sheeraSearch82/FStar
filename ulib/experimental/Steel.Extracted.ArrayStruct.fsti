(*
   Copyright 2020 Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)

module Steel.Extracted.ArrayStruct

module AS = Steel.PCM.ArrayStruct
module Mem = Steel.PCM.Memory
module SizeT = Steel.SizeT
module Map = FStar.Map


open FStar.FunctionalExtensionality
module PCM = Steel.PCM
module UPCM = Steel.PCM.Unitless
module UPCMBase = Steel.PCM.Unitless.Base
module PCMBase = Steel.PCM.Base

open Steel.PCM.Effect
open Steel.PCM.Memory

/// This module defines a mechanism for extracting arraystructs compatible with separation logic
/// into C arraystructs via Kremlin

#set-options "--fuel 0 --ifuel 0"

(* foo is the view of what you're storing *)
type foo : Type u#1 =
  | MkFoo : x: UInt32.t -> y: UInt32.t -> z: UInt64.t -> foo

(* low_foo is the low-level representation of [foo] *)
type low_foo : Type u#1 = {
  xy: Seq.lseq UInt32.t 2;
  z: UInt64.t
}

val foo_to_low_foo : foo -> low_foo

(* The representation of the objects managed by [foo_pcm] in memory is low_foo *)
(* [@@repr [low_foo, foo_to_low_foo, low_foo_to_foo]] *)
val foo_pcm : PCM.pcm foo
(* Suppose the [foo_pcm] mandates that z >= x + y *)

class low_level_type (a: Type u#a) = {
  pcm: PCM.pcm a;
  low_a: Type u#a;
  a_to_low_a: a -> low_a;
}

(* Check by tactic that [low_a] corresponds to something like Steel.PCM.ArrayStruct.descriptor *)

(*
  Second tactic : if [a] is already in the [low_a] format, then have a tactic that metaprograms
  all the getters and setters.
  Future work, only after we have a working setup
*)

instance low_level_foo : low_level_type foo = {
  pcm = foo_pcm;
  low_a = low_foo;
  a_to_low_a = foo_to_low_foo;
}

open FStar.Tactics.Typeclasses

(* Raise a GitHub issue for a typeclass syntax withing val signatures *)
let ref (a: Type u#a) (#[tcresolve ()] ca:low_level_type a) : Type u#0  = ref a ca.pcm

let ref_hprop (#a: Type u#a) (#[tcresolve ()] ca:low_level_type a) (r: ref a) : slprop u#a =
  h_exists (pts_to r)

(* Buggy, use selectors here*)
val sel (#a: Type) (#[tcresolve ()] ca:low_level_type a) (r: ref a) (h: hmem (ref_hprop r))  : GTot a

#set-options "--print_implicits --print_universes --z3rlimit 20 --prn"

val alloc
  (#a: Type u#1) (#[FStar.Tactics.Typeclasses.tcresolve ()] ca: low_level_type a)
  (v: a) (#[FStar.Tactics.exact (quote (ca.a_to_low_a v))] v_low: ca.low_a)
    : Steel (ref a #ca) emp (fun r -> ref_hprop r) (fun _ -> True) (fun _ r h1 -> (* sel h1 r == v*) True)

let main () =
  alloc #foo (MkFoo 0ul 0ul 1UL)


(* You have to give update_z because you have to justify this with regards to [foo_pcm] *)


val update: unit -> Tot unit
val get: unit -> Tot unit
val focus: unit -> Tot unit
val explode: unit -> Tot unit
val op_String_Access : unit -> Tot unit

open FStar.Tactics

let check (src: string) : Tac unit =
  let _ = lookup_typ (top_env ()) (cur_module () @ [ src ]) in
  exact (`(()))

(* What checks for this attribute ?
    - number of arguments: 2
    - first argument is ref to type that has low_level_type typeclass
    - [low_foo] is [low_a] for that typeclass
    - z is a field of low_foo (low_foo has to be a record)
    - postcondition implies that (a_to_low_a (sel h1 r))  == { a_to_low_a (sel h0 r) with z = new_val }
  *)
[@@ update low_foo.z]
val update_z (r: ref foo) (new_val: UInt64.t)
    : Steel unit (ref_hprop r) (fun _ -> ref_hprop r) (
      let pre : hmem (ref_hprop r) -> prop = fun h0 ->
        if UInt64.v new_val >= UInt32.v (sel r h0).x + UInt32.v (sel r h0).y then
          True else False
      in
      assume(respects_fp pre);
      pre
    ) (
      let post : hmem (ref_hprop r) -> unit -> hmem (ref_hprop r) -> prop  =
        fun h0 _ h1 -> (sel r h1) == MkFoo (sel r h0).x (sel r h0).y new_val
      in
      assume(respects_binary_fp post);
      post
    )

let _ : unit  = _ by (check (`%update_z))

(* What does this attribute check ?
    - number of arguments: 2
    - first argument is ref to type that has low_level_type typeclass
    - [low_foo] is [low_a] for that typeclass
    - .x.[0] is a subpath of low_foo
    - postcondition (fun h0 x h1) implies that (
      a_to_low_a (sel h0 r) == a_to_low_a (sel h1 r) /\
      x == a_to_low_a (sel h1 r).x.[0]
     )
*)

[@@get low_foo.x.[0]]
val get_x (r: ref foo)
  : Steel UInt32.t (ref_hprop r) (fun _ -> ref_hprop r) (fun _ -> True) (
    let post : hmem (ref_hprop r) -> UInt32.t -> hmem (ref_hprop r) -> prop =
      fun h0 x h1 -> (sel r h0 == sel r h1 /\ x == (sel r h1).x)
    in
    assume(respects_binary_fp post);
    post
  )

(* Language of attributes :
   [@@ update low_struct.field]
   [@@ update low_array.index] and paths thereof
   [@@ read low_struct.field]
   [@@ read low_array.index] and paths thereof
   [@@ focus low_struct.field -> field_low]
   [@@ explode low_struct -> [field1_low; field2_low]]
*)

val u32_pcm : PCM.pcm (Universe.raise_t u#0 u#1 UInt32.t)

instance low_level_x : low_level_type (Universe.raise_t u#0 u#1 UInt32.t) = {
  pcm = u32_pcm;
  low_a = (Universe.raise_t u#0 u#1 UInt32.t);
  a_to_low_a = (fun x -> x);
}

val wand_lemma (p1 p2:slprop u#a) : Lemma ((p1 `star` (wand p1 p2)) `equiv` p2)

/// Ok we have getters and setters. But what about addresses ? We need:
/// - a type for the sub-object that you want to take address
/// - a PCM governing the values of the sub-object
/// - a magic_wand to focus on the sub-object
/// - an explode operation that explodes a parent object into multiple sub-objects


(* This yields a magic wand in the function's signature. Things checked by the attribute:
    - number of arguments: 1
    - first argument is ref to type that has low_level_type typeclass
    - [low_foo] is [low_a] for that typeclass
    - x.[0] is a subpath of low_foo
    - return type is ref to type that has the second low_level_type typeclass
    - postcondition implies
      a_to_low_a (sel h0 r) == a_to_low_a (sel h1 r) /\ (sel h1 r') == (sel h0 r).x
*)

[@@focus low_foo.x.[0] -> low_level_x]
val focus_x (r: ref foo)
  : Steel (ref (Universe.raise_t UInt32.t)) (ref_hprop r) (fun r' ->
   ref_hprop r' `star`
   wand (ref_hprop r') (ref_hprop r)
 ) (fun _ -> True) (
   let post :
     hmem (ref_hprop r) ->
     (r': ref (Universe.raise_t UInt32.t) #low_level_x) ->
     hmem ((ref_hprop r') `star`  wand (ref_hprop r') (ref_hprop r)) ->
     prop
   =
     fun h0 r' h1 ->
       wand_lemma (ref_hprop r') (ref_hprop r);
       (sel r h0) == (sel r h1) /\ Universe.downgrade_val (sel r' h0) == (sel r h0).x
   in
   assume(respects_binary_fp post);
   post
 )

val u64_pcm : PCM.pcm (Universe.raise_t u#0 u#1 UInt64.t)

instance low_level_z : low_level_type (Universe.raise_t u#0 u#1 UInt64.t) = {
  pcm = u64_pcm;
  low_a = Universe.raise_t u#0 u#1 UInt64.t;
  a_to_low_a = (fun x -> x);
}

val xy_pcm : PCM.pcm (Seq.lseq (Universe.raise_t UInt32.t) 2)

instance low_level_xy : low_level_type (Seq.lseq u#1 (Universe.raise_t UInt32.t) 2) = {
  pcm = xy_pcm;
  low_a = (Seq.lseq (Universe.raise_t UInt32.t) 2);
  a_to_low_a = (fun x -> x);
}

let foo_to_xy_z (x: foo)
  : Tot (Seq.lseq (Universe.raise_t UInt32.t) 2 & Universe.raise_t UInt64.t)
  =
  let s = Seq.init 2 (fun i -> Universe.raise_val (if i = 0 then x.x else x.y)) in
  (s, Universe.raise_val (MkFoo?.z x))

(* This yields the totality of the parent object but exploded in slprops.
  Things checked by the attribute:
    - number of arguments: 1
    - first argument is ref to type that has low_level_type typeclass
    - [low_foo] is [low_a] for that typeclass
    - possibly check for a path of low_foo
    - return type is tupleof refs to the right typeclasses
    - postcondition implies
       a_to_low_a (sel h0 r) == a_to_low_a (sel h1 r) /\
       (sel h1 r1', sel h1 r2') == foo_to_xy_z (sel h0 r)
*)
[@@explode low_foo -> (low_level_xy, low_level_z) -> foo_to_xy_z]
val explode_xy_z (r: ref foo)
  : Steel (
    ref (Seq.lseq (Universe.raise_t UInt32.t) 2) #low_level_xy &
    ref (Universe.raise_t UInt64.t)
  )
  (ref_hprop r) (fun (r1, r2) ->
    ref_hprop r1 `star` ref_hprop r2 `star`
    wand (ref_hprop r1 `star` ref_hprop r2) (ref_hprop r)
  )
  (fun _ -> True) (
    let post:
      hmem (ref_hprop r) ->
      (r': (ref (Seq.lseq (Universe.raise_t UInt32.t) 2) #low_level_xy &
           ref (Universe.raise_t UInt64.t))) ->
      hmem (ref_hprop (fst r') `star` ref_hprop (snd r') `star`
        wand (ref_hprop (fst r') `star` ref_hprop (snd r')) (ref_hprop r)
      ) ->
      prop
    =
     fun h0 (r1, r2) h1 ->
       wand_lemma (ref_hprop r1 `star` ref_hprop r2) (ref_hprop r);
       Universe.downgrade_val (Seq.index (sel r1 h1) 0) == MkFoo?.x (sel r h0) /\
       Universe.downgrade_val (Seq.index (sel r1 h1) 1) == (sel r h0).y /\
       Universe.downgrade_val (sel r2 h1) == MkFoo?.z (sel r h0) /\
       sel r h0 == sel r h1
    in
    assume(respects_binary_fp post);
    post
  )
