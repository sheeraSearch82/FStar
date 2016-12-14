
open Prims

type step =
| Beta
| Iota
| Zeta
| Exclude of step
| WHNF
| Primops
| Eager_unfolding
| Inlining
| NoDeltaSteps
| UnfoldUntil of FStar_Syntax_Syntax.delta_depth
| PureSubtermsWithinComputations
| Simplify
| EraseUniverses
| AllowUnboundUniverses
| Reify
| CompressUvars
| NoFullNorm 
 and steps =
step Prims.list


let is_Beta = (fun _discr_ -> (match (_discr_) with
| Beta (_) -> begin
true
end
| _ -> begin
false
end))


let is_Iota = (fun _discr_ -> (match (_discr_) with
| Iota (_) -> begin
true
end
| _ -> begin
false
end))


let is_Zeta = (fun _discr_ -> (match (_discr_) with
| Zeta (_) -> begin
true
end
| _ -> begin
false
end))


let is_Exclude = (fun _discr_ -> (match (_discr_) with
| Exclude (_) -> begin
true
end
| _ -> begin
false
end))


let is_WHNF = (fun _discr_ -> (match (_discr_) with
| WHNF (_) -> begin
true
end
| _ -> begin
false
end))


let is_Primops = (fun _discr_ -> (match (_discr_) with
| Primops (_) -> begin
true
end
| _ -> begin
false
end))


let is_Eager_unfolding = (fun _discr_ -> (match (_discr_) with
| Eager_unfolding (_) -> begin
true
end
| _ -> begin
false
end))


let is_Inlining = (fun _discr_ -> (match (_discr_) with
| Inlining (_) -> begin
true
end
| _ -> begin
false
end))


let is_NoDeltaSteps = (fun _discr_ -> (match (_discr_) with
| NoDeltaSteps (_) -> begin
true
end
| _ -> begin
false
end))


let is_UnfoldUntil = (fun _discr_ -> (match (_discr_) with
| UnfoldUntil (_) -> begin
true
end
| _ -> begin
false
end))


let is_PureSubtermsWithinComputations = (fun _discr_ -> (match (_discr_) with
| PureSubtermsWithinComputations (_) -> begin
true
end
| _ -> begin
false
end))


let is_Simplify = (fun _discr_ -> (match (_discr_) with
| Simplify (_) -> begin
true
end
| _ -> begin
false
end))


let is_EraseUniverses = (fun _discr_ -> (match (_discr_) with
| EraseUniverses (_) -> begin
true
end
| _ -> begin
false
end))


let is_AllowUnboundUniverses = (fun _discr_ -> (match (_discr_) with
| AllowUnboundUniverses (_) -> begin
true
end
| _ -> begin
false
end))


let is_Reify = (fun _discr_ -> (match (_discr_) with
| Reify (_) -> begin
true
end
| _ -> begin
false
end))


let is_CompressUvars = (fun _discr_ -> (match (_discr_) with
| CompressUvars (_) -> begin
true
end
| _ -> begin
false
end))


let is_NoFullNorm = (fun _discr_ -> (match (_discr_) with
| NoFullNorm (_) -> begin
true
end
| _ -> begin
false
end))


let ___Exclude____0 = (fun projectee -> (match (projectee) with
| Exclude (_54_13) -> begin
_54_13
end))


let ___UnfoldUntil____0 = (fun projectee -> (match (projectee) with
| UnfoldUntil (_54_16) -> begin
_54_16
end))


type closure =
| Clos of (env * FStar_Syntax_Syntax.term * (env * FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo * Prims.bool)
| Univ of FStar_Syntax_Syntax.universe
| Dummy 
 and env =
closure Prims.list


let is_Clos = (fun _discr_ -> (match (_discr_) with
| Clos (_) -> begin
true
end
| _ -> begin
false
end))


let is_Univ = (fun _discr_ -> (match (_discr_) with
| Univ (_) -> begin
true
end
| _ -> begin
false
end))


let is_Dummy = (fun _discr_ -> (match (_discr_) with
| Dummy (_) -> begin
true
end
| _ -> begin
false
end))


let ___Clos____0 = (fun projectee -> (match (projectee) with
| Clos (_54_19) -> begin
_54_19
end))


let ___Univ____0 = (fun projectee -> (match (projectee) with
| Univ (_54_22) -> begin
_54_22
end))


let closure_to_string : closure  ->  Prims.string = (fun _54_1 -> (match (_54_1) with
| Clos (_54_25, t, _54_28, _54_30) -> begin
(FStar_Syntax_Print.term_to_string t)
end
| Univ (_54_34) -> begin
"Univ"
end
| Dummy -> begin
"dummy"
end))


type cfg =
{steps : steps; tcenv : FStar_TypeChecker_Env.env; delta_level : FStar_TypeChecker_Env.delta_level Prims.list}


let is_Mkcfg : cfg  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkcfg"))))


type branches =
(FStar_Syntax_Syntax.pat * FStar_Syntax_Syntax.term Prims.option * FStar_Syntax_Syntax.term) Prims.list


type subst_t =
FStar_Syntax_Syntax.subst_elt Prims.list


type stack_elt =
| Arg of (closure * FStar_Syntax_Syntax.aqual * FStar_Range.range)
| UnivArgs of (FStar_Syntax_Syntax.universe Prims.list * FStar_Range.range)
| MemoLazy of (env * FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo
| Match of (env * branches * FStar_Range.range)
| Abs of (env * FStar_Syntax_Syntax.binders * env * (FStar_Syntax_Syntax.lcomp, FStar_Syntax_Syntax.residual_comp) FStar_Util.either Prims.option * FStar_Range.range)
| App of (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.aqual * FStar_Range.range)
| Meta of (FStar_Syntax_Syntax.metadata * FStar_Range.range)
| Let of (env * FStar_Syntax_Syntax.binders * FStar_Syntax_Syntax.letbinding * FStar_Range.range)
| Steps of (steps * FStar_TypeChecker_Env.delta_level Prims.list)
| Debug of FStar_Syntax_Syntax.term


let is_Arg = (fun _discr_ -> (match (_discr_) with
| Arg (_) -> begin
true
end
| _ -> begin
false
end))


let is_UnivArgs = (fun _discr_ -> (match (_discr_) with
| UnivArgs (_) -> begin
true
end
| _ -> begin
false
end))


let is_MemoLazy = (fun _discr_ -> (match (_discr_) with
| MemoLazy (_) -> begin
true
end
| _ -> begin
false
end))


let is_Match = (fun _discr_ -> (match (_discr_) with
| Match (_) -> begin
true
end
| _ -> begin
false
end))


let is_Abs = (fun _discr_ -> (match (_discr_) with
| Abs (_) -> begin
true
end
| _ -> begin
false
end))


let is_App = (fun _discr_ -> (match (_discr_) with
| App (_) -> begin
true
end
| _ -> begin
false
end))


let is_Meta = (fun _discr_ -> (match (_discr_) with
| Meta (_) -> begin
true
end
| _ -> begin
false
end))


let is_Let = (fun _discr_ -> (match (_discr_) with
| Let (_) -> begin
true
end
| _ -> begin
false
end))


let is_Steps = (fun _discr_ -> (match (_discr_) with
| Steps (_) -> begin
true
end
| _ -> begin
false
end))


let is_Debug = (fun _discr_ -> (match (_discr_) with
| Debug (_) -> begin
true
end
| _ -> begin
false
end))


let ___Arg____0 = (fun projectee -> (match (projectee) with
| Arg (_54_43) -> begin
_54_43
end))


let ___UnivArgs____0 = (fun projectee -> (match (projectee) with
| UnivArgs (_54_46) -> begin
_54_46
end))


let ___MemoLazy____0 = (fun projectee -> (match (projectee) with
| MemoLazy (_54_49) -> begin
_54_49
end))


let ___Match____0 = (fun projectee -> (match (projectee) with
| Match (_54_52) -> begin
_54_52
end))


let ___Abs____0 = (fun projectee -> (match (projectee) with
| Abs (_54_55) -> begin
_54_55
end))


let ___App____0 = (fun projectee -> (match (projectee) with
| App (_54_58) -> begin
_54_58
end))


let ___Meta____0 = (fun projectee -> (match (projectee) with
| Meta (_54_61) -> begin
_54_61
end))


let ___Let____0 = (fun projectee -> (match (projectee) with
| Let (_54_64) -> begin
_54_64
end))


let ___Steps____0 = (fun projectee -> (match (projectee) with
| Steps (_54_67) -> begin
_54_67
end))


let ___Debug____0 = (fun projectee -> (match (projectee) with
| Debug (_54_70) -> begin
_54_70
end))


type stack =
stack_elt Prims.list


let mk = (fun t r -> (FStar_Syntax_Syntax.mk t None r))


let set_memo = (fun r t -> (match ((FStar_ST.read r)) with
| Some (_54_76) -> begin
(FStar_All.failwith "Unexpected set_memo: thunk already evaluated")
end
| None -> begin
(FStar_ST.op_Colon_Equals r (Some (t)))
end))


let env_to_string : closure Prims.list  ->  Prims.string = (fun env -> (let _151_231 = (FStar_List.map closure_to_string env)
in (FStar_All.pipe_right _151_231 (FStar_String.concat "; "))))


let stack_elt_to_string : stack_elt  ->  Prims.string = (fun _54_2 -> (match (_54_2) with
| Arg (c, _54_83, _54_85) -> begin
(let _151_234 = (closure_to_string c)
in (FStar_Util.format1 "Closure %s" _151_234))
end
| MemoLazy (_54_89) -> begin
"MemoLazy"
end
| Abs (_54_92, bs, _54_95, _54_97, _54_99) -> begin
(let _151_235 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length bs))
in (FStar_Util.format1 "Abs %s" _151_235))
end
| UnivArgs (_54_103) -> begin
"UnivArgs"
end
| Match (_54_106) -> begin
"Match"
end
| App (t, _54_110, _54_112) -> begin
(let _151_236 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.format1 "App %s" _151_236))
end
| Meta (m, _54_117) -> begin
"Meta"
end
| Let (_54_121) -> begin
"Let"
end
| Steps (s, _54_125) -> begin
"Steps"
end
| Debug (t) -> begin
(let _151_237 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.format1 "Debug %s" _151_237))
end))


let stack_to_string : stack_elt Prims.list  ->  Prims.string = (fun s -> (let _151_240 = (FStar_List.map stack_elt_to_string s)
in (FStar_All.pipe_right _151_240 (FStar_String.concat "; "))))


let log : cfg  ->  (Prims.unit  ->  Prims.unit)  ->  Prims.unit = (fun cfg f -> if (FStar_TypeChecker_Env.debug cfg.tcenv (FStar_Options.Other ("Norm"))) then begin
(f ())
end else begin
()
end)


let is_empty = (fun _54_3 -> (match (_54_3) with
| [] -> begin
true
end
| _54_136 -> begin
false
end))


let lookup_bvar = (fun env x -> try
(match (()) with
| () -> begin
(FStar_List.nth env x.FStar_Syntax_Syntax.index)
end)
with
| _54_143 -> begin
(let _151_256 = (let _151_255 = (FStar_Syntax_Print.db_to_string x)
in (FStar_Util.format1 "Failed to find %s\n" _151_255))
in (FStar_All.failwith _151_256))
end)


let comp_to_comp_typ : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp_typ = (fun env c -> (

let c = (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (t, None) -> begin
(

let u = (env.FStar_TypeChecker_Env.universe_of env t)
in (FStar_Syntax_Syntax.mk_Total' t (Some (u))))
end
| FStar_Syntax_Syntax.GTotal (t, None) -> begin
(

let u = (env.FStar_TypeChecker_Env.universe_of env t)
in (FStar_Syntax_Syntax.mk_GTotal' t (Some (u))))
end
| _54_159 -> begin
c
end)
in (FStar_Syntax_Util.comp_to_comp_typ c)))


let rec unfold_effect_abbrev : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp_typ = (fun env comp -> (

let c = (comp_to_comp_typ env comp)
in (match ((FStar_TypeChecker_Env.lookup_effect_abbrev env c.FStar_Syntax_Syntax.comp_univs c.FStar_Syntax_Syntax.effect_name)) with
| None -> begin
c
end
| Some (binders, cdef) -> begin
(

let _54_171 = (FStar_Syntax_Subst.open_comp binders cdef)
in (match (_54_171) with
| (binders, cdef) -> begin
(

let _54_172 = if ((FStar_List.length binders) <> ((FStar_List.length c.FStar_Syntax_Syntax.effect_args) + (Prims.parse_int "1"))) then begin
(Prims.raise (FStar_Syntax_Syntax.Error ((("Effect constructor is not fully applied"), (comp.FStar_Syntax_Syntax.pos)))))
end else begin
()
end
in (

let inst = (let _151_268 = (let _151_267 = (FStar_Syntax_Syntax.as_arg c.FStar_Syntax_Syntax.result_typ)
in (_151_267)::c.FStar_Syntax_Syntax.effect_args)
in (FStar_List.map2 (fun _54_177 _54_181 -> (match (((_54_177), (_54_181))) with
| ((x, _54_176), (t, _54_180)) -> begin
FStar_Syntax_Syntax.NT (((x), (t)))
end)) binders _151_268))
in (

let c1 = (FStar_Syntax_Subst.subst_comp inst cdef)
in (

let c = (let _151_269 = (

let _54_184 = (comp_to_comp_typ env c1)
in {FStar_Syntax_Syntax.comp_univs = _54_184.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = _54_184.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = _54_184.FStar_Syntax_Syntax.result_typ; FStar_Syntax_Syntax.effect_args = _54_184.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = c.FStar_Syntax_Syntax.flags})
in (FStar_All.pipe_right _151_269 FStar_Syntax_Syntax.mk_Comp))
in (unfold_effect_abbrev env c)))))
end))
end)))


let downgrade_ghost_effect_name : FStar_Ident.lident  ->  FStar_Ident.lident Prims.option = (fun l -> if (FStar_Ident.lid_equals l FStar_Syntax_Const.effect_Ghost_lid) then begin
Some (FStar_Syntax_Const.effect_Pure_lid)
end else begin
if (FStar_Ident.lid_equals l FStar_Syntax_Const.effect_GTot_lid) then begin
Some (FStar_Syntax_Const.effect_Tot_lid)
end else begin
if (FStar_Ident.lid_equals l FStar_Syntax_Const.effect_GHOST_lid) then begin
Some (FStar_Syntax_Const.effect_PURE_lid)
end else begin
None
end
end
end)


let norm_universe : cfg  ->  closure Prims.list  ->  FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.universe = (fun cfg env u -> (

let norm_univs = (fun us -> (

let us = (FStar_Util.sort_with FStar_Syntax_Util.compare_univs us)
in (

let _54_206 = (FStar_List.fold_left (fun _54_197 u -> (match (_54_197) with
| (cur_kernel, cur_max, out) -> begin
(

let _54_201 = (FStar_Syntax_Util.univ_kernel u)
in (match (_54_201) with
| (k_u, n) -> begin
if (FStar_Syntax_Util.eq_univs cur_kernel k_u) then begin
((cur_kernel), (u), (out))
end else begin
((k_u), (u), ((cur_max)::out))
end
end))
end)) ((FStar_Syntax_Syntax.U_zero), (FStar_Syntax_Syntax.U_zero), ([])) us)
in (match (_54_206) with
| (_54_203, u, out) -> begin
(FStar_List.rev ((u)::out))
end))))
in (

let rec aux = (fun u -> (

let u = (FStar_Syntax_Subst.compress_univ u)
in (match (u) with
| FStar_Syntax_Syntax.U_bvar (x) -> begin
try
(match (()) with
| () -> begin
(match ((FStar_List.nth env x)) with
| Univ (u) -> begin
(aux u)
end
| Dummy -> begin
(u)::[]
end
| _54_223 -> begin
(FStar_All.failwith "Impossible: universe variable bound to a term")
end)
end)
with
| _54_216 -> begin
if (FStar_All.pipe_right cfg.steps (FStar_List.contains AllowUnboundUniverses)) then begin
(FStar_Syntax_Syntax.U_unknown)::[]
end else begin
(FStar_All.failwith "Universe variable not found")
end
end
end
| (FStar_Syntax_Syntax.U_zero) | (FStar_Syntax_Syntax.U_unif (_)) | (FStar_Syntax_Syntax.U_name (_)) | (FStar_Syntax_Syntax.U_unknown) -> begin
(u)::[]
end
| FStar_Syntax_Syntax.U_max ([]) -> begin
(FStar_Syntax_Syntax.U_zero)::[]
end
| FStar_Syntax_Syntax.U_max (us) -> begin
(

let us = (let _151_286 = (FStar_List.collect aux us)
in (FStar_All.pipe_right _151_286 norm_univs))
in (match (us) with
| (u_k)::(hd)::rest -> begin
(

let rest = (hd)::rest
in (match ((FStar_Syntax_Util.univ_kernel u_k)) with
| (FStar_Syntax_Syntax.U_zero, n) -> begin
if (FStar_All.pipe_right rest (FStar_List.for_all (fun u -> (

let _54_250 = (FStar_Syntax_Util.univ_kernel u)
in (match (_54_250) with
| (_54_248, m) -> begin
(n <= m)
end))))) then begin
rest
end else begin
us
end
end
| _54_252 -> begin
us
end))
end
| _54_254 -> begin
us
end))
end
| FStar_Syntax_Syntax.U_succ (u) -> begin
(let _151_289 = (aux u)
in (FStar_List.map (fun _151_288 -> FStar_Syntax_Syntax.U_succ (_151_288)) _151_289))
end)))
in if (FStar_All.pipe_right cfg.steps (FStar_List.contains EraseUniverses)) then begin
FStar_Syntax_Syntax.U_unknown
end else begin
(match ((aux u)) with
| ([]) | ((FStar_Syntax_Syntax.U_zero)::[]) -> begin
FStar_Syntax_Syntax.U_zero
end
| (FStar_Syntax_Syntax.U_zero)::(u)::[] -> begin
u
end
| (FStar_Syntax_Syntax.U_zero)::us -> begin
FStar_Syntax_Syntax.U_max (us)
end
| (u)::[] -> begin
u
end
| us -> begin
FStar_Syntax_Syntax.U_max (us)
end)
end)))


let rec closure_as_term : cfg  ->  closure Prims.list  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun cfg env t -> (

let _54_273 = (log cfg (fun _54_272 -> (match (()) with
| () -> begin
(let _151_314 = (FStar_Syntax_Print.tag_of_term t)
in (let _151_313 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 ">>> %s Closure_as_term %s\n" _151_314 _151_313)))
end)))
in (match (env) with
| [] when (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains CompressUvars cfg.steps)) -> begin
t
end
| _54_277 -> begin
(

let t = (FStar_Syntax_Subst.compress t)
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (_54_280) -> begin
(FStar_All.failwith "Impossible")
end
| (FStar_Syntax_Syntax.Tm_unknown) | (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_name (_)) | (FStar_Syntax_Syntax.Tm_fvar (_)) -> begin
t
end
| FStar_Syntax_Syntax.Tm_uvar (_54_293) -> begin
t
end
| FStar_Syntax_Syntax.Tm_type (u) -> begin
(let _151_319 = (let _151_318 = (norm_universe cfg env u)
in FStar_Syntax_Syntax.Tm_type (_151_318))
in (mk _151_319 t.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_uinst (t, us) -> begin
(let _151_320 = (FStar_List.map (norm_universe cfg env) us)
in (FStar_Syntax_Syntax.mk_Tm_uinst t _151_320))
end
| FStar_Syntax_Syntax.Tm_bvar (x) -> begin
(match ((lookup_bvar env x)) with
| Univ (_54_304) -> begin
(FStar_All.failwith "Impossible: term variable is bound to a universe")
end
| Dummy -> begin
t
end
| Clos (env, t0, r, _54_311) -> begin
(closure_as_term cfg env t0)
end)
end
| FStar_Syntax_Syntax.Tm_app (head, args) -> begin
(

let head = (closure_as_term_delayed cfg env head)
in (

let args = (closures_as_args_delayed cfg env args)
in (mk (FStar_Syntax_Syntax.Tm_app (((head), (args)))) t.FStar_Syntax_Syntax.pos)))
end
| FStar_Syntax_Syntax.Tm_abs (bs, body, lopt) -> begin
(

let _54_327 = (closures_as_binders_delayed cfg env bs)
in (match (_54_327) with
| (bs, env) -> begin
(

let body = (closure_as_term_delayed cfg env body)
in (let _151_323 = (let _151_322 = (let _151_321 = (close_lcomp_opt cfg env lopt)
in ((bs), (body), (_151_321)))
in FStar_Syntax_Syntax.Tm_abs (_151_322))
in (mk _151_323 t.FStar_Syntax_Syntax.pos)))
end))
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let _54_335 = (closures_as_binders_delayed cfg env bs)
in (match (_54_335) with
| (bs, env) -> begin
(

let c = (close_comp cfg env c)
in (mk (FStar_Syntax_Syntax.Tm_arrow (((bs), (c)))) t.FStar_Syntax_Syntax.pos))
end))
end
| FStar_Syntax_Syntax.Tm_refine (x, phi) -> begin
(

let _54_343 = (let _151_325 = (let _151_324 = (FStar_Syntax_Syntax.mk_binder x)
in (_151_324)::[])
in (closures_as_binders_delayed cfg env _151_325))
in (match (_54_343) with
| (x, env) -> begin
(

let phi = (closure_as_term_delayed cfg env phi)
in (let _151_329 = (let _151_328 = (let _151_327 = (let _151_326 = (FStar_List.hd x)
in (FStar_All.pipe_right _151_326 Prims.fst))
in ((_151_327), (phi)))
in FStar_Syntax_Syntax.Tm_refine (_151_328))
in (mk _151_329 t.FStar_Syntax_Syntax.pos)))
end))
end
| FStar_Syntax_Syntax.Tm_ascribed (t1, FStar_Util.Inl (t2), lopt) -> begin
(let _151_335 = (let _151_334 = (let _151_333 = (closure_as_term_delayed cfg env t1)
in (let _151_332 = (let _151_331 = (closure_as_term_delayed cfg env t2)
in (FStar_All.pipe_left (fun _151_330 -> FStar_Util.Inl (_151_330)) _151_331))
in ((_151_333), (_151_332), (lopt))))
in FStar_Syntax_Syntax.Tm_ascribed (_151_334))
in (mk _151_335 t.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_ascribed (t1, FStar_Util.Inr (c), lopt) -> begin
(let _151_341 = (let _151_340 = (let _151_339 = (closure_as_term_delayed cfg env t1)
in (let _151_338 = (let _151_337 = (close_comp cfg env c)
in (FStar_All.pipe_left (fun _151_336 -> FStar_Util.Inr (_151_336)) _151_337))
in ((_151_339), (_151_338), (lopt))))
in FStar_Syntax_Syntax.Tm_ascribed (_151_340))
in (mk _151_341 t.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_meta (t', FStar_Syntax_Syntax.Meta_pattern (args)) -> begin
(let _151_346 = (let _151_345 = (let _151_344 = (closure_as_term_delayed cfg env t')
in (let _151_343 = (let _151_342 = (FStar_All.pipe_right args (FStar_List.map (closures_as_args_delayed cfg env)))
in FStar_Syntax_Syntax.Meta_pattern (_151_342))
in ((_151_344), (_151_343))))
in FStar_Syntax_Syntax.Tm_meta (_151_345))
in (mk _151_346 t.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_meta (t', FStar_Syntax_Syntax.Meta_monadic (m, tbody)) -> begin
(let _151_352 = (let _151_351 = (let _151_350 = (closure_as_term_delayed cfg env t')
in (let _151_349 = (let _151_348 = (let _151_347 = (closure_as_term_delayed cfg env tbody)
in ((m), (_151_347)))
in FStar_Syntax_Syntax.Meta_monadic (_151_348))
in ((_151_350), (_151_349))))
in FStar_Syntax_Syntax.Tm_meta (_151_351))
in (mk _151_352 t.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_meta (t', FStar_Syntax_Syntax.Meta_monadic_lift (m1, m2, tbody)) -> begin
(let _151_358 = (let _151_357 = (let _151_356 = (closure_as_term_delayed cfg env t')
in (let _151_355 = (let _151_354 = (let _151_353 = (closure_as_term_delayed cfg env tbody)
in ((m1), (m2), (_151_353)))
in FStar_Syntax_Syntax.Meta_monadic_lift (_151_354))
in ((_151_356), (_151_355))))
in FStar_Syntax_Syntax.Tm_meta (_151_357))
in (mk _151_358 t.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_meta (t', m) -> begin
(let _151_361 = (let _151_360 = (let _151_359 = (closure_as_term_delayed cfg env t')
in ((_151_359), (m)))
in FStar_Syntax_Syntax.Tm_meta (_151_360))
in (mk _151_361 t.FStar_Syntax_Syntax.pos))
end
| FStar_Syntax_Syntax.Tm_let ((false, (lb)::[]), body) -> begin
(

let env0 = env
in (

let env = (FStar_List.fold_left (fun env _54_390 -> (Dummy)::env) env lb.FStar_Syntax_Syntax.lbunivs)
in (

let typ = (closure_as_term_delayed cfg env lb.FStar_Syntax_Syntax.lbtyp)
in (

let def = (closure_as_term cfg env lb.FStar_Syntax_Syntax.lbdef)
in (

let body = (match (lb.FStar_Syntax_Syntax.lbname) with
| FStar_Util.Inr (_54_396) -> begin
body
end
| FStar_Util.Inl (_54_399) -> begin
(closure_as_term cfg ((Dummy)::env0) body)
end)
in (

let lb = (

let _54_402 = lb
in {FStar_Syntax_Syntax.lbname = _54_402.FStar_Syntax_Syntax.lbname; FStar_Syntax_Syntax.lbunivs = _54_402.FStar_Syntax_Syntax.lbunivs; FStar_Syntax_Syntax.lbtyp = typ; FStar_Syntax_Syntax.lbeff = _54_402.FStar_Syntax_Syntax.lbeff; FStar_Syntax_Syntax.lbdef = def})
in (mk (FStar_Syntax_Syntax.Tm_let (((((false), ((lb)::[]))), (body)))) t.FStar_Syntax_Syntax.pos)))))))
end
| FStar_Syntax_Syntax.Tm_let ((_54_406, lbs), body) -> begin
(

let norm_one_lb = (fun env lb -> (

let env_univs = (FStar_List.fold_right (fun _54_415 env -> (Dummy)::env) lb.FStar_Syntax_Syntax.lbunivs env)
in (

let env = if (FStar_Syntax_Syntax.is_top_level lbs) then begin
env_univs
end else begin
(FStar_List.fold_right (fun _54_419 env -> (Dummy)::env) lbs env_univs)
end
in (

let _54_423 = lb
in (let _151_373 = (closure_as_term cfg env_univs lb.FStar_Syntax_Syntax.lbtyp)
in (let _151_372 = (closure_as_term cfg env lb.FStar_Syntax_Syntax.lbdef)
in {FStar_Syntax_Syntax.lbname = _54_423.FStar_Syntax_Syntax.lbname; FStar_Syntax_Syntax.lbunivs = _54_423.FStar_Syntax_Syntax.lbunivs; FStar_Syntax_Syntax.lbtyp = _151_373; FStar_Syntax_Syntax.lbeff = _54_423.FStar_Syntax_Syntax.lbeff; FStar_Syntax_Syntax.lbdef = _151_372}))))))
in (

let lbs = (FStar_All.pipe_right lbs (FStar_List.map (norm_one_lb env)))
in (

let body = (

let body_env = (FStar_List.fold_right (fun _54_426 env -> (Dummy)::env) lbs env)
in (closure_as_term cfg body_env body))
in (mk (FStar_Syntax_Syntax.Tm_let (((((true), (lbs))), (body)))) t.FStar_Syntax_Syntax.pos))))
end
| FStar_Syntax_Syntax.Tm_match (head, branches) -> begin
(

let head = (closure_as_term cfg env head)
in (

let norm_one_branch = (fun env _54_441 -> (match (_54_441) with
| (pat, w_opt, tm) -> begin
(

let rec norm_pat = (fun env p -> (match (p.FStar_Syntax_Syntax.v) with
| FStar_Syntax_Syntax.Pat_constant (_54_446) -> begin
((p), (env))
end
| FStar_Syntax_Syntax.Pat_disj ([]) -> begin
(FStar_All.failwith "Impossible")
end
| FStar_Syntax_Syntax.Pat_disj ((hd)::tl) -> begin
(

let _54_456 = (norm_pat env hd)
in (match (_54_456) with
| (hd, env') -> begin
(

let tl = (FStar_All.pipe_right tl (FStar_List.map (fun p -> (let _151_385 = (norm_pat env p)
in (Prims.fst _151_385)))))
in (((

let _54_459 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_disj ((hd)::tl); FStar_Syntax_Syntax.ty = _54_459.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = _54_459.FStar_Syntax_Syntax.p})), (env')))
end))
end
| FStar_Syntax_Syntax.Pat_cons (fv, pats) -> begin
(

let _54_476 = (FStar_All.pipe_right pats (FStar_List.fold_left (fun _54_467 _54_470 -> (match (((_54_467), (_54_470))) with
| ((pats, env), (p, b)) -> begin
(

let _54_473 = (norm_pat env p)
in (match (_54_473) with
| (p, env) -> begin
(((((p), (b)))::pats), (env))
end))
end)) (([]), (env))))
in (match (_54_476) with
| (pats, env) -> begin
(((

let _54_477 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_cons (((fv), ((FStar_List.rev pats)))); FStar_Syntax_Syntax.ty = _54_477.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = _54_477.FStar_Syntax_Syntax.p})), (env))
end))
end
| FStar_Syntax_Syntax.Pat_var (x) -> begin
(

let x = (

let _54_481 = x
in (let _151_388 = (closure_as_term cfg env x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = _54_481.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _54_481.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = _151_388}))
in (((

let _54_484 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_var (x); FStar_Syntax_Syntax.ty = _54_484.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = _54_484.FStar_Syntax_Syntax.p})), ((Dummy)::env)))
end
| FStar_Syntax_Syntax.Pat_wild (x) -> begin
(

let x = (

let _54_488 = x
in (let _151_389 = (closure_as_term cfg env x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = _54_488.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _54_488.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = _151_389}))
in (((

let _54_491 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_wild (x); FStar_Syntax_Syntax.ty = _54_491.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = _54_491.FStar_Syntax_Syntax.p})), ((Dummy)::env)))
end
| FStar_Syntax_Syntax.Pat_dot_term (x, t) -> begin
(

let x = (

let _54_497 = x
in (let _151_390 = (closure_as_term cfg env x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = _54_497.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _54_497.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = _151_390}))
in (

let t = (closure_as_term cfg env t)
in (((

let _54_501 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_dot_term (((x), (t))); FStar_Syntax_Syntax.ty = _54_501.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = _54_501.FStar_Syntax_Syntax.p})), (env))))
end))
in (

let _54_505 = (norm_pat env pat)
in (match (_54_505) with
| (pat, env) -> begin
(

let w_opt = (match (w_opt) with
| None -> begin
None
end
| Some (w) -> begin
(let _151_391 = (closure_as_term cfg env w)
in Some (_151_391))
end)
in (

let tm = (closure_as_term cfg env tm)
in ((pat), (w_opt), (tm))))
end)))
end))
in (let _151_394 = (let _151_393 = (let _151_392 = (FStar_All.pipe_right branches (FStar_List.map (norm_one_branch env)))
in ((head), (_151_392)))
in FStar_Syntax_Syntax.Tm_match (_151_393))
in (mk _151_394 t.FStar_Syntax_Syntax.pos))))
end))
end)))
and closure_as_term_delayed : cfg  ->  closure Prims.list  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun cfg env t -> (match (env) with
| [] when (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains CompressUvars cfg.steps)) -> begin
t
end
| _54_516 -> begin
(closure_as_term cfg env t)
end))
and closures_as_args_delayed : cfg  ->  closure Prims.list  ->  FStar_Syntax_Syntax.args  ->  FStar_Syntax_Syntax.args = (fun cfg env args -> (match (env) with
| [] when (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains CompressUvars cfg.steps)) -> begin
args
end
| _54_522 -> begin
(FStar_List.map (fun _54_525 -> (match (_54_525) with
| (x, imp) -> begin
(let _151_402 = (closure_as_term_delayed cfg env x)
in ((_151_402), (imp)))
end)) args)
end))
and closures_as_binders_delayed : cfg  ->  closure Prims.list  ->  FStar_Syntax_Syntax.binders  ->  (FStar_Syntax_Syntax.binders * closure Prims.list) = (fun cfg env bs -> (

let _54_541 = (FStar_All.pipe_right bs (FStar_List.fold_left (fun _54_531 _54_534 -> (match (((_54_531), (_54_534))) with
| ((env, out), (b, imp)) -> begin
(

let b = (

let _54_535 = b
in (let _151_408 = (closure_as_term_delayed cfg env b.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = _54_535.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _54_535.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = _151_408}))
in (

let env = (Dummy)::env
in ((env), ((((b), (imp)))::out))))
end)) ((env), ([]))))
in (match (_54_541) with
| (env, bs) -> begin
(((FStar_List.rev bs)), (env))
end)))
and close_comp : cfg  ->  closure Prims.list  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp = (fun cfg env c -> (match (env) with
| [] when (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains CompressUvars cfg.steps)) -> begin
c
end
| _54_547 -> begin
(match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (t, uopt) -> begin
(let _151_413 = (closure_as_term_delayed cfg env t)
in (let _151_412 = (FStar_Option.map (norm_universe cfg env) uopt)
in (FStar_Syntax_Syntax.mk_Total' _151_413 _151_412)))
end
| FStar_Syntax_Syntax.GTotal (t, uopt) -> begin
(let _151_415 = (closure_as_term_delayed cfg env t)
in (let _151_414 = (FStar_Option.map (norm_universe cfg env) uopt)
in (FStar_Syntax_Syntax.mk_GTotal' _151_415 _151_414)))
end
| FStar_Syntax_Syntax.Comp (c) -> begin
(

let rt = (closure_as_term_delayed cfg env c.FStar_Syntax_Syntax.result_typ)
in (

let args = (closures_as_args_delayed cfg env c.FStar_Syntax_Syntax.effect_args)
in (

let flags = (FStar_All.pipe_right c.FStar_Syntax_Syntax.flags (FStar_List.map (fun _54_4 -> (match (_54_4) with
| FStar_Syntax_Syntax.DECREASES (t) -> begin
(let _151_417 = (closure_as_term_delayed cfg env t)
in FStar_Syntax_Syntax.DECREASES (_151_417))
end
| f -> begin
f
end))))
in (let _151_419 = (

let _54_565 = c
in (let _151_418 = (FStar_List.map (norm_universe cfg env) c.FStar_Syntax_Syntax.comp_univs)
in {FStar_Syntax_Syntax.comp_univs = _151_418; FStar_Syntax_Syntax.effect_name = _54_565.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = rt; FStar_Syntax_Syntax.effect_args = args; FStar_Syntax_Syntax.flags = flags}))
in (FStar_Syntax_Syntax.mk_Comp _151_419)))))
end)
end))
and filter_out_lcomp_cflags : FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.cflags Prims.list = (fun lc -> (FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags (FStar_List.filter (fun _54_5 -> (match (_54_5) with
| FStar_Syntax_Syntax.DECREASES (_54_570) -> begin
false
end
| _54_573 -> begin
true
end)))))
and close_lcomp_opt : cfg  ->  closure Prims.list  ->  (FStar_Syntax_Syntax.lcomp, FStar_Syntax_Syntax.residual_comp) FStar_Util.either Prims.option  ->  (FStar_Syntax_Syntax.lcomp, FStar_Syntax_Syntax.residual_comp) FStar_Util.either Prims.option = (fun cfg env lopt -> (match (lopt) with
| Some (FStar_Util.Inl (lc)) -> begin
(

let flags = (filter_out_lcomp_cflags lc)
in if (FStar_Syntax_Util.is_total_lcomp lc) then begin
Some (FStar_Util.Inr (((FStar_Syntax_Const.effect_Tot_lid), (flags))))
end else begin
if (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc) then begin
Some (FStar_Util.Inr (((FStar_Syntax_Const.effect_GTot_lid), (flags))))
end else begin
Some (FStar_Util.Inr (((lc.FStar_Syntax_Syntax.eff_name), (flags))))
end
end)
end
| _54_582 -> begin
lopt
end))


let arith_ops : (FStar_Ident.lident * (Prims.int  ->  Prims.int  ->  FStar_Const.sconst)) Prims.list = (

let int_as_const = (fun i -> (let _151_434 = (let _151_433 = (FStar_Util.string_of_int i)
in ((_151_433), (None)))
in FStar_Const.Const_int (_151_434)))
in (

let bool_as_const = (fun b -> FStar_Const.Const_bool (b))
in (let _151_630 = (let _151_629 = (FStar_List.map (fun m -> (let _151_628 = (let _151_597 = (FStar_Syntax_Const.p2l (("FStar")::(m)::("add")::[]))
in ((_151_597), ((fun x y -> (int_as_const (x + y))))))
in (let _151_627 = (let _151_626 = (let _151_608 = (FStar_Syntax_Const.p2l (("FStar")::(m)::("sub")::[]))
in ((_151_608), ((fun x y -> (int_as_const (x - y))))))
in (let _151_625 = (let _151_624 = (let _151_619 = (FStar_Syntax_Const.p2l (("FStar")::(m)::("mul")::[]))
in ((_151_619), ((fun x y -> (int_as_const (x * y))))))
in (_151_624)::[])
in (_151_626)::_151_625))
in (_151_628)::_151_627))) (("Int8")::("UInt8")::("Int16")::("UInt16")::("Int32")::("UInt32")::("Int64")::("UInt64")::("UInt128")::[]))
in (FStar_List.flatten _151_629))
in (FStar_List.append ((((FStar_Syntax_Const.op_Addition), ((fun x y -> (int_as_const (x + y))))))::(((FStar_Syntax_Const.op_Subtraction), ((fun x y -> (int_as_const (x - y))))))::(((FStar_Syntax_Const.op_Multiply), ((fun x y -> (int_as_const (x * y))))))::(((FStar_Syntax_Const.op_Division), ((fun x y -> (int_as_const (x / y))))))::(((FStar_Syntax_Const.op_LT), ((fun x y -> (bool_as_const (x < y))))))::(((FStar_Syntax_Const.op_LTE), ((fun x y -> (bool_as_const (x <= y))))))::(((FStar_Syntax_Const.op_GT), ((fun x y -> (bool_as_const (x > y))))))::(((FStar_Syntax_Const.op_GTE), ((fun x y -> (bool_as_const (x >= y))))))::(((FStar_Syntax_Const.op_Modulus), ((fun x y -> (int_as_const (x mod y))))))::[]) _151_630))))


let un_ops : (FStar_Ident.lident * (Prims.string  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax)) Prims.list = (

let mk = (fun x -> (mk x FStar_Range.dummyRange))
in (

let name = (fun x -> (let _151_640 = (let _151_639 = (let _151_638 = (FStar_Syntax_Const.p2l x)
in (FStar_Syntax_Syntax.lid_as_fv _151_638 FStar_Syntax_Syntax.Delta_constant None))
in FStar_Syntax_Syntax.Tm_fvar (_151_639))
in (mk _151_640)))
in (

let ctor = (fun x -> (let _151_645 = (let _151_644 = (let _151_643 = (FStar_Syntax_Const.p2l x)
in (FStar_Syntax_Syntax.lid_as_fv _151_643 FStar_Syntax_Syntax.Delta_constant (Some (FStar_Syntax_Syntax.Data_ctor))))
in FStar_Syntax_Syntax.Tm_fvar (_151_644))
in (mk _151_645)))
in (let _151_675 = (let _151_672 = (FStar_Syntax_Const.p2l (("FStar")::("String")::("list_of_string")::[]))
in ((_151_672), ((fun s -> (let _151_671 = (FStar_String.list_of_string s)
in (let _151_670 = (let _151_669 = (let _151_668 = (let _151_667 = (let _151_663 = (ctor (("Prims")::("Nil")::[]))
in (FStar_Syntax_Syntax.mk_Tm_uinst _151_663 ((FStar_Syntax_Syntax.U_zero)::[])))
in (let _151_666 = (let _151_665 = (let _151_664 = (name (("FStar")::("Char")::("char")::[]))
in ((_151_664), (Some (FStar_Syntax_Syntax.Implicit (true)))))
in (_151_665)::[])
in ((_151_667), (_151_666))))
in FStar_Syntax_Syntax.Tm_app (_151_668))
in (mk _151_669))
in (FStar_List.fold_right (fun c a -> (let _151_662 = (let _151_661 = (let _151_660 = (let _151_653 = (ctor (("Prims")::("Cons")::[]))
in (FStar_Syntax_Syntax.mk_Tm_uinst _151_653 ((FStar_Syntax_Syntax.U_zero)::[])))
in (let _151_659 = (let _151_658 = (let _151_654 = (name (("FStar")::("Char")::("char")::[]))
in ((_151_654), (Some (FStar_Syntax_Syntax.Implicit (true)))))
in (let _151_657 = (let _151_656 = (let _151_655 = (mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_char (c))))
in ((_151_655), (None)))
in (_151_656)::(((a), (None)))::[])
in (_151_658)::_151_657))
in ((_151_660), (_151_659))))
in FStar_Syntax_Syntax.Tm_app (_151_661))
in (mk _151_662))) _151_671 _151_670)))))))
in (_151_675)::[]))))


let reduce_primops : step Prims.list  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax = (fun steps tm -> (

let find = (fun fv ops -> (match (fv.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_List.tryFind (fun _54_632 -> (match (_54_632) with
| (l, _54_631) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv l)
end)) ops)
end
| _54_634 -> begin
None
end))
in if (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains Primops steps)) then begin
tm
end else begin
(match (tm.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_app (fv, ((a1, _54_642))::((a2, _54_638))::[]) -> begin
(match ((find fv arith_ops)) with
| None -> begin
tm
end
| Some (_54_649, op) -> begin
(

let norm = (fun i j -> (

let c = (let _151_692 = (FStar_Util.int_of_string i)
in (let _151_691 = (FStar_Util.int_of_string j)
in (op _151_692 _151_691)))
in (mk (FStar_Syntax_Syntax.Tm_constant (c)) tm.FStar_Syntax_Syntax.pos)))
in (match ((let _151_696 = (let _151_693 = (FStar_Syntax_Subst.compress a1)
in _151_693.FStar_Syntax_Syntax.n)
in (let _151_695 = (let _151_694 = (FStar_Syntax_Subst.compress a2)
in _151_694.FStar_Syntax_Syntax.n)
in ((_151_696), (_151_695))))) with
| (FStar_Syntax_Syntax.Tm_app (head1, ((arg1, _54_660))::[]), FStar_Syntax_Syntax.Tm_app (head2, ((arg2, _54_668))::[])) -> begin
(match ((let _151_704 = (let _151_697 = (FStar_Syntax_Subst.compress head1)
in _151_697.FStar_Syntax_Syntax.n)
in (let _151_703 = (let _151_698 = (FStar_Syntax_Subst.compress head2)
in _151_698.FStar_Syntax_Syntax.n)
in (let _151_702 = (let _151_699 = (FStar_Syntax_Subst.compress arg1)
in _151_699.FStar_Syntax_Syntax.n)
in (let _151_701 = (let _151_700 = (FStar_Syntax_Subst.compress arg2)
in _151_700.FStar_Syntax_Syntax.n)
in ((_151_704), (_151_703), (_151_702), (_151_701))))))) with
| (FStar_Syntax_Syntax.Tm_fvar (fv1), FStar_Syntax_Syntax.Tm_fvar (fv2), FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int (i, None)), FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int (j, None))) when ((FStar_Util.ends_with (FStar_Ident.text_of_lid fv1.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v) "int_to_t") && (FStar_Util.ends_with (FStar_Ident.text_of_lid fv2.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v) "int_to_t")) -> begin
(let _151_708 = (mk (FStar_Syntax_Syntax.Tm_fvar (fv1)) tm.FStar_Syntax_Syntax.pos)
in (let _151_707 = (let _151_706 = (let _151_705 = (norm i j)
in ((_151_705), (None)))
in (_151_706)::[])
in (FStar_Syntax_Util.mk_app _151_708 _151_707)))
end
| _54_690 -> begin
tm
end)
end
| (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int (i, None)), FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int (j, None))) -> begin
(norm i j)
end
| _54_703 -> begin
tm
end))
end)
end
| FStar_Syntax_Syntax.Tm_app (fv, ((a1, _54_707))::[]) -> begin
(match ((find fv un_ops)) with
| None -> begin
tm
end
| Some (_54_714, op) -> begin
(match ((let _151_711 = (FStar_Syntax_Subst.compress a1)
in _151_711.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_string (b, _54_720)) -> begin
(let _151_712 = (FStar_Bytes.unicode_bytes_as_string b)
in (op _151_712))
end
| _54_725 -> begin
tm
end)
end)
end
| _54_727 -> begin
tm
end)
end))


let maybe_simplify : step Prims.list  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax = (fun steps tm -> (

let w = (fun t -> (

let _54_732 = t
in {FStar_Syntax_Syntax.n = _54_732.FStar_Syntax_Syntax.n; FStar_Syntax_Syntax.tk = _54_732.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = tm.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = _54_732.FStar_Syntax_Syntax.vars}))
in (

let simp_t = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.true_lid) -> begin
Some (true)
end
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.false_lid) -> begin
Some (false)
end
| _54_741 -> begin
None
end))
in (

let simplify = (fun arg -> (((simp_t (Prims.fst arg))), (arg)))
in if (FStar_All.pipe_left Prims.op_Negation (FStar_List.contains Simplify steps)) then begin
(reduce_primops steps tm)
end else begin
(match (tm.FStar_Syntax_Syntax.n) with
| (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uinst ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, _); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, args)) | (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, args)) -> begin
if (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.and_lid) then begin
(match ((FStar_All.pipe_right args (FStar_List.map simplify))) with
| (((Some (true), _))::((_, (arg, _)))::[]) | (((_, (arg, _)))::((Some (true), _))::[]) -> begin
arg
end
| (((Some (false), _))::(_)::[]) | ((_)::((Some (false), _))::[]) -> begin
(w FStar_Syntax_Util.t_false)
end
| _54_819 -> begin
tm
end)
end else begin
if (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.or_lid) then begin
(match ((FStar_All.pipe_right args (FStar_List.map simplify))) with
| (((Some (true), _))::(_)::[]) | ((_)::((Some (true), _))::[]) -> begin
(w FStar_Syntax_Util.t_true)
end
| (((Some (false), _))::((_, (arg, _)))::[]) | (((_, (arg, _)))::((Some (false), _))::[]) -> begin
arg
end
| _54_862 -> begin
tm
end)
end else begin
if (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.imp_lid) then begin
(match ((FStar_All.pipe_right args (FStar_List.map simplify))) with
| ((_)::((Some (true), _))::[]) | (((Some (false), _))::(_)::[]) -> begin
(w FStar_Syntax_Util.t_true)
end
| ((Some (true), _54_889))::((_54_880, (arg, _54_883)))::[] -> begin
arg
end
| _54_893 -> begin
tm
end)
end else begin
if (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.not_lid) then begin
(match ((FStar_All.pipe_right args (FStar_List.map simplify))) with
| ((Some (true), _54_897))::[] -> begin
(w FStar_Syntax_Util.t_false)
end
| ((Some (false), _54_903))::[] -> begin
(w FStar_Syntax_Util.t_true)
end
| _54_907 -> begin
tm
end)
end else begin
if ((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.forall_lid) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.exists_lid)) then begin
(match (args) with
| (((t, _))::[]) | (((_, Some (FStar_Syntax_Syntax.Implicit (_))))::((t, _))::[]) -> begin
(match ((let _151_723 = (FStar_Syntax_Subst.compress t)
in _151_723.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_abs ((_54_925)::[], body, _54_929) -> begin
(match ((simp_t body)) with
| Some (true) -> begin
(w FStar_Syntax_Util.t_true)
end
| Some (false) -> begin
(w FStar_Syntax_Util.t_false)
end
| _54_937 -> begin
tm
end)
end
| _54_939 -> begin
tm
end)
end
| _54_941 -> begin
tm
end)
end else begin
tm
end
end
end
end
end
end
| _54_943 -> begin
tm
end)
end))))


let is_norm_request = (fun hd args -> (match ((let _151_727 = (let _151_726 = (FStar_Syntax_Util.un_uinst hd)
in _151_726.FStar_Syntax_Syntax.n)
in ((_151_727), (args)))) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), (_54_951)::(_54_949)::[]) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.normalize_term)
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), (_54_957)::[]) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.normalize)
end
| _54_961 -> begin
false
end))


let get_norm_request = (fun args -> (match (args) with
| ((_)::((tm, _))::[]) | (((tm, _))::[]) -> begin
tm
end
| _54_975 -> begin
(FStar_All.failwith "Impossible")
end))


let rec nth_prefix = (fun n l -> if (n = (Prims.parse_int "0")) then begin
[]
end else begin
(match (l) with
| [] -> begin
[]
end
| (x)::xs -> begin
(let _151_731 = (nth_prefix (n - (Prims.parse_int "1")) xs)
in (x)::_151_731)
end)
end)


let rec norm : cfg  ->  env  ->  stack  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun cfg env stack t -> (

let t = (FStar_Syntax_Subst.compress t)
in (

let _54_988 = (log cfg (fun _54_987 -> (match (()) with
| () -> begin
(let _151_766 = (FStar_Syntax_Print.tag_of_term t)
in (let _151_765 = (FStar_Syntax_Print.term_to_string t)
in (let _151_764 = (let _151_763 = (nth_prefix (Prims.parse_int "4") stack)
in (stack_to_string _151_763))
in (FStar_Util.print3 ">>> %s\nNorm %s with top of the stack %s \n" _151_766 _151_765 _151_764))))
end)))
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (_54_991) -> begin
(FStar_All.failwith "Impossible")
end
| (FStar_Syntax_Syntax.Tm_unknown) | (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_name (_)) | (FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = _; FStar_Syntax_Syntax.fv_delta = FStar_Syntax_Syntax.Delta_constant; FStar_Syntax_Syntax.fv_qual = _})) | (FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = _; FStar_Syntax_Syntax.fv_delta = _; FStar_Syntax_Syntax.fv_qual = Some (FStar_Syntax_Syntax.Data_ctor)})) | (FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = _; FStar_Syntax_Syntax.fv_delta = _; FStar_Syntax_Syntax.fv_qual = Some (FStar_Syntax_Syntax.Record_ctor (_))})) -> begin
(

let _54_1029 = (log cfg (fun _54_1028 -> (match (()) with
| () -> begin
(FStar_Util.print "Tm_fvar case 0\n" [])
end)))
in (rebuild cfg env stack t))
end
| FStar_Syntax_Syntax.Tm_app (hd, args) when (((not ((FStar_All.pipe_right cfg.steps (FStar_List.contains NoFullNorm)))) && (is_norm_request hd args)) && (not ((FStar_Ident.lid_equals cfg.tcenv.FStar_TypeChecker_Env.curmodule FStar_Syntax_Const.prims_lid)))) -> begin
(

let tm = (get_norm_request args)
in (

let s = (Reify)::(Beta)::(UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::(Zeta)::(Iota)::(Primops)::[]
in (

let cfg' = (

let _54_1037 = cfg
in {steps = s; tcenv = _54_1037.tcenv; delta_level = (FStar_TypeChecker_Env.Unfold (FStar_Syntax_Syntax.Delta_constant))::[]})
in (

let stack' = (Debug (t))::(Steps (((cfg.steps), (cfg.delta_level))))::stack
in (norm cfg' env stack' tm)))))
end
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = _54_1046; FStar_Syntax_Syntax.pos = _54_1044; FStar_Syntax_Syntax.vars = _54_1042}, (a1)::(a2)::rest) -> begin
(

let _54_1060 = (FStar_Syntax_Util.head_and_args t)
in (match (_54_1060) with
| (hd, _54_1059) -> begin
(

let t' = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((hd), ((a1)::[])))) None t.FStar_Syntax_Syntax.pos)
in (

let t = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((t'), ((a2)::rest)))) None t.FStar_Syntax_Syntax.pos)
in (norm cfg env stack t)))
end))
end
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = _54_1068; FStar_Syntax_Syntax.pos = _54_1066; FStar_Syntax_Syntax.vars = _54_1064}, (a)::[]) when (FStar_All.pipe_right cfg.steps (FStar_List.contains Reify)) -> begin
(

let _54_1079 = (FStar_Syntax_Util.head_and_args t)
in (match (_54_1079) with
| (reify_head, _54_1078) -> begin
(

let a = (let _151_771 = (FStar_All.pipe_left FStar_Syntax_Util.unascribe (Prims.fst a))
in (FStar_Syntax_Subst.compress _151_771))
in (

let normalization_reify_result = (match (a.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reflect (_54_1088)); FStar_Syntax_Syntax.tk = _54_1086; FStar_Syntax_Syntax.pos = _54_1084; FStar_Syntax_Syntax.vars = _54_1082}, (a)::[]) -> begin
(norm cfg env stack (Prims.fst a))
end
| FStar_Syntax_Syntax.Tm_match (e, branches) -> begin
(

let e = (FStar_Syntax_Util.mk_reify e)
in (

let branches = (FStar_All.pipe_right branches (FStar_List.map (fun _54_1104 -> (match (_54_1104) with
| (pat, wopt, tm) -> begin
(let _151_773 = (FStar_Syntax_Util.mk_reify tm)
in ((pat), (wopt), (_151_773)))
end))))
in (

let tm = (mk (FStar_Syntax_Syntax.Tm_match (((e), (branches)))) t.FStar_Syntax_Syntax.pos)
in (norm cfg env stack tm))))
end
| _54_1108 -> begin
(

let stack = (App (((reify_head), (None), (t.FStar_Syntax_Syntax.pos))))::stack
in (norm cfg env stack a))
end)
in (

let _54_1111 = (let _151_775 = (FStar_Syntax_Print.term_to_string a)
in (let _151_774 = (FStar_Syntax_Print.term_to_string normalization_reify_result)
in (FStar_Util.print2_warning "RESULT OF NORMALIZATION : before %s    after %s\n" _151_775 _151_774)))
in normalization_reify_result)))
end))
end
| FStar_Syntax_Syntax.Tm_type (u) -> begin
(

let u = (norm_universe cfg env u)
in (let _151_776 = (mk (FStar_Syntax_Syntax.Tm_type (u)) t.FStar_Syntax_Syntax.pos)
in (rebuild cfg env stack _151_776)))
end
| FStar_Syntax_Syntax.Tm_uinst (t', us) -> begin
if (FStar_All.pipe_right cfg.steps (FStar_List.contains EraseUniverses)) then begin
(norm cfg env stack t')
end else begin
(

let us = (let _151_778 = (let _151_777 = (FStar_List.map (norm_universe cfg env) us)
in ((_151_777), (t.FStar_Syntax_Syntax.pos)))
in UnivArgs (_151_778))
in (

let stack = (us)::stack
in (norm cfg env stack t')))
end
end
| FStar_Syntax_Syntax.Tm_fvar (f) -> begin
(

let t0 = t
in (

let should_delta = (FStar_All.pipe_right cfg.delta_level (FStar_Util.for_some (fun _54_6 -> (match (_54_6) with
| FStar_TypeChecker_Env.NoDelta -> begin
false
end
| (FStar_TypeChecker_Env.Inlining) | (FStar_TypeChecker_Env.Eager_unfolding_only) -> begin
true
end
| FStar_TypeChecker_Env.Unfold (l) -> begin
(FStar_TypeChecker_Common.delta_depth_greater_than f.FStar_Syntax_Syntax.fv_delta l)
end))))
in if (not (should_delta)) then begin
(

let _54_1133 = (log cfg (fun _54_1132 -> (match (()) with
| () -> begin
(FStar_Util.print "Tm_fvar case 1\n" [])
end)))
in (rebuild cfg env stack t))
end else begin
(

let r_env = (let _151_781 = (FStar_Syntax_Syntax.range_of_fv f)
in (FStar_TypeChecker_Env.set_range cfg.tcenv _151_781))
in (match ((FStar_TypeChecker_Env.lookup_definition cfg.delta_level r_env f.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)) with
| None -> begin
(

let _54_1138 = (log cfg (fun _54_1137 -> (match (()) with
| () -> begin
(FStar_Util.print "Tm_fvar case 2\n" [])
end)))
in (rebuild cfg env stack t))
end
| Some (us, t) -> begin
(

let _54_1145 = (log cfg (fun _54_1144 -> (match (()) with
| () -> begin
(let _151_785 = (FStar_Syntax_Print.term_to_string t0)
in (let _151_784 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 ">>> Unfolded %s to %s\n" _151_785 _151_784)))
end)))
in (

let n = (FStar_List.length us)
in if (n > (Prims.parse_int "0")) then begin
(match (stack) with
| (UnivArgs (us', _54_1151))::stack -> begin
(

let env = (FStar_All.pipe_right us' (FStar_List.fold_left (fun env u -> (Univ (u))::env) env))
in (norm cfg env stack t))
end
| _54_1159 when (FStar_All.pipe_right cfg.steps (FStar_List.contains EraseUniverses)) -> begin
(norm cfg env stack t)
end
| _54_1161 -> begin
(let _151_789 = (let _151_788 = (FStar_Syntax_Print.lid_to_string f.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in (FStar_Util.format1 "Impossible: missing universe instantiation on %s" _151_788))
in (FStar_All.failwith _151_789))
end)
end else begin
(norm cfg env stack t)
end))
end))
end))
end
| FStar_Syntax_Syntax.Tm_bvar (x) -> begin
(match ((lookup_bvar env x)) with
| Univ (_54_1165) -> begin
(FStar_All.failwith "Impossible: term variable is bound to a universe")
end
| Dummy -> begin
(FStar_All.failwith "Term variable not found")
end
| Clos (env, t0, r, fix) -> begin
if ((not (fix)) || (not ((FStar_List.contains (Exclude (Zeta)) cfg.steps)))) then begin
(match ((FStar_ST.read r)) with
| Some (env, t') -> begin
(

let _54_1179 = (log cfg (fun _54_1178 -> (match (()) with
| () -> begin
(let _151_792 = (FStar_Syntax_Print.term_to_string t)
in (let _151_791 = (FStar_Syntax_Print.term_to_string t')
in (FStar_Util.print2 "Lazy hit: %s cached to %s\n" _151_792 _151_791)))
end)))
in (match ((let _151_793 = (FStar_Syntax_Subst.compress t')
in _151_793.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_abs (_54_1182) -> begin
(norm cfg env stack t')
end
| _54_1185 -> begin
(rebuild cfg env stack t')
end))
end
| None -> begin
(norm cfg env ((MemoLazy (r))::stack) t0)
end)
end else begin
(norm cfg env stack t0)
end
end)
end
| FStar_Syntax_Syntax.Tm_abs (bs, body, lopt) -> begin
(match (stack) with
| (UnivArgs (_54_1195))::_54_1193 -> begin
(FStar_All.failwith "Ill-typed term: universes cannot be applied to term abstraction")
end
| (Match (_54_1201))::_54_1199 -> begin
(FStar_All.failwith "Ill-typed term: cannot pattern match an abstraction")
end
| (Arg (c, _54_1207, _54_1209))::stack_rest -> begin
(match (c) with
| Univ (_54_1214) -> begin
(norm cfg ((c)::env) stack_rest t)
end
| _54_1217 -> begin
(match (bs) with
| [] -> begin
(FStar_All.failwith "Impossible")
end
| (_54_1220)::[] -> begin
(match (lopt) with
| None when (FStar_Options.__unit_tests ()) -> begin
(

let _54_1224 = (log cfg (fun _54_1223 -> (match (()) with
| () -> begin
(let _151_795 = (closure_to_string c)
in (FStar_Util.print1 "\tShifted %s\n" _151_795))
end)))
in (norm cfg ((c)::env) stack_rest body))
end
| Some (FStar_Util.Inr (l, cflags)) when (((FStar_Ident.lid_equals l FStar_Syntax_Const.effect_Tot_lid) || (FStar_Ident.lid_equals l FStar_Syntax_Const.effect_GTot_lid)) || (FStar_All.pipe_right cflags (FStar_Util.for_some (fun _54_7 -> (match (_54_7) with
| FStar_Syntax_Syntax.TOTAL -> begin
true
end
| _54_1234 -> begin
false
end))))) -> begin
(

let _54_1236 = (log cfg (fun _54_1235 -> (match (()) with
| () -> begin
(let _151_798 = (closure_to_string c)
in (FStar_Util.print1 "\tShifted %s\n" _151_798))
end)))
in (norm cfg ((c)::env) stack_rest body))
end
| Some (FStar_Util.Inl (lc)) when (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc) -> begin
(

let _54_1242 = (log cfg (fun _54_1241 -> (match (()) with
| () -> begin
(let _151_800 = (closure_to_string c)
in (FStar_Util.print1 "\tShifted %s\n" _151_800))
end)))
in (norm cfg ((c)::env) stack_rest body))
end
| _54_1245 when (FStar_All.pipe_right cfg.steps (FStar_List.contains Reify)) -> begin
(norm cfg ((c)::env) stack_rest body)
end
| _54_1247 -> begin
(

let cfg = (

let _54_1248 = cfg
in {steps = (WHNF)::(Exclude (Iota))::(Exclude (Zeta))::cfg.steps; tcenv = _54_1248.tcenv; delta_level = _54_1248.delta_level})
in (let _151_801 = (closure_as_term cfg env t)
in (rebuild cfg env stack _151_801)))
end)
end
| (_54_1253)::tl -> begin
(

let _54_1256 = (log cfg (fun _54_1255 -> (match (()) with
| () -> begin
(let _151_803 = (closure_to_string c)
in (FStar_Util.print1 "\tShifted %s\n" _151_803))
end)))
in (

let body = (mk (FStar_Syntax_Syntax.Tm_abs (((tl), (body), (lopt)))) t.FStar_Syntax_Syntax.pos)
in (norm cfg ((c)::env) stack_rest body)))
end)
end)
end
| (Steps (s, dl))::stack -> begin
(norm (

let _54_1265 = cfg
in {steps = s; tcenv = _54_1265.tcenv; delta_level = dl}) env stack t)
end
| (MemoLazy (r))::stack -> begin
(

let _54_1271 = (set_memo r ((env), (t)))
in (

let _54_1274 = (log cfg (fun _54_1273 -> (match (()) with
| () -> begin
(let _151_805 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print1 "\tSet memo %s\n" _151_805))
end)))
in (norm cfg env stack t)))
end
| ((Debug (_))::_) | ((Meta (_))::_) | ((Let (_))::_) | ((App (_))::_) | ((Abs (_))::_) | ([]) -> begin
if (FStar_List.contains WHNF cfg.steps) then begin
(let _151_806 = (closure_as_term cfg env t)
in (rebuild cfg env stack _151_806))
end else begin
(

let _54_1310 = (FStar_Syntax_Subst.open_term' bs body)
in (match (_54_1310) with
| (bs, body, opening) -> begin
(

let lopt = (match (lopt) with
| Some (FStar_Util.Inl (l)) -> begin
(let _151_812 = (let _151_810 = (let _151_808 = (let _151_807 = (l.FStar_Syntax_Syntax.comp ())
in (FStar_Syntax_Subst.subst_comp opening _151_807))
in (FStar_All.pipe_right _151_808 FStar_Syntax_Util.lcomp_of_comp))
in (FStar_All.pipe_right _151_810 (fun _151_809 -> FStar_Util.Inl (_151_809))))
in (FStar_All.pipe_right _151_812 (fun _151_811 -> Some (_151_811))))
end
| _54_1315 -> begin
lopt
end)
in (

let env' = (FStar_All.pipe_right bs (FStar_List.fold_left (fun env _54_1318 -> (Dummy)::env) env))
in (

let _54_1322 = (log cfg (fun _54_1321 -> (match (()) with
| () -> begin
(let _151_816 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length bs))
in (FStar_Util.print1 "\tShifted %s dummies\n" _151_816))
end)))
in (norm cfg env' ((Abs (((env), (bs), (env'), (lopt), (t.FStar_Syntax_Syntax.pos))))::stack) body))))
end))
end
end)
end
| FStar_Syntax_Syntax.Tm_app (head, args) -> begin
(

let stack = (FStar_All.pipe_right stack (FStar_List.fold_right (fun _54_1330 stack -> (match (_54_1330) with
| (a, aq) -> begin
(let _151_823 = (let _151_822 = (let _151_821 = (let _151_820 = (let _151_819 = (FStar_Util.mk_ref None)
in ((env), (a), (_151_819), (false)))
in Clos (_151_820))
in ((_151_821), (aq), (t.FStar_Syntax_Syntax.pos)))
in Arg (_151_822))
in (_151_823)::stack)
end)) args))
in (

let _54_1334 = (log cfg (fun _54_1333 -> (match (()) with
| () -> begin
(let _151_825 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length args))
in (FStar_Util.print1 "\tPushed %s arguments\n" _151_825))
end)))
in (norm cfg env stack head)))
end
| FStar_Syntax_Syntax.Tm_refine (x, f) -> begin
if (FStar_List.contains WHNF cfg.steps) then begin
(match (((env), (stack))) with
| ([], []) -> begin
(

let t_x = (norm cfg env [] x.FStar_Syntax_Syntax.sort)
in (

let t = (mk (FStar_Syntax_Syntax.Tm_refine ((((

let _54_1344 = x
in {FStar_Syntax_Syntax.ppname = _54_1344.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _54_1344.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t_x})), (f)))) t.FStar_Syntax_Syntax.pos)
in (rebuild cfg env stack t)))
end
| _54_1348 -> begin
(let _151_826 = (closure_as_term cfg env t)
in (rebuild cfg env stack _151_826))
end)
end else begin
(

let t_x = (norm cfg env [] x.FStar_Syntax_Syntax.sort)
in (

let _54_1352 = (FStar_Syntax_Subst.open_term ((((x), (None)))::[]) f)
in (match (_54_1352) with
| (closing, f) -> begin
(

let f = (norm cfg ((Dummy)::env) [] f)
in (

let t = (let _151_829 = (let _151_828 = (let _151_827 = (FStar_Syntax_Subst.close closing f)
in (((

let _54_1354 = x
in {FStar_Syntax_Syntax.ppname = _54_1354.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _54_1354.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t_x})), (_151_827)))
in FStar_Syntax_Syntax.Tm_refine (_151_828))
in (mk _151_829 t.FStar_Syntax_Syntax.pos))
in (rebuild cfg env stack t)))
end)))
end
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
if (FStar_List.contains WHNF cfg.steps) then begin
(let _151_830 = (closure_as_term cfg env t)
in (rebuild cfg env stack _151_830))
end else begin
(

let _54_1363 = (FStar_Syntax_Subst.open_comp bs c)
in (match (_54_1363) with
| (bs, c) -> begin
(

let c = (let _151_833 = (FStar_All.pipe_right bs (FStar_List.fold_left (fun env _54_1365 -> (Dummy)::env) env))
in (norm_comp cfg _151_833 c))
in (

let t = (let _151_834 = (norm_binders cfg env bs)
in (FStar_Syntax_Util.arrow _151_834 c))
in (rebuild cfg env stack t)))
end))
end
end
| FStar_Syntax_Syntax.Tm_ascribed (t1, tc, l) -> begin
(match (stack) with
| ((Match (_))::_) | ((Arg (_))::_) | ((App ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, _, _))::_) | ((MemoLazy (_))::_) -> begin
(norm cfg env stack t1)
end
| _54_1411 -> begin
(

let t1 = (norm cfg env [] t1)
in (

let _54_1414 = (log cfg (fun _54_1413 -> (match (()) with
| () -> begin
(FStar_Util.print_string "+++ Normalizing ascription \n")
end)))
in (

let tc = (match (tc) with
| FStar_Util.Inl (t) -> begin
(let _151_836 = (norm cfg env [] t)
in FStar_Util.Inl (_151_836))
end
| FStar_Util.Inr (c) -> begin
(let _151_837 = (norm_comp cfg env c)
in FStar_Util.Inr (_151_837))
end)
in (let _151_838 = (mk (FStar_Syntax_Syntax.Tm_ascribed (((t1), (tc), (l)))) t.FStar_Syntax_Syntax.pos)
in (rebuild cfg env stack _151_838)))))
end)
end
| FStar_Syntax_Syntax.Tm_match (head, branches) -> begin
(

let stack = (Match (((env), (branches), (t.FStar_Syntax_Syntax.pos))))::stack
in (norm cfg env stack head))
end
| FStar_Syntax_Syntax.Tm_let ((_54_1427, ({FStar_Syntax_Syntax.lbname = FStar_Util.Inr (_54_1439); FStar_Syntax_Syntax.lbunivs = _54_1437; FStar_Syntax_Syntax.lbtyp = _54_1435; FStar_Syntax_Syntax.lbeff = _54_1433; FStar_Syntax_Syntax.lbdef = _54_1431})::_54_1429), _54_1445) -> begin
(rebuild cfg env stack t)
end
| FStar_Syntax_Syntax.Tm_let ((false, (lb)::[]), body) -> begin
(

let n = (FStar_TypeChecker_Env.norm_eff_name cfg.tcenv lb.FStar_Syntax_Syntax.lbeff)
in if ((not ((FStar_All.pipe_right cfg.steps (FStar_List.contains NoDeltaSteps)))) && ((FStar_Syntax_Util.is_pure_effect n) || ((FStar_Syntax_Util.is_ghost_effect n) && (not ((FStar_All.pipe_right cfg.steps (FStar_List.contains PureSubtermsWithinComputations))))))) then begin
(

let env = (let _151_841 = (let _151_840 = (let _151_839 = (FStar_Util.mk_ref None)
in ((env), (lb.FStar_Syntax_Syntax.lbdef), (_151_839), (false)))
in Clos (_151_840))
in (_151_841)::env)
in (norm cfg env stack body))
end else begin
(

let _54_1459 = (let _151_844 = (let _151_843 = (let _151_842 = (FStar_All.pipe_right lb.FStar_Syntax_Syntax.lbname FStar_Util.left)
in (FStar_All.pipe_right _151_842 FStar_Syntax_Syntax.mk_binder))
in (_151_843)::[])
in (FStar_Syntax_Subst.open_term _151_844 body))
in (match (_54_1459) with
| (bs, body) -> begin
(

let lb = (

let _54_1460 = lb
in (let _151_850 = (let _151_847 = (let _151_845 = (FStar_List.hd bs)
in (FStar_All.pipe_right _151_845 Prims.fst))
in (FStar_All.pipe_right _151_847 (fun _151_846 -> FStar_Util.Inl (_151_846))))
in (let _151_849 = (norm cfg env [] lb.FStar_Syntax_Syntax.lbtyp)
in (let _151_848 = (norm cfg env [] lb.FStar_Syntax_Syntax.lbdef)
in {FStar_Syntax_Syntax.lbname = _151_850; FStar_Syntax_Syntax.lbunivs = _54_1460.FStar_Syntax_Syntax.lbunivs; FStar_Syntax_Syntax.lbtyp = _151_849; FStar_Syntax_Syntax.lbeff = _54_1460.FStar_Syntax_Syntax.lbeff; FStar_Syntax_Syntax.lbdef = _151_848}))))
in (

let env' = (FStar_All.pipe_right bs (FStar_List.fold_left (fun env _54_1464 -> (Dummy)::env) env))
in (norm cfg env' ((Let (((env), (bs), (lb), (t.FStar_Syntax_Syntax.pos))))::stack) body)))
end))
end)
end
| FStar_Syntax_Syntax.Tm_let (lbs, body) when (FStar_List.contains (Exclude (Zeta)) cfg.steps) -> begin
(let _151_853 = (closure_as_term cfg env t)
in (rebuild cfg env stack _151_853))
end
| FStar_Syntax_Syntax.Tm_let (lbs, body) -> begin
(

let _54_1490 = (FStar_List.fold_right (fun lb _54_1479 -> (match (_54_1479) with
| (rec_env, memos, i) -> begin
(

let f_i = (let _151_856 = (

let _54_1480 = (FStar_Util.left lb.FStar_Syntax_Syntax.lbname)
in {FStar_Syntax_Syntax.ppname = _54_1480.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = i; FStar_Syntax_Syntax.sort = _54_1480.FStar_Syntax_Syntax.sort})
in (FStar_Syntax_Syntax.bv_to_tm _151_856))
in (

let fix_f_i = (mk (FStar_Syntax_Syntax.Tm_let (((lbs), (f_i)))) t.FStar_Syntax_Syntax.pos)
in (

let memo = (FStar_Util.mk_ref None)
in (

let rec_env = (Clos (((env), (fix_f_i), (memo), (true))))::rec_env
in ((rec_env), ((memo)::memos), ((i + (Prims.parse_int "1"))))))))
end)) (Prims.snd lbs) ((env), ([]), ((Prims.parse_int "0"))))
in (match (_54_1490) with
| (rec_env, memos, _54_1489) -> begin
(

let _54_1493 = (FStar_List.map2 (fun lb memo -> (FStar_ST.op_Colon_Equals memo (Some (((rec_env), (lb.FStar_Syntax_Syntax.lbdef)))))) (Prims.snd lbs) memos)
in (

let body_env = (FStar_List.fold_right (fun lb env -> (let _151_863 = (let _151_862 = (let _151_861 = (FStar_Util.mk_ref None)
in ((rec_env), (lb.FStar_Syntax_Syntax.lbdef), (_151_861), (false)))
in Clos (_151_862))
in (_151_863)::env)) (Prims.snd lbs) env)
in (norm cfg body_env stack body)))
end))
end
| FStar_Syntax_Syntax.Tm_meta (head, m) -> begin
(match (m) with
| FStar_Syntax_Syntax.Meta_monadic (m, t) -> begin
(

let should_reify = (match (stack) with
| (App ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = _54_1513; FStar_Syntax_Syntax.pos = _54_1511; FStar_Syntax_Syntax.vars = _54_1509}, _54_1518, _54_1520))::_54_1507 -> begin
(

let _54_1524 = (FStar_Util.print1 "Found a reify on the stack. %s" "")
in (FStar_All.pipe_right cfg.steps (FStar_List.contains Reify)))
end
| _54_1527 -> begin
false
end)
in (

let _54_1529 = (let _151_864 = (stack_to_string stack)
in (FStar_Util.print2 "Will %sreify : %s \n" (if should_reify then begin
""
end else begin
"not "
end) _151_864))
in if (not (should_reify)) then begin
(

let t = (norm cfg env [] t)
in (

let stack = (Steps (((cfg.steps), (cfg.delta_level))))::stack
in (

let cfg = (

let _54_1533 = cfg
in {steps = (FStar_List.append ((NoDeltaSteps)::(Exclude (Zeta))::[]) cfg.steps); tcenv = _54_1533.tcenv; delta_level = (FStar_TypeChecker_Env.NoDelta)::[]})
in (norm cfg env ((Meta (((FStar_Syntax_Syntax.Meta_monadic (((m), (t)))), (t.FStar_Syntax_Syntax.pos))))::stack) head))))
end else begin
(

let reify_lift = (fun e msrc mtgt t -> if (FStar_Syntax_Util.is_pure_effect msrc) then begin
(

let ed = (FStar_TypeChecker_Env.get_effect_decl cfg.tcenv mtgt)
in (

let _54_1545 = ed.FStar_Syntax_Syntax.return_repr
in (match (_54_1545) with
| (_54_1543, return_repr) -> begin
(

let return_inst = (match ((let _151_873 = (FStar_Syntax_Subst.compress return_repr)
in _151_873.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_uinst (return_tm, (_54_1548)::[]) -> begin
(let _151_877 = (let _151_876 = (let _151_875 = (let _151_874 = (cfg.tcenv.FStar_TypeChecker_Env.universe_of cfg.tcenv t)
in (_151_874)::[])
in ((return_tm), (_151_875)))
in FStar_Syntax_Syntax.Tm_uinst (_151_876))
in (FStar_Syntax_Syntax.mk _151_877 None e.FStar_Syntax_Syntax.pos))
end
| _54_1553 -> begin
(FStar_All.failwith "NIY : Reification of indexed effects")
end)
in (let _151_883 = (let _151_882 = (let _151_881 = (let _151_880 = (FStar_Syntax_Syntax.as_arg t)
in (let _151_879 = (let _151_878 = (FStar_Syntax_Syntax.as_arg e)
in (_151_878)::[])
in (_151_880)::_151_879))
in ((return_inst), (_151_881)))
in FStar_Syntax_Syntax.Tm_app (_151_882))
in (FStar_Syntax_Syntax.mk _151_883 None e.FStar_Syntax_Syntax.pos)))
end)))
end else begin
(FStar_All.failwith "NYI: monadic lift normalisation")
end)
in (match ((let _151_884 = (FStar_Syntax_Subst.compress head)
in _151_884.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_let ((false, (lb)::[]), body) -> begin
(

let ed = (FStar_TypeChecker_Env.get_effect_decl cfg.tcenv m)
in (

let _54_1566 = ed.FStar_Syntax_Syntax.bind_repr
in (match (_54_1566) with
| (_54_1564, bind_repr) -> begin
(match (lb.FStar_Syntax_Syntax.lbname) with
| FStar_Util.Inl (x) -> begin
(

let head = (FStar_All.pipe_left FStar_Syntax_Util.mk_reify lb.FStar_Syntax_Syntax.lbdef)
in (

let body = (FStar_All.pipe_left FStar_Syntax_Util.mk_reify body)
in (

let body = (let _151_888 = (let _151_887 = (let _151_886 = (let _151_885 = (FStar_Syntax_Syntax.mk_binder x)
in (_151_885)::[])
in ((_151_886), (body), (None)))
in FStar_Syntax_Syntax.Tm_abs (_151_887))
in (FStar_Syntax_Syntax.mk _151_888 None body.FStar_Syntax_Syntax.pos))
in (

let bind_inst = (match ((let _151_889 = (FStar_Syntax_Subst.compress bind_repr)
in _151_889.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_uinst (bind, (_54_1576)::(_54_1574)::[]) -> begin
(let _151_895 = (let _151_894 = (let _151_893 = (let _151_892 = (cfg.tcenv.FStar_TypeChecker_Env.universe_of cfg.tcenv lb.FStar_Syntax_Syntax.lbtyp)
in (let _151_891 = (let _151_890 = (cfg.tcenv.FStar_TypeChecker_Env.universe_of cfg.tcenv t)
in (_151_890)::[])
in (_151_892)::_151_891))
in ((bind), (_151_893)))
in FStar_Syntax_Syntax.Tm_uinst (_151_894))
in (FStar_Syntax_Syntax.mk _151_895 None t.FStar_Syntax_Syntax.pos))
end
| _54_1581 -> begin
(FStar_All.failwith "NIY : Reification of indexed effects")
end)
in (

let reified = (let _151_909 = (let _151_908 = (let _151_907 = (let _151_906 = (FStar_Syntax_Syntax.as_arg lb.FStar_Syntax_Syntax.lbtyp)
in (let _151_905 = (let _151_904 = (FStar_Syntax_Syntax.as_arg t)
in (let _151_903 = (let _151_902 = (FStar_Syntax_Syntax.as_arg FStar_Syntax_Syntax.tun)
in (let _151_901 = (let _151_900 = (FStar_Syntax_Syntax.as_arg head)
in (let _151_899 = (let _151_898 = (FStar_Syntax_Syntax.as_arg FStar_Syntax_Syntax.tun)
in (let _151_897 = (let _151_896 = (FStar_Syntax_Syntax.as_arg body)
in (_151_896)::[])
in (_151_898)::_151_897))
in (_151_900)::_151_899))
in (_151_902)::_151_901))
in (_151_904)::_151_903))
in (_151_906)::_151_905))
in ((bind_inst), (_151_907)))
in FStar_Syntax_Syntax.Tm_app (_151_908))
in (FStar_Syntax_Syntax.mk _151_909 None t.FStar_Syntax_Syntax.pos))
in (let _151_910 = (FStar_List.tl stack)
in (norm cfg env _151_910 reified)))))))
end
| FStar_Util.Inr (_54_1585) -> begin
(FStar_All.failwith "Cannot reify a top-level let binding")
end)
end)))
end
| FStar_Syntax_Syntax.Tm_app (head, args) -> begin
(

let ed = (FStar_TypeChecker_Env.get_effect_decl cfg.tcenv m)
in (

let _54_1595 = ed.FStar_Syntax_Syntax.bind_repr
in (match (_54_1595) with
| (_54_1593, bind_repr) -> begin
(

let maybe_unfold_action = (fun head -> (

let _54_1606 = (match ((let _151_913 = (FStar_Syntax_Subst.compress head)
in _151_913.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_uinst (t, univs) -> begin
((t), (univs))
end
| _54_1603 -> begin
((head), ([]))
end)
in (match (_54_1606) with
| (t, univs) -> begin
(match ((let _151_914 = (FStar_Syntax_Subst.compress t)
in _151_914.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_fvar (x) when (let _151_915 = (FStar_Syntax_Syntax.lid_of_fv x)
in (FStar_TypeChecker_Env.is_action cfg.tcenv _151_915)) -> begin
(

let r_env = (let _151_916 = (FStar_Syntax_Syntax.range_of_fv x)
in (FStar_TypeChecker_Env.set_range cfg.tcenv _151_916))
in (match ((let _151_917 = (FStar_Syntax_Syntax.lid_of_fv x)
in (FStar_TypeChecker_Env.lookup_definition cfg.delta_level r_env _151_917))) with
| Some (univs0, t0) when ((FStar_List.length univs0) = (FStar_List.length univs)) -> begin
(let _151_918 = (FStar_Syntax_Syntax.mk_Tm_uinst t0 univs)
in ((_151_918), (Some (true))))
end
| None -> begin
(

let _54_1615 = (FStar_Util.print "Case 0" [])
in ((head), (Some (false))))
end
| Some (univs0, _54_1619) -> begin
(let _151_922 = (let _151_921 = (FStar_Util.string_of_int (FStar_List.length univs0))
in (let _151_920 = (FStar_Util.string_of_int (FStar_List.length univs0))
in (let _151_919 = (FStar_Syntax_Print.term_to_string head)
in (FStar_Util.format3 "Invalid universe instantiation (%s universe variables needed, %s provided, in term %s)" _151_921 _151_920 _151_919))))
in (FStar_All.failwith _151_922))
end))
end
| _54_1623 -> begin
(

let _54_1624 = (FStar_Util.print "Case 1" [])
in ((head), (None)))
end)
end)))
in (

let rec bind_on_lift = (fun args acc -> (match (args) with
| [] -> begin
(match ((FStar_List.rev acc)) with
| [] -> begin
(FStar_All.failwith "bind_on_lift should be always called with a non-empty list")
end
| ((head, _54_1634))::args -> begin
(

let _54_1639 = (maybe_unfold_action head)
in (match (_54_1639) with
| (head, found_action) -> begin
(

let mk = (fun tm -> (FStar_Syntax_Syntax.mk tm None t.FStar_Syntax_Syntax.pos))
in (

let body = (mk (FStar_Syntax_Syntax.Tm_app (((head), (args)))))
in (match (found_action) with
| None -> begin
(FStar_Syntax_Util.mk_reify body)
end
| Some (false) -> begin
(mk (FStar_Syntax_Syntax.Tm_meta (((body), (FStar_Syntax_Syntax.Meta_monadic (((m), (t))))))))
end
| Some (true) -> begin
body
end)))
end))
end)
end
| ((e, q))::es -> begin
(match ((let _151_929 = (FStar_Syntax_Subst.compress e)
in _151_929.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_meta (e0, FStar_Syntax_Syntax.Meta_monadic_lift (m1, m2, t')) when (not ((FStar_Syntax_Util.is_pure_effect m1))) -> begin
(

let x = (FStar_Syntax_Syntax.gen_bv "monadic_app_var" None t')
in (

let body = (let _151_932 = (let _151_931 = (let _151_930 = (FStar_Syntax_Syntax.bv_to_name x)
in ((_151_930), (q)))
in (_151_931)::acc)
in (bind_on_lift es _151_932))
in (

let lifted_e0 = (reify_lift e0 m1 m2 t')
in (

let continuation = (FStar_Syntax_Util.abs ((((x), (None)))::[]) body (Some (FStar_Util.Inr (((m2), ([]))))))
in (

let bind_inst = (match ((let _151_933 = (FStar_Syntax_Subst.compress bind_repr)
in _151_933.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_uinst (bind, (_54_1669)::(_54_1667)::[]) -> begin
(let _151_939 = (let _151_938 = (let _151_937 = (let _151_936 = (cfg.tcenv.FStar_TypeChecker_Env.universe_of cfg.tcenv t')
in (let _151_935 = (let _151_934 = (cfg.tcenv.FStar_TypeChecker_Env.universe_of cfg.tcenv t)
in (_151_934)::[])
in (_151_936)::_151_935))
in ((bind), (_151_937)))
in FStar_Syntax_Syntax.Tm_uinst (_151_938))
in (FStar_Syntax_Syntax.mk _151_939 None e0.FStar_Syntax_Syntax.pos))
end
| _54_1674 -> begin
(FStar_All.failwith "NIY : Reification of indexed effects")
end)
in (let _151_953 = (let _151_952 = (let _151_951 = (let _151_950 = (FStar_Syntax_Syntax.as_arg t')
in (let _151_949 = (let _151_948 = (FStar_Syntax_Syntax.as_arg t)
in (let _151_947 = (let _151_946 = (FStar_Syntax_Syntax.as_arg FStar_Syntax_Syntax.tun)
in (let _151_945 = (let _151_944 = (FStar_Syntax_Syntax.as_arg lifted_e0)
in (let _151_943 = (let _151_942 = (FStar_Syntax_Syntax.as_arg FStar_Syntax_Syntax.tun)
in (let _151_941 = (let _151_940 = (FStar_Syntax_Syntax.as_arg continuation)
in (_151_940)::[])
in (_151_942)::_151_941))
in (_151_944)::_151_943))
in (_151_946)::_151_945))
in (_151_948)::_151_947))
in (_151_950)::_151_949))
in ((bind_inst), (_151_951)))
in FStar_Syntax_Syntax.Tm_app (_151_952))
in (FStar_Syntax_Syntax.mk _151_953 None e0.FStar_Syntax_Syntax.pos)))))))
end
| FStar_Syntax_Syntax.Tm_meta (e0, FStar_Syntax_Syntax.Meta_monadic_lift (_54_1678)) -> begin
(bind_on_lift es ((((e0), (q)))::acc))
end
| _54_1683 -> begin
(bind_on_lift es ((((e), (q)))::acc))
end)
end))
in (

let binded_head = (let _151_955 = (let _151_954 = (FStar_Syntax_Syntax.as_arg head)
in (_151_954)::args)
in (bind_on_lift _151_955 []))
in (

let _54_1685 = (let _151_956 = (FStar_Syntax_Print.term_to_string binded_head)
in (FStar_Util.print1_warning "BEFORE NORMALIZING MONADIC APP : %s\n" _151_956))
in (let _151_957 = (FStar_List.tl stack)
in (norm cfg env _151_957 binded_head))))))
end)))
end
| FStar_Syntax_Syntax.Tm_meta (e, FStar_Syntax_Syntax.Meta_monadic_lift (msrc, mtgt, t')) -> begin
(

let lifted = (reify_lift e msrc mtgt t')
in (norm cfg env stack lifted))
end
| _54_1697 -> begin
(norm cfg env stack head)
end))
end))
end
| FStar_Syntax_Syntax.Meta_monadic_lift (m, m', t) -> begin
if (((FStar_Syntax_Util.is_pure_effect m) || (FStar_Syntax_Util.is_ghost_effect m)) && (FStar_All.pipe_right cfg.steps (FStar_List.contains PureSubtermsWithinComputations))) then begin
(

let stack = (Steps (((cfg.steps), (cfg.delta_level))))::stack
in (

let cfg = (

let _54_1704 = cfg
in {steps = (PureSubtermsWithinComputations)::(Primops)::(AllowUnboundUniverses)::(EraseUniverses)::(Exclude (Zeta))::[]; tcenv = _54_1704.tcenv; delta_level = (FStar_TypeChecker_Env.Inlining)::(FStar_TypeChecker_Env.Eager_unfolding_only)::[]})
in (norm cfg env ((Meta (((FStar_Syntax_Syntax.Meta_monadic_lift (((m), (m'), (t)))), (head.FStar_Syntax_Syntax.pos))))::stack) head)))
end else begin
(norm cfg env ((Meta (((FStar_Syntax_Syntax.Meta_monadic_lift (((m), (m'), (t)))), (head.FStar_Syntax_Syntax.pos))))::stack) head)
end
end
| _54_1708 -> begin
(match (stack) with
| (_54_1712)::_54_1710 -> begin
(match (m) with
| FStar_Syntax_Syntax.Meta_labeled (l, r, _54_1717) -> begin
(norm cfg env ((Meta (((m), (r))))::stack) head)
end
| FStar_Syntax_Syntax.Meta_pattern (args) -> begin
(

let args = (norm_pattern_args cfg env args)
in (norm cfg env ((Meta (((FStar_Syntax_Syntax.Meta_pattern (args)), (t.FStar_Syntax_Syntax.pos))))::stack) head))
end
| _54_1724 -> begin
(norm cfg env stack head)
end)
end
| _54_1726 -> begin
(

let head = (norm cfg env [] head)
in (

let m = (match (m) with
| FStar_Syntax_Syntax.Meta_pattern (args) -> begin
(let _151_958 = (norm_pattern_args cfg env args)
in FStar_Syntax_Syntax.Meta_pattern (_151_958))
end
| _54_1731 -> begin
m
end)
in (

let t = (mk (FStar_Syntax_Syntax.Tm_meta (((head), (m)))) t.FStar_Syntax_Syntax.pos)
in (rebuild cfg env stack t))))
end)
end)
end))))
and norm_pattern_args : cfg  ->  env  ->  FStar_Syntax_Syntax.args Prims.list  ->  FStar_Syntax_Syntax.args Prims.list = (fun cfg env args -> (FStar_All.pipe_right args (FStar_List.map (FStar_List.map (fun _54_1739 -> (match (_54_1739) with
| (a, imp) -> begin
(let _151_963 = (norm cfg env [] a)
in ((_151_963), (imp)))
end))))))
and norm_comp : cfg  ->  env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp = (fun cfg env comp -> (

let comp = (ghost_to_pure_aux cfg env comp)
in (match (comp.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (t, uopt) -> begin
(

let _54_1748 = comp
in (let _151_970 = (let _151_969 = (let _151_968 = (norm cfg env [] t)
in (let _151_967 = (FStar_Option.map (norm_universe cfg env) uopt)
in ((_151_968), (_151_967))))
in FStar_Syntax_Syntax.Total (_151_969))
in {FStar_Syntax_Syntax.n = _151_970; FStar_Syntax_Syntax.tk = _54_1748.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = _54_1748.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = _54_1748.FStar_Syntax_Syntax.vars}))
end
| FStar_Syntax_Syntax.GTotal (t, uopt) -> begin
(

let _54_1754 = comp
in (let _151_974 = (let _151_973 = (let _151_972 = (norm cfg env [] t)
in (let _151_971 = (FStar_Option.map (norm_universe cfg env) uopt)
in ((_151_972), (_151_971))))
in FStar_Syntax_Syntax.GTotal (_151_973))
in {FStar_Syntax_Syntax.n = _151_974; FStar_Syntax_Syntax.tk = _54_1754.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = _54_1754.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = _54_1754.FStar_Syntax_Syntax.vars}))
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(

let norm_args = (fun args -> (FStar_All.pipe_right args (FStar_List.map (fun _54_1762 -> (match (_54_1762) with
| (a, i) -> begin
(let _151_978 = (norm cfg env [] a)
in ((_151_978), (i)))
end)))))
in (

let flags = (FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags (FStar_List.map (fun _54_8 -> (match (_54_8) with
| FStar_Syntax_Syntax.DECREASES (t) -> begin
(let _151_980 = (norm cfg env [] t)
in FStar_Syntax_Syntax.DECREASES (_151_980))
end
| f -> begin
f
end))))
in (

let _54_1768 = comp
in (let _151_985 = (let _151_984 = (

let _54_1770 = ct
in (let _151_983 = (FStar_List.map (norm_universe cfg env) ct.FStar_Syntax_Syntax.comp_univs)
in (let _151_982 = (norm cfg env [] ct.FStar_Syntax_Syntax.result_typ)
in (let _151_981 = (norm_args ct.FStar_Syntax_Syntax.effect_args)
in {FStar_Syntax_Syntax.comp_univs = _151_983; FStar_Syntax_Syntax.effect_name = _54_1770.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = _151_982; FStar_Syntax_Syntax.effect_args = _151_981; FStar_Syntax_Syntax.flags = flags}))))
in FStar_Syntax_Syntax.Comp (_151_984))
in {FStar_Syntax_Syntax.n = _151_985; FStar_Syntax_Syntax.tk = _54_1768.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = _54_1768.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = _54_1768.FStar_Syntax_Syntax.vars}))))
end)))
and ghost_to_pure_aux : cfg  ->  env  ->  FStar_Syntax_Syntax.comp  ->  (FStar_Syntax_Syntax.comp', Prims.unit) FStar_Syntax_Syntax.syntax = (fun cfg env c -> (

let norm = (fun t -> (norm (

let _54_1777 = cfg
in {steps = (Eager_unfolding)::(UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::(AllowUnboundUniverses)::[]; tcenv = _54_1777.tcenv; delta_level = _54_1777.delta_level}) env [] t))
in (

let non_info = (fun t -> (let _151_993 = (norm t)
in (FStar_Syntax_Util.non_informative _151_993)))
in (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (_54_1782) -> begin
c
end
| FStar_Syntax_Syntax.GTotal (t, uopt) when (non_info t) -> begin
(

let _54_1788 = c
in {FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Total (((t), (uopt))); FStar_Syntax_Syntax.tk = _54_1788.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = _54_1788.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = _54_1788.FStar_Syntax_Syntax.vars})
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(

let l = (FStar_TypeChecker_Env.norm_eff_name cfg.tcenv ct.FStar_Syntax_Syntax.effect_name)
in if ((FStar_Syntax_Util.is_ghost_effect l) && (non_info ct.FStar_Syntax_Syntax.result_typ)) then begin
(

let ct = (match ((downgrade_ghost_effect_name ct.FStar_Syntax_Syntax.effect_name)) with
| Some (pure_eff) -> begin
(

let _54_1795 = ct
in {FStar_Syntax_Syntax.comp_univs = _54_1795.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = pure_eff; FStar_Syntax_Syntax.result_typ = _54_1795.FStar_Syntax_Syntax.result_typ; FStar_Syntax_Syntax.effect_args = _54_1795.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = _54_1795.FStar_Syntax_Syntax.flags})
end
| None -> begin
(

let ct = (unfold_effect_abbrev cfg.tcenv c)
in (

let _54_1799 = ct
in {FStar_Syntax_Syntax.comp_univs = _54_1799.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = FStar_Syntax_Const.effect_PURE_lid; FStar_Syntax_Syntax.result_typ = _54_1799.FStar_Syntax_Syntax.result_typ; FStar_Syntax_Syntax.effect_args = _54_1799.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = _54_1799.FStar_Syntax_Syntax.flags}))
end)
in (

let _54_1802 = c
in {FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Comp (ct); FStar_Syntax_Syntax.tk = _54_1802.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = _54_1802.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = _54_1802.FStar_Syntax_Syntax.vars}))
end else begin
c
end)
end
| _54_1805 -> begin
c
end))))
and norm_binder : cfg  ->  env  ->  FStar_Syntax_Syntax.binder  ->  FStar_Syntax_Syntax.binder = (fun cfg env _54_1810 -> (match (_54_1810) with
| (x, imp) -> begin
(let _151_998 = (

let _54_1811 = x
in (let _151_997 = (norm cfg env [] x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = _54_1811.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _54_1811.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = _151_997}))
in ((_151_998), (imp)))
end))
and norm_binders : cfg  ->  env  ->  FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.binders = (fun cfg env bs -> (

let _54_1824 = (FStar_List.fold_left (fun _54_1818 b -> (match (_54_1818) with
| (nbs', env) -> begin
(

let b = (norm_binder cfg env b)
in (((b)::nbs'), ((Dummy)::env)))
end)) (([]), (env)) bs)
in (match (_54_1824) with
| (nbs, _54_1823) -> begin
(FStar_List.rev nbs)
end)))
and norm_lcomp_opt : cfg  ->  env  ->  (FStar_Syntax_Syntax.lcomp, FStar_Syntax_Syntax.residual_comp) FStar_Util.either Prims.option  ->  (FStar_Syntax_Syntax.lcomp, FStar_Syntax_Syntax.residual_comp) FStar_Util.either Prims.option = (fun cfg env lopt -> (match (lopt) with
| Some (FStar_Util.Inl (lc)) -> begin
(

let flags = (filter_out_lcomp_cflags lc)
in if (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc) then begin
(

let t = (norm cfg env [] lc.FStar_Syntax_Syntax.res_typ)
in if (FStar_Syntax_Util.is_total_lcomp lc) then begin
(let _151_1010 = (let _151_1009 = (let _151_1008 = (let _151_1007 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_Syntax_Util.comp_set_flags _151_1007 flags))
in (FStar_Syntax_Util.lcomp_of_comp _151_1008))
in FStar_Util.Inl (_151_1009))
in Some (_151_1010))
end else begin
(let _151_1014 = (let _151_1013 = (let _151_1012 = (let _151_1011 = (FStar_Syntax_Syntax.mk_GTotal t)
in (FStar_Syntax_Util.comp_set_flags _151_1011 flags))
in (FStar_Syntax_Util.lcomp_of_comp _151_1012))
in FStar_Util.Inl (_151_1013))
in Some (_151_1014))
end)
end else begin
Some (FStar_Util.Inr (((lc.FStar_Syntax_Syntax.eff_name), (flags))))
end)
end
| _54_1834 -> begin
lopt
end))
and rebuild : cfg  ->  env  ->  stack  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun cfg env stack t -> (match (stack) with
| [] -> begin
t
end
| (Debug (tm))::stack -> begin
(

let _54_1844 = if (FStar_All.pipe_left (FStar_TypeChecker_Env.debug cfg.tcenv) (FStar_Options.Other ("print_normalized_terms"))) then begin
(let _151_1020 = (FStar_Syntax_Print.term_to_string tm)
in (let _151_1019 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 "Normalized %s to %s\n" _151_1020 _151_1019)))
end else begin
()
end
in (rebuild cfg env stack t))
end
| (Steps (s, dl))::stack -> begin
(rebuild (

let _54_1852 = cfg
in {steps = s; tcenv = _54_1852.tcenv; delta_level = dl}) env stack t)
end
| (Meta (m, r))::stack -> begin
(

let t = (mk (FStar_Syntax_Syntax.Tm_meta (((t), (m)))) r)
in (rebuild cfg env stack t))
end
| (MemoLazy (r))::stack -> begin
(

let _54_1865 = (set_memo r ((env), (t)))
in (

let _54_1868 = (log cfg (fun _54_1867 -> (match (()) with
| () -> begin
(let _151_1022 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print1 "\tSet memo %s\n" _151_1022))
end)))
in (rebuild cfg env stack t)))
end
| (Let (env', bs, lb, r))::stack -> begin
(

let body = (FStar_Syntax_Subst.close bs t)
in (

let t = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_let (((((false), ((lb)::[]))), (body)))) None r)
in (rebuild cfg env' stack t)))
end
| (Abs (env', bs, env'', lopt, r))::stack -> begin
(

let bs = (norm_binders cfg env' bs)
in (

let lopt = (norm_lcomp_opt cfg env'' lopt)
in (let _151_1023 = (

let _54_1891 = (FStar_Syntax_Util.abs bs t lopt)
in {FStar_Syntax_Syntax.n = _54_1891.FStar_Syntax_Syntax.n; FStar_Syntax_Syntax.tk = _54_1891.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = r; FStar_Syntax_Syntax.vars = _54_1891.FStar_Syntax_Syntax.vars})
in (rebuild cfg env stack _151_1023))))
end
| ((Arg (Univ (_), _, _))::_) | ((Arg (Dummy, _, _))::_) -> begin
(FStar_All.failwith "Impossible")
end
| (UnivArgs (us, r))::stack -> begin
(

let t = (FStar_Syntax_Syntax.mk_Tm_uinst t us)
in (rebuild cfg env stack t))
end
| (Arg (Clos (env, tm, m, _54_1927), aq, r))::stack -> begin
(

let _54_1936 = (log cfg (fun _54_1935 -> (match (()) with
| () -> begin
(let _151_1025 = (FStar_Syntax_Print.term_to_string tm)
in (FStar_Util.print1 "Rebuilding with arg %s\n" _151_1025))
end)))
in if (FStar_List.contains (Exclude (Iota)) cfg.steps) then begin
if (FStar_List.contains WHNF cfg.steps) then begin
(

let arg = (closure_as_term cfg env tm)
in (

let t = (FStar_Syntax_Syntax.extend_app t ((arg), (aq)) None r)
in (rebuild cfg env stack t)))
end else begin
(

let stack = (App (((t), (aq), (r))))::stack
in (norm cfg env stack tm))
end
end else begin
(match ((FStar_ST.read m)) with
| None -> begin
if (FStar_List.contains WHNF cfg.steps) then begin
(

let arg = (closure_as_term cfg env tm)
in (

let t = (FStar_Syntax_Syntax.extend_app t ((arg), (aq)) None r)
in (rebuild cfg env stack t)))
end else begin
(

let stack = (MemoLazy (m))::(App (((t), (aq), (r))))::stack
in (norm cfg env stack tm))
end
end
| Some (_54_1946, a) -> begin
(

let t = (FStar_Syntax_Syntax.extend_app t ((a), (aq)) None r)
in (rebuild cfg env stack t))
end)
end)
end
| (App (head, aq, r))::stack -> begin
(

let t = (FStar_Syntax_Syntax.extend_app head ((t), (aq)) None r)
in (let _151_1026 = (maybe_simplify cfg.steps t)
in (rebuild cfg env stack _151_1026)))
end
| (Match (env, branches, r))::stack -> begin
(

let _54_1967 = (log cfg (fun _54_1966 -> (match (()) with
| () -> begin
(let _151_1028 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print1 "Rebuilding with match, scrutinee is %s ...\n" _151_1028))
end)))
in (

let scrutinee = t
in (

let norm_and_rebuild_match = (fun _54_1971 -> (match (()) with
| () -> begin
(

let whnf = (FStar_List.contains WHNF cfg.steps)
in (

let cfg_exclude_iota_zeta = (

let new_delta = (FStar_All.pipe_right cfg.delta_level (FStar_List.filter (fun _54_9 -> (match (_54_9) with
| (FStar_TypeChecker_Env.Inlining) | (FStar_TypeChecker_Env.Eager_unfolding_only) -> begin
true
end
| _54_1977 -> begin
false
end))))
in (

let steps' = if (FStar_All.pipe_right cfg.steps (FStar_List.contains PureSubtermsWithinComputations)) then begin
(Exclude (Zeta))::[]
end else begin
(Exclude (Iota))::(Exclude (Zeta))::[]
end
in (

let _54_1980 = cfg
in {steps = (FStar_List.append steps' cfg.steps); tcenv = _54_1980.tcenv; delta_level = new_delta})))
in (

let norm_or_whnf = (fun env t -> if whnf then begin
(closure_as_term cfg_exclude_iota_zeta env t)
end else begin
(norm cfg_exclude_iota_zeta env [] t)
end)
in (

let rec norm_pat = (fun env p -> (match (p.FStar_Syntax_Syntax.v) with
| FStar_Syntax_Syntax.Pat_constant (_54_1990) -> begin
((p), (env))
end
| FStar_Syntax_Syntax.Pat_disj ([]) -> begin
(FStar_All.failwith "Impossible")
end
| FStar_Syntax_Syntax.Pat_disj ((hd)::tl) -> begin
(

let _54_2000 = (norm_pat env hd)
in (match (_54_2000) with
| (hd, env') -> begin
(

let tl = (FStar_All.pipe_right tl (FStar_List.map (fun p -> (let _151_1041 = (norm_pat env p)
in (Prims.fst _151_1041)))))
in (((

let _54_2003 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_disj ((hd)::tl); FStar_Syntax_Syntax.ty = _54_2003.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = _54_2003.FStar_Syntax_Syntax.p})), (env')))
end))
end
| FStar_Syntax_Syntax.Pat_cons (fv, pats) -> begin
(

let _54_2020 = (FStar_All.pipe_right pats (FStar_List.fold_left (fun _54_2011 _54_2014 -> (match (((_54_2011), (_54_2014))) with
| ((pats, env), (p, b)) -> begin
(

let _54_2017 = (norm_pat env p)
in (match (_54_2017) with
| (p, env) -> begin
(((((p), (b)))::pats), (env))
end))
end)) (([]), (env))))
in (match (_54_2020) with
| (pats, env) -> begin
(((

let _54_2021 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_cons (((fv), ((FStar_List.rev pats)))); FStar_Syntax_Syntax.ty = _54_2021.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = _54_2021.FStar_Syntax_Syntax.p})), (env))
end))
end
| FStar_Syntax_Syntax.Pat_var (x) -> begin
(

let x = (

let _54_2025 = x
in (let _151_1044 = (norm_or_whnf env x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = _54_2025.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _54_2025.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = _151_1044}))
in (((

let _54_2028 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_var (x); FStar_Syntax_Syntax.ty = _54_2028.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = _54_2028.FStar_Syntax_Syntax.p})), ((Dummy)::env)))
end
| FStar_Syntax_Syntax.Pat_wild (x) -> begin
(

let x = (

let _54_2032 = x
in (let _151_1045 = (norm_or_whnf env x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = _54_2032.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _54_2032.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = _151_1045}))
in (((

let _54_2035 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_wild (x); FStar_Syntax_Syntax.ty = _54_2035.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = _54_2035.FStar_Syntax_Syntax.p})), ((Dummy)::env)))
end
| FStar_Syntax_Syntax.Pat_dot_term (x, t) -> begin
(

let x = (

let _54_2041 = x
in (let _151_1046 = (norm_or_whnf env x.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = _54_2041.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _54_2041.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = _151_1046}))
in (

let t = (norm_or_whnf env t)
in (((

let _54_2045 = p
in {FStar_Syntax_Syntax.v = FStar_Syntax_Syntax.Pat_dot_term (((x), (t))); FStar_Syntax_Syntax.ty = _54_2045.FStar_Syntax_Syntax.ty; FStar_Syntax_Syntax.p = _54_2045.FStar_Syntax_Syntax.p})), (env))))
end))
in (

let branches = (match (env) with
| [] when whnf -> begin
branches
end
| _54_2049 -> begin
(FStar_All.pipe_right branches (FStar_List.map (fun branch -> (

let _54_2054 = (FStar_Syntax_Subst.open_branch branch)
in (match (_54_2054) with
| (p, wopt, e) -> begin
(

let _54_2057 = (norm_pat env p)
in (match (_54_2057) with
| (p, env) -> begin
(

let wopt = (match (wopt) with
| None -> begin
None
end
| Some (w) -> begin
(let _151_1048 = (norm_or_whnf env w)
in Some (_151_1048))
end)
in (

let e = (norm_or_whnf env e)
in (FStar_Syntax_Util.branch ((p), (wopt), (e)))))
end))
end)))))
end)
in (let _151_1049 = (mk (FStar_Syntax_Syntax.Tm_match (((scrutinee), (branches)))) r)
in (rebuild cfg env stack _151_1049)))))))
end))
in (

let rec is_cons = (fun head -> (match (head.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_uinst (h, _54_2068) -> begin
(is_cons h)
end
| (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = _; FStar_Syntax_Syntax.fv_delta = _; FStar_Syntax_Syntax.fv_qual = Some (FStar_Syntax_Syntax.Data_ctor)})) | (FStar_Syntax_Syntax.Tm_fvar ({FStar_Syntax_Syntax.fv_name = _; FStar_Syntax_Syntax.fv_delta = _; FStar_Syntax_Syntax.fv_qual = Some (FStar_Syntax_Syntax.Record_ctor (_))})) -> begin
true
end
| _54_2093 -> begin
false
end))
in (

let guard_when_clause = (fun wopt b rest -> (match (wopt) with
| None -> begin
b
end
| Some (w) -> begin
(

let then_branch = b
in (

let else_branch = (mk (FStar_Syntax_Syntax.Tm_match (((scrutinee), (rest)))) r)
in (FStar_Syntax_Util.if_then_else w then_branch else_branch)))
end))
in (

let rec matches_pat = (fun scrutinee p -> (

let scrutinee = (FStar_Syntax_Util.unmeta scrutinee)
in (

let _54_2110 = (FStar_Syntax_Util.head_and_args scrutinee)
in (match (_54_2110) with
| (head, args) -> begin
(match (p.FStar_Syntax_Syntax.v) with
| FStar_Syntax_Syntax.Pat_disj (ps) -> begin
(

let mopt = (FStar_Util.find_map ps (fun p -> (

let m = (matches_pat scrutinee p)
in (match (m) with
| FStar_Util.Inl (_54_2116) -> begin
Some (m)
end
| FStar_Util.Inr (true) -> begin
Some (m)
end
| FStar_Util.Inr (false) -> begin
None
end))))
in (match (mopt) with
| None -> begin
FStar_Util.Inr (false)
end
| Some (m) -> begin
m
end))
end
| (FStar_Syntax_Syntax.Pat_var (_)) | (FStar_Syntax_Syntax.Pat_wild (_)) -> begin
FStar_Util.Inl ((scrutinee)::[])
end
| FStar_Syntax_Syntax.Pat_dot_term (_54_2133) -> begin
FStar_Util.Inl ([])
end
| FStar_Syntax_Syntax.Pat_constant (s) -> begin
(match (scrutinee.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_constant (s') when (s = s') -> begin
FStar_Util.Inl ([])
end
| _54_2140 -> begin
(let _151_1066 = (not ((is_cons head)))
in FStar_Util.Inr (_151_1066))
end)
end
| FStar_Syntax_Syntax.Pat_cons (fv, arg_pats) -> begin
(match ((let _151_1067 = (FStar_Syntax_Util.un_uinst head)
in _151_1067.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_fvar (fv') when (FStar_Syntax_Syntax.fv_eq fv fv') -> begin
(matches_args [] args arg_pats)
end
| _54_2148 -> begin
(let _151_1068 = (not ((is_cons head)))
in FStar_Util.Inr (_151_1068))
end)
end)
end))))
and matches_args = (fun out a p -> (match (((a), (p))) with
| ([], []) -> begin
FStar_Util.Inl (out)
end
| (((t, _54_2158))::rest_a, ((p, _54_2164))::rest_p) -> begin
(match ((matches_pat t p)) with
| FStar_Util.Inl (s) -> begin
(matches_args (FStar_List.append out s) rest_a rest_p)
end
| m -> begin
m
end)
end
| _54_2172 -> begin
FStar_Util.Inr (false)
end))
in (

let rec matches = (fun scrutinee p -> (match (p) with
| [] -> begin
(norm_and_rebuild_match ())
end
| ((p, wopt, b))::rest -> begin
(match ((matches_pat scrutinee p)) with
| FStar_Util.Inr (false) -> begin
(matches scrutinee rest)
end
| FStar_Util.Inr (true) -> begin
(norm_and_rebuild_match ())
end
| FStar_Util.Inl (s) -> begin
(

let _54_2190 = (log cfg (fun _54_2189 -> (match (()) with
| () -> begin
(let _151_1079 = (FStar_Syntax_Print.pat_to_string p)
in (let _151_1078 = (let _151_1077 = (FStar_List.map FStar_Syntax_Print.term_to_string s)
in (FStar_All.pipe_right _151_1077 (FStar_String.concat "; ")))
in (FStar_Util.print2 "Matches pattern %s with subst = %s\n" _151_1079 _151_1078)))
end)))
in (

let env = (FStar_List.fold_left (fun env t -> (let _151_1084 = (let _151_1083 = (let _151_1082 = (FStar_Util.mk_ref (Some ((([]), (t)))))
in (([]), (t), (_151_1082), (false)))
in Clos (_151_1083))
in (_151_1084)::env)) env s)
in (let _151_1085 = (guard_when_clause wopt b rest)
in (norm cfg env stack _151_1085))))
end)
end))
in if (FStar_All.pipe_right cfg.steps (FStar_List.contains (Exclude (Iota)))) then begin
(norm_and_rebuild_match ())
end else begin
(matches scrutinee branches)
end)))))))
end))


let config : step Prims.list  ->  FStar_TypeChecker_Env.env  ->  cfg = (fun s e -> (

let d = (FStar_All.pipe_right s (FStar_List.collect (fun _54_10 -> (match (_54_10) with
| UnfoldUntil (k) -> begin
(FStar_TypeChecker_Env.Unfold (k))::[]
end
| Eager_unfolding -> begin
(FStar_TypeChecker_Env.Eager_unfolding_only)::[]
end
| Inlining -> begin
(FStar_TypeChecker_Env.Inlining)::[]
end
| _54_2203 -> begin
[]
end))))
in (

let d = (match (d) with
| [] -> begin
(FStar_TypeChecker_Env.NoDelta)::[]
end
| _54_2207 -> begin
d
end)
in {steps = s; tcenv = e; delta_level = d})))


let normalize : steps  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun s e t -> (let _151_1097 = (config s e)
in (norm _151_1097 [] [] t)))


let normalize_comp : steps  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp = (fun s e t -> (let _151_1104 = (config s e)
in (norm_comp _151_1104 [] t)))


let normalize_universe : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.universe = (fun env u -> (let _151_1109 = (config [] env)
in (norm_universe _151_1109 [] u)))


let ghost_to_pure : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp = (fun env c -> (let _151_1114 = (config [] env)
in (ghost_to_pure_aux _151_1114 [] c)))


let ghost_to_pure_lcomp : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.lcomp = (fun env lc -> (

let cfg = (config ((Eager_unfolding)::(UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::(EraseUniverses)::(AllowUnboundUniverses)::[]) env)
in (

let non_info = (fun t -> (let _151_1121 = (norm cfg [] [] t)
in (FStar_Syntax_Util.non_informative _151_1121)))
in if ((FStar_Syntax_Util.is_ghost_effect lc.FStar_Syntax_Syntax.eff_name) && (non_info lc.FStar_Syntax_Syntax.res_typ)) then begin
(match ((downgrade_ghost_effect_name lc.FStar_Syntax_Syntax.eff_name)) with
| Some (pure_eff) -> begin
(

let _54_2226 = lc
in {FStar_Syntax_Syntax.eff_name = pure_eff; FStar_Syntax_Syntax.res_typ = _54_2226.FStar_Syntax_Syntax.res_typ; FStar_Syntax_Syntax.cflags = _54_2226.FStar_Syntax_Syntax.cflags; FStar_Syntax_Syntax.comp = (fun _54_2228 -> (match (()) with
| () -> begin
(let _151_1123 = (lc.FStar_Syntax_Syntax.comp ())
in (ghost_to_pure env _151_1123))
end))})
end
| None -> begin
lc
end)
end else begin
lc
end)))


let term_to_string : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  Prims.string = (fun env t -> (let _151_1128 = (normalize ((AllowUnboundUniverses)::[]) env t)
in (FStar_Syntax_Print.term_to_string _151_1128)))


let comp_to_string : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  Prims.string = (fun env c -> (let _151_1134 = (let _151_1133 = (config ((AllowUnboundUniverses)::[]) env)
in (norm_comp _151_1133 [] c))
in (FStar_Syntax_Print.comp_to_string _151_1134)))


let normalize_refinement : steps  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ = (fun steps env t0 -> (

let t = (normalize (FStar_List.append steps ((Beta)::[])) env t0)
in (

let rec aux = (fun t -> (

let t = (FStar_Syntax_Subst.compress t)
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_refine (x, phi) -> begin
(

let t0 = (aux x.FStar_Syntax_Syntax.sort)
in (match (t0.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_refine (y, phi1) -> begin
(let _151_1145 = (let _151_1144 = (let _151_1143 = (FStar_Syntax_Util.mk_conj phi1 phi)
in ((y), (_151_1143)))
in FStar_Syntax_Syntax.Tm_refine (_151_1144))
in (mk _151_1145 t0.FStar_Syntax_Syntax.pos))
end
| _54_2251 -> begin
t
end))
end
| _54_2253 -> begin
t
end)))
in (aux t))))


let eta_expand_with_type : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term = (fun t sort -> (

let _54_2258 = (FStar_Syntax_Util.arrow_formals_comp sort)
in (match (_54_2258) with
| (binders, c) -> begin
(match (binders) with
| [] -> begin
t
end
| _54_2261 -> begin
(

let _54_2264 = (FStar_All.pipe_right binders FStar_Syntax_Util.args_of_binders)
in (match (_54_2264) with
| (binders, args) -> begin
(let _151_1154 = (FStar_Syntax_Syntax.mk_Tm_app t args None t.FStar_Syntax_Syntax.pos)
in (let _151_1153 = (let _151_1152 = (FStar_All.pipe_right (FStar_Syntax_Util.lcomp_of_comp c) (fun _151_1150 -> FStar_Util.Inl (_151_1150)))
in (FStar_All.pipe_right _151_1152 (fun _151_1151 -> Some (_151_1151))))
in (FStar_Syntax_Util.abs binders _151_1154 _151_1153)))
end))
end)
end)))


let eta_expand : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun env t -> (match ((let _151_1159 = (FStar_ST.read t.FStar_Syntax_Syntax.tk)
in ((_151_1159), (t.FStar_Syntax_Syntax.n)))) with
| (Some (sort), _54_2270) -> begin
(let _151_1160 = (mk sort t.FStar_Syntax_Syntax.pos)
in (eta_expand_with_type t _151_1160))
end
| (_54_2273, FStar_Syntax_Syntax.Tm_name (x)) -> begin
(eta_expand_with_type t x.FStar_Syntax_Syntax.sort)
end
| _54_2278 -> begin
(

let _54_2281 = (FStar_Syntax_Util.head_and_args t)
in (match (_54_2281) with
| (head, args) -> begin
(match ((let _151_1161 = (FStar_Syntax_Subst.compress head)
in _151_1161.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_uvar (_54_2283, thead) -> begin
(

let _54_2289 = (FStar_Syntax_Util.arrow_formals thead)
in (match (_54_2289) with
| (formals, tres) -> begin
if ((FStar_List.length formals) = (FStar_List.length args)) then begin
t
end else begin
(

let _54_2297 = (env.FStar_TypeChecker_Env.type_of (

let _54_2290 = env
in {FStar_TypeChecker_Env.solver = _54_2290.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _54_2290.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _54_2290.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _54_2290.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _54_2290.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _54_2290.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = None; FStar_TypeChecker_Env.sigtab = _54_2290.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _54_2290.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _54_2290.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _54_2290.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _54_2290.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _54_2290.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _54_2290.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _54_2290.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _54_2290.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _54_2290.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _54_2290.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = true; FStar_TypeChecker_Env.lax_universes = _54_2290.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = _54_2290.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = _54_2290.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = true; FStar_TypeChecker_Env.qname_and_index = _54_2290.FStar_TypeChecker_Env.qname_and_index}) t)
in (match (_54_2297) with
| (_54_2293, ty, _54_2296) -> begin
(eta_expand_with_type t ty)
end))
end
end))
end
| _54_2299 -> begin
(

let _54_2307 = (env.FStar_TypeChecker_Env.type_of (

let _54_2300 = env
in {FStar_TypeChecker_Env.solver = _54_2300.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _54_2300.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _54_2300.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _54_2300.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _54_2300.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _54_2300.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = None; FStar_TypeChecker_Env.sigtab = _54_2300.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _54_2300.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _54_2300.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _54_2300.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _54_2300.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _54_2300.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _54_2300.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _54_2300.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _54_2300.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _54_2300.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _54_2300.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = true; FStar_TypeChecker_Env.lax_universes = _54_2300.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = _54_2300.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = _54_2300.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = true; FStar_TypeChecker_Env.qname_and_index = _54_2300.FStar_TypeChecker_Env.qname_and_index}) t)
in (match (_54_2307) with
| (_54_2303, ty, _54_2306) -> begin
(eta_expand_with_type t ty)
end))
end)
end))
end))




