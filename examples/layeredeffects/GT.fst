module GT

open FStar.Tactics

// GM: Originally wanted to include Dv too: that is not so easy,
//     the [unit -> Dv a] type lives in universe level 0, differently
//     from the others, which prevents us from writing a universe-polymorphic
//     [m] type. Cumulativity would solve this. Leaving it out for now.
type idx =
 | T
 | G
 //| D

// GM: Force a type equality by SMT
let coerce #a #b (x:a{a == b}) : b = x

let m (a:Type u#aa) (i:idx) : Type u#aa =
  match i with
  | T -> unit -> Tot  a
  | G -> unit -> GTot a
  //| D -> unit -> Dv   a

let t_return #a (x:a) : m a T = (fun () -> x)
let g_return #a (x:a) : m a G = (fun () -> x)
//let d_return #a (x:a) : m a D = (fun () -> x)

let return (a:Type) (x:a) (i:idx) : m a i =
  match i with
  | T -> t_return x
  | G -> g_return x
  //| D -> d_return x

let t_bind #a #b (c : m a T) (f : a -> m b T) : m b T = fun () -> f (c ()) ()
let g_bind #a #b (c : m a G) (f : a -> m b G) : m b G = fun () -> f (c ()) ()
//let d_bind #a #b (c : m D a) (f : a -> m D b) : m D b = fun () -> f (c ()) ()

let bind (a b : Type) (i:idx) (c : m a i) (f : a -> m b i) : m b i =
  match i with
  | T -> t_bind #a #b c f
  | G -> g_bind #a #b c f
  //| D -> coerce (d_bind #a #b c f <: m D b)
  // ^ needed a coerce too

// Already somewhat usable
let rec r_map #i #a #b (f : a -> m b i) (xs : list a) : m (list b) i =
  match xs with
  | [] -> return _ [] _
  | x::xs ->
    bind _ _ _ (f x) (fun y ->
    bind _ _ _ (r_map f xs) (fun ys ->
    return _ (y::ys) _))

let t1_t () : Tot (list int) = r_map #T (fun x -> fun () -> x + 1) [1;2;3;4] ()
let t1_g () : GTot (list int) = r_map #G (fun x -> fun () -> x + 1) [1;2;3;4] ()
//let t1_d () : Dv (list int) = map #D (fun x -> fun () -> x + 1) [1;2;3;4] ()

let subcomp (a:Type) (i:idx) (f : m a i) : m a i = f

let if_then_else (a:Type) (i:idx) (f : m a i) (g : m a i) (p : Type0) : Type = m a i

// GM: Would be nice to not have to use all explicit args everywhere,
//     and to get better errors especially when args are out of order,
//     e.g. the [idx] in [return] needs to come after [x], otherwise
//     we get an assertion failure trying to prove [forall (a: Type). idx == a].

reifiable
reflectable
layered_effect {
  GTD : a:Type -> idx -> Effect
  with
  repr         = m;
  return       = return;
  bind         = bind;
  subcomp      = subcomp;
  if_then_else = if_then_else
}

let lift_pure_gtd (a:Type) (wp : pure_wp a) (i : idx)
                  (f : unit -> PURE a wp)
                 : Pure (m a i)
                        (requires (wp (fun _ -> True) /\ (forall p1 p2. (forall x. p1 x ==> p2 x) ==> wp p1 ==> wp p2)))
                        (ensures (fun _ -> True))
 = f
 // GM: Surprised that this works actually... I expected that I would need to
 //     case analyze [i].

sub_effect PURE ~> GTD = lift_pure_gtd

let rec map #a #b #i (f : a -> GTD b i) (xs : list a) : GTD (list b) i =
  match xs with
  | [] -> []
  | x::xs -> (f x)::(map f xs)

let app #a #b #i (f : a -> GTD b i) (x : a) : GTD b i = f x

#set-options "--debug GT --debug_level SMTQuery"

// GM: This fails, but I'm not sure why. With tactica (after compute) I see
// the failing goal is
//
//  … @ …ido/r/fstar/layef/GT.fst(106,80-106,86)  Wed Jun 10 22:26:42 2020
//  Goal 1/26
//  a: Type
//  i: idx
//  n: nat
//  f: _: a -> GT.GTD a i
//  x: a
//  x'0: nat
//  uu___: l_True /\ l_True /\ ~(x'0 == 0)
//  x'1: nat
//  x'2: x'0 == x'1
//  x'3: unit
//  x'4: a
//  --------------------------------------------------------------------------------
//  squash (n - 1 >= 0)
//  (*?u509*) _
//
// which seems odd, since [n] and [x'0] are disconnected.

open FStar.Tactics

[@@expect_failure [19]]
let rec appn #a #i (n:nat) (f : a -> GTD a i) (x : a) : GTD a i =
  match n with 
  | 0 -> x
  | _ -> begin
    assume (n>0);
    appn (n-1) f (f x)
  end

// explodes
//[@@expect_failure]
//let test #a #i (n:int) : GTD nat i =
//  let r = app abs n in
//  r

let labs0 #i (n:int) : GTD int i =
  if n < 0
  then -n
  else n
  
let labs #i (n:int) : GTD nat i =
  if n < 0
  then -n
  else n

// GM: This fails, which I think makes sense since the effect
//     doesn't carry any logical payload, so the assume gets lost?
[@@expect_failure]
let test #a #i (n:int) : GTD nat i =
  let r = labs0 n in
  assume (r >= 0);
  r
