open Prims
let (debug_embedding : Prims.bool FStar_ST.ref) = FStar_Util.mk_ref false 
let (eager_embedding : Prims.bool FStar_ST.ref) = FStar_Util.mk_ref false 
type debug_level_t =
  | Low 
  | Medium 
  | High 
  | Extreme 
  | Other of Prims.string 
let (uu___is_Low : debug_level_t -> Prims.bool) =
  fun projectee  -> match projectee with | Low  -> true | uu____26 -> false 
let (uu___is_Medium : debug_level_t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Medium  -> true | uu____37 -> false
  
let (uu___is_High : debug_level_t -> Prims.bool) =
  fun projectee  -> match projectee with | High  -> true | uu____48 -> false 
let (uu___is_Extreme : debug_level_t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Extreme  -> true | uu____59 -> false
  
let (uu___is_Other : debug_level_t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Other _0 -> true | uu____72 -> false
  
let (__proj__Other__item___0 : debug_level_t -> Prims.string) =
  fun projectee  -> match projectee with | Other _0 -> _0 
type option_val =
  | Bool of Prims.bool 
  | String of Prims.string 
  | Path of Prims.string 
  | Int of Prims.int 
  | List of option_val Prims.list 
  | Unset 
let (uu___is_Bool : option_val -> Prims.bool) =
  fun projectee  ->
    match projectee with | Bool _0 -> true | uu____126 -> false
  
let (__proj__Bool__item___0 : option_val -> Prims.bool) =
  fun projectee  -> match projectee with | Bool _0 -> _0 
let (uu___is_String : option_val -> Prims.bool) =
  fun projectee  ->
    match projectee with | String _0 -> true | uu____149 -> false
  
let (__proj__String__item___0 : option_val -> Prims.string) =
  fun projectee  -> match projectee with | String _0 -> _0 
let (uu___is_Path : option_val -> Prims.bool) =
  fun projectee  ->
    match projectee with | Path _0 -> true | uu____172 -> false
  
let (__proj__Path__item___0 : option_val -> Prims.string) =
  fun projectee  -> match projectee with | Path _0 -> _0 
let (uu___is_Int : option_val -> Prims.bool) =
  fun projectee  ->
    match projectee with | Int _0 -> true | uu____195 -> false
  
let (__proj__Int__item___0 : option_val -> Prims.int) =
  fun projectee  -> match projectee with | Int _0 -> _0 
let (uu___is_List : option_val -> Prims.bool) =
  fun projectee  ->
    match projectee with | List _0 -> true | uu____219 -> false
  
let (__proj__List__item___0 : option_val -> option_val Prims.list) =
  fun projectee  -> match projectee with | List _0 -> _0 
let (uu___is_Unset : option_val -> Prims.bool) =
  fun projectee  ->
    match projectee with | Unset  -> true | uu____243 -> false
  
type error_flag =
  | CFatal 
  | CAlwaysError 
  | CError 
  | CWarning 
  | CSilent 
let (uu___is_CFatal : error_flag -> Prims.bool) =
  fun projectee  ->
    match projectee with | CFatal  -> true | uu____254 -> false
  
let (uu___is_CAlwaysError : error_flag -> Prims.bool) =
  fun projectee  ->
    match projectee with | CAlwaysError  -> true | uu____265 -> false
  
let (uu___is_CError : error_flag -> Prims.bool) =
  fun projectee  ->
    match projectee with | CError  -> true | uu____276 -> false
  
let (uu___is_CWarning : error_flag -> Prims.bool) =
  fun projectee  ->
    match projectee with | CWarning  -> true | uu____287 -> false
  
let (uu___is_CSilent : error_flag -> Prims.bool) =
  fun projectee  ->
    match projectee with | CSilent  -> true | uu____298 -> false
  
let (__unit_tests__ : Prims.bool FStar_ST.ref) = FStar_Util.mk_ref false 
let (__unit_tests : unit -> Prims.bool) =
  fun uu____312  -> FStar_ST.op_Bang __unit_tests__ 
let (__set_unit_tests : unit -> unit) =
  fun uu____339  -> FStar_ST.op_Colon_Equals __unit_tests__ true 
let (__clear_unit_tests : unit -> unit) =
  fun uu____367  -> FStar_ST.op_Colon_Equals __unit_tests__ false 
let (as_bool : option_val -> Prims.bool) =
  fun uu___0_396  ->
    match uu___0_396 with
    | Bool b -> b
    | uu____400 -> failwith "Impos: expected Bool"
  
let (as_int : option_val -> Prims.int) =
  fun uu___1_409  ->
    match uu___1_409 with
    | Int b -> b
    | uu____413 -> failwith "Impos: expected Int"
  
let (as_string : option_val -> Prims.string) =
  fun uu___2_422  ->
    match uu___2_422 with
    | String b -> b
    | Path b -> FStar_Common.try_convert_file_name_to_mixed b
    | uu____428 -> failwith "Impos: expected String"
  
let (as_list' : option_val -> option_val Prims.list) =
  fun uu___3_438  ->
    match uu___3_438 with
    | List ts -> ts
    | uu____444 -> failwith "Impos: expected List"
  
let as_list :
  'Auu____455 .
    (option_val -> 'Auu____455) -> option_val -> 'Auu____455 Prims.list
  =
  fun as_t  ->
    fun x  ->
      let uu____473 = as_list' x  in
      FStar_All.pipe_right uu____473 (FStar_List.map as_t)
  
let as_option :
  'Auu____487 .
    (option_val -> 'Auu____487) ->
      option_val -> 'Auu____487 FStar_Pervasives_Native.option
  =
  fun as_t  ->
    fun uu___4_502  ->
      match uu___4_502 with
      | Unset  -> FStar_Pervasives_Native.None
      | v1 ->
          let uu____506 = as_t v1  in FStar_Pervasives_Native.Some uu____506
  
let (as_comma_string_list : option_val -> Prims.string Prims.list) =
  fun uu___5_515  ->
    match uu___5_515 with
    | List ls ->
        let uu____522 =
          FStar_List.map
            (fun l  ->
               let uu____534 = as_string l  in FStar_Util.split uu____534 ",")
            ls
           in
        FStar_All.pipe_left FStar_List.flatten uu____522
    | uu____546 -> failwith "Impos: expected String (comma list)"
  
type optionstate = option_val FStar_Util.smap
let copy_optionstate :
  'Auu____558 . 'Auu____558 FStar_Util.smap -> 'Auu____558 FStar_Util.smap =
  fun m  -> FStar_Util.smap_copy m 
let (fstar_options : optionstate Prims.list Prims.list FStar_ST.ref) =
  FStar_Util.mk_ref [] 
let (internal_peek : unit -> optionstate) =
  fun uu____588  ->
    let uu____589 =
      let uu____592 = FStar_ST.op_Bang fstar_options  in
      FStar_List.hd uu____592  in
    FStar_List.hd uu____589
  
let (peek : unit -> optionstate) =
  fun uu____631  ->
    let uu____632 = internal_peek ()  in copy_optionstate uu____632
  
let (pop : unit -> unit) =
  fun uu____640  ->
    let uu____641 = FStar_ST.op_Bang fstar_options  in
    match uu____641 with
    | [] -> failwith "TOO MANY POPS!"
    | uu____676::[] -> failwith "TOO MANY POPS!"
    | uu____684::tl1 -> FStar_ST.op_Colon_Equals fstar_options tl1
  
let (push : unit -> unit) =
  fun uu____726  ->
    let uu____727 =
      let uu____732 =
        let uu____735 =
          let uu____738 = FStar_ST.op_Bang fstar_options  in
          FStar_List.hd uu____738  in
        FStar_List.map copy_optionstate uu____735  in
      let uu____772 = FStar_ST.op_Bang fstar_options  in uu____732 ::
        uu____772
       in
    FStar_ST.op_Colon_Equals fstar_options uu____727
  
let (internal_pop : unit -> Prims.bool) =
  fun uu____839  ->
    let curstack =
      let uu____843 = FStar_ST.op_Bang fstar_options  in
      FStar_List.hd uu____843  in
    match curstack with
    | [] -> failwith "impossible: empty current option stack"
    | uu____880::[] -> false
    | uu____882::tl1 ->
        ((let uu____887 =
            let uu____892 =
              let uu____897 = FStar_ST.op_Bang fstar_options  in
              FStar_List.tl uu____897  in
            tl1 :: uu____892  in
          FStar_ST.op_Colon_Equals fstar_options uu____887);
         true)
  
let (internal_push : unit -> unit) =
  fun uu____966  ->
    let curstack =
      let uu____970 = FStar_ST.op_Bang fstar_options  in
      FStar_List.hd uu____970  in
    let stack' =
      let uu____1007 =
        let uu____1008 = FStar_List.hd curstack  in
        copy_optionstate uu____1008  in
      uu____1007 :: curstack  in
    let uu____1011 =
      let uu____1016 =
        let uu____1021 = FStar_ST.op_Bang fstar_options  in
        FStar_List.tl uu____1021  in
      stack' :: uu____1016  in
    FStar_ST.op_Colon_Equals fstar_options uu____1011
  
let (set : optionstate -> unit) =
  fun o  ->
    let uu____1090 = FStar_ST.op_Bang fstar_options  in
    match uu____1090 with
    | [] -> failwith "set on empty option stack"
    | []::uu____1125 -> failwith "set on empty current option stack"
    | (uu____1133::tl1)::os ->
        FStar_ST.op_Colon_Equals fstar_options ((o :: tl1) :: os)
  
let (snapshot : unit -> (Prims.int * unit)) =
  fun uu____1183  -> FStar_Common.snapshot push fstar_options () 
let (rollback : Prims.int FStar_Pervasives_Native.option -> unit) =
  fun depth  -> FStar_Common.rollback pop fstar_options depth 
let (set_option : Prims.string -> option_val -> unit) =
  fun k  ->
    fun v1  ->
      let uu____1213 = internal_peek ()  in
      FStar_Util.smap_add uu____1213 k v1
  
let (set_option' : (Prims.string * option_val) -> unit) =
  fun uu____1226  -> match uu____1226 with | (k,v1) -> set_option k v1 
let (light_off_files : Prims.string Prims.list FStar_ST.ref) =
  FStar_Util.mk_ref [] 
let (add_light_off_file : Prims.string -> unit) =
  fun filename  ->
    let uu____1254 =
      let uu____1258 = FStar_ST.op_Bang light_off_files  in filename ::
        uu____1258
       in
    FStar_ST.op_Colon_Equals light_off_files uu____1254
  
let (defaults : (Prims.string * option_val) Prims.list) =
  [("__temp_no_proj", (List []));
  ("__temp_fast_implicits", (Bool false));
  ("abort_on", (Int Prims.int_zero));
  ("admit_smt_queries", (Bool false));
  ("admit_except", Unset);
  ("already_cached", Unset);
  ("cache_checked_modules", (Bool false));
  ("cache_dir", Unset);
  ("cache_off", (Bool false));
  ("cmi", (Bool false));
  ("codegen", Unset);
  ("codegen-lib", (List []));
  ("debug", (List []));
  ("debug_level", (List []));
  ("defensive", (String "no"));
  ("dep", Unset);
  ("dep_ninja", (String "all"));
  ("detail_errors", (Bool false));
  ("detail_hint_replay", (Bool false));
  ("doc", (Bool false));
  ("dump_module", (List []));
  ("eager_subtyping", (Bool false));
  ("expose_interfaces", (Bool false));
  ("extract", Unset);
  ("extract_all", (Bool false));
  ("extract_module", (List []));
  ("extract_namespace", (List []));
  ("fs_typ_app", (Bool false));
  ("full_context_dependency", (Bool true));
  ("hide_uvar_nums", (Bool false));
  ("hint_info", (Bool false));
  ("hint_dir", Unset);
  ("hint_file", Unset);
  ("in", (Bool false));
  ("ide", (Bool false));
  ("lsp", (Bool false));
  ("include", (List []));
  ("print", (Bool false));
  ("print_in_place", (Bool false));
  ("fuel", Unset);
  ("ifuel", Unset);
  ("initial_fuel", (Int (Prims.of_int (2))));
  ("initial_ifuel", (Int Prims.int_one));
  ("keep_query_captions", (Bool true));
  ("lax", (Bool false));
  ("load", (List []));
  ("log_queries", (Bool false));
  ("log_types", (Bool false));
  ("max_fuel", (Int (Prims.of_int (8))));
  ("max_ifuel", (Int (Prims.of_int (2))));
  ("min_fuel", (Int Prims.int_one));
  ("MLish", (Bool false));
  ("no_default_includes", (Bool false));
  ("no_extract", (List []));
  ("no_location_info", (Bool false));
  ("no_smt", (Bool false));
  ("no_plugins", (Bool false));
  ("no_tactics", (Bool false));
  ("normalize_pure_terms_for_extraction", (Bool false));
  ("odir", Unset);
  ("prims", Unset);
  ("pretype", (Bool true));
  ("prims_ref", Unset);
  ("print_bound_var_types", (Bool false));
  ("print_effect_args", (Bool false));
  ("print_full_names", (Bool false));
  ("print_implicits", (Bool false));
  ("print_universes", (Bool false));
  ("print_z3_statistics", (Bool false));
  ("prn", (Bool false));
  ("quake", (Int Prims.int_zero));
  ("quake_lo", (Int Prims.int_one));
  ("quake_hi", (Int Prims.int_one));
  ("query_stats", (Bool false));
  ("record_hints", (Bool false));
  ("record_options", (Bool false));
  ("reuse_hint_for", Unset);
  ("silent", (Bool false));
  ("smt", Unset);
  ("smtencoding.elim_box", (Bool false));
  ("smtencoding.nl_arith_repr", (String "boxwrap"));
  ("smtencoding.l_arith_repr", (String "boxwrap"));
  ("smtencoding.valid_intro", (Bool true));
  ("smtencoding.valid_elim", (Bool false));
  ("tactics_failhard", (Bool false));
  ("tactics_info", (Bool false));
  ("tactic_raw_binders", (Bool false));
  ("tactic_trace", (Bool false));
  ("tactic_trace_d", (Int Prims.int_zero));
  ("tcnorm", (Bool true));
  ("timing", (Bool false));
  ("trace_error", (Bool false));
  ("ugly", (Bool false));
  ("unthrottle_inductives", (Bool false));
  ("unsafe_tactic_exec", (Bool false));
  ("use_native_tactics", Unset);
  ("use_eq_at_higher_order", (Bool false));
  ("use_hints", (Bool false));
  ("use_hint_hashes", (Bool false));
  ("using_facts_from", Unset);
  ("vcgen.optimize_bind_as_seq", Unset);
  ("verify_module", (List []));
  ("warn_default_effects", (Bool false));
  ("z3refresh", (Bool false));
  ("z3rlimit", (Int (Prims.of_int (5))));
  ("z3rlimit_factor", (Int Prims.int_one));
  ("z3seed", (Int Prims.int_zero));
  ("z3cliopt", (List []));
  ("use_two_phase_tc", (Bool true));
  ("__no_positivity", (Bool false));
  ("__ml_no_eta_expand_coertions", (Bool false));
  ("__tactics_nbe", (Bool false));
  ("warn_error", (List []));
  ("use_extracted_interfaces", (Bool false));
  ("use_nbe", (Bool false));
  ("use_nbe_for_extraction", (Bool false));
  ("trivial_pre_for_unannotated_effectful_fns", (Bool true));
  ("profile_group_by_decl", (Bool false));
  ("profile_component", Unset);
  ("profile", Unset)] 
let (parse_warn_error_set_get :
  (((Prims.string -> error_flag Prims.list) -> unit) *
    (unit -> Prims.string -> error_flag Prims.list)))
  =
  let r = FStar_Util.mk_ref FStar_Pervasives_Native.None  in
  let set1 f =
    let uu____2318 = FStar_ST.op_Bang r  in
    match uu____2318 with
    | FStar_Pervasives_Native.None  ->
        FStar_ST.op_Colon_Equals r (FStar_Pervasives_Native.Some f)
    | uu____2409 -> failwith "Multiple initialization of FStar.Options"  in
  let get1 uu____2430 =
    let uu____2431 = FStar_ST.op_Bang r  in
    match uu____2431 with
    | FStar_Pervasives_Native.Some f -> f
    | FStar_Pervasives_Native.None  ->
        failwith "FStar.Options is improperly initialized"
     in
  (set1, get1) 
let (initialize_parse_warn_error :
  (Prims.string -> error_flag Prims.list) -> unit) =
  fun f  -> FStar_Pervasives_Native.fst parse_warn_error_set_get f 
let (parse_warn_error : Prims.string -> error_flag Prims.list) =
  fun s  ->
    let uu____2570 = FStar_Pervasives_Native.snd parse_warn_error_set_get ()
       in
    uu____2570 s
  
let (init : unit -> unit) =
  fun uu____2601  ->
    let o = internal_peek ()  in
    FStar_Util.smap_clear o;
    FStar_All.pipe_right defaults (FStar_List.iter set_option')
  
let (clear : unit -> unit) =
  fun uu____2621  ->
    let o = FStar_Util.smap_create (Prims.of_int (50))  in
    FStar_ST.op_Colon_Equals fstar_options [[o]];
    FStar_ST.op_Colon_Equals light_off_files [];
    init ()
  
let (_run : unit) = clear () 
let (get_option : Prims.string -> option_val) =
  fun s  ->
    let uu____2694 =
      let uu____2697 = internal_peek ()  in
      FStar_Util.smap_try_find uu____2697 s  in
    match uu____2694 with
    | FStar_Pervasives_Native.None  ->
        let uu____2700 =
          let uu____2702 = FStar_String.op_Hat s " not found"  in
          FStar_String.op_Hat "Impossible: option " uu____2702  in
        failwith uu____2700
    | FStar_Pervasives_Native.Some s1 -> s1
  
let lookup_opt :
  'Auu____2714 . Prims.string -> (option_val -> 'Auu____2714) -> 'Auu____2714
  = fun s  -> fun c  -> let uu____2732 = get_option s  in c uu____2732 
let (get_abort_on : unit -> Prims.int) =
  fun uu____2739  -> lookup_opt "abort_on" as_int 
let (get_admit_smt_queries : unit -> Prims.bool) =
  fun uu____2748  -> lookup_opt "admit_smt_queries" as_bool 
let (get_admit_except : unit -> Prims.string FStar_Pervasives_Native.option)
  = fun uu____2759  -> lookup_opt "admit_except" (as_option as_string) 
let (get_already_cached :
  unit -> Prims.string Prims.list FStar_Pervasives_Native.option) =
  fun uu____2775  ->
    lookup_opt "already_cached" (as_option (as_list as_string))
  
let (get_cache_checked_modules : unit -> Prims.bool) =
  fun uu____2792  -> lookup_opt "cache_checked_modules" as_bool 
let (get_cache_dir : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____2803  -> lookup_opt "cache_dir" (as_option as_string) 
let (get_cache_off : unit -> Prims.bool) =
  fun uu____2815  -> lookup_opt "cache_off" as_bool 
let (get_cmi : unit -> Prims.bool) =
  fun uu____2824  -> lookup_opt "cmi" as_bool 
let (get_codegen : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____2835  -> lookup_opt "codegen" (as_option as_string) 
let (get_codegen_lib : unit -> Prims.string Prims.list) =
  fun uu____2849  -> lookup_opt "codegen-lib" (as_list as_string) 
let (get_debug : unit -> Prims.string Prims.list) =
  fun uu____2863  -> lookup_opt "debug" (as_list as_string) 
let (get_debug_level : unit -> Prims.string Prims.list) =
  fun uu____2877  -> lookup_opt "debug_level" as_comma_string_list 
let (get_defensive : unit -> Prims.string) =
  fun uu____2888  -> lookup_opt "defensive" as_string 
let (get_dep : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____2899  -> lookup_opt "dep" (as_option as_string) 
let (get_dep_ninja : unit -> Prims.string) =
  fun uu____2911  -> lookup_opt "dep_ninja" as_string 
let (get_detail_errors : unit -> Prims.bool) =
  fun uu____2920  -> lookup_opt "detail_errors" as_bool 
let (get_detail_hint_replay : unit -> Prims.bool) =
  fun uu____2929  -> lookup_opt "detail_hint_replay" as_bool 
let (get_doc : unit -> Prims.bool) =
  fun uu____2938  -> lookup_opt "doc" as_bool 
let (get_dump_module : unit -> Prims.string Prims.list) =
  fun uu____2949  -> lookup_opt "dump_module" (as_list as_string) 
let (get_eager_subtyping : unit -> Prims.bool) =
  fun uu____2961  -> lookup_opt "eager_subtyping" as_bool 
let (get_expose_interfaces : unit -> Prims.bool) =
  fun uu____2970  -> lookup_opt "expose_interfaces" as_bool 
let (get_extract :
  unit -> Prims.string Prims.list FStar_Pervasives_Native.option) =
  fun uu____2983  -> lookup_opt "extract" (as_option (as_list as_string)) 
let (get_extract_module : unit -> Prims.string Prims.list) =
  fun uu____3002  -> lookup_opt "extract_module" (as_list as_string) 
let (get_extract_namespace : unit -> Prims.string Prims.list) =
  fun uu____3016  -> lookup_opt "extract_namespace" (as_list as_string) 
let (get_fs_typ_app : unit -> Prims.bool) =
  fun uu____3028  -> lookup_opt "fs_typ_app" as_bool 
let (get_hide_uvar_nums : unit -> Prims.bool) =
  fun uu____3037  -> lookup_opt "hide_uvar_nums" as_bool 
let (get_hint_info : unit -> Prims.bool) =
  fun uu____3046  -> lookup_opt "hint_info" as_bool 
let (get_hint_dir : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____3057  -> lookup_opt "hint_dir" (as_option as_string) 
let (get_hint_file : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____3071  -> lookup_opt "hint_file" (as_option as_string) 
let (get_in : unit -> Prims.bool) =
  fun uu____3083  -> lookup_opt "in" as_bool 
let (get_ide : unit -> Prims.bool) =
  fun uu____3092  -> lookup_opt "ide" as_bool 
let (get_lsp : unit -> Prims.bool) =
  fun uu____3101  -> lookup_opt "lsp" as_bool 
let (get_include : unit -> Prims.string Prims.list) =
  fun uu____3112  -> lookup_opt "include" (as_list as_string) 
let (get_print : unit -> Prims.bool) =
  fun uu____3124  -> lookup_opt "print" as_bool 
let (get_print_in_place : unit -> Prims.bool) =
  fun uu____3133  -> lookup_opt "print_in_place" as_bool 
let (get_initial_fuel : unit -> Prims.int) =
  fun uu____3142  -> lookup_opt "initial_fuel" as_int 
let (get_initial_ifuel : unit -> Prims.int) =
  fun uu____3151  -> lookup_opt "initial_ifuel" as_int 
let (get_keep_query_captions : unit -> Prims.bool) =
  fun uu____3160  -> lookup_opt "keep_query_captions" as_bool 
let (get_lax : unit -> Prims.bool) =
  fun uu____3169  -> lookup_opt "lax" as_bool 
let (get_load : unit -> Prims.string Prims.list) =
  fun uu____3180  -> lookup_opt "load" (as_list as_string) 
let (get_log_queries : unit -> Prims.bool) =
  fun uu____3192  -> lookup_opt "log_queries" as_bool 
let (get_log_types : unit -> Prims.bool) =
  fun uu____3201  -> lookup_opt "log_types" as_bool 
let (get_max_fuel : unit -> Prims.int) =
  fun uu____3210  -> lookup_opt "max_fuel" as_int 
let (get_max_ifuel : unit -> Prims.int) =
  fun uu____3219  -> lookup_opt "max_ifuel" as_int 
let (get_min_fuel : unit -> Prims.int) =
  fun uu____3228  -> lookup_opt "min_fuel" as_int 
let (get_MLish : unit -> Prims.bool) =
  fun uu____3237  -> lookup_opt "MLish" as_bool 
let (get_no_default_includes : unit -> Prims.bool) =
  fun uu____3246  -> lookup_opt "no_default_includes" as_bool 
let (get_no_extract : unit -> Prims.string Prims.list) =
  fun uu____3257  -> lookup_opt "no_extract" (as_list as_string) 
let (get_no_location_info : unit -> Prims.bool) =
  fun uu____3269  -> lookup_opt "no_location_info" as_bool 
let (get_no_plugins : unit -> Prims.bool) =
  fun uu____3278  -> lookup_opt "no_plugins" as_bool 
let (get_no_smt : unit -> Prims.bool) =
  fun uu____3287  -> lookup_opt "no_smt" as_bool 
let (get_normalize_pure_terms_for_extraction : unit -> Prims.bool) =
  fun uu____3296  -> lookup_opt "normalize_pure_terms_for_extraction" as_bool 
let (get_odir : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____3307  -> lookup_opt "odir" (as_option as_string) 
let (get_ugly : unit -> Prims.bool) =
  fun uu____3319  -> lookup_opt "ugly" as_bool 
let (get_prims : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____3330  -> lookup_opt "prims" (as_option as_string) 
let (get_print_bound_var_types : unit -> Prims.bool) =
  fun uu____3342  -> lookup_opt "print_bound_var_types" as_bool 
let (get_print_effect_args : unit -> Prims.bool) =
  fun uu____3351  -> lookup_opt "print_effect_args" as_bool 
let (get_print_full_names : unit -> Prims.bool) =
  fun uu____3360  -> lookup_opt "print_full_names" as_bool 
let (get_print_implicits : unit -> Prims.bool) =
  fun uu____3369  -> lookup_opt "print_implicits" as_bool 
let (get_print_universes : unit -> Prims.bool) =
  fun uu____3378  -> lookup_opt "print_universes" as_bool 
let (get_print_z3_statistics : unit -> Prims.bool) =
  fun uu____3387  -> lookup_opt "print_z3_statistics" as_bool 
let (get_prn : unit -> Prims.bool) =
  fun uu____3396  -> lookup_opt "prn" as_bool 
let (get_quake_lo : unit -> Prims.int) =
  fun uu____3405  -> lookup_opt "quake_lo" as_int 
let (get_quake_hi : unit -> Prims.int) =
  fun uu____3414  -> lookup_opt "quake_hi" as_int 
let (get_query_stats : unit -> Prims.bool) =
  fun uu____3423  -> lookup_opt "query_stats" as_bool 
let (get_record_hints : unit -> Prims.bool) =
  fun uu____3432  -> lookup_opt "record_hints" as_bool 
let (get_record_options : unit -> Prims.bool) =
  fun uu____3441  -> lookup_opt "record_options" as_bool 
let (get_reuse_hint_for :
  unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____3452  -> lookup_opt "reuse_hint_for" (as_option as_string) 
let (get_silent : unit -> Prims.bool) =
  fun uu____3464  -> lookup_opt "silent" as_bool 
let (get_smt : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____3475  -> lookup_opt "smt" (as_option as_string) 
let (get_smtencoding_elim_box : unit -> Prims.bool) =
  fun uu____3487  -> lookup_opt "smtencoding.elim_box" as_bool 
let (get_smtencoding_nl_arith_repr : unit -> Prims.string) =
  fun uu____3496  -> lookup_opt "smtencoding.nl_arith_repr" as_string 
let (get_smtencoding_l_arith_repr : unit -> Prims.string) =
  fun uu____3505  -> lookup_opt "smtencoding.l_arith_repr" as_string 
let (get_smtencoding_valid_intro : unit -> Prims.bool) =
  fun uu____3514  -> lookup_opt "smtencoding.valid_intro" as_bool 
let (get_smtencoding_valid_elim : unit -> Prims.bool) =
  fun uu____3523  -> lookup_opt "smtencoding.valid_elim" as_bool 
let (get_tactic_raw_binders : unit -> Prims.bool) =
  fun uu____3532  -> lookup_opt "tactic_raw_binders" as_bool 
let (get_tactics_failhard : unit -> Prims.bool) =
  fun uu____3541  -> lookup_opt "tactics_failhard" as_bool 
let (get_tactics_info : unit -> Prims.bool) =
  fun uu____3550  -> lookup_opt "tactics_info" as_bool 
let (get_tactic_trace : unit -> Prims.bool) =
  fun uu____3559  -> lookup_opt "tactic_trace" as_bool 
let (get_tactic_trace_d : unit -> Prims.int) =
  fun uu____3568  -> lookup_opt "tactic_trace_d" as_int 
let (get_tactics_nbe : unit -> Prims.bool) =
  fun uu____3577  -> lookup_opt "__tactics_nbe" as_bool 
let (get_tcnorm : unit -> Prims.bool) =
  fun uu____3586  -> lookup_opt "tcnorm" as_bool 
let (get_timing : unit -> Prims.bool) =
  fun uu____3595  -> lookup_opt "timing" as_bool 
let (get_trace_error : unit -> Prims.bool) =
  fun uu____3604  -> lookup_opt "trace_error" as_bool 
let (get_unthrottle_inductives : unit -> Prims.bool) =
  fun uu____3613  -> lookup_opt "unthrottle_inductives" as_bool 
let (get_unsafe_tactic_exec : unit -> Prims.bool) =
  fun uu____3622  -> lookup_opt "unsafe_tactic_exec" as_bool 
let (get_use_eq_at_higher_order : unit -> Prims.bool) =
  fun uu____3631  -> lookup_opt "use_eq_at_higher_order" as_bool 
let (get_use_hints : unit -> Prims.bool) =
  fun uu____3640  -> lookup_opt "use_hints" as_bool 
let (get_use_hint_hashes : unit -> Prims.bool) =
  fun uu____3649  -> lookup_opt "use_hint_hashes" as_bool 
let (get_use_native_tactics :
  unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____3660  -> lookup_opt "use_native_tactics" (as_option as_string) 
let (get_use_tactics : unit -> Prims.bool) =
  fun uu____3672  ->
    let uu____3673 = lookup_opt "no_tactics" as_bool  in
    Prims.op_Negation uu____3673
  
let (get_using_facts_from :
  unit -> Prims.string Prims.list FStar_Pervasives_Native.option) =
  fun uu____3687  ->
    lookup_opt "using_facts_from" (as_option (as_list as_string))
  
let (get_vcgen_optimize_bind_as_seq :
  unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____3706  ->
    lookup_opt "vcgen.optimize_bind_as_seq" (as_option as_string)
  
let (get_verify_module : unit -> Prims.string Prims.list) =
  fun uu____3720  -> lookup_opt "verify_module" (as_list as_string) 
let (get___temp_no_proj : unit -> Prims.string Prims.list) =
  fun uu____3734  -> lookup_opt "__temp_no_proj" (as_list as_string) 
let (get_version : unit -> Prims.bool) =
  fun uu____3746  -> lookup_opt "version" as_bool 
let (get_warn_default_effects : unit -> Prims.bool) =
  fun uu____3755  -> lookup_opt "warn_default_effects" as_bool 
let (get_z3cliopt : unit -> Prims.string Prims.list) =
  fun uu____3766  -> lookup_opt "z3cliopt" (as_list as_string) 
let (get_z3refresh : unit -> Prims.bool) =
  fun uu____3778  -> lookup_opt "z3refresh" as_bool 
let (get_z3rlimit : unit -> Prims.int) =
  fun uu____3787  -> lookup_opt "z3rlimit" as_int 
let (get_z3rlimit_factor : unit -> Prims.int) =
  fun uu____3796  -> lookup_opt "z3rlimit_factor" as_int 
let (get_z3seed : unit -> Prims.int) =
  fun uu____3805  -> lookup_opt "z3seed" as_int 
let (get_use_two_phase_tc : unit -> Prims.bool) =
  fun uu____3814  -> lookup_opt "use_two_phase_tc" as_bool 
let (get_no_positivity : unit -> Prims.bool) =
  fun uu____3823  -> lookup_opt "__no_positivity" as_bool 
let (get_ml_no_eta_expand_coertions : unit -> Prims.bool) =
  fun uu____3832  -> lookup_opt "__ml_no_eta_expand_coertions" as_bool 
let (get_warn_error : unit -> Prims.string Prims.list) =
  fun uu____3843  -> lookup_opt "warn_error" (as_list as_string) 
let (get_use_extracted_interfaces : unit -> Prims.bool) =
  fun uu____3855  -> lookup_opt "use_extracted_interfaces" as_bool 
let (get_use_nbe : unit -> Prims.bool) =
  fun uu____3864  -> lookup_opt "use_nbe" as_bool 
let (get_use_nbe_for_extraction : unit -> Prims.bool) =
  fun uu____3873  -> lookup_opt "use_nbe_for_extraction" as_bool 
let (get_trivial_pre_for_unannotated_effectful_fns : unit -> Prims.bool) =
  fun uu____3882  ->
    lookup_opt "trivial_pre_for_unannotated_effectful_fns" as_bool
  
let (get_profile :
  unit -> Prims.string Prims.list FStar_Pervasives_Native.option) =
  fun uu____3895  -> lookup_opt "profile" (as_option (as_list as_string)) 
let (get_profile_group_by_decl : unit -> Prims.bool) =
  fun uu____3912  -> lookup_opt "profile_group_by_decl" as_bool 
let (get_profile_component :
  unit -> Prims.string Prims.list FStar_Pervasives_Native.option) =
  fun uu____3925  ->
    lookup_opt "profile_component" (as_option (as_list as_string))
  
let (dlevel : Prims.string -> debug_level_t) =
  fun uu___6_3942  ->
    match uu___6_3942 with
    | "Low" -> Low
    | "Medium" -> Medium
    | "High" -> High
    | "Extreme" -> Extreme
    | s -> Other s
  
let (one_debug_level_geq : debug_level_t -> debug_level_t -> Prims.bool) =
  fun l1  ->
    fun l2  ->
      match l1 with
      | Other uu____3963 -> l1 = l2
      | Low  -> l1 = l2
      | Medium  -> (l2 = Low) || (l2 = Medium)
      | High  -> ((l2 = Low) || (l2 = Medium)) || (l2 = High)
      | Extreme  ->
          (((l2 = Low) || (l2 = Medium)) || (l2 = High)) || (l2 = Extreme)
  
let (debug_level_geq : debug_level_t -> Prims.bool) =
  fun l2  ->
    let uu____3972 = get_debug_level ()  in
    FStar_All.pipe_right uu____3972
      (FStar_Util.for_some (fun l1  -> one_debug_level_geq (dlevel l1) l2))
  
let (universe_include_path_base_dirs : Prims.string Prims.list) =
  let sub_dirs = ["legacy"; "experimental"; ".cache"]  in
  FStar_All.pipe_right ["/ulib"; "/lib/fstar"]
    (FStar_List.collect
       (fun d  ->
          let uu____4016 =
            FStar_All.pipe_right sub_dirs
              (FStar_List.map
                 (fun s  ->
                    let uu____4032 = FStar_String.op_Hat "/" s  in
                    FStar_String.op_Hat d uu____4032))
             in
          d :: uu____4016))
  
let (_version : Prims.string FStar_ST.ref) = FStar_Util.mk_ref "" 
let (_platform : Prims.string FStar_ST.ref) = FStar_Util.mk_ref "" 
let (_compiler : Prims.string FStar_ST.ref) = FStar_Util.mk_ref "" 
let (_date : Prims.string FStar_ST.ref) = FStar_Util.mk_ref "<not set>" 
let (_commit : Prims.string FStar_ST.ref) = FStar_Util.mk_ref "" 
let (display_version : unit -> unit) =
  fun uu____4071  ->
    let uu____4072 =
      let uu____4074 = FStar_ST.op_Bang _version  in
      let uu____4097 = FStar_ST.op_Bang _platform  in
      let uu____4120 = FStar_ST.op_Bang _compiler  in
      let uu____4143 = FStar_ST.op_Bang _date  in
      let uu____4166 = FStar_ST.op_Bang _commit  in
      FStar_Util.format5
        "F* %s\nplatform=%s\ncompiler=%s\ndate=%s\ncommit=%s\n" uu____4074
        uu____4097 uu____4120 uu____4143 uu____4166
       in
    FStar_Util.print_string uu____4072
  
let display_usage_aux :
  'Auu____4197 'Auu____4198 .
    ('Auu____4197 * Prims.string * 'Auu____4198 FStar_Getopt.opt_variant *
      Prims.string) Prims.list -> unit
  =
  fun specs  ->
    FStar_Util.print_string "fstar.exe [options] file[s]\n";
    FStar_List.iter
      (fun uu____4253  ->
         match uu____4253 with
         | (uu____4266,flag,p,doc) ->
             (match p with
              | FStar_Getopt.ZeroArgs ig ->
                  if doc = ""
                  then
                    let uu____4285 =
                      let uu____4287 = FStar_Util.colorize_bold flag  in
                      FStar_Util.format1 "  --%s\n" uu____4287  in
                    FStar_Util.print_string uu____4285
                  else
                    (let uu____4292 =
                       let uu____4294 = FStar_Util.colorize_bold flag  in
                       FStar_Util.format2 "  --%s  %s\n" uu____4294 doc  in
                     FStar_Util.print_string uu____4292)
              | FStar_Getopt.OneArg (uu____4297,argname) ->
                  if doc = ""
                  then
                    let uu____4312 =
                      let uu____4314 = FStar_Util.colorize_bold flag  in
                      let uu____4316 = FStar_Util.colorize_bold argname  in
                      FStar_Util.format2 "  --%s %s\n" uu____4314 uu____4316
                       in
                    FStar_Util.print_string uu____4312
                  else
                    (let uu____4321 =
                       let uu____4323 = FStar_Util.colorize_bold flag  in
                       let uu____4325 = FStar_Util.colorize_bold argname  in
                       FStar_Util.format3 "  --%s %s  %s\n" uu____4323
                         uu____4325 doc
                        in
                     FStar_Util.print_string uu____4321))) specs
  
let (mk_spec :
  (FStar_BaseTypes.char * Prims.string * option_val FStar_Getopt.opt_variant
    * Prims.string) -> FStar_Getopt.opt)
  =
  fun o  ->
    let uu____4360 = o  in
    match uu____4360 with
    | (ns,name,arg,desc) ->
        let arg1 =
          match arg with
          | FStar_Getopt.ZeroArgs f ->
              let g uu____4402 =
                let uu____4403 = f ()  in set_option name uu____4403  in
              FStar_Getopt.ZeroArgs g
          | FStar_Getopt.OneArg (f,d) ->
              let g x = let uu____4424 = f x  in set_option name uu____4424
                 in
              FStar_Getopt.OneArg (g, d)
           in
        (ns, name, arg1, desc)
  
let (accumulated_option : Prims.string -> option_val -> option_val) =
  fun name  ->
    fun value  ->
      let prev_values =
        let uu____4451 = lookup_opt name (as_option as_list')  in
        FStar_Util.dflt [] uu____4451  in
      List (value :: prev_values)
  
let (reverse_accumulated_option : Prims.string -> option_val -> option_val) =
  fun name  ->
    fun value  ->
      let prev_values =
        let uu____4480 = lookup_opt name (as_option as_list')  in
        FStar_Util.dflt [] uu____4480  in
      List (FStar_List.append prev_values [value])
  
let accumulate_string :
  'Auu____4502 .
    Prims.string -> ('Auu____4502 -> Prims.string) -> 'Auu____4502 -> unit
  =
  fun name  ->
    fun post_processor  ->
      fun value  ->
        let uu____4527 =
          let uu____4528 =
            let uu____4529 = post_processor value  in String uu____4529  in
          accumulated_option name uu____4528  in
        set_option name uu____4527
  
let (add_extract_module : Prims.string -> unit) =
  fun s  -> accumulate_string "extract_module" FStar_String.lowercase s 
let (add_extract_namespace : Prims.string -> unit) =
  fun s  -> accumulate_string "extract_namespace" FStar_String.lowercase s 
let (add_verify_module : Prims.string -> unit) =
  fun s  -> accumulate_string "verify_module" FStar_String.lowercase s 
type opt_type =
  | Const of option_val 
  | IntStr of Prims.string 
  | BoolStr 
  | PathStr of Prims.string 
  | SimpleStr of Prims.string 
  | EnumStr of Prims.string Prims.list 
  | OpenEnumStr of (Prims.string Prims.list * Prims.string) 
  | PostProcessed of ((option_val -> option_val) * opt_type) 
  | Accumulated of opt_type 
  | ReverseAccumulated of opt_type 
  | WithSideEffect of ((unit -> unit) * opt_type) 
let (uu___is_Const : opt_type -> Prims.bool) =
  fun projectee  ->
    match projectee with | Const _0 -> true | uu____4651 -> false
  
let (__proj__Const__item___0 : opt_type -> option_val) =
  fun projectee  -> match projectee with | Const _0 -> _0 
let (uu___is_IntStr : opt_type -> Prims.bool) =
  fun projectee  ->
    match projectee with | IntStr _0 -> true | uu____4671 -> false
  
let (__proj__IntStr__item___0 : opt_type -> Prims.string) =
  fun projectee  -> match projectee with | IntStr _0 -> _0 
let (uu___is_BoolStr : opt_type -> Prims.bool) =
  fun projectee  ->
    match projectee with | BoolStr  -> true | uu____4692 -> false
  
let (uu___is_PathStr : opt_type -> Prims.bool) =
  fun projectee  ->
    match projectee with | PathStr _0 -> true | uu____4705 -> false
  
let (__proj__PathStr__item___0 : opt_type -> Prims.string) =
  fun projectee  -> match projectee with | PathStr _0 -> _0 
let (uu___is_SimpleStr : opt_type -> Prims.bool) =
  fun projectee  ->
    match projectee with | SimpleStr _0 -> true | uu____4728 -> false
  
let (__proj__SimpleStr__item___0 : opt_type -> Prims.string) =
  fun projectee  -> match projectee with | SimpleStr _0 -> _0 
let (uu___is_EnumStr : opt_type -> Prims.bool) =
  fun projectee  ->
    match projectee with | EnumStr _0 -> true | uu____4753 -> false
  
let (__proj__EnumStr__item___0 : opt_type -> Prims.string Prims.list) =
  fun projectee  -> match projectee with | EnumStr _0 -> _0 
let (uu___is_OpenEnumStr : opt_type -> Prims.bool) =
  fun projectee  ->
    match projectee with | OpenEnumStr _0 -> true | uu____4789 -> false
  
let (__proj__OpenEnumStr__item___0 :
  opt_type -> (Prims.string Prims.list * Prims.string)) =
  fun projectee  -> match projectee with | OpenEnumStr _0 -> _0 
let (uu___is_PostProcessed : opt_type -> Prims.bool) =
  fun projectee  ->
    match projectee with | PostProcessed _0 -> true | uu____4839 -> false
  
let (__proj__PostProcessed__item___0 :
  opt_type -> ((option_val -> option_val) * opt_type)) =
  fun projectee  -> match projectee with | PostProcessed _0 -> _0 
let (uu___is_Accumulated : opt_type -> Prims.bool) =
  fun projectee  ->
    match projectee with | Accumulated _0 -> true | uu____4879 -> false
  
let (__proj__Accumulated__item___0 : opt_type -> opt_type) =
  fun projectee  -> match projectee with | Accumulated _0 -> _0 
let (uu___is_ReverseAccumulated : opt_type -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | ReverseAccumulated _0 -> true
    | uu____4898 -> false
  
let (__proj__ReverseAccumulated__item___0 : opt_type -> opt_type) =
  fun projectee  -> match projectee with | ReverseAccumulated _0 -> _0 
let (uu___is_WithSideEffect : opt_type -> Prims.bool) =
  fun projectee  ->
    match projectee with | WithSideEffect _0 -> true | uu____4924 -> false
  
let (__proj__WithSideEffect__item___0 :
  opt_type -> ((unit -> unit) * opt_type)) =
  fun projectee  -> match projectee with | WithSideEffect _0 -> _0 
exception InvalidArgument of Prims.string 
let (uu___is_InvalidArgument : Prims.exn -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | InvalidArgument uu____4967 -> true
    | uu____4970 -> false
  
let (__proj__InvalidArgument__item__uu___ : Prims.exn -> Prims.string) =
  fun projectee  ->
    match projectee with | InvalidArgument uu____4980 -> uu____4980
  
let rec (parse_opt_val :
  Prims.string -> opt_type -> Prims.string -> option_val) =
  fun opt_name  ->
    fun typ  ->
      fun str_val  ->
        try
          (fun uu___310_5004  ->
             match () with
             | () ->
                 (match typ with
                  | Const c -> c
                  | IntStr uu____5006 ->
                      let uu____5008 = FStar_Util.safe_int_of_string str_val
                         in
                      (match uu____5008 with
                       | FStar_Pervasives_Native.Some v1 -> Int v1
                       | FStar_Pervasives_Native.None  ->
                           FStar_Exn.raise (InvalidArgument opt_name))
                  | BoolStr  ->
                      let uu____5016 =
                        if str_val = "true"
                        then true
                        else
                          if str_val = "false"
                          then false
                          else FStar_Exn.raise (InvalidArgument opt_name)
                         in
                      Bool uu____5016
                  | PathStr uu____5033 -> Path str_val
                  | SimpleStr uu____5035 -> String str_val
                  | EnumStr strs ->
                      if FStar_List.mem str_val strs
                      then String str_val
                      else FStar_Exn.raise (InvalidArgument opt_name)
                  | OpenEnumStr uu____5045 -> String str_val
                  | PostProcessed (pp,elem_spec) ->
                      let uu____5062 =
                        parse_opt_val opt_name elem_spec str_val  in
                      pp uu____5062
                  | Accumulated elem_spec ->
                      let v1 = parse_opt_val opt_name elem_spec str_val  in
                      accumulated_option opt_name v1
                  | ReverseAccumulated elem_spec ->
                      let v1 = parse_opt_val opt_name elem_spec str_val  in
                      reverse_accumulated_option opt_name v1
                  | WithSideEffect (side_effect,elem_spec) ->
                      (side_effect ();
                       parse_opt_val opt_name elem_spec str_val))) ()
        with
        | InvalidArgument opt_name1 ->
            let uu____5082 =
              FStar_Util.format1 "Invalid argument to --%s" opt_name1  in
            failwith uu____5082
  
let rec (desc_of_opt_type :
  opt_type -> Prims.string FStar_Pervasives_Native.option) =
  fun typ  ->
    let desc_of_enum cases =
      let uu____5112 =
        let uu____5114 =
          FStar_String.op_Hat (FStar_String.concat "|" cases) "]"  in
        FStar_String.op_Hat "[" uu____5114  in
      FStar_Pervasives_Native.Some uu____5112  in
    match typ with
    | Const c -> FStar_Pervasives_Native.None
    | IntStr desc -> FStar_Pervasives_Native.Some desc
    | BoolStr  -> desc_of_enum ["true"; "false"]
    | PathStr desc -> FStar_Pervasives_Native.Some desc
    | SimpleStr desc -> FStar_Pervasives_Native.Some desc
    | EnumStr strs -> desc_of_enum strs
    | OpenEnumStr (strs,desc) -> desc_of_enum (FStar_List.append strs [desc])
    | PostProcessed (uu____5156,elem_spec) -> desc_of_opt_type elem_spec
    | Accumulated elem_spec -> desc_of_opt_type elem_spec
    | ReverseAccumulated elem_spec -> desc_of_opt_type elem_spec
    | WithSideEffect (uu____5166,elem_spec) -> desc_of_opt_type elem_spec
  
let (arg_spec_of_opt_type :
  Prims.string -> opt_type -> option_val FStar_Getopt.opt_variant) =
  fun opt_name  ->
    fun typ  ->
      let parser = parse_opt_val opt_name typ  in
      let uu____5197 = desc_of_opt_type typ  in
      match uu____5197 with
      | FStar_Pervasives_Native.None  ->
          FStar_Getopt.ZeroArgs ((fun uu____5205  -> parser ""))
      | FStar_Pervasives_Native.Some desc ->
          FStar_Getopt.OneArg (parser, desc)
  
let (pp_validate_dir : option_val -> option_val) =
  fun p  -> let pp = as_string p  in FStar_Util.mkdir false pp; p 
let (pp_lowercase : option_val -> option_val) =
  fun s  ->
    let uu____5231 =
      let uu____5233 = as_string s  in FStar_String.lowercase uu____5233  in
    String uu____5231
  
let (abort_counter : Prims.int FStar_ST.ref) =
  FStar_Util.mk_ref Prims.int_zero 
let rec (specs_with_types :
  unit ->
    (FStar_BaseTypes.char * Prims.string * opt_type * Prims.string)
      Prims.list)
  =
  fun uu____5268  ->
    [(FStar_Getopt.noshort, "abort_on",
       (PostProcessed
          (((fun uu___7_5303  ->
               match uu___7_5303 with
               | Int x -> (FStar_ST.op_Colon_Equals abort_counter x; Int x)
               | x -> failwith "?")), (IntStr "non-negative integer"))),
       "Abort on the n-th error or warning raised. Useful in combination with --trace_error. Count starts at 1, use 0 to disable. (default 0)");
    (FStar_Getopt.noshort, "admit_smt_queries", BoolStr,
      "Admit SMT queries, unsafe! (default 'false')");
    (FStar_Getopt.noshort, "admit_except",
      (SimpleStr "[symbol|(symbol, id)]"),
      "Admit all queries, except those with label (<symbol>, <id>)) (e.g. --admit_except '(FStar.Fin.pigeonhole, 1)' or --admit_except FStar.Fin.pigeonhole)");
    (FStar_Getopt.noshort, "already_cached",
      (Accumulated
         (SimpleStr
            "One or more space-separated occurrences of '[+|-]( * | namespace | module)'")),
      "\n\t\tExpects all modules whose names or namespaces match the provided options \n\t\t\tto already have valid .checked files in the include path");
    (FStar_Getopt.noshort, "cache_checked_modules", (Const (Bool true)),
      "Write a '.checked' file for each module after verification and read from it if present, instead of re-verifying");
    (FStar_Getopt.noshort, "cache_dir",
      (PostProcessed (pp_validate_dir, (PathStr "dir"))),
      "Read and write .checked and .checked.lax in directory <dir>");
    (FStar_Getopt.noshort, "cache_off", (Const (Bool true)),
      "Do not read or write any .checked files");
    (FStar_Getopt.noshort, "cmi", (Const (Bool true)),
      "Inline across module interfaces during extraction (aka. cross-module inlining)");
    (FStar_Getopt.noshort, "codegen",
      (EnumStr ["OCaml"; "FSharp"; "Kremlin"; "Plugin"]),
      "Generate code for further compilation to executable code, or build a compiler plugin");
    (FStar_Getopt.noshort, "codegen-lib",
      (Accumulated (SimpleStr "namespace")),
      "External runtime library (i.e. M.N.x extracts to M.N.X instead of M_N.x)");
    (FStar_Getopt.noshort, "debug", (Accumulated (SimpleStr "module_name")),
      "Print lots of debugging information while checking module");
    (FStar_Getopt.noshort, "debug_level",
      (Accumulated
         (OpenEnumStr (["Low"; "Medium"; "High"; "Extreme"], "..."))),
      "Control the verbosity of debugging info");
    (FStar_Getopt.noshort, "defensive", (EnumStr ["no"; "warn"; "fail"]),
      "Enable several internal sanity checks, useful to track bugs and report issues.\n\t\tif 'no', no checks are performed\n\t\tif 'warn', checks are performed and raise a warning when they fail\n\t\tif 'fail', like 'warn', but the compiler aborts instead of issuing a warning\n\t\t(default 'no')");
    (FStar_Getopt.noshort, "dep",
      (EnumStr ["make"; "graph"; "full"; "ninja"; "raw"]),
      "Output the transitive closure of the full dependency graph in three formats:\n\t 'graph': a format suitable the 'dot' tool from 'GraphViz'\n\t 'full': a format suitable for 'make', including dependences for producing .ml and .krml files\n\t 'ninja': same as 'full' but suitable for 'ninja'\n\t 'make': (deprecated) a format suitable for 'make', including only dependences among source files");
    (FStar_Getopt.noshort, "dep_ninja",
      (EnumStr ["checked"; "ml"; "cmx"; "krml"; "all"]),
      "Output the following dependency rules in ninja format (only with '--dep ninja'):\n\t 'checked': dependencies for producing .checked files\n\t 'ml': dependencies for producing .checked, .ml, files\n\t 'cmx': dependencies for producing .checked, .ml, and .cmx files\n\t 'krml': dependencies for producing .checked and .krml files\n\t 'all': dependencies for producing .checked, .ml, .cmx and .krml files (this is the default)");
    (FStar_Getopt.noshort, "detail_errors", (Const (Bool true)),
      "Emit a detailed error report by asking the SMT solver many queries; will take longer");
    (FStar_Getopt.noshort, "detail_hint_replay", (Const (Bool true)),
      "Emit a detailed report for proof whose unsat core fails to replay");
    (FStar_Getopt.noshort, "doc", (Const (Bool true)),
      "Extract Markdown documentation files for the input modules, as well as an index. Output is written to --odir directory.");
    (FStar_Getopt.noshort, "dump_module",
      (Accumulated (SimpleStr "module_name")), "");
    (FStar_Getopt.noshort, "eager_subtyping", (Const (Bool true)),
      "Try to solve subtyping constraints at each binder (loses precision but may be slightly more efficient)");
    (FStar_Getopt.noshort, "extract",
      (Accumulated
         (SimpleStr
            "One or more space-separated occurrences of '[+|-]( * | namespace | module)'")),
      "\n\t\tExtract only those modules whose names or namespaces match the provided options.\n\t\t\tModules can be extracted or not using the [+|-] qualifier. \n\t\t\tFor example --extract '* -FStar.Reflection +FStar.List -FStar.List.Tot' will \n\t\t\t\tnot extract FStar.List.Tot.*, \n\t\t\t\textract remaining modules from FStar.List.*, \n\t\t\t\tnot extract FStar.Reflection.*, \n\t\t\t\tand extract all the rest.\n\t\tNote, the '+' is optional: --extract '+A' and --extract 'A' mean the same thing.\n\t\tMultiple uses of this option accumulate, e.g., --extract A --extract B is interpreted as --extract 'A B'.");
    (FStar_Getopt.noshort, "extract_module",
      (Accumulated (PostProcessed (pp_lowercase, (SimpleStr "module_name")))),
      "Deprecated: use --extract instead; Only extract the specified modules (instead of the possibly-partial dependency graph)");
    (FStar_Getopt.noshort, "extract_namespace",
      (Accumulated
         (PostProcessed (pp_lowercase, (SimpleStr "namespace name")))),
      "Deprecated: use --extract instead; Only extract modules in the specified namespace");
    (FStar_Getopt.noshort, "expose_interfaces", (Const (Bool true)),
      "Explicitly break the abstraction imposed by the interface of any implementation file that appears on the command line (use with care!)");
    (FStar_Getopt.noshort, "hide_uvar_nums", (Const (Bool true)),
      "Don't print unification variable numbers");
    (FStar_Getopt.noshort, "hint_dir", (PathStr "path"),
      "Read/write hints to <dir>/module_name.hints (instead of placing hint-file alongside source file)");
    (FStar_Getopt.noshort, "hint_file", (PathStr "path"),
      "Read/write hints to <path> (instead of module-specific hints files; overrides hint_dir)");
    (FStar_Getopt.noshort, "hint_info", (Const (Bool true)),
      "Print information regarding hints (deprecated; use --query_stats instead)");
    (FStar_Getopt.noshort, "in", (Const (Bool true)),
      "Legacy interactive mode; reads input from stdin");
    (FStar_Getopt.noshort, "ide", (Const (Bool true)),
      "JSON-based interactive mode for IDEs");
    (FStar_Getopt.noshort, "lsp", (Const (Bool true)),
      "Language Server Protocol-based interactive mode for IDEs");
    (FStar_Getopt.noshort, "include", (ReverseAccumulated (PathStr "path")),
      "A directory in which to search for files included on the command line");
    (FStar_Getopt.noshort, "print", (Const (Bool true)),
      "Parses and prettyprints the files included on the command line");
    (FStar_Getopt.noshort, "print_in_place", (Const (Bool true)),
      "Parses and prettyprints in place the files included on the command line");
    (FStar_Getopt.noshort, "fuel",
      (PostProcessed
         (((fun uu___8_5974  ->
              match uu___8_5974 with
              | String s ->
                  let p f =
                    let uu____5985 = FStar_Util.int_of_string f  in
                    Int uu____5985  in
                  let uu____5987 =
                    match FStar_Util.split s "," with
                    | f::[] -> (f, f)
                    | f1::f2::[] -> (f1, f2)
                    | uu____6016 -> failwith "unexpected value for --fuel"
                     in
                  (match uu____5987 with
                   | (min1,max1) ->
                       ((let uu____6034 = p min1  in
                         set_option "initial_fuel" uu____6034);
                        (let uu____6037 = p max1  in
                         set_option "max_fuel" uu____6037);
                        String s))
              | uu____6039 -> failwith "impos")),
           (SimpleStr "non-negative integer or pair of non-negative integers"))),
      "Set initial_fuel and max_fuel at once");
    (FStar_Getopt.noshort, "ifuel",
      (PostProcessed
         (((fun uu___9_6069  ->
              match uu___9_6069 with
              | String s ->
                  let p f =
                    let uu____6080 = FStar_Util.int_of_string f  in
                    Int uu____6080  in
                  let uu____6082 =
                    match FStar_Util.split s "," with
                    | f::[] -> (f, f)
                    | f1::f2::[] -> (f1, f2)
                    | uu____6111 -> failwith "unexpected value for --ifuel"
                     in
                  (match uu____6082 with
                   | (min1,max1) ->
                       ((let uu____6129 = p min1  in
                         set_option "initial_ifuel" uu____6129);
                        (let uu____6132 = p max1  in
                         set_option "max_ifuel" uu____6132);
                        String s))
              | uu____6134 -> failwith "impos")),
           (SimpleStr "non-negative integer or pair of non-negative integers"))),
      "Set initial_ifuel and max_ifuel at once");
    (FStar_Getopt.noshort, "initial_fuel", (IntStr "non-negative integer"),
      "Number of unrolling of recursive functions to try initially (default 2)");
    (FStar_Getopt.noshort, "initial_ifuel", (IntStr "non-negative integer"),
      "Number of unrolling of inductive datatypes to try at first (default 1)");
    (FStar_Getopt.noshort, "keep_query_captions", BoolStr,
      "Retain comments in the logged SMT queries (requires --log_queries; default true)");
    (FStar_Getopt.noshort, "lax", (Const (Bool true)),
      "Run the lax-type checker only (admit all verification conditions)");
    (FStar_Getopt.noshort, "load", (ReverseAccumulated (PathStr "module")),
      "Load compiled module");
    (FStar_Getopt.noshort, "log_types", (Const (Bool true)),
      "Print types computed for data/val/let-bindings");
    (FStar_Getopt.noshort, "log_queries", (Const (Bool true)),
      "Log the Z3 queries in several queries-*.smt2 files, as we go");
    (FStar_Getopt.noshort, "max_fuel", (IntStr "non-negative integer"),
      "Number of unrolling of recursive functions to try at most (default 8)");
    (FStar_Getopt.noshort, "max_ifuel", (IntStr "non-negative integer"),
      "Number of unrolling of inductive datatypes to try at most (default 2)");
    (FStar_Getopt.noshort, "min_fuel", (IntStr "non-negative integer"),
      "Minimum number of unrolling of recursive functions to try (default 1)");
    (FStar_Getopt.noshort, "MLish", (Const (Bool true)),
      "Trigger various specializations for compiling the F* compiler itself (not meant for user code)");
    (FStar_Getopt.noshort, "no_default_includes", (Const (Bool true)),
      "Ignore the default module search paths");
    (FStar_Getopt.noshort, "no_extract",
      (Accumulated (PathStr "module name")),
      "Deprecated: use --extract instead; Do not extract code from this module");
    (FStar_Getopt.noshort, "no_location_info", (Const (Bool true)),
      "Suppress location information in the generated OCaml output (only relevant with --codegen OCaml)");
    (FStar_Getopt.noshort, "no_smt", (Const (Bool true)),
      "Do not send any queries to the SMT solver, and fail on them instead");
    (FStar_Getopt.noshort, "normalize_pure_terms_for_extraction",
      (Const (Bool true)),
      "Extract top-level pure terms after normalizing them. This can lead to very large code, but can result in more partial evaluation and compile-time specialization.");
    (FStar_Getopt.noshort, "odir",
      (PostProcessed (pp_validate_dir, (PathStr "dir"))),
      "Place output in directory <dir>");
    (FStar_Getopt.noshort, "prims", (PathStr "file"), "");
    (FStar_Getopt.noshort, "print_bound_var_types", (Const (Bool true)),
      "Print the types of bound variables");
    (FStar_Getopt.noshort, "print_effect_args", (Const (Bool true)),
      "Print inferred predicate transformers for all computation types");
    (FStar_Getopt.noshort, "print_full_names", (Const (Bool true)),
      "Print full names of variables");
    (FStar_Getopt.noshort, "print_implicits", (Const (Bool true)),
      "Print implicit arguments");
    (FStar_Getopt.noshort, "print_universes", (Const (Bool true)),
      "Print universes");
    (FStar_Getopt.noshort, "print_z3_statistics", (Const (Bool true)),
      "Print Z3 statistics for each SMT query (details such as relevant modules, facts, etc. for each proof)");
    (FStar_Getopt.noshort, "prn", (Const (Bool true)),
      "Print full names (deprecated; use --print_full_names instead)");
    (FStar_Getopt.noshort, "quake",
      (PostProcessed
         (((fun uu___10_6591  ->
              match uu___10_6591 with
              | String s ->
                  let p f =
                    let uu____6602 = FStar_Util.int_of_string f  in
                    Int uu____6602  in
                  let uu____6604 =
                    match FStar_Util.split s "/" with
                    | f::[] -> (f, f)
                    | f1::f2::[] -> (f1, f2)
                    | uu____6633 -> failwith "unexpected value for --quake"
                     in
                  (match uu____6604 with
                   | (min1,max1) ->
                       ((let uu____6651 = p min1  in
                         set_option "quake_lo" uu____6651);
                        (let uu____6654 = p max1  in
                         set_option "quake_hi" uu____6654);
                        String s))
              | uu____6656 -> failwith "impos")),
           (SimpleStr "non-negative integer or pair of non-negative integers"))),
      "N/M repeats each query M times and checks that it succeeds at least N times");
    (FStar_Getopt.noshort, "query_stats", (Const (Bool true)),
      "Print SMT query statistics");
    (FStar_Getopt.noshort, "record_hints", (Const (Bool true)),
      "Record a database of hints for efficient proof replay");
    (FStar_Getopt.noshort, "record_options", (Const (Bool true)),
      "Record the state of options used to check each sigelt, useful for the `check_with` attribute and metaprogramming");
    (FStar_Getopt.noshort, "reuse_hint_for", (SimpleStr "toplevel_name"),
      "Optimistically, attempt using the recorded hint for <toplevel_name> (a top-level name in the current module) when trying to verify some other term 'g'");
    (FStar_Getopt.noshort, "silent", (Const (Bool true)),
      "Disable all non-critical output");
    (FStar_Getopt.noshort, "smt", (PathStr "path"),
      "Path to the Z3 SMT solver (we could eventually support other solvers)");
    (FStar_Getopt.noshort, "smtencoding.elim_box", BoolStr,
      "Toggle a peephole optimization that eliminates redundant uses of boxing/unboxing in the SMT encoding (default 'false')");
    (FStar_Getopt.noshort, "smtencoding.nl_arith_repr",
      (EnumStr ["native"; "wrapped"; "boxwrap"]),
      "Control the representation of non-linear arithmetic functions in the SMT encoding:\n\t\ti.e., if 'boxwrap' use 'Prims.op_Multiply, Prims.op_Division, Prims.op_Modulus'; \n\t\tif 'native' use '*, div, mod';\n\t\tif 'wrapped' use '_mul, _div, _mod : Int*Int -> Int'; \n\t\t(default 'boxwrap')");
    (FStar_Getopt.noshort, "smtencoding.l_arith_repr",
      (EnumStr ["native"; "boxwrap"]),
      "Toggle the representation of linear arithmetic functions in the SMT encoding:\n\t\ti.e., if 'boxwrap', use 'Prims.op_Addition, Prims.op_Subtraction, Prims.op_Minus'; \n\t\tif 'native', use '+, -, -'; \n\t\t(default 'boxwrap')");
    (FStar_Getopt.noshort, "smtencoding.valid_intro", BoolStr,
      "Include an axiom in the SMT encoding to introduce proof-irrelevance from a constructive proof");
    (FStar_Getopt.noshort, "smtencoding.valid_elim", BoolStr,
      "Include an axiom in the SMT encoding to eliminate proof-irrelevance into the existence of a proof witness");
    (FStar_Getopt.noshort, "tactic_raw_binders", (Const (Bool true)),
      "Do not use the lexical scope of tactics to improve binder names");
    (FStar_Getopt.noshort, "tactics_failhard", (Const (Bool true)),
      "Do not recover from metaprogramming errors, and abort if one occurs");
    (FStar_Getopt.noshort, "tactics_info", (Const (Bool true)),
      "Print some rough information on tactics, such as the time they take to run");
    (FStar_Getopt.noshort, "tactic_trace", (Const (Bool true)),
      "Print a depth-indexed trace of tactic execution (Warning: very verbose)");
    (FStar_Getopt.noshort, "tactic_trace_d", (IntStr "positive_integer"),
      "Trace tactics up to a certain binding depth");
    (FStar_Getopt.noshort, "__tactics_nbe", (Const (Bool true)),
      "Use NBE to evaluate metaprograms (experimental)");
    (FStar_Getopt.noshort, "tcnorm", BoolStr,
      "Attempt to normalize definitions marked as tcnorm (default 'true')");
    (FStar_Getopt.noshort, "timing", (Const (Bool true)),
      "Print the time it takes to verify each top-level definition");
    (FStar_Getopt.noshort, "trace_error", (Const (Bool true)),
      "Don't print an error message; show an exception trace instead");
    (FStar_Getopt.noshort, "ugly", (Const (Bool true)),
      "Emit output formatted for debugging");
    (FStar_Getopt.noshort, "unthrottle_inductives", (Const (Bool true)),
      "Let the SMT solver unfold inductive types to arbitrary depths (may affect verifier performance)");
    (FStar_Getopt.noshort, "unsafe_tactic_exec", (Const (Bool true)),
      "Allow tactics to run external processes. WARNING: checking an untrusted F* file while using this option can have disastrous effects.");
    (FStar_Getopt.noshort, "use_eq_at_higher_order", (Const (Bool true)),
      "Use equality constraints when comparing higher-order types (Temporary)");
    (FStar_Getopt.noshort, "use_hints", (Const (Bool true)),
      "Use a previously recorded hints database for proof replay");
    (FStar_Getopt.noshort, "use_hint_hashes", (Const (Bool true)),
      "Admit queries if their hash matches the hash recorded in the hints database");
    (FStar_Getopt.noshort, "use_native_tactics", (PathStr "path"),
      "Use compiled tactics from <path>");
    (FStar_Getopt.noshort, "no_plugins", (Const (Bool true)),
      "Do not run plugins natively and interpret them as usual instead");
    (FStar_Getopt.noshort, "no_tactics", (Const (Bool true)),
      "Do not run the tactic engine before discharging a VC");
    (FStar_Getopt.noshort, "using_facts_from",
      (ReverseAccumulated
         (SimpleStr
            "One or more space-separated occurrences of '[+|-]( * | namespace | fact id)'")),
      "\n\t\tPrunes the context to include only the facts from the given namespace or fact id. \n\t\t\tFacts can be include or excluded using the [+|-] qualifier. \n\t\t\tFor example --using_facts_from '* -FStar.Reflection +FStar.List -FStar.List.Tot' will \n\t\t\t\tremove all facts from FStar.List.Tot.*, \n\t\t\t\tretain all remaining facts from FStar.List.*, \n\t\t\t\tremove all facts from FStar.Reflection.*, \n\t\t\t\tand retain all the rest.\n\t\tNote, the '+' is optional: --using_facts_from 'FStar.List' is equivalent to --using_facts_from '+FStar.List'. \n\t\tMultiple uses of this option accumulate, e.g., --using_facts_from A --using_facts_from B is interpreted as --using_facts_from A^B.");
    (FStar_Getopt.noshort, "vcgen.optimize_bind_as_seq",
      (EnumStr ["off"; "without_type"; "with_type"]),
      "\n\t\tOptimize the generation of verification conditions, \n\t\t\tspecifically the construction of monadic `bind`,\n\t\t\tgenerating `seq` instead of `bind` when the first computation as a trivial post-condition.\n\t\t\tBy default, this optimization does not apply.\n\t\t\tWhen the `without_type` option is chosen, this imposes a cost on the SMT solver\n\t\t\tto reconstruct type information.\n\t\t\tWhen `with_type` is chosen, type information is provided to the SMT solver,\n\t\t\tbut at the cost of VC bloat, which may often be redundant.");
    (FStar_Getopt.noshort, "__temp_no_proj",
      (Accumulated (SimpleStr "module_name")),
      "Don't generate projectors for this module");
    (FStar_Getopt.noshort, "__temp_fast_implicits", (Const (Bool true)),
      "Don't use this option yet");
    (118, "version",
      (WithSideEffect
         (((fun uu____7254  ->
              display_version (); FStar_All.exit Prims.int_zero)),
           (Const (Bool true)))), "Display version number");
    (FStar_Getopt.noshort, "warn_default_effects", (Const (Bool true)),
      "Warn when (a -> b) is desugared to (a -> Tot b)");
    (FStar_Getopt.noshort, "z3cliopt",
      (ReverseAccumulated (SimpleStr "option")), "Z3 command line options");
    (FStar_Getopt.noshort, "z3refresh", (Const (Bool true)),
      "Restart Z3 after each query; useful for ensuring proof robustness");
    (FStar_Getopt.noshort, "z3rlimit", (IntStr "positive_integer"),
      "Set the Z3 per-query resource limit (default 5 units, taking roughtly 5s)");
    (FStar_Getopt.noshort, "z3rlimit_factor", (IntStr "positive_integer"),
      "Set the Z3 per-query resource limit multiplier. This is useful when, say, regenerating hints and you want to be more lax. (default 1)");
    (FStar_Getopt.noshort, "z3seed", (IntStr "positive_integer"),
      "Set the Z3 random seed (default 0)");
    (FStar_Getopt.noshort, "use_two_phase_tc", BoolStr,
      "Use the two phase typechecker (default 'true')");
    (FStar_Getopt.noshort, "__no_positivity", (Const (Bool true)),
      "Don't check positivity of inductive types");
    (FStar_Getopt.noshort, "__ml_no_eta_expand_coertions",
      (Const (Bool true)), "Do not eta-expand coertions in generated OCaml");
    (FStar_Getopt.noshort, "warn_error", (Accumulated (SimpleStr "")),
      "The [-warn_error] option follows the OCaml syntax, namely:\n\t\t- [r] is a range of warnings (either a number [n], or a range [n..n])\n\t\t- [-r] silences range [r]\n\t\t- [+r] enables range [r]\n\t\t- [@r] makes range [r] fatal.");
    (FStar_Getopt.noshort, "use_extracted_interfaces", BoolStr,
      "Extract interfaces from the dependencies and use them for verification (default 'false')");
    (FStar_Getopt.noshort, "use_nbe", BoolStr,
      "Use normalization by evaluation as the default normalization strategy (default 'false')");
    (FStar_Getopt.noshort, "use_nbe_for_extraction", BoolStr,
      "Use normalization by evaluation for normalizing terms before extraction (default 'false')");
    (FStar_Getopt.noshort, "trivial_pre_for_unannotated_effectful_fns",
      BoolStr,
      "Enforce trivial preconditions for unannotated effectful functions (default 'true')");
    (FStar_Getopt.noshort, "__debug_embedding",
      (WithSideEffect
         (((fun uu____7511  -> FStar_ST.op_Colon_Equals debug_embedding true)),
           (Const (Bool true)))),
      "Debug messages for embeddings/unembeddings of natively compiled terms");
    (FStar_Getopt.noshort, "eager_embedding",
      (WithSideEffect
         (((fun uu____7555  -> FStar_ST.op_Colon_Equals eager_embedding true)),
           (Const (Bool true)))),
      "Eagerly embed and unembed terms to primitive operations and plugins: not recommended except for benchmarking");
    (FStar_Getopt.noshort, "profile_group_by_decl", (Const (Bool true)),
      "Emit profiles grouped by declaration rather than by module");
    (FStar_Getopt.noshort, "profile_component",
      (Accumulated
         (SimpleStr
            "One or more space-separated occurrences of '[+|-]( * | namespace | module | identifier)'")),
      "\n\tSpecific source locations in the compiler are instrumented with profiling counters.\n\tPass `--profile_component FStar.TypeChecker` to enable all counters in the FStar.TypeChecker namespace.\n\tThis option is a module or namespace selector, like many other options (e.g., `--extract`)");
    (FStar_Getopt.noshort, "profile",
      (Accumulated
         (SimpleStr
            "One or more space-separated occurrences of '[+|-]( * | namespace | module)'")),
      "\n\tProfiling can be enabled when the compiler is processing a given set of source modules.\n\tPass `--profile FStar.Pervasives` to enable profiling when the compiler is processing any module in FStar.Pervasives.\n\tThis option is a module or namespace selector, like many other options (e.g., `--extract`)");
    (104, "help",
      (WithSideEffect
         (((fun uu____7652  ->
              (let uu____7654 = specs ()  in display_usage_aux uu____7654);
              FStar_All.exit Prims.int_zero)), (Const (Bool true)))),
      "Display this information")]

and (specs : unit -> FStar_Getopt.opt Prims.list) =
  fun uu____7685  ->
    let uu____7688 = specs_with_types ()  in
    FStar_List.map
      (fun uu____7719  ->
         match uu____7719 with
         | (short,long,typ,doc) ->
             let uu____7741 =
               let uu____7755 = arg_spec_of_opt_type long typ  in
               (short, long, uu____7755, doc)  in
             mk_spec uu____7741) uu____7688

let (settable : Prims.string -> Prims.bool) =
  fun uu___11_7770  ->
    match uu___11_7770 with
    | "abort_on" -> true
    | "admit_except" -> true
    | "admit_smt_queries" -> true
    | "debug" -> true
    | "debug_level" -> true
    | "defensive" -> true
    | "detail_errors" -> true
    | "detail_hint_replay" -> true
    | "eager_subtyping" -> true
    | "hide_uvar_nums" -> true
    | "hint_dir" -> true
    | "hint_file" -> true
    | "hint_info" -> true
    | "fuel" -> true
    | "ifuel" -> true
    | "initial_fuel" -> true
    | "initial_ifuel" -> true
    | "lax" -> true
    | "load" -> true
    | "log_queries" -> true
    | "log_types" -> true
    | "max_fuel" -> true
    | "max_ifuel" -> true
    | "min_fuel" -> true
    | "no_plugins" -> true
    | "__no_positivity" -> true
    | "normalize_pure_terms_for_extraction" -> true
    | "no_smt" -> true
    | "no_tactics" -> true
    | "print_bound_var_types" -> true
    | "print_effect_args" -> true
    | "print_full_names" -> true
    | "print_implicits" -> true
    | "print_universes" -> true
    | "print_z3_statistics" -> true
    | "prn" -> true
    | "quake_lo" -> true
    | "quake_hi" -> true
    | "quake" -> true
    | "query_stats" -> true
    | "record_options" -> true
    | "reuse_hint_for" -> true
    | "silent" -> true
    | "smtencoding.elim_box" -> true
    | "smtencoding.l_arith_repr" -> true
    | "smtencoding.nl_arith_repr" -> true
    | "smtencoding.valid_intro" -> true
    | "smtencoding.valid_elim" -> true
    | "tactic_raw_binders" -> true
    | "tactics_failhard" -> true
    | "tactics_info" -> true
    | "__tactics_nbe" -> true
    | "tactic_trace" -> true
    | "tactic_trace_d" -> true
    | "tcnorm" -> true
    | "__temp_fast_implicits" -> true
    | "__temp_no_proj" -> true
    | "timing" -> true
    | "trace_error" -> true
    | "ugly" -> true
    | "unthrottle_inductives" -> true
    | "use_eq_at_higher_order" -> true
    | "use_two_phase_tc" -> true
    | "using_facts_from" -> true
    | "vcgen.optimize_bind_as_seq" -> true
    | "warn_error" -> true
    | "z3cliopt" -> true
    | "z3refresh" -> true
    | "z3rlimit" -> true
    | "z3rlimit_factor" -> true
    | "z3seed" -> true
    | "trivial_pre_for_unannotated_effectful_fns" -> true
    | "profile_group_by_decl" -> true
    | "profile_component" -> true
    | "profile" -> true
    | uu____7923 -> false
  
let (all_specs : FStar_Getopt.opt Prims.list) = specs () 
let (all_specs_with_types :
  (FStar_BaseTypes.char * Prims.string * opt_type * Prims.string) Prims.list)
  = specs_with_types () 
let (settable_specs :
  (FStar_BaseTypes.char * Prims.string * unit FStar_Getopt.opt_variant *
    Prims.string) Prims.list)
  =
  FStar_All.pipe_right all_specs
    (FStar_List.filter
       (fun uu____8007  ->
          match uu____8007 with
          | (uu____8022,x,uu____8024,uu____8025) -> settable x))
  
let (display_usage : unit -> unit) =
  fun uu____8041  ->
    let uu____8042 = specs ()  in display_usage_aux uu____8042
  
let (fstar_bin_directory : Prims.string) = FStar_Util.get_exec_dir () 
exception File_argument of Prims.string 
let (uu___is_File_argument : Prims.exn -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | File_argument uu____8074 -> true
    | uu____8077 -> false
  
let (__proj__File_argument__item__uu___ : Prims.exn -> Prims.string) =
  fun projectee  ->
    match projectee with | File_argument uu____8087 -> uu____8087
  
let (set_options : Prims.string -> FStar_Getopt.parse_cmdline_res) =
  fun s  ->
    try
      (fun uu___543_8098  ->
         match () with
         | () ->
             if s = ""
             then FStar_Getopt.Success
             else
               FStar_Getopt.parse_string settable_specs
                 (fun s1  -> FStar_Exn.raise (File_argument s1)) s) ()
    with
    | File_argument s1 ->
        let uu____8115 =
          FStar_Util.format1 "File %s is not a valid option" s1  in
        FStar_Getopt.Error uu____8115
  
let (file_list_ : Prims.string Prims.list FStar_ST.ref) =
  FStar_Util.mk_ref [] 
let (parse_cmd_line :
  unit -> (FStar_Getopt.parse_cmdline_res * Prims.string Prims.list)) =
  fun uu____8140  ->
    let res =
      FStar_Getopt.parse_cmdline all_specs
        (fun i  ->
           let uu____8146 =
             let uu____8150 = FStar_ST.op_Bang file_list_  in
             FStar_List.append uu____8150 [i]  in
           FStar_ST.op_Colon_Equals file_list_ uu____8146)
       in
    let uu____8207 =
      let uu____8211 = FStar_ST.op_Bang file_list_  in
      FStar_List.map FStar_Common.try_convert_file_name_to_mixed uu____8211
       in
    (res, uu____8207)
  
let (file_list : unit -> Prims.string Prims.list) =
  fun uu____8253  -> FStar_ST.op_Bang file_list_ 
let (restore_cmd_line_options : Prims.bool -> FStar_Getopt.parse_cmdline_res)
  =
  fun should_clear  ->
    let old_verify_module = get_verify_module ()  in
    if should_clear then clear () else init ();
    (let r =
       let uu____8296 = specs ()  in
       FStar_Getopt.parse_cmdline uu____8296 (fun x  -> ())  in
     (let uu____8303 =
        let uu____8309 =
          let uu____8310 =
            FStar_List.map (fun _8314  -> String _8314) old_verify_module  in
          List uu____8310  in
        ("verify_module", uu____8309)  in
      set_option' uu____8303);
     r)
  
let (module_name_of_file_name : Prims.string -> Prims.string) =
  fun f  ->
    let f1 = FStar_Util.basename f  in
    let f2 =
      let uu____8330 =
        let uu____8332 =
          let uu____8334 =
            let uu____8336 = FStar_Util.get_file_extension f1  in
            FStar_String.length uu____8336  in
          (FStar_String.length f1) - uu____8334  in
        uu____8332 - Prims.int_one  in
      FStar_String.substring f1 Prims.int_zero uu____8330  in
    FStar_String.lowercase f2
  
let (should_verify : Prims.string -> Prims.bool) =
  fun m  ->
    let uu____8349 = get_lax ()  in
    if uu____8349
    then false
    else
      (let l = get_verify_module ()  in
       FStar_List.contains (FStar_String.lowercase m) l)
  
let (should_verify_file : Prims.string -> Prims.bool) =
  fun fn  ->
    let uu____8370 = module_name_of_file_name fn  in should_verify uu____8370
  
let (module_name_eq : Prims.string -> Prims.string -> Prims.bool) =
  fun m1  ->
    fun m2  -> (FStar_String.lowercase m1) = (FStar_String.lowercase m2)
  
let (dont_gen_projectors : Prims.string -> Prims.bool) =
  fun m  ->
    let uu____8398 = get___temp_no_proj ()  in
    FStar_All.pipe_right uu____8398 (FStar_List.existsb (module_name_eq m))
  
let (should_print_message : Prims.string -> Prims.bool) =
  fun m  ->
    let uu____8416 = should_verify m  in
    if uu____8416 then m <> "Prims" else false
  
let (include_path : unit -> Prims.string Prims.list) =
  fun uu____8433  ->
    let cache_dir =
      let uu____8438 = get_cache_dir ()  in
      match uu____8438 with
      | FStar_Pervasives_Native.None  -> []
      | FStar_Pervasives_Native.Some c -> [c]  in
    let uu____8452 = get_no_default_includes ()  in
    if uu____8452
    then
      let uu____8458 = get_include ()  in
      FStar_List.append cache_dir uu____8458
    else
      (let lib_paths =
         let uu____8469 = FStar_Util.expand_environment_variable "FSTAR_LIB"
            in
         match uu____8469 with
         | FStar_Pervasives_Native.None  ->
             let fstar_home = FStar_String.op_Hat fstar_bin_directory "/.."
                in
             let defs = universe_include_path_base_dirs  in
             let uu____8485 =
               FStar_All.pipe_right defs
                 (FStar_List.map (fun x  -> FStar_String.op_Hat fstar_home x))
                in
             FStar_All.pipe_right uu____8485
               (FStar_List.filter FStar_Util.file_exists)
         | FStar_Pervasives_Native.Some s -> [s]  in
       let uu____8512 =
         let uu____8516 =
           let uu____8520 = get_include ()  in
           FStar_List.append uu____8520 ["."]  in
         FStar_List.append lib_paths uu____8516  in
       FStar_List.append cache_dir uu____8512)
  
let (find_file : Prims.string -> Prims.string FStar_Pervasives_Native.option)
  =
  let file_map = FStar_Util.smap_create (Prims.of_int (100))  in
  fun filename  ->
    let uu____8551 = FStar_Util.smap_try_find file_map filename  in
    match uu____8551 with
    | FStar_Pervasives_Native.Some f -> f
    | FStar_Pervasives_Native.None  ->
        let result =
          try
            (fun uu___594_8582  ->
               match () with
               | () ->
                   let uu____8586 = FStar_Util.is_path_absolute filename  in
                   if uu____8586
                   then
                     (if FStar_Util.file_exists filename
                      then FStar_Pervasives_Native.Some filename
                      else FStar_Pervasives_Native.None)
                   else
                     (let uu____8602 =
                        let uu____8606 = include_path ()  in
                        FStar_List.rev uu____8606  in
                      FStar_Util.find_map uu____8602
                        (fun p  ->
                           let path =
                             if p = "."
                             then filename
                             else FStar_Util.join_paths p filename  in
                           if FStar_Util.file_exists path
                           then FStar_Pervasives_Native.Some path
                           else FStar_Pervasives_Native.None))) ()
          with | uu___593_8634 -> FStar_Pervasives_Native.None  in
        (if FStar_Option.isSome result
         then FStar_Util.smap_add file_map filename result
         else ();
         result)
  
let (prims : unit -> Prims.string) =
  fun uu____8653  ->
    let uu____8654 = get_prims ()  in
    match uu____8654 with
    | FStar_Pervasives_Native.None  ->
        let filename = "prims.fst"  in
        let uu____8663 = find_file filename  in
        (match uu____8663 with
         | FStar_Pervasives_Native.Some result -> result
         | FStar_Pervasives_Native.None  ->
             let uu____8672 =
               FStar_Util.format1
                 "unable to find required file \"%s\" in the module search path.\n"
                 filename
                in
             failwith uu____8672)
    | FStar_Pervasives_Native.Some x -> x
  
let (prims_basename : unit -> Prims.string) =
  fun uu____8685  ->
    let uu____8686 = prims ()  in FStar_Util.basename uu____8686
  
let (pervasives : unit -> Prims.string) =
  fun uu____8694  ->
    let filename = "FStar.Pervasives.fst"  in
    let uu____8698 = find_file filename  in
    match uu____8698 with
    | FStar_Pervasives_Native.Some result -> result
    | FStar_Pervasives_Native.None  ->
        let uu____8707 =
          FStar_Util.format1
            "unable to find required file \"%s\" in the module search path.\n"
            filename
           in
        failwith uu____8707
  
let (pervasives_basename : unit -> Prims.string) =
  fun uu____8717  ->
    let uu____8718 = pervasives ()  in FStar_Util.basename uu____8718
  
let (pervasives_native_basename : unit -> Prims.string) =
  fun uu____8726  ->
    let filename = "FStar.Pervasives.Native.fst"  in
    let uu____8730 = find_file filename  in
    match uu____8730 with
    | FStar_Pervasives_Native.Some result -> FStar_Util.basename result
    | FStar_Pervasives_Native.None  ->
        let uu____8739 =
          FStar_Util.format1
            "unable to find required file \"%s\" in the module search path.\n"
            filename
           in
        failwith uu____8739
  
let (prepend_output_dir : Prims.string -> Prims.string) =
  fun fname  ->
    let uu____8752 = get_odir ()  in
    match uu____8752 with
    | FStar_Pervasives_Native.None  -> fname
    | FStar_Pervasives_Native.Some x -> FStar_Util.join_paths x fname
  
let (prepend_cache_dir : Prims.string -> Prims.string) =
  fun fpath  ->
    let uu____8770 = get_cache_dir ()  in
    match uu____8770 with
    | FStar_Pervasives_Native.None  -> fpath
    | FStar_Pervasives_Native.Some x ->
        let uu____8779 = FStar_Util.basename fpath  in
        FStar_Util.join_paths x uu____8779
  
let (path_of_text : Prims.string -> Prims.string Prims.list) =
  fun text  -> FStar_String.split [46] text 
let (parse_settings :
  Prims.string Prims.list ->
    (Prims.string Prims.list * Prims.bool) Prims.list)
  =
  fun ns  ->
    let cache = FStar_Util.smap_create (Prims.of_int (31))  in
    let with_cache f s =
      let uu____8901 = FStar_Util.smap_try_find cache s  in
      match uu____8901 with
      | FStar_Pervasives_Native.Some s1 -> s1
      | FStar_Pervasives_Native.None  ->
          let res = f s  in (FStar_Util.smap_add cache s res; res)
       in
    let parse_one_setting s =
      if s = "*"
      then ([], true)
      else
        if s = "-*"
        then ([], false)
        else
          if FStar_Util.starts_with s "-"
          then
            (let path =
               let uu____9055 = FStar_Util.substring_from s Prims.int_one  in
               path_of_text uu____9055  in
             (path, false))
          else
            (let s1 =
               if FStar_Util.starts_with s "+"
               then FStar_Util.substring_from s Prims.int_one
               else s  in
             ((path_of_text s1), true))
       in
    let uu____9078 =
      FStar_All.pipe_right ns
        (FStar_List.collect
           (fun s  ->
              let s1 = FStar_Util.trim_string s  in
              if s1 = ""
              then []
              else
                with_cache
                  (fun s2  ->
                     let s3 = FStar_Util.replace_char s2 32 44  in
                     let uu____9152 =
                       let uu____9156 =
                         FStar_All.pipe_right (FStar_Util.splitlines s3)
                           (FStar_List.concatMap
                              (fun s4  -> FStar_Util.split s4 ","))
                          in
                       FStar_All.pipe_right uu____9156
                         (FStar_List.filter (fun s4  -> s4 <> ""))
                        in
                     FStar_All.pipe_right uu____9152
                       (FStar_List.map parse_one_setting)) s1))
       in
    FStar_All.pipe_right uu____9078 FStar_List.rev
  
let (__temp_no_proj : Prims.string -> Prims.bool) =
  fun s  ->
    let uu____9243 = get___temp_no_proj ()  in
    FStar_All.pipe_right uu____9243 (FStar_List.contains s)
  
let (__temp_fast_implicits : unit -> Prims.bool) =
  fun uu____9258  -> lookup_opt "__temp_fast_implicits" as_bool 
let (admit_smt_queries : unit -> Prims.bool) =
  fun uu____9267  -> get_admit_smt_queries () 
let (admit_except : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____9276  -> get_admit_except () 
let (cache_checked_modules : unit -> Prims.bool) =
  fun uu____9283  -> get_cache_checked_modules () 
let (cache_off : unit -> Prims.bool) = fun uu____9290  -> get_cache_off () 
let (cmi : unit -> Prims.bool) = fun uu____9297  -> get_cmi () 
type codegen_t =
  | OCaml 
  | FSharp 
  | Kremlin 
  | Plugin 
let (uu___is_OCaml : codegen_t -> Prims.bool) =
  fun projectee  ->
    match projectee with | OCaml  -> true | uu____9307 -> false
  
let (uu___is_FSharp : codegen_t -> Prims.bool) =
  fun projectee  ->
    match projectee with | FSharp  -> true | uu____9318 -> false
  
let (uu___is_Kremlin : codegen_t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Kremlin  -> true | uu____9329 -> false
  
let (uu___is_Plugin : codegen_t -> Prims.bool) =
  fun projectee  ->
    match projectee with | Plugin  -> true | uu____9340 -> false
  
let (codegen : unit -> codegen_t FStar_Pervasives_Native.option) =
  fun uu____9349  ->
    let uu____9350 = get_codegen ()  in
    FStar_Util.map_opt uu____9350
      (fun uu___12_9356  ->
         match uu___12_9356 with
         | "OCaml" -> OCaml
         | "FSharp" -> FSharp
         | "Kremlin" -> Kremlin
         | "Plugin" -> Plugin
         | uu____9362 -> failwith "Impossible")
  
let (codegen_libs : unit -> Prims.string Prims.list Prims.list) =
  fun uu____9375  ->
    let uu____9376 = get_codegen_lib ()  in
    FStar_All.pipe_right uu____9376
      (FStar_List.map (fun x  -> FStar_Util.split x "."))
  
let (debug_any : unit -> Prims.bool) =
  fun uu____9402  -> let uu____9403 = get_debug ()  in uu____9403 <> [] 
let (debug_module : Prims.string -> Prims.bool) =
  fun modul  ->
    let uu____9420 = get_debug ()  in
    FStar_All.pipe_right uu____9420
      (FStar_List.existsb (module_name_eq modul))
  
let (debug_at_level : Prims.string -> debug_level_t -> Prims.bool) =
  fun modul  ->
    fun level  ->
      (let uu____9445 = get_debug ()  in
       FStar_All.pipe_right uu____9445
         (FStar_List.existsb (module_name_eq modul)))
        && (debug_level_geq level)
  
let (profile_group_by_decls : unit -> Prims.bool) =
  fun uu____9460  -> get_profile_group_by_decl () 
let (defensive : unit -> Prims.bool) =
  fun uu____9467  -> let uu____9468 = get_defensive ()  in uu____9468 <> "no" 
let (defensive_fail : unit -> Prims.bool) =
  fun uu____9478  ->
    let uu____9479 = get_defensive ()  in uu____9479 = "fail"
  
let (dep : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____9491  -> get_dep () 
let (dep_ninja : unit -> Prims.string) = fun uu____9498  -> get_dep_ninja () 
let (detail_errors : unit -> Prims.bool) =
  fun uu____9505  -> get_detail_errors () 
let (detail_hint_replay : unit -> Prims.bool) =
  fun uu____9512  -> get_detail_hint_replay () 
let (doc : unit -> Prims.bool) = fun uu____9519  -> get_doc () 
let (dump_module : Prims.string -> Prims.bool) =
  fun s  ->
    let uu____9529 = get_dump_module ()  in
    FStar_All.pipe_right uu____9529 (FStar_List.existsb (module_name_eq s))
  
let (eager_subtyping : unit -> Prims.bool) =
  fun uu____9544  -> get_eager_subtyping () 
let (expose_interfaces : unit -> Prims.bool) =
  fun uu____9551  -> get_expose_interfaces () 
let (fs_typ_app : Prims.string -> Prims.bool) =
  fun filename  ->
    let uu____9561 = FStar_ST.op_Bang light_off_files  in
    FStar_List.contains filename uu____9561
  
let (full_context_dependency : unit -> Prims.bool) = fun uu____9597  -> true 
let (hide_uvar_nums : unit -> Prims.bool) =
  fun uu____9605  -> get_hide_uvar_nums () 
let (hint_info : unit -> Prims.bool) =
  fun uu____9612  -> (get_hint_info ()) || (get_query_stats ()) 
let (hint_dir : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____9621  -> get_hint_dir () 
let (hint_file : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____9630  -> get_hint_file () 
let (hint_file_for_src : Prims.string -> Prims.string) =
  fun src_filename  ->
    let uu____9640 = hint_file ()  in
    match uu____9640 with
    | FStar_Pervasives_Native.Some fn -> fn
    | FStar_Pervasives_Native.None  ->
        let file_name =
          let uu____9651 = hint_dir ()  in
          match uu____9651 with
          | FStar_Pervasives_Native.Some dir ->
              let uu____9659 = FStar_Util.basename src_filename  in
              FStar_Util.concat_dir_filename dir uu____9659
          | uu____9661 -> src_filename  in
        FStar_Util.format1 "%s.hints" file_name
  
let (ide : unit -> Prims.bool) = fun uu____9672  -> get_ide () 
let (print : unit -> Prims.bool) = fun uu____9679  -> get_print () 
let (print_in_place : unit -> Prims.bool) =
  fun uu____9686  -> get_print_in_place () 
let (initial_fuel : unit -> Prims.int) =
  fun uu____9693  ->
    let uu____9694 = get_initial_fuel ()  in
    let uu____9696 = get_max_fuel ()  in Prims.min uu____9694 uu____9696
  
let (initial_ifuel : unit -> Prims.int) =
  fun uu____9704  ->
    let uu____9705 = get_initial_ifuel ()  in
    let uu____9707 = get_max_ifuel ()  in Prims.min uu____9705 uu____9707
  
let (interactive : unit -> Prims.bool) =
  fun uu____9715  -> (get_in ()) || (get_ide ()) 
let (lax : unit -> Prims.bool) = fun uu____9722  -> get_lax () 
let (load : unit -> Prims.string Prims.list) = fun uu____9731  -> get_load () 
let (legacy_interactive : unit -> Prims.bool) = fun uu____9738  -> get_in () 
let (lsp_server : unit -> Prims.bool) = fun uu____9745  -> get_lsp () 
let (log_queries : unit -> Prims.bool) =
  fun uu____9752  -> get_log_queries () 
let (keep_query_captions : unit -> Prims.bool) =
  fun uu____9759  -> (log_queries ()) && (get_keep_query_captions ()) 
let (log_types : unit -> Prims.bool) = fun uu____9766  -> get_log_types () 
let (max_fuel : unit -> Prims.int) = fun uu____9773  -> get_max_fuel () 
let (max_ifuel : unit -> Prims.int) = fun uu____9780  -> get_max_ifuel () 
let (min_fuel : unit -> Prims.int) = fun uu____9787  -> get_min_fuel () 
let (ml_ish : unit -> Prims.bool) = fun uu____9794  -> get_MLish () 
let (set_ml_ish : unit -> unit) =
  fun uu____9800  -> set_option "MLish" (Bool true) 
let (no_default_includes : unit -> Prims.bool) =
  fun uu____9809  -> get_no_default_includes () 
let (no_extract : Prims.string -> Prims.bool) =
  fun s  ->
    let uu____9819 = get_no_extract ()  in
    FStar_All.pipe_right uu____9819 (FStar_List.existsb (module_name_eq s))
  
let (normalize_pure_terms_for_extraction : unit -> Prims.bool) =
  fun uu____9834  -> get_normalize_pure_terms_for_extraction () 
let (no_location_info : unit -> Prims.bool) =
  fun uu____9841  -> get_no_location_info () 
let (no_plugins : unit -> Prims.bool) = fun uu____9848  -> get_no_plugins () 
let (no_smt : unit -> Prims.bool) = fun uu____9855  -> get_no_smt () 
let (output_dir : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____9864  -> get_odir () 
let (ugly : unit -> Prims.bool) = fun uu____9871  -> get_ugly () 
let (print_bound_var_types : unit -> Prims.bool) =
  fun uu____9878  -> get_print_bound_var_types () 
let (print_effect_args : unit -> Prims.bool) =
  fun uu____9885  -> get_print_effect_args () 
let (print_implicits : unit -> Prims.bool) =
  fun uu____9892  -> get_print_implicits () 
let (print_real_names : unit -> Prims.bool) =
  fun uu____9899  -> (get_prn ()) || (get_print_full_names ()) 
let (print_universes : unit -> Prims.bool) =
  fun uu____9906  -> get_print_universes () 
let (print_z3_statistics : unit -> Prims.bool) =
  fun uu____9913  -> get_print_z3_statistics () 
let (quake_lo : unit -> Prims.int) = fun uu____9920  -> get_quake_lo () 
let (quake_hi : unit -> Prims.int) = fun uu____9927  -> get_quake_hi () 
let (query_stats : unit -> Prims.bool) =
  fun uu____9934  -> get_query_stats () 
let (record_hints : unit -> Prims.bool) =
  fun uu____9941  -> get_record_hints () 
let (record_options : unit -> Prims.bool) =
  fun uu____9948  -> get_record_options () 
let (reuse_hint_for : unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____9957  -> get_reuse_hint_for () 
let (silent : unit -> Prims.bool) = fun uu____9964  -> get_silent () 
let (smtencoding_elim_box : unit -> Prims.bool) =
  fun uu____9971  -> get_smtencoding_elim_box () 
let (smtencoding_nl_arith_native : unit -> Prims.bool) =
  fun uu____9978  ->
    let uu____9979 = get_smtencoding_nl_arith_repr ()  in
    uu____9979 = "native"
  
let (smtencoding_nl_arith_wrapped : unit -> Prims.bool) =
  fun uu____9989  ->
    let uu____9990 = get_smtencoding_nl_arith_repr ()  in
    uu____9990 = "wrapped"
  
let (smtencoding_nl_arith_default : unit -> Prims.bool) =
  fun uu____10000  ->
    let uu____10001 = get_smtencoding_nl_arith_repr ()  in
    uu____10001 = "boxwrap"
  
let (smtencoding_l_arith_native : unit -> Prims.bool) =
  fun uu____10011  ->
    let uu____10012 = get_smtencoding_l_arith_repr ()  in
    uu____10012 = "native"
  
let (smtencoding_l_arith_default : unit -> Prims.bool) =
  fun uu____10022  ->
    let uu____10023 = get_smtencoding_l_arith_repr ()  in
    uu____10023 = "boxwrap"
  
let (smtencoding_valid_intro : unit -> Prims.bool) =
  fun uu____10033  -> get_smtencoding_valid_intro () 
let (smtencoding_valid_elim : unit -> Prims.bool) =
  fun uu____10040  -> get_smtencoding_valid_elim () 
let (tactic_raw_binders : unit -> Prims.bool) =
  fun uu____10047  -> get_tactic_raw_binders () 
let (tactics_failhard : unit -> Prims.bool) =
  fun uu____10054  -> get_tactics_failhard () 
let (tactics_info : unit -> Prims.bool) =
  fun uu____10061  -> get_tactics_info () 
let (tactic_trace : unit -> Prims.bool) =
  fun uu____10068  -> get_tactic_trace () 
let (tactic_trace_d : unit -> Prims.int) =
  fun uu____10075  -> get_tactic_trace_d () 
let (tactics_nbe : unit -> Prims.bool) =
  fun uu____10082  -> get_tactics_nbe () 
let (tcnorm : unit -> Prims.bool) = fun uu____10089  -> get_tcnorm () 
let (timing : unit -> Prims.bool) = fun uu____10096  -> get_timing () 
let (trace_error : unit -> Prims.bool) =
  fun uu____10103  -> get_trace_error () 
let (unthrottle_inductives : unit -> Prims.bool) =
  fun uu____10110  -> get_unthrottle_inductives () 
let (unsafe_tactic_exec : unit -> Prims.bool) =
  fun uu____10117  -> get_unsafe_tactic_exec () 
let (use_eq_at_higher_order : unit -> Prims.bool) =
  fun uu____10124  -> get_use_eq_at_higher_order () 
let (use_hints : unit -> Prims.bool) = fun uu____10131  -> get_use_hints () 
let (use_hint_hashes : unit -> Prims.bool) =
  fun uu____10138  -> get_use_hint_hashes () 
let (use_native_tactics :
  unit -> Prims.string FStar_Pervasives_Native.option) =
  fun uu____10147  -> get_use_native_tactics () 
let (use_tactics : unit -> Prims.bool) =
  fun uu____10154  -> get_use_tactics () 
let (using_facts_from :
  unit -> (Prims.string Prims.list * Prims.bool) Prims.list) =
  fun uu____10170  ->
    let uu____10171 = get_using_facts_from ()  in
    match uu____10171 with
    | FStar_Pervasives_Native.None  -> [([], true)]
    | FStar_Pervasives_Native.Some ns -> parse_settings ns
  
let (vcgen_optimize_bind_as_seq : unit -> Prims.bool) =
  fun uu____10225  ->
    let uu____10226 = get_vcgen_optimize_bind_as_seq ()  in
    FStar_Option.isSome uu____10226
  
let (vcgen_decorate_with_type : unit -> Prims.bool) =
  fun uu____10237  ->
    let uu____10238 = get_vcgen_optimize_bind_as_seq ()  in
    match uu____10238 with
    | FStar_Pervasives_Native.Some "with_type" -> true
    | uu____10246 -> false
  
let (warn_default_effects : unit -> Prims.bool) =
  fun uu____10257  -> get_warn_default_effects () 
let (z3_exe : unit -> Prims.string) =
  fun uu____10264  ->
    let uu____10265 = get_smt ()  in
    match uu____10265 with
    | FStar_Pervasives_Native.None  -> FStar_Platform.exe "z3"
    | FStar_Pervasives_Native.Some s -> s
  
let (z3_cliopt : unit -> Prims.string Prims.list) =
  fun uu____10283  -> get_z3cliopt () 
let (z3_refresh : unit -> Prims.bool) = fun uu____10290  -> get_z3refresh () 
let (z3_rlimit : unit -> Prims.int) = fun uu____10297  -> get_z3rlimit () 
let (z3_rlimit_factor : unit -> Prims.int) =
  fun uu____10304  -> get_z3rlimit_factor () 
let (z3_seed : unit -> Prims.int) = fun uu____10311  -> get_z3seed () 
let (use_two_phase_tc : unit -> Prims.bool) =
  fun uu____10318  ->
    (get_use_two_phase_tc ()) &&
      (let uu____10320 = lax ()  in Prims.op_Negation uu____10320)
  
let (no_positivity : unit -> Prims.bool) =
  fun uu____10328  -> get_no_positivity () 
let (ml_no_eta_expand_coertions : unit -> Prims.bool) =
  fun uu____10335  -> get_ml_no_eta_expand_coertions () 
let (warn_error : unit -> Prims.string) =
  fun uu____10342  ->
    let uu____10343 = get_warn_error ()  in
    FStar_String.concat "" uu____10343
  
let (use_extracted_interfaces : unit -> Prims.bool) =
  fun uu____10354  -> get_use_extracted_interfaces () 
let (use_nbe : unit -> Prims.bool) = fun uu____10361  -> get_use_nbe () 
let (use_nbe_for_extraction : unit -> Prims.bool) =
  fun uu____10368  -> get_use_nbe_for_extraction () 
let (trivial_pre_for_unannotated_effectful_fns : unit -> Prims.bool) =
  fun uu____10375  -> get_trivial_pre_for_unannotated_effectful_fns () 
let with_saved_options : 'a . (unit -> 'a) -> 'a =
  fun f  ->
    let uu____10392 =
      let uu____10394 = trace_error ()  in Prims.op_Negation uu____10394  in
    if uu____10392
    then
      (push ();
       (let r =
          try
            (fun uu___802_10409  ->
               match () with
               | () -> let uu____10414 = f ()  in FStar_Util.Inr uu____10414)
              ()
          with | uu___801_10416 -> FStar_Util.Inl uu___801_10416  in
        pop ();
        (match r with
         | FStar_Util.Inr v1 -> v1
         | FStar_Util.Inl ex -> FStar_Exn.raise ex)))
    else (push (); (let retv = f ()  in pop (); retv))
  
let (module_matches_namespace_filter :
  Prims.string -> Prims.string Prims.list -> Prims.bool) =
  fun m  ->
    fun filter1  ->
      let m1 = FStar_String.lowercase m  in
      let setting = parse_settings filter1  in
      let m_components = path_of_text m1  in
      let rec matches_path m_components1 path =
        match (m_components1, path) with
        | (uu____10497,[]) -> true
        | (m2::ms,p::ps) ->
            (m2 = (FStar_String.lowercase p)) && (matches_path ms ps)
        | uu____10530 -> false  in
      let uu____10542 =
        FStar_All.pipe_right setting
          (FStar_Util.try_find
             (fun uu____10584  ->
                match uu____10584 with
                | (path,uu____10595) -> matches_path m_components path))
         in
      match uu____10542 with
      | FStar_Pervasives_Native.None  -> false
      | FStar_Pervasives_Native.Some (uu____10614,flag) -> flag
  
let (matches_namespace_filter_opt :
  Prims.string ->
    Prims.string Prims.list FStar_Pervasives_Native.option -> Prims.bool)
  =
  fun m  ->
    fun uu___13_10649  ->
      match uu___13_10649 with
      | FStar_Pervasives_Native.None  -> false
      | FStar_Pervasives_Native.Some filter1 ->
          module_matches_namespace_filter m filter1
  
let (should_extract : Prims.string -> Prims.bool) =
  fun m  ->
    let m1 = FStar_String.lowercase m  in
    let uu____10679 = get_extract ()  in
    match uu____10679 with
    | FStar_Pervasives_Native.Some extract_setting ->
        ((let uu____10694 =
            let uu____10710 = get_no_extract ()  in
            let uu____10714 = get_extract_namespace ()  in
            let uu____10718 = get_extract_module ()  in
            (uu____10710, uu____10714, uu____10718)  in
          match uu____10694 with
          | ([],[],[]) -> ()
          | uu____10743 ->
              failwith
                "Incompatible options: --extract cannot be used with --no_extract, --extract_namespace or --extract_module");
         module_matches_namespace_filter m1 extract_setting)
    | FStar_Pervasives_Native.None  ->
        let should_extract_namespace m2 =
          let uu____10772 = get_extract_namespace ()  in
          match uu____10772 with
          | [] -> false
          | ns ->
              FStar_All.pipe_right ns
                (FStar_Util.for_some
                   (fun n1  ->
                      FStar_Util.starts_with m2 (FStar_String.lowercase n1)))
           in
        let should_extract_module m2 =
          let uu____10800 = get_extract_module ()  in
          match uu____10800 with
          | [] -> false
          | l ->
              FStar_All.pipe_right l
                (FStar_Util.for_some
                   (fun n1  -> (FStar_String.lowercase n1) = m2))
           in
        (let uu____10822 = no_extract m1  in Prims.op_Negation uu____10822)
          &&
          (let uu____10825 =
             let uu____10836 = get_extract_namespace ()  in
             let uu____10840 = get_extract_module ()  in
             (uu____10836, uu____10840)  in
           (match uu____10825 with
            | ([],[]) -> true
            | uu____10860 ->
                (should_extract_namespace m1) || (should_extract_module m1)))
  
let (should_be_already_cached : Prims.string -> Prims.bool) =
  fun m  ->
    let uu____10880 = get_already_cached ()  in
    match uu____10880 with
    | FStar_Pervasives_Native.None  -> false
    | FStar_Pervasives_Native.Some already_cached_setting ->
        module_matches_namespace_filter m already_cached_setting
  
let (error_flags : unit -> error_flag Prims.list) =
  let cache = FStar_Util.smap_create (Prims.of_int (10))  in
  fun uu____10913  ->
    let we = warn_error ()  in
    let uu____10916 = FStar_Util.smap_try_find cache we  in
    match uu____10916 with
    | FStar_Pervasives_Native.None  ->
        let r = parse_warn_error we  in (FStar_Util.smap_add cache we r; r)
    | FStar_Pervasives_Native.Some r -> r
  
let (profile_enabled :
  Prims.string FStar_Pervasives_Native.option -> Prims.string -> Prims.bool)
  =
  fun modul_opt  ->
    fun phase  ->
      match modul_opt with
      | FStar_Pervasives_Native.None  ->
          let uu____10960 = get_profile_component ()  in
          matches_namespace_filter_opt phase uu____10960
      | FStar_Pervasives_Native.Some modul ->
          (let uu____10971 = get_profile ()  in
           matches_namespace_filter_opt modul uu____10971) &&
            (let uu____10978 = get_profile_component ()  in
             matches_namespace_filter_opt phase uu____10978)
  