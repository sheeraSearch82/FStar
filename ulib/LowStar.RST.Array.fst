(*
   Copyright 2008-2019 Microsoft Research

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
module LowStar.RST.Array

let index (#a:Type) (b:A.array a) (i:UInt32.t) = reveal_array(); A.index b i

let upd (#a:Type) (b:A.array a) (i:UInt32.t) (v:a) =
  (**) reveal_array();
  (**) reveal_rst_inv();
  (**) reveal_modifies();
  (**) let h0 = HST.get () in
  A.upd b i v;
  (**) let h1 = HST.get () in
  (**) assert(modifies (array_resource b) (array_resource b) h0 h1);
  (**) assert(A.loc_includes (A.loc_not_unused_in h0) (as_loc (fp (array_resource b))));
  (**) A.loc_includes_adresses_loc_array #a b true; // TODO: find out why this pattern is not triggered
  (**) A.address_liveness_insensitive_addresses (A.frameOf b) (Set.singleton (A.as_addr b));
  (**) assert(A.modifies (A.address_liveness_insensitive_locs) h0 h1);
  (**) A.modifies_address_liveness_insensitive_unused_in h0 h1;
  (**) assert(A.loc_includes (A.loc_not_unused_in h1) (as_loc (fp (array_resource b))));
  (**) same_perm_seq_always_constant h0 h1 b

let alloc (#a:Type) (init:a) (len:UInt32.t) =
  (**) reveal_full_array();
  (**) reveal_rst_inv();
  (**) reveal_modifies();
  let b = A.alloc init len in
  (**) let h1 = HST.get () in
  (**) assert(forall (i:nat{i < A.vlength #a b}). A.get_perm #a h1 b i = FStar.Real.one); // Find out how to trigger that
  (**) A.loc_includes_adresses_loc_array #a b true;
  b

let free (#a:Type) (b:A.array a) =
  (**) reveal_full_array();
  (**) reveal_empty_resource();
  (**) reveal_rst_inv();
  (**) reveal_modifies();
  A.free b

let share #a b =
  (**) reveal_array();
  (**) reveal_rst_inv();
  (**) reveal_modifies();
  (**) reveal_star();
  let b' = A.share b in
  b'

let merge #a b b' =
  (**) reveal_array();
  (**) reveal_rst_inv();
  (**) reveal_modifies();
  (**) reveal_star();
  A.merge #a b b'

let split #a b idx =
  (**) reveal_array ();
  (**) reveal_rst_inv ();
  (**) reveal_modifies ();
  (**) reveal_star ();
  (**) let h0 = HST.get () in
  let (b1, b2) = A.split #a b idx in
  (**) let h1 = HST.get () in
  (**) reveal_star_inv (array_resource b1) (array_resource b2) h1;
  (**) let aux1 (i:nat{i < A.vlength b1}) (j:nat{j < A.vlength b1}) : Lemma (A.get_perm h1 b1 i == A.get_perm h1 b1 j) =
  (**)   assert(A.get_perm h1 b1 i = A.get_perm h0 b i);
  (**)   assert(A.get_perm h1 b1 j = A.get_perm h0 b j)
  (**) in
  (**) Classical.forall_intro_2 aux1;
  (**) let aux2 (i:nat{i < A.vlength b2}) (j:nat{j < A.vlength b2}) : Lemma (A.get_perm h1 b2 i == A.get_perm h1 b2 j) =
  (**)   assert(A.get_perm h1 b2 i = A.get_perm h0 b (i + A.vlength b1));
  (**)   assert(A.get_perm h1 b2 j = A.get_perm h0 b (j + A.vlength b1))
  (**) in
  (**) Classical.forall_intro_2 aux2;
  (**) assert(forall(i:nat{i < A.vlength b2}). (A.get_perm h1 b2 i == A.get_perm h0 b (i + A.vlength b1)));
  (**) A.loc_union_is_split_into #a b b1 b2;
  (b1, b2)

#push-options "--z3rlimit 10"

let glue #a b b1 b2 =
  (**) assert(A.is_split_into b (b1,b2));
  (**) reveal_array ();
  (**) reveal_rst_inv ();
  (**) reveal_modifies ();
  (**) reveal_star ();
  (**) let h0 = HST.get () in
  (**) reveal_star_inv (array_resource b1) (array_resource b2) h0;
  A.glue #a b b1 b2;
  (**) let h1 = HST.get () in
  (**) let aux (i:nat{i < A.vlength b}) (j:nat{j < A.vlength b}) : Lemma (A.get_perm h1 b i == A.get_perm h1 b j) =
  (**)   begin if i < A.vlength b1 then
  (**)     assert(A.get_perm h1 b i = A.get_perm h0 b1 i)
  (**)   else
  (**)     assert(A.get_perm h1 b i = A.get_perm h0 b2 (i - A.vlength b1))
  (**)   end;
  (**)   if j < A.vlength b1 then
  (**)     assert(A.get_perm h1 b j = A.get_perm h0 b1 j)
  (**)   else
  (**)     assert(A.get_perm h1 b j = A.get_perm h0 b2 (j - A.vlength b1))
  (**) in
  (**) Classical.forall_intro_2 aux;
  (**) assert(A.modifies A.loc_none h0 h1);
  (**) A.loc_includes_none (A.loc_array b);
  (**) assert(A.modifies (A.loc_array b) h0 h1);
  (**) assert(A.is_split_into b (b1,b2));
  (**) A.loc_union_is_split_into b b1 b2

#pop-options

let frame_full_pre (#a:Type) (b:A.array a) (res:resource) (pre:r_pre (array_resource b <*> res))
  (h:imem (inv (full_array_resource b <*> res)))
  =
  reveal_full_array();
  reveal_array();
  reveal_star();
  pre h /\
  sel (array_view b) h == sel (full_array_view b) h

let frame_full_post(#t:Type)
                   (#a:Type)
                   (b:A.array a)
                   (res0:resource)
                   (res1:t -> resource)
                   (pre:r_pre (array_resource b <*> res0))
                   (post:r_post (array_resource b <*> res0) t (fun x -> array_resource b <*> res1 x))
                   (h0:imem (inv (full_array_resource b <*> res0)))
                   (x:t)
                   (h1:imem (inv (full_array_resource b <*> res1 x)))
    = reveal_array();
      reveal_full_array();
      reveal_star();
      post h0 x h1 /\
      sel (array_view b) h1 == sel (full_array_view b) h1

let frame_full_array (#t:Type) (#a:Type) (b:A.array a)
    (res0:resource)
    (res1:t -> resource)
    (#pre:r_pre (array_resource b <*> res0))
    (#post:r_post (array_resource b <*> res0) t (fun x -> array_resource b <*> res1 x))
    ($f:unit -> RST t (array_resource b <*> res0) (fun x -> array_resource b <*> res1 x) pre post)
    : RST t
      (full_array_resource b <*> res0)
      (fun x -> full_array_resource b <*> res1 x)
      (frame_full_pre b res0 pre)
      (frame_full_post b res0 res1 pre post)
   = reveal_modifies();
     reveal_rst_inv();
     reveal_array();
     reveal_star();
     let h0 = HST.get() in
     let x = f() in
     let h1 = HST.get() in
     A.loc_includes_disjoint_elim (as_loc (fp (res1 x))) (A.loc_array b) (A.loc_union (as_loc (fp res0)) (A.loc_unused_in h0));
     A.unused_in_not_unused_in_disjoint_2 (A.loc_unused_in h0) (A.loc_not_unused_in h0) (A.loc_unused_in h0) (A.loc_not_unused_in h0) h0;
     x
