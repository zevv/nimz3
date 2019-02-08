{.experimental: "codeReordering".}


converter enumToInt(en: Z3_lbool): int {.used.} = en.int

type Z3_symbol_kind* = distinct int
converter enumToInt(en: Z3_symbol_kind): int {.used.} = en.int

type Z3_decl_kind* = distinct int
converter enumToInt(en: Z3_decl_kind): int {.used.} = en.int

type Z3_search_failure* = distinct int
converter enumToInt(en: Z3_search_failure): int {.used.} = en.int

type Z3_ast_print_mode* = distinct int
converter enumToInt(en: Z3_ast_print_mode): int {.used.} = en.int

type Z3_goal_prec* = distinct int
converter enumToInt(en: Z3_goal_prec): int {.used.} = en.int

type 
  Z3_lbool* = enum
    Z3_L_FALSE = -1,
    Z3_L_UNDEF = 0,
    Z3_L_TRUE = 1

  Z3_error_code* = enum
    Z3_OK = 0,
    Z3_SORT_ERROR = 1,
    Z3_IOB = 2,
    Z3_INVALID_ARG = 3,
    Z3_PARSER_ERROR = 4,
    Z3_NO_PARSER = 5,
    Z3_INVALID_PATTERN = 6,
    Z3_MEMOUT_FAIL = 7,
    Z3_FILE_ACCESS_ERROR = 8,
    Z3_INTERNAL_FATAL = 9,
    Z3_INVALID_USAGE = 10,
    Z3_DEC_REF_ERROR = 11,
    Z3_EXCEPTION = 12,

const
  libz3 = "libz3.so"
  STDC_PREDEF_H* = 1
  STDC_IEC_559* = 1
  STDC_IEC_559_COMPLEX* = 1
  Z3_TRUE* = 1
  Z3_FALSE* = 0
  Z3_INT_SYMBOL* = 0.Z3_symbol_kind
  Z3_STRING_SYMBOL* = 1.Z3_symbol_kind
  Z3_NO_FAILURE* = 0.Z3_search_failure
  Z3_UNKNOWN* = 1.Z3_search_failure
  Z3_TIMEOUT* = 2.Z3_search_failure
  Z3_MEMOUT_WATERMARK* = 3.Z3_search_failure
  Z3_CANCELED* = 4.Z3_search_failure
  Z3_NUM_CONFLICTS* = 5.Z3_search_failure
  Z3_THEORY2* = 6.Z3_search_failure
  Z3_QUANTIFIERS* = 7.Z3_search_failure
  Z3_PRINT_SMTLIB_FULL* = 0.Z3_ast_print_mode
  Z3_PRINT_LOW_LEVEL* = 1.Z3_ast_print_mode
  Z3_PRINT_SMTLIB_COMPLIANT* = 2.Z3_ast_print_mode
  Z3_PRINT_SMTLIB2_COMPLIANT* = 3.Z3_ast_print_mode
  Z3_GOAL_PRECISE* = 0.Z3_goal_prec
  Z3_GOAL_UNDER* = 1.Z3_goal_prec
  Z3_GOAL_OVER* = 2.Z3_goal_prec
  Z3_GOAL_UNDER_OVER* = 3.Z3_goal_prec

type
  Z3_symbol* = distinct pointer
  Z3_literals* = distinct pointer
  Z3_theory* = distinct pointer
  Z3_config* = distinct pointer
  Z3_context* = distinct pointer
  Z3_sort* = distinct pointer
  Z3_func_decl* = distinct pointer
  Z3_ast* = distinct pointer
  Z3_app* = distinct pointer
  Z3_pattern* = distinct pointer
  Z3_model* = distinct pointer
  Z3_constructor* = distinct pointer
  Z3_constructor_list* = distinct pointer
  Z3_params* = distinct pointer
  Z3_param_descrs* = distinct pointer
  Z3_goal* = distinct pointer
  Z3_tactic* = distinct pointer
  Z3_probe* = distinct pointer
  Z3_stats* = distinct pointer
  Z3_solver* = distinct pointer
  Z3_ast_vector* = distinct pointer
  Z3_ast_map* = distinct pointer
  Z3_apply_result* = distinct pointer
  Z3_func_interp* = distinct pointer
  Z3_func_entry* = distinct pointer
  Z3_fixedpoint* = distinct pointer
  Z3_optimize* = distinct pointer
  Z3_rcf_num* = distinct pointer
  Z3_theory_data* = distinct pointer
  Z3_bool* = bool
  Z3_string* = cstring
  Z3_string_ptr* = ptr Z3_string
  Z3_error_handler* = proc(c: Z3_context,e: Z3_error_code) {.nimcall.}
  Z3_reduce_eq_callback_fptr* = proc(t: Z3_theory,a: Z3_ast,b: Z3_ast,r: ptr Z3_ast): Z3_bool {.nimcall.}
  Z3_theory_callback_fptr* = proc(t: Z3_theory) {.nimcall.}
  Z3_theory_final_check_callback_fptr* = proc(a1: Z3_theory): Z3_bool {.nimcall.}
  Z3_theory_ast_callback_fptr* = proc(a1: Z3_theory,a2: Z3_ast) {.nimcall.}
  Z3_theory_ast_bool_callback_fptr* = proc(a1: Z3_theory,a2: Z3_ast,a3: Z3_bool) {.nimcall.}
  Z3_theory_ast_ast_callback_fptr* = proc(a1: Z3_theory,a2: Z3_ast,a3: Z3_ast) {.nimcall.}

proc Z3_global_param_set*(param_id: Z3_string,param_value: Z3_string) {.importc: "Z3_global_param_set", dynlib: libz3.}
proc Z3_global_param_reset_all*() {.importc: "Z3_global_param_reset_all", dynlib: libz3.}
proc Z3_global_param_get*(param_id: Z3_string,param_value: Z3_string_ptr): Z3_bool {.importc: "Z3_global_param_get", dynlib: libz3.}
proc Z3_mk_config*(): Z3_config {.importc: "Z3_mk_config", dynlib: libz3.}
proc Z3_del_config*(c: Z3_config) {.importc: "Z3_del_config", dynlib: libz3.}
proc Z3_set_param_value*(c: Z3_config,param_id: Z3_string,param_value: Z3_string) {.importc: "Z3_set_param_value", dynlib: libz3.}
proc Z3_mk_context*(c: Z3_config): Z3_context {.importc: "Z3_mk_context", dynlib: libz3.}
proc Z3_mk_context_rc*(c: Z3_config): Z3_context {.importc: "Z3_mk_context_rc", dynlib: libz3.}
proc Z3_del_context*(c: Z3_context) {.importc: "Z3_del_context", dynlib: libz3.}
proc Z3_inc_ref*(c: Z3_context,a: Z3_ast) {.importc: "Z3_inc_ref", dynlib: libz3.}
proc Z3_dec_ref*(c: Z3_context,a: Z3_ast) {.importc: "Z3_dec_ref", dynlib: libz3.}
proc Z3_update_param_value*(c: Z3_context,param_id: Z3_string,param_value: Z3_string) {.importc: "Z3_update_param_value", dynlib: libz3.}
proc Z3_interrupt*(c: Z3_context) {.importc: "Z3_interrupt", dynlib: libz3.}
proc Z3_mk_params*(c: Z3_context): Z3_params {.importc: "Z3_mk_params", dynlib: libz3.}
proc Z3_params_inc_ref*(c: Z3_context,p: Z3_params) {.importc: "Z3_params_inc_ref", dynlib: libz3.}
proc Z3_params_dec_ref*(c: Z3_context,p: Z3_params) {.importc: "Z3_params_dec_ref", dynlib: libz3.}
proc Z3_params_set_bool*(c: Z3_context,p: Z3_params,k: Z3_symbol,v: Z3_bool) {.importc: "Z3_params_set_bool", dynlib: libz3.}
proc Z3_params_set_uint*(c: Z3_context,p: Z3_params,k: Z3_symbol,v: cuint) {.importc: "Z3_params_set_uint", dynlib: libz3.}
proc Z3_params_set_double*(c: Z3_context,p: Z3_params,k: Z3_symbol,v: cdouble) {.importc: "Z3_params_set_double", dynlib: libz3.}
proc Z3_params_set_symbol*(c: Z3_context,p: Z3_params,k: Z3_symbol,v: Z3_symbol) {.importc: "Z3_params_set_symbol", dynlib: libz3.}
proc Z3_params_to_string*(c: Z3_context,p: Z3_params): Z3_string {.importc: "Z3_params_to_string", dynlib: libz3.}
proc Z3_params_validate*(c: Z3_context,p: Z3_params,d: Z3_param_descrs) {.importc: "Z3_params_validate", dynlib: libz3.}
proc Z3_param_descrs_inc_ref*(c: Z3_context,p: Z3_param_descrs) {.importc: "Z3_param_descrs_inc_ref", dynlib: libz3.}
proc Z3_param_descrs_dec_ref*(c: Z3_context,p: Z3_param_descrs) {.importc: "Z3_param_descrs_dec_ref", dynlib: libz3.}
proc Z3_param_descrs_size*(c: Z3_context,p: Z3_param_descrs): cuint {.importc: "Z3_param_descrs_size", dynlib: libz3.}
proc Z3_param_descrs_get_name*(c: Z3_context,p: Z3_param_descrs,i: cuint): Z3_symbol {.importc: "Z3_param_descrs_get_name", dynlib: libz3.}
proc Z3_param_descrs_to_string*(c: Z3_context,p: Z3_param_descrs): Z3_string {.importc: "Z3_param_descrs_to_string", dynlib: libz3.}
proc Z3_mk_int_symbol*(c: Z3_context,i: cint): Z3_symbol {.importc: "Z3_mk_int_symbol", dynlib: libz3.}
proc Z3_mk_string_symbol*(c: Z3_context,s: Z3_string): Z3_symbol {.importc: "Z3_mk_string_symbol", dynlib: libz3.}
proc Z3_mk_uninterpreted_sort*(c: Z3_context,s: Z3_symbol): Z3_sort {.importc: "Z3_mk_uninterpreted_sort", dynlib: libz3.}
proc Z3_mk_bool_sort*(c: Z3_context): Z3_sort {.importc: "Z3_mk_bool_sort", dynlib: libz3.}
proc Z3_mk_int_sort*(c: Z3_context): Z3_sort {.importc: "Z3_mk_int_sort", dynlib: libz3.}
proc Z3_mk_real_sort*(c: Z3_context): Z3_sort {.importc: "Z3_mk_real_sort", dynlib: libz3.}
proc Z3_mk_bv_sort*(c: Z3_context,sz: cuint): Z3_sort {.importc: "Z3_mk_bv_sort", dynlib: libz3.}
proc Z3_mk_finite_domain_sort*(c: Z3_context,name: Z3_symbol,size: culonglong): Z3_sort {.importc: "Z3_mk_finite_domain_sort", dynlib: libz3.}
proc Z3_mk_array_sort*(c: Z3_context,domain: Z3_sort,range: Z3_sort): Z3_sort {.importc: "Z3_mk_array_sort", dynlib: libz3.}
proc Z3_mk_list_sort*(c: Z3_context,name: Z3_symbol,elem_sort: Z3_sort,nil_decl: ptr Z3_func_decl,is_nil_decl: ptr Z3_func_decl,cons_decl: ptr Z3_func_decl,is_cons_decl: ptr Z3_func_decl,head_decl: ptr Z3_func_decl,tail_decl: ptr Z3_func_decl): Z3_sort {.importc: "Z3_mk_list_sort", dynlib: libz3.}
proc Z3_del_constructor*(c: Z3_context,constr: Z3_constructor) {.importc: "Z3_del_constructor", dynlib: libz3.}
proc Z3_del_constructor_list*(c: Z3_context,clist: Z3_constructor_list) {.importc: "Z3_del_constructor_list", dynlib: libz3.}
proc Z3_mk_const*(c: Z3_context,s: Z3_symbol,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_const", dynlib: libz3.}
proc Z3_mk_fresh_const*(c: Z3_context,prefix: Z3_string,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_fresh_const", dynlib: libz3.}
proc Z3_mk_true*(c: Z3_context): Z3_ast {.importc: "Z3_mk_true", dynlib: libz3.}
proc Z3_mk_false*(c: Z3_context): Z3_ast {.importc: "Z3_mk_false", dynlib: libz3.}
proc Z3_mk_eq*(c: Z3_context,l: Z3_ast,r: Z3_ast): Z3_ast {.importc: "Z3_mk_eq", dynlib: libz3.}
proc Z3_mk_not*(c: Z3_context,a: Z3_ast): Z3_ast {.importc: "Z3_mk_not", dynlib: libz3.}
proc Z3_mk_ite*(c: Z3_context,t1: Z3_ast,t2: Z3_ast,t3: Z3_ast): Z3_ast {.importc: "Z3_mk_ite", dynlib: libz3.}
proc Z3_mk_iff*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_iff", dynlib: libz3.}
proc Z3_mk_implies*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_implies", dynlib: libz3.}
proc Z3_mk_xor*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_xor", dynlib: libz3.}
proc Z3_mk_and*(c: Z3_context,num_args: cuint, args: ptr Z3_ast): Z3_ast {.importc: "Z3_mk_and", dynlib: libz3.}
proc Z3_mk_add*(c: Z3_context,num_args: cuint, args: ptr Z3_ast): Z3_ast {.importc: "Z3_mk_add", dynlib: libz3.}
proc Z3_mk_mul*(c: Z3_context,num_args: cuint, args: ptr Z3_ast): Z3_ast {.importc: "Z3_mk_mul", dynlib: libz3.}
proc Z3_mk_distinct*(c: Z3_context,num_args: cuint, args: ptr Z3_ast): Z3_ast {.importc: "Z3_mk_distinct", dynlib: libz3.}
proc Z3_mk_union*(c: Z3_context,num_args: cuint, args: ptr Z3_ast): Z3_ast {.importc: "Z3_mk_union", dynlib: libz3.}
proc Z3_mk_intersect*(c: Z3_context,num_args: cuint, args: ptr Z3_ast): Z3_ast {.importc: "Z3_mk_intersect", dynlib: libz3.}
proc Z3_mk_sub*(c: Z3_context,num_args: cuint, args: ptr Z3_ast): Z3_ast {.importc: "Z3_mk_sub", dynlib: libz3.}
proc Z3_mk_or*(c: Z3_context,num_args: cuint, args: ptr Z3_ast): Z3_ast {.importc: "Z3_mk_or", dynlib: libz3.}
proc Z3_mk_unary_minus*(c: Z3_context,arg: Z3_ast): Z3_ast {.importc: "Z3_mk_unary_minus", dynlib: libz3.}
proc Z3_mk_div*(c: Z3_context,arg1: Z3_ast,arg2: Z3_ast): Z3_ast {.importc: "Z3_mk_div", dynlib: libz3.}
proc Z3_mk_mod*(c: Z3_context,arg1: Z3_ast,arg2: Z3_ast): Z3_ast {.importc: "Z3_mk_mod", dynlib: libz3.}
proc Z3_mk_rem*(c: Z3_context,arg1: Z3_ast,arg2: Z3_ast): Z3_ast {.importc: "Z3_mk_rem", dynlib: libz3.}
proc Z3_mk_power*(c: Z3_context,arg1: Z3_ast,arg2: Z3_ast): Z3_ast {.importc: "Z3_mk_power", dynlib: libz3.}
proc Z3_mk_lt*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_lt", dynlib: libz3.}
proc Z3_mk_le*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_le", dynlib: libz3.}
proc Z3_mk_gt*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_gt", dynlib: libz3.}
proc Z3_mk_ge*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_ge", dynlib: libz3.}
proc Z3_mk_int2real*(c: Z3_context,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_int2real", dynlib: libz3.}
proc Z3_mk_real2int*(c: Z3_context,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_real2int", dynlib: libz3.}
proc Z3_mk_is_int*(c: Z3_context,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_is_int", dynlib: libz3.}
proc Z3_mk_bvnot*(c: Z3_context,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_bvnot", dynlib: libz3.}
proc Z3_mk_bvredand*(c: Z3_context,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_bvredand", dynlib: libz3.}
proc Z3_mk_bvredor*(c: Z3_context,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_bvredor", dynlib: libz3.}
proc Z3_mk_bvand*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvand", dynlib: libz3.}
proc Z3_mk_bvor*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvor", dynlib: libz3.}
proc Z3_mk_bvxor*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvxor", dynlib: libz3.}
proc Z3_mk_bvnand*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvnand", dynlib: libz3.}
proc Z3_mk_bvnor*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvnor", dynlib: libz3.}
proc Z3_mk_bvxnor*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvxnor", dynlib: libz3.}
proc Z3_mk_bvneg*(c: Z3_context,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_bvneg", dynlib: libz3.}
proc Z3_mk_bvadd*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvadd", dynlib: libz3.}
proc Z3_mk_bvsub*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvsub", dynlib: libz3.}
proc Z3_mk_bvmul*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvmul", dynlib: libz3.}
proc Z3_mk_bvudiv*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvudiv", dynlib: libz3.}
proc Z3_mk_bvsdiv*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvsdiv", dynlib: libz3.}
proc Z3_mk_bvurem*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvurem", dynlib: libz3.}
proc Z3_mk_bvsrem*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvsrem", dynlib: libz3.}
proc Z3_mk_bvsmod*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvsmod", dynlib: libz3.}
proc Z3_mk_bvult*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvult", dynlib: libz3.}
proc Z3_mk_bvslt*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvslt", dynlib: libz3.}
proc Z3_mk_bvule*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvule", dynlib: libz3.}
proc Z3_mk_bvsle*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvsle", dynlib: libz3.}
proc Z3_mk_bvuge*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvuge", dynlib: libz3.}
proc Z3_mk_bvsge*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvsge", dynlib: libz3.}
proc Z3_mk_bvugt*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvugt", dynlib: libz3.}
proc Z3_mk_bvsgt*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvsgt", dynlib: libz3.}
proc Z3_mk_concat*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_concat", dynlib: libz3.}
proc Z3_mk_extract*(c: Z3_context,high: cuint,low: cuint,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_extract", dynlib: libz3.}
proc Z3_mk_sign_ext*(c: Z3_context,i: cuint,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_sign_ext", dynlib: libz3.}
proc Z3_mk_zero_ext*(c: Z3_context,i: cuint,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_zero_ext", dynlib: libz3.}
proc Z3_mk_repeat*(c: Z3_context,i: cuint,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_repeat", dynlib: libz3.}
proc Z3_mk_bvshl*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvshl", dynlib: libz3.}
proc Z3_mk_bvlshr*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvlshr", dynlib: libz3.}
proc Z3_mk_bvashr*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvashr", dynlib: libz3.}
proc Z3_mk_rotate_left*(c: Z3_context,i: cuint,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_rotate_left", dynlib: libz3.}
proc Z3_mk_rotate_right*(c: Z3_context,i: cuint,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_rotate_right", dynlib: libz3.}
proc Z3_mk_ext_rotate_left*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_ext_rotate_left", dynlib: libz3.}
proc Z3_mk_ext_rotate_right*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_ext_rotate_right", dynlib: libz3.}
proc Z3_mk_int2bv*(c: Z3_context,n: cuint,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_int2bv", dynlib: libz3.}
proc Z3_mk_bv2int*(c: Z3_context,t1: Z3_ast,is_signed: Z3_bool): Z3_ast {.importc: "Z3_mk_bv2int", dynlib: libz3.}
proc Z3_mk_bvadd_no_overflow*(c: Z3_context,t1: Z3_ast,t2: Z3_ast,is_signed: Z3_bool): Z3_ast {.importc: "Z3_mk_bvadd_no_overflow", dynlib: libz3.}
proc Z3_mk_bvadd_no_underflow*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvadd_no_underflow", dynlib: libz3.}
proc Z3_mk_bvsub_no_overflow*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvsub_no_overflow", dynlib: libz3.}
proc Z3_mk_bvsub_no_underflow*(c: Z3_context,t1: Z3_ast,t2: Z3_ast,is_signed: Z3_bool): Z3_ast {.importc: "Z3_mk_bvsub_no_underflow", dynlib: libz3.}
proc Z3_mk_bvsdiv_no_overflow*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvsdiv_no_overflow", dynlib: libz3.}
proc Z3_mk_bvneg_no_overflow*(c: Z3_context,t1: Z3_ast): Z3_ast {.importc: "Z3_mk_bvneg_no_overflow", dynlib: libz3.}
proc Z3_mk_bvmul_no_overflow*(c: Z3_context,t1: Z3_ast,t2: Z3_ast,is_signed: Z3_bool): Z3_ast {.importc: "Z3_mk_bvmul_no_overflow", dynlib: libz3.}
proc Z3_mk_bvmul_no_underflow*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_bvmul_no_underflow", dynlib: libz3.}
proc Z3_mk_select*(c: Z3_context,a: Z3_ast,i: Z3_ast): Z3_ast {.importc: "Z3_mk_select", dynlib: libz3.}
proc Z3_mk_store*(c: Z3_context,a: Z3_ast,i: Z3_ast,v: Z3_ast): Z3_ast {.importc: "Z3_mk_store", dynlib: libz3.}
proc Z3_mk_const_array*(c: Z3_context,domain: Z3_sort,v: Z3_ast): Z3_ast {.importc: "Z3_mk_const_array", dynlib: libz3.}
proc Z3_mk_array_default*(c: Z3_context,array: Z3_ast): Z3_ast {.importc: "Z3_mk_array_default", dynlib: libz3.}
proc Z3_mk_set_sort*(c: Z3_context,ty: Z3_sort): Z3_sort {.importc: "Z3_mk_set_sort", dynlib: libz3.}
proc Z3_mk_empty_set*(c: Z3_context,domain: Z3_sort): Z3_ast {.importc: "Z3_mk_empty_set", dynlib: libz3.}
proc Z3_mk_full_set*(c: Z3_context,domain: Z3_sort): Z3_ast {.importc: "Z3_mk_full_set", dynlib: libz3.}
proc Z3_mk_set_add*(c: Z3_context,set: Z3_ast,elem: Z3_ast): Z3_ast {.importc: "Z3_mk_set_add", dynlib: libz3.}
proc Z3_mk_set_del*(c: Z3_context,set: Z3_ast,elem: Z3_ast): Z3_ast {.importc: "Z3_mk_set_del", dynlib: libz3.}
proc Z3_mk_set_difference*(c: Z3_context,arg1: Z3_ast,arg2: Z3_ast): Z3_ast {.importc: "Z3_mk_set_difference", dynlib: libz3.}
proc Z3_mk_set_complement*(c: Z3_context,arg: Z3_ast): Z3_ast {.importc: "Z3_mk_set_complement", dynlib: libz3.}
proc Z3_mk_set_member*(c: Z3_context,elem: Z3_ast,set: Z3_ast): Z3_ast {.importc: "Z3_mk_set_member", dynlib: libz3.}
proc Z3_mk_set_subset*(c: Z3_context,arg1: Z3_ast,arg2: Z3_ast): Z3_ast {.importc: "Z3_mk_set_subset", dynlib: libz3.}
proc Z3_mk_numeral*(c: Z3_context,numeral: Z3_string,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_numeral", dynlib: libz3.}
proc Z3_mk_real*(c: Z3_context,num: cint,den: cint): Z3_ast {.importc: "Z3_mk_real", dynlib: libz3.}
proc Z3_mk_int*(c: Z3_context,v: cint,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_int", dynlib: libz3.}
proc Z3_mk_unsigned_int*(c: Z3_context,v: cuint,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_unsigned_int", dynlib: libz3.}
proc Z3_mk_int64*(c: Z3_context,v: clonglong,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_int64", dynlib: libz3.}
proc Z3_mk_unsigned_int64*(c: Z3_context,v: culonglong,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_unsigned_int64", dynlib: libz3.}
proc Z3_mk_exists*(c: Z3_context,weight: cuint, num_patterns: cuint, patterns: ptr Z3_pattern, num_decls: cuint, sorts: ptr Z3_sort, decl_names: ptr Z3_symbol, body: Z3_ast): Z3_ast {.importc: "Z3_mk_exists", dynlib: libz3.}
proc Z3_mk_bound*(c: Z3_context,index: cuint,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_bound", dynlib: libz3.}
proc Z3_get_symbol_kind*(c: Z3_context,s: Z3_symbol): Z3_symbol_kind {.importc: "Z3_get_symbol_kind", dynlib: libz3.}
proc Z3_get_symbol_int*(c: Z3_context,s: Z3_symbol): cint {.importc: "Z3_get_symbol_int", dynlib: libz3.}
proc Z3_get_symbol_string*(c: Z3_context,s: Z3_symbol): Z3_string {.importc: "Z3_get_symbol_string", dynlib: libz3.}
proc Z3_get_sort_name*(c: Z3_context,d: Z3_sort): Z3_symbol {.importc: "Z3_get_sort_name", dynlib: libz3.}
proc Z3_get_sort_id*(c: Z3_context,s: Z3_sort): cuint {.importc: "Z3_get_sort_id", dynlib: libz3.}
proc Z3_sort_to_ast*(c: Z3_context,s: Z3_sort): Z3_ast {.importc: "Z3_sort_to_ast", dynlib: libz3.}
proc Z3_is_eq_sort*(c: Z3_context,s1: Z3_sort,s2: Z3_sort): Z3_bool {.importc: "Z3_is_eq_sort", dynlib: libz3.}
proc Z3_get_bv_sort_size*(c: Z3_context,t: Z3_sort): cuint {.importc: "Z3_get_bv_sort_size", dynlib: libz3.}
proc Z3_get_finite_domain_sort_size*(c: Z3_context,s: Z3_sort,r: ptr culonglong): Z3_bool {.importc: "Z3_get_finite_domain_sort_size", dynlib: libz3.}
proc Z3_get_array_sort_domain*(c: Z3_context,t: Z3_sort): Z3_sort {.importc: "Z3_get_array_sort_domain", dynlib: libz3.}
proc Z3_get_array_sort_range*(c: Z3_context,t: Z3_sort): Z3_sort {.importc: "Z3_get_array_sort_range", dynlib: libz3.}
proc Z3_get_tuple_sort_mk_decl*(c: Z3_context,t: Z3_sort): Z3_func_decl {.importc: "Z3_get_tuple_sort_mk_decl", dynlib: libz3.}
proc Z3_get_tuple_sort_num_fields*(c: Z3_context,t: Z3_sort): cuint {.importc: "Z3_get_tuple_sort_num_fields", dynlib: libz3.}
proc Z3_get_tuple_sort_field_decl*(c: Z3_context,t: Z3_sort,i: cuint): Z3_func_decl {.importc: "Z3_get_tuple_sort_field_decl", dynlib: libz3.}
proc Z3_get_datatype_sort_num_constructors*(c: Z3_context,t: Z3_sort): cuint {.importc: "Z3_get_datatype_sort_num_constructors", dynlib: libz3.}
proc Z3_get_datatype_sort_constructor*(c: Z3_context,t: Z3_sort,idx: cuint): Z3_func_decl {.importc: "Z3_get_datatype_sort_constructor", dynlib: libz3.}
proc Z3_get_datatype_sort_recognizer*(c: Z3_context,t: Z3_sort,idx: cuint): Z3_func_decl {.importc: "Z3_get_datatype_sort_recognizer", dynlib: libz3.}
proc Z3_get_datatype_sort_constructor_accessor*(c: Z3_context,t: Z3_sort,idx_c: cuint,idx_a: cuint): Z3_func_decl {.importc: "Z3_get_datatype_sort_constructor_accessor", dynlib: libz3.}
proc Z3_datatype_update_field*(c: Z3_context,field_access: Z3_func_decl,t: Z3_ast,value: Z3_ast): Z3_ast {.importc: "Z3_datatype_update_field", dynlib: libz3.}
proc Z3_get_relation_arity*(c: Z3_context,s: Z3_sort): cuint {.importc: "Z3_get_relation_arity", dynlib: libz3.}
proc Z3_get_relation_column*(c: Z3_context,s: Z3_sort,col: cuint): Z3_sort {.importc: "Z3_get_relation_column", dynlib: libz3.}
proc Z3_func_decl_to_ast*(c: Z3_context,f: Z3_func_decl): Z3_ast {.importc: "Z3_func_decl_to_ast", dynlib: libz3.}
proc Z3_is_eq_func_decl*(c: Z3_context,f1: Z3_func_decl,f2: Z3_func_decl): Z3_bool {.importc: "Z3_is_eq_func_decl", dynlib: libz3.}
proc Z3_get_func_decl_id*(c: Z3_context,f: Z3_func_decl): cuint {.importc: "Z3_get_func_decl_id", dynlib: libz3.}
proc Z3_get_decl_name*(c: Z3_context,d: Z3_func_decl): Z3_symbol {.importc: "Z3_get_decl_name", dynlib: libz3.}
proc Z3_get_decl_kind*(c: Z3_context,d: Z3_func_decl): Z3_decl_kind {.importc: "Z3_get_decl_kind", dynlib: libz3.}
proc Z3_get_domain_size*(c: Z3_context,d: Z3_func_decl): cuint {.importc: "Z3_get_domain_size", dynlib: libz3.}
proc Z3_get_arity*(c: Z3_context,d: Z3_func_decl): cuint {.importc: "Z3_get_arity", dynlib: libz3.}
proc Z3_get_domain*(c: Z3_context,d: Z3_func_decl,i: cuint): Z3_sort {.importc: "Z3_get_domain", dynlib: libz3.}
proc Z3_get_range*(c: Z3_context,d: Z3_func_decl): Z3_sort {.importc: "Z3_get_range", dynlib: libz3.}
proc Z3_get_decl_num_parameters*(c: Z3_context,d: Z3_func_decl): cuint {.importc: "Z3_get_decl_num_parameters", dynlib: libz3.}
proc Z3_get_decl_int_parameter*(c: Z3_context,d: Z3_func_decl,idx: cuint): cint {.importc: "Z3_get_decl_int_parameter", dynlib: libz3.}
proc Z3_get_decl_double_parameter*(c: Z3_context,d: Z3_func_decl,idx: cuint): cdouble {.importc: "Z3_get_decl_double_parameter", dynlib: libz3.}
proc Z3_get_decl_symbol_parameter*(c: Z3_context,d: Z3_func_decl,idx: cuint): Z3_symbol {.importc: "Z3_get_decl_symbol_parameter", dynlib: libz3.}
proc Z3_get_decl_sort_parameter*(c: Z3_context,d: Z3_func_decl,idx: cuint): Z3_sort {.importc: "Z3_get_decl_sort_parameter", dynlib: libz3.}
proc Z3_get_decl_ast_parameter*(c: Z3_context,d: Z3_func_decl,idx: cuint): Z3_ast {.importc: "Z3_get_decl_ast_parameter", dynlib: libz3.}
proc Z3_get_decl_func_decl_parameter*(c: Z3_context,d: Z3_func_decl,idx: cuint): Z3_func_decl {.importc: "Z3_get_decl_func_decl_parameter", dynlib: libz3.}
proc Z3_get_decl_rational_parameter*(c: Z3_context,d: Z3_func_decl,idx: cuint): Z3_string {.importc: "Z3_get_decl_rational_parameter", dynlib: libz3.}
proc Z3_app_to_ast*(c: Z3_context,a: Z3_app): Z3_ast {.importc: "Z3_app_to_ast", dynlib: libz3.}
proc Z3_get_app_decl*(c: Z3_context,a: Z3_app): Z3_func_decl {.importc: "Z3_get_app_decl", dynlib: libz3.}
proc Z3_get_app_num_args*(c: Z3_context,a: Z3_app): cuint {.importc: "Z3_get_app_num_args", dynlib: libz3.}
proc Z3_get_app_arg*(c: Z3_context,a: Z3_app,i: cuint): Z3_ast {.importc: "Z3_get_app_arg", dynlib: libz3.}
proc Z3_is_eq_ast*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_bool {.importc: "Z3_is_eq_ast", dynlib: libz3.}
proc Z3_get_ast_id*(c: Z3_context,t: Z3_ast): cuint {.importc: "Z3_get_ast_id", dynlib: libz3.}
proc Z3_get_ast_hash*(c: Z3_context,a: Z3_ast): cuint {.importc: "Z3_get_ast_hash", dynlib: libz3.}
proc Z3_get_sort*(c: Z3_context,a: Z3_ast): Z3_sort {.importc: "Z3_get_sort", dynlib: libz3.}
proc Z3_is_well_sorted*(c: Z3_context,t: Z3_ast): Z3_bool {.importc: "Z3_is_well_sorted", dynlib: libz3.}
proc Z3_get_bool_value*(c: Z3_context,a: Z3_ast): Z3_lbool {.importc: "Z3_get_bool_value", dynlib: libz3.}
proc Z3_is_app*(c: Z3_context,a: Z3_ast): Z3_bool {.importc: "Z3_is_app", dynlib: libz3.}
proc Z3_is_numeral_ast*(c: Z3_context,a: Z3_ast): Z3_bool {.importc: "Z3_is_numeral_ast", dynlib: libz3.}
proc Z3_is_algebraic_number*(c: Z3_context,a: Z3_ast): Z3_bool {.importc: "Z3_is_algebraic_number", dynlib: libz3.}
proc Z3_to_app*(c: Z3_context,a: Z3_ast): Z3_app {.importc: "Z3_to_app", dynlib: libz3.}
proc Z3_to_func_decl*(c: Z3_context,a: Z3_ast): Z3_func_decl {.importc: "Z3_to_func_decl", dynlib: libz3.}
proc Z3_get_numeral_string*(c: Z3_context,a: Z3_ast): Z3_string {.importc: "Z3_get_numeral_string", dynlib: libz3.}
proc Z3_get_numeral_decimal_string*(c: Z3_context,a: Z3_ast,precision: cuint): Z3_string {.importc: "Z3_get_numeral_decimal_string", dynlib: libz3.}
proc Z3_get_numerator*(c: Z3_context,a: Z3_ast): Z3_ast {.importc: "Z3_get_numerator", dynlib: libz3.}
proc Z3_get_denominator*(c: Z3_context,a: Z3_ast): Z3_ast {.importc: "Z3_get_denominator", dynlib: libz3.}
proc Z3_get_numeral_small*(c: Z3_context,a: Z3_ast,num: ptr clonglong,den: ptr clonglong): Z3_bool {.importc: "Z3_get_numeral_small", dynlib: libz3.}
proc Z3_get_numeral_int*(c: Z3_context,v: Z3_ast,i: ptr cint): Z3_bool {.importc: "Z3_get_numeral_int", dynlib: libz3.}
proc Z3_get_numeral_uint*(c: Z3_context,v: Z3_ast,u: ptr cuint): Z3_bool {.importc: "Z3_get_numeral_uint", dynlib: libz3.}
proc Z3_get_numeral_uint64*(c: Z3_context,v: Z3_ast,u: ptr culonglong): Z3_bool {.importc: "Z3_get_numeral_uint64", dynlib: libz3.}
proc Z3_get_numeral_int64*(c: Z3_context,v: Z3_ast,i: ptr clonglong): Z3_bool {.importc: "Z3_get_numeral_int64", dynlib: libz3.}
proc Z3_get_numeral_rational_int64*(c: Z3_context,v: Z3_ast,num: ptr clonglong,den: ptr clonglong): Z3_bool {.importc: "Z3_get_numeral_rational_int64", dynlib: libz3.}
proc Z3_get_algebraic_number_lower*(c: Z3_context,a: Z3_ast,precision: cuint): Z3_ast {.importc: "Z3_get_algebraic_number_lower", dynlib: libz3.}
proc Z3_get_algebraic_number_upper*(c: Z3_context,a: Z3_ast,precision: cuint): Z3_ast {.importc: "Z3_get_algebraic_number_upper", dynlib: libz3.}
proc Z3_pattern_to_ast*(c: Z3_context,p: Z3_pattern): Z3_ast {.importc: "Z3_pattern_to_ast", dynlib: libz3.}
proc Z3_get_pattern_num_terms*(c: Z3_context,p: Z3_pattern): cuint {.importc: "Z3_get_pattern_num_terms", dynlib: libz3.}
proc Z3_get_pattern*(c: Z3_context,p: Z3_pattern,idx: cuint): Z3_ast {.importc: "Z3_get_pattern", dynlib: libz3.}
proc Z3_get_index_value*(c: Z3_context,a: Z3_ast): cuint {.importc: "Z3_get_index_value", dynlib: libz3.}
proc Z3_is_quantifier_forall*(c: Z3_context,a: Z3_ast): Z3_bool {.importc: "Z3_is_quantifier_forall", dynlib: libz3.}
proc Z3_get_quantifier_weight*(c: Z3_context,a: Z3_ast): cuint {.importc: "Z3_get_quantifier_weight", dynlib: libz3.}
proc Z3_get_quantifier_num_patterns*(c: Z3_context,a: Z3_ast): cuint {.importc: "Z3_get_quantifier_num_patterns", dynlib: libz3.}
proc Z3_get_quantifier_pattern_ast*(c: Z3_context,a: Z3_ast,i: cuint): Z3_pattern {.importc: "Z3_get_quantifier_pattern_ast", dynlib: libz3.}
proc Z3_get_quantifier_num_no_patterns*(c: Z3_context,a: Z3_ast): cuint {.importc: "Z3_get_quantifier_num_no_patterns", dynlib: libz3.}
proc Z3_get_quantifier_no_pattern_ast*(c: Z3_context,a: Z3_ast,i: cuint): Z3_ast {.importc: "Z3_get_quantifier_no_pattern_ast", dynlib: libz3.}
proc Z3_get_quantifier_num_bound*(c: Z3_context,a: Z3_ast): cuint {.importc: "Z3_get_quantifier_num_bound", dynlib: libz3.}
proc Z3_get_quantifier_bound_name*(c: Z3_context,a: Z3_ast,i: cuint): Z3_symbol {.importc: "Z3_get_quantifier_bound_name", dynlib: libz3.}
proc Z3_get_quantifier_bound_sort*(c: Z3_context,a: Z3_ast,i: cuint): Z3_sort {.importc: "Z3_get_quantifier_bound_sort", dynlib: libz3.}
proc Z3_get_quantifier_body*(c: Z3_context,a: Z3_ast): Z3_ast {.importc: "Z3_get_quantifier_body", dynlib: libz3.}
proc Z3_simplify*(c: Z3_context,a: Z3_ast): Z3_ast {.importc: "Z3_simplify", dynlib: libz3.}
proc Z3_simplify_ex*(c: Z3_context,a: Z3_ast,p: Z3_params): Z3_ast {.importc: "Z3_simplify_ex", dynlib: libz3.}
proc Z3_simplify_get_help*(c: Z3_context): Z3_string {.importc: "Z3_simplify_get_help", dynlib: libz3.}
proc Z3_simplify_get_param_descrs*(c: Z3_context): Z3_param_descrs {.importc: "Z3_simplify_get_param_descrs", dynlib: libz3.}
proc Z3_translate*(source: Z3_context,a: Z3_ast,target: Z3_context): Z3_ast {.importc: "Z3_translate", dynlib: libz3.}
proc Z3_model_inc_ref*(c: Z3_context,m: Z3_model) {.importc: "Z3_model_inc_ref", dynlib: libz3.}
proc Z3_model_dec_ref*(c: Z3_context,m: Z3_model) {.importc: "Z3_model_dec_ref", dynlib: libz3.}
proc Z3_model_eval*(c: Z3_context,m: Z3_model,t: Z3_ast,model_completion: Z3_bool,v: ptr Z3_ast): Z3_bool {.importc: "Z3_model_eval", dynlib: libz3.}
proc Z3_model_get_const_interp*(c: Z3_context,m: Z3_model,a: Z3_func_decl): Z3_ast {.importc: "Z3_model_get_const_interp", dynlib: libz3.}
proc Z3_model_has_interp*(c: Z3_context,m: Z3_model,a: Z3_func_decl): Z3_bool {.importc: "Z3_model_has_interp", dynlib: libz3.}
proc Z3_model_get_func_interp*(c: Z3_context,m: Z3_model,f: Z3_func_decl): Z3_func_interp {.importc: "Z3_model_get_func_interp", dynlib: libz3.}
proc Z3_model_get_num_consts*(c: Z3_context,m: Z3_model): cuint {.importc: "Z3_model_get_num_consts", dynlib: libz3.}
proc Z3_model_get_const_decl*(c: Z3_context,m: Z3_model,i: cuint): Z3_func_decl {.importc: "Z3_model_get_const_decl", dynlib: libz3.}
proc Z3_model_get_num_funcs*(c: Z3_context,m: Z3_model): cuint {.importc: "Z3_model_get_num_funcs", dynlib: libz3.}
proc Z3_model_get_func_decl*(c: Z3_context,m: Z3_model,i: cuint): Z3_func_decl {.importc: "Z3_model_get_func_decl", dynlib: libz3.}
proc Z3_model_get_num_sorts*(c: Z3_context,m: Z3_model): cuint {.importc: "Z3_model_get_num_sorts", dynlib: libz3.}
proc Z3_model_get_sort*(c: Z3_context,m: Z3_model,i: cuint): Z3_sort {.importc: "Z3_model_get_sort", dynlib: libz3.}
proc Z3_model_get_sort_universe*(c: Z3_context,m: Z3_model,s: Z3_sort): Z3_ast_vector {.importc: "Z3_model_get_sort_universe", dynlib: libz3.}
proc Z3_is_as_array*(c: Z3_context,a: Z3_ast): Z3_bool {.importc: "Z3_is_as_array", dynlib: libz3.}
proc Z3_get_as_array_func_decl*(c: Z3_context,a: Z3_ast): Z3_func_decl {.importc: "Z3_get_as_array_func_decl", dynlib: libz3.}
proc Z3_func_interp_inc_ref*(c: Z3_context,f: Z3_func_interp) {.importc: "Z3_func_interp_inc_ref", dynlib: libz3.}
proc Z3_func_interp_dec_ref*(c: Z3_context,f: Z3_func_interp) {.importc: "Z3_func_interp_dec_ref", dynlib: libz3.}
proc Z3_func_interp_get_num_entries*(c: Z3_context,f: Z3_func_interp): cuint {.importc: "Z3_func_interp_get_num_entries", dynlib: libz3.}
proc Z3_func_interp_get_entry*(c: Z3_context,f: Z3_func_interp,i: cuint): Z3_func_entry {.importc: "Z3_func_interp_get_entry", dynlib: libz3.}
proc Z3_func_interp_get_else*(c: Z3_context,f: Z3_func_interp): Z3_ast {.importc: "Z3_func_interp_get_else", dynlib: libz3.}
proc Z3_func_interp_get_arity*(c: Z3_context,f: Z3_func_interp): cuint {.importc: "Z3_func_interp_get_arity", dynlib: libz3.}
proc Z3_func_entry_inc_ref*(c: Z3_context,e: Z3_func_entry) {.importc: "Z3_func_entry_inc_ref", dynlib: libz3.}
proc Z3_func_entry_dec_ref*(c: Z3_context,e: Z3_func_entry) {.importc: "Z3_func_entry_dec_ref", dynlib: libz3.}
proc Z3_func_entry_get_value*(c: Z3_context,e: Z3_func_entry): Z3_ast {.importc: "Z3_func_entry_get_value", dynlib: libz3.}
proc Z3_func_entry_get_num_args*(c: Z3_context,e: Z3_func_entry): cuint {.importc: "Z3_func_entry_get_num_args", dynlib: libz3.}
proc Z3_func_entry_get_arg*(c: Z3_context,e: Z3_func_entry,i: cuint): Z3_ast {.importc: "Z3_func_entry_get_arg", dynlib: libz3.}
proc Z3_open_log*(filename: Z3_string): Z3_bool {.importc: "Z3_open_log", dynlib: libz3.}
proc Z3_append_log*(string: Z3_string) {.importc: "Z3_append_log", dynlib: libz3.}
proc Z3_close_log*() {.importc: "Z3_close_log", dynlib: libz3.}
proc Z3_toggle_warning_messages*(enabled: Z3_bool) {.importc: "Z3_toggle_warning_messages", dynlib: libz3.}
proc Z3_set_ast_print_mode*(c: Z3_context,mode: Z3_ast_print_mode) {.importc: "Z3_set_ast_print_mode", dynlib: libz3.}
proc Z3_ast_to_string*(c: Z3_context,a: Z3_ast): Z3_string {.importc: "Z3_ast_to_string", dynlib: libz3.}
proc Z3_pattern_to_string*(c: Z3_context,p: Z3_pattern): Z3_string {.importc: "Z3_pattern_to_string", dynlib: libz3.}
proc Z3_sort_to_string*(c: Z3_context,s: Z3_sort): Z3_string {.importc: "Z3_sort_to_string", dynlib: libz3.}
proc Z3_func_decl_to_string*(c: Z3_context,d: Z3_func_decl): Z3_string {.importc: "Z3_func_decl_to_string", dynlib: libz3.}
proc Z3_model_to_string*(c: Z3_context,m: Z3_model): Z3_string {.importc: "Z3_model_to_string", dynlib: libz3.}
proc Z3_get_smtlib_num_formulas*(c: Z3_context): cuint {.importc: "Z3_get_smtlib_num_formulas", dynlib: libz3.}
proc Z3_get_smtlib_formula*(c: Z3_context,i: cuint): Z3_ast {.importc: "Z3_get_smtlib_formula", dynlib: libz3.}
proc Z3_get_smtlib_num_assumptions*(c: Z3_context): cuint {.importc: "Z3_get_smtlib_num_assumptions", dynlib: libz3.}
proc Z3_get_smtlib_assumption*(c: Z3_context,i: cuint): Z3_ast {.importc: "Z3_get_smtlib_assumption", dynlib: libz3.}
proc Z3_get_smtlib_num_decls*(c: Z3_context): cuint {.importc: "Z3_get_smtlib_num_decls", dynlib: libz3.}
proc Z3_get_smtlib_decl*(c: Z3_context,i: cuint): Z3_func_decl {.importc: "Z3_get_smtlib_decl", dynlib: libz3.}
proc Z3_get_smtlib_num_sorts*(c: Z3_context): cuint {.importc: "Z3_get_smtlib_num_sorts", dynlib: libz3.}
proc Z3_get_smtlib_sort*(c: Z3_context,i: cuint): Z3_sort {.importc: "Z3_get_smtlib_sort", dynlib: libz3.}
proc Z3_get_smtlib_error*(c: Z3_context): Z3_string {.importc: "Z3_get_smtlib_error", dynlib: libz3.}
proc Z3_get_error_code*(c: Z3_context): Z3_error_code {.importc: "Z3_get_error_code", dynlib: libz3.}
proc Z3_set_error_handler*(c: Z3_context,h: Z3_error_handler) {.importc: "Z3_set_error_handler", dynlib: libz3.}
proc Z3_set_error*(c: Z3_context,e: Z3_error_code) {.importc: "Z3_set_error", dynlib: libz3.}
proc Z3_get_error_msg*(err: Z3_error_code): Z3_string {.importc: "Z3_get_error_msg", dynlib: libz3.}
proc Z3_get_error_msg_ex*(c: Z3_context,err: Z3_error_code): Z3_string {.importc: "Z3_get_error_msg_ex", dynlib: libz3.}
proc Z3_get_version*(major: ptr cuint,minor: ptr cuint,build_number: ptr cuint,revision_number: ptr cuint) {.importc: "Z3_get_version", dynlib: libz3.}
proc Z3_enable_trace*(tag: Z3_string) {.importc: "Z3_enable_trace", dynlib: libz3.}
proc Z3_disable_trace*(tag: Z3_string) {.importc: "Z3_disable_trace", dynlib: libz3.}
proc Z3_reset_memory*() {.importc: "Z3_reset_memory", dynlib: libz3.}
proc Z3_finalize_memory*() {.importc: "Z3_finalize_memory", dynlib: libz3.}
proc Z3_mk_theory*(c: Z3_context,th_name: Z3_string,data: Z3_theory_data): Z3_theory {.importc: "Z3_mk_theory", dynlib: libz3.}
proc Z3_theory_get_ext_data*(t: Z3_theory): Z3_theory_data {.importc: "Z3_theory_get_ext_data", dynlib: libz3.}
proc Z3_theory_mk_sort*(c: Z3_context,t: Z3_theory,s: Z3_symbol): Z3_sort {.importc: "Z3_theory_mk_sort", dynlib: libz3.}
proc Z3_theory_mk_value*(c: Z3_context,t: Z3_theory,n: Z3_symbol,s: Z3_sort): Z3_ast {.importc: "Z3_theory_mk_value", dynlib: libz3.}
proc Z3_theory_mk_constant*(c: Z3_context,t: Z3_theory,n: Z3_symbol,s: Z3_sort): Z3_ast {.importc: "Z3_theory_mk_constant", dynlib: libz3.}
proc Z3_theory_get_context*(t: Z3_theory): Z3_context {.importc: "Z3_theory_get_context", dynlib: libz3.}
proc Z3_set_delete_callback*(t: Z3_theory,f: Z3_theory_callback_fptr) {.importc: "Z3_set_delete_callback", dynlib: libz3.}
#proc Z3_set_reduce_app_callback*(t: Z3_theory,f: Z3_reduce_app_callback_fptr) {.importc: "Z3_set_reduce_app_callback", dynlib: libz3.}
proc Z3_set_reduce_eq_callback*(t: Z3_theory,f: Z3_reduce_eq_callback_fptr) {.importc: "Z3_set_reduce_eq_callback", dynlib: libz3.}
#proc Z3_set_reduce_distinct_callback*(t: Z3_theory,f: Z3_reduce_distinct_callback_fptr) {.importc: "Z3_set_reduce_distinct_callback", dynlib: libz3.}
proc Z3_set_new_app_callback*(t: Z3_theory,f: Z3_theory_ast_callback_fptr) {.importc: "Z3_set_new_app_callback", dynlib: libz3.}
proc Z3_set_new_elem_callback*(t: Z3_theory,f: Z3_theory_ast_callback_fptr) {.importc: "Z3_set_new_elem_callback", dynlib: libz3.}
proc Z3_set_init_search_callback*(t: Z3_theory,f: Z3_theory_callback_fptr) {.importc: "Z3_set_init_search_callback", dynlib: libz3.}
proc Z3_set_push_callback*(t: Z3_theory,f: Z3_theory_callback_fptr) {.importc: "Z3_set_push_callback", dynlib: libz3.}
proc Z3_set_pop_callback*(t: Z3_theory,f: Z3_theory_callback_fptr) {.importc: "Z3_set_pop_callback", dynlib: libz3.}
proc Z3_set_restart_callback*(t: Z3_theory,f: Z3_theory_callback_fptr) {.importc: "Z3_set_restart_callback", dynlib: libz3.}
proc Z3_set_reset_callback*(t: Z3_theory,f: Z3_theory_callback_fptr) {.importc: "Z3_set_reset_callback", dynlib: libz3.}
proc Z3_set_final_check_callback*(t: Z3_theory,f: Z3_theory_final_check_callback_fptr) {.importc: "Z3_set_final_check_callback", dynlib: libz3.}
proc Z3_set_new_eq_callback*(t: Z3_theory,f: Z3_theory_ast_ast_callback_fptr) {.importc: "Z3_set_new_eq_callback", dynlib: libz3.}
proc Z3_set_new_diseq_callback*(t: Z3_theory,f: Z3_theory_ast_ast_callback_fptr) {.importc: "Z3_set_new_diseq_callback", dynlib: libz3.}
proc Z3_set_new_assignment_callback*(t: Z3_theory,f: Z3_theory_ast_bool_callback_fptr) {.importc: "Z3_set_new_assignment_callback", dynlib: libz3.}
proc Z3_set_new_relevant_callback*(t: Z3_theory,f: Z3_theory_ast_callback_fptr) {.importc: "Z3_set_new_relevant_callback", dynlib: libz3.}
proc Z3_theory_assert_axiom*(t: Z3_theory,ax: Z3_ast) {.importc: "Z3_theory_assert_axiom", dynlib: libz3.}
proc Z3_theory_assume_eq*(t: Z3_theory,lhs: Z3_ast,rhs: Z3_ast) {.importc: "Z3_theory_assume_eq", dynlib: libz3.}
proc Z3_theory_enable_axiom_simplification*(t: Z3_theory,flag: Z3_bool) {.importc: "Z3_theory_enable_axiom_simplification", dynlib: libz3.}
proc Z3_theory_get_eqc_root*(t: Z3_theory,n: Z3_ast): Z3_ast {.importc: "Z3_theory_get_eqc_root", dynlib: libz3.}
proc Z3_theory_get_eqc_next*(t: Z3_theory,n: Z3_ast): Z3_ast {.importc: "Z3_theory_get_eqc_next", dynlib: libz3.}
proc Z3_theory_get_num_parents*(t: Z3_theory,n: Z3_ast): cuint {.importc: "Z3_theory_get_num_parents", dynlib: libz3.}
proc Z3_theory_get_parent*(t: Z3_theory,n: Z3_ast,i: cuint): Z3_ast {.importc: "Z3_theory_get_parent", dynlib: libz3.}
proc Z3_theory_is_value*(t: Z3_theory,n: Z3_ast): Z3_bool {.importc: "Z3_theory_is_value", dynlib: libz3.}
proc Z3_theory_is_decl*(t: Z3_theory,d: Z3_func_decl): Z3_bool {.importc: "Z3_theory_is_decl", dynlib: libz3.}
proc Z3_theory_get_num_elems*(t: Z3_theory): cuint {.importc: "Z3_theory_get_num_elems", dynlib: libz3.}
proc Z3_theory_get_elem*(t: Z3_theory,i: cuint): Z3_ast {.importc: "Z3_theory_get_elem", dynlib: libz3.}
proc Z3_theory_get_num_apps*(t: Z3_theory): cuint {.importc: "Z3_theory_get_num_apps", dynlib: libz3.}
proc Z3_theory_get_app*(t: Z3_theory,i: cuint): Z3_ast {.importc: "Z3_theory_get_app", dynlib: libz3.}
proc Z3_mk_fixedpoint*(c: Z3_context): Z3_fixedpoint {.importc: "Z3_mk_fixedpoint", dynlib: libz3.}
proc Z3_fixedpoint_inc_ref*(c: Z3_context,d: Z3_fixedpoint) {.importc: "Z3_fixedpoint_inc_ref", dynlib: libz3.}
proc Z3_fixedpoint_dec_ref*(c: Z3_context,d: Z3_fixedpoint) {.importc: "Z3_fixedpoint_dec_ref", dynlib: libz3.}
proc Z3_fixedpoint_add_rule*(c: Z3_context,d: Z3_fixedpoint,rule: Z3_ast,name: Z3_symbol) {.importc: "Z3_fixedpoint_add_rule", dynlib: libz3.}
proc Z3_fixedpoint_assert*(c: Z3_context,d: Z3_fixedpoint,axiom: Z3_ast) {.importc: "Z3_fixedpoint_assert", dynlib: libz3.}
proc Z3_fixedpoint_query*(c: Z3_context,d: Z3_fixedpoint,query: Z3_ast): Z3_lbool {.importc: "Z3_fixedpoint_query", dynlib: libz3.}
proc Z3_fixedpoint_get_answer*(c: Z3_context,d: Z3_fixedpoint): Z3_ast {.importc: "Z3_fixedpoint_get_answer", dynlib: libz3.}
proc Z3_fixedpoint_get_reason_unknown*(c: Z3_context,d: Z3_fixedpoint): Z3_string {.importc: "Z3_fixedpoint_get_reason_unknown", dynlib: libz3.}
proc Z3_fixedpoint_update_rule*(c: Z3_context,d: Z3_fixedpoint,a: Z3_ast,name: Z3_symbol) {.importc: "Z3_fixedpoint_update_rule", dynlib: libz3.}
proc Z3_fixedpoint_get_num_levels*(c: Z3_context,d: Z3_fixedpoint,pred: Z3_func_decl): cuint {.importc: "Z3_fixedpoint_get_num_levels", dynlib: libz3.}
proc Z3_fixedpoint_get_cover_delta*(c: Z3_context,d: Z3_fixedpoint,level: cint,pred: Z3_func_decl): Z3_ast {.importc: "Z3_fixedpoint_get_cover_delta", dynlib: libz3.}
proc Z3_fixedpoint_add_cover*(c: Z3_context,d: Z3_fixedpoint,level: cint,pred: Z3_func_decl,property: Z3_ast) {.importc: "Z3_fixedpoint_add_cover", dynlib: libz3.}
proc Z3_fixedpoint_get_statistics*(c: Z3_context,d: Z3_fixedpoint): Z3_stats {.importc: "Z3_fixedpoint_get_statistics", dynlib: libz3.}
proc Z3_fixedpoint_register_relation*(c: Z3_context,d: Z3_fixedpoint,f: Z3_func_decl) {.importc: "Z3_fixedpoint_register_relation", dynlib: libz3.}
proc Z3_fixedpoint_get_rules*(c: Z3_context,f: Z3_fixedpoint): Z3_ast_vector {.importc: "Z3_fixedpoint_get_rules", dynlib: libz3.}
proc Z3_fixedpoint_get_assertions*(c: Z3_context,f: Z3_fixedpoint): Z3_ast_vector {.importc: "Z3_fixedpoint_get_assertions", dynlib: libz3.}
proc Z3_fixedpoint_set_params*(c: Z3_context,f: Z3_fixedpoint,p: Z3_params) {.importc: "Z3_fixedpoint_set_params", dynlib: libz3.}
proc Z3_fixedpoint_get_help*(c: Z3_context,f: Z3_fixedpoint): Z3_string {.importc: "Z3_fixedpoint_get_help", dynlib: libz3.}
proc Z3_fixedpoint_get_param_descrs*(c: Z3_context,f: Z3_fixedpoint): Z3_param_descrs {.importc: "Z3_fixedpoint_get_param_descrs", dynlib: libz3.}
proc Z3_fixedpoint_from_string*(c: Z3_context,f: Z3_fixedpoint,s: Z3_string): Z3_ast_vector {.importc: "Z3_fixedpoint_from_string", dynlib: libz3.}
proc Z3_fixedpoint_from_file*(c: Z3_context,f: Z3_fixedpoint,s: Z3_string): Z3_ast_vector {.importc: "Z3_fixedpoint_from_file", dynlib: libz3.}
proc Z3_fixedpoint_push*(c: Z3_context,d: Z3_fixedpoint) {.importc: "Z3_fixedpoint_push", dynlib: libz3.}
proc Z3_fixedpoint_pop*(c: Z3_context,d: Z3_fixedpoint) {.importc: "Z3_fixedpoint_pop", dynlib: libz3.}
proc Z3_fixedpoint_init*(c: Z3_context,d: Z3_fixedpoint,state: pointer) {.importc: "Z3_fixedpoint_init", dynlib: libz3.}
#proc Z3_fixedpoint_set_reduce_assign_callback*(c: Z3_context,d: Z3_fixedpoint,cb: Z3_fixedpoint_reduce_assign_callback_fptr) {.importc: "Z3_fixedpoint_set_reduce_assign_callback", dynlib: libz3.}
#proc Z3_fixedpoint_set_reduce_app_callback*(c: Z3_context,d: Z3_fixedpoint,cb: Z3_fixedpoint_reduce_app_callback_fptr) {.importc: "Z3_fixedpoint_set_reduce_app_callback", dynlib: libz3.}
proc Z3_mk_optimize*(c: Z3_context): Z3_optimize {.importc: "Z3_mk_optimize", dynlib: libz3.}
proc Z3_optimize_inc_ref*(c: Z3_context,d: Z3_optimize) {.importc: "Z3_optimize_inc_ref", dynlib: libz3.}
proc Z3_optimize_dec_ref*(c: Z3_context,d: Z3_optimize) {.importc: "Z3_optimize_dec_ref", dynlib: libz3.}
proc Z3_optimize_assert*(c: Z3_context,o: Z3_optimize,a: Z3_ast) {.importc: "Z3_optimize_assert", dynlib: libz3.}
proc Z3_optimize_assert_soft*(c: Z3_context,o: Z3_optimize,a: Z3_ast,weight: Z3_string,id: Z3_symbol): cuint {.importc: "Z3_optimize_assert_soft", dynlib: libz3.}
proc Z3_optimize_maximize*(c: Z3_context,o: Z3_optimize,t: Z3_ast): cuint {.importc: "Z3_optimize_maximize", dynlib: libz3.}
proc Z3_optimize_minimize*(c: Z3_context,o: Z3_optimize,t: Z3_ast): cuint {.importc: "Z3_optimize_minimize", dynlib: libz3.}
proc Z3_optimize_push*(c: Z3_context,d: Z3_optimize) {.importc: "Z3_optimize_push", dynlib: libz3.}
proc Z3_optimize_pop*(c: Z3_context,d: Z3_optimize) {.importc: "Z3_optimize_pop", dynlib: libz3.}
proc Z3_optimize_check*(c: Z3_context,o: Z3_optimize): Z3_lbool {.importc: "Z3_optimize_check", dynlib: libz3.}
proc Z3_optimize_get_reason_unknown*(c: Z3_context,d: Z3_optimize): Z3_string {.importc: "Z3_optimize_get_reason_unknown", dynlib: libz3.}
proc Z3_optimize_get_model*(c: Z3_context,o: Z3_optimize): Z3_model {.importc: "Z3_optimize_get_model", dynlib: libz3.}
proc Z3_optimize_set_params*(c: Z3_context,o: Z3_optimize,p: Z3_params) {.importc: "Z3_optimize_set_params", dynlib: libz3.}
proc Z3_optimize_get_param_descrs*(c: Z3_context,o: Z3_optimize): Z3_param_descrs {.importc: "Z3_optimize_get_param_descrs", dynlib: libz3.}
proc Z3_optimize_get_lower*(c: Z3_context,o: Z3_optimize,idx: cuint): Z3_ast {.importc: "Z3_optimize_get_lower", dynlib: libz3.}
proc Z3_optimize_get_upper*(c: Z3_context,o: Z3_optimize,idx: cuint): Z3_ast {.importc: "Z3_optimize_get_upper", dynlib: libz3.}
proc Z3_optimize_to_string*(c: Z3_context,o: Z3_optimize): Z3_string {.importc: "Z3_optimize_to_string", dynlib: libz3.}
proc Z3_optimize_get_help*(c: Z3_context,t: Z3_optimize): Z3_string {.importc: "Z3_optimize_get_help", dynlib: libz3.}
proc Z3_optimize_get_statistics*(c: Z3_context,d: Z3_optimize): Z3_stats {.importc: "Z3_optimize_get_statistics", dynlib: libz3.}
proc Z3_mk_ast_vector*(c: Z3_context): Z3_ast_vector {.importc: "Z3_mk_ast_vector", dynlib: libz3.}
proc Z3_ast_vector_inc_ref*(c: Z3_context,v: Z3_ast_vector) {.importc: "Z3_ast_vector_inc_ref", dynlib: libz3.}
proc Z3_ast_vector_dec_ref*(c: Z3_context,v: Z3_ast_vector) {.importc: "Z3_ast_vector_dec_ref", dynlib: libz3.}
proc Z3_ast_vector_size*(c: Z3_context,v: Z3_ast_vector): cuint {.importc: "Z3_ast_vector_size", dynlib: libz3.}
proc Z3_ast_vector_get*(c: Z3_context,v: Z3_ast_vector,i: cuint): Z3_ast {.importc: "Z3_ast_vector_get", dynlib: libz3.}
proc Z3_ast_vector_set*(c: Z3_context,v: Z3_ast_vector,i: cuint,a: Z3_ast) {.importc: "Z3_ast_vector_set", dynlib: libz3.}
proc Z3_ast_vector_resize*(c: Z3_context,v: Z3_ast_vector,n: cuint) {.importc: "Z3_ast_vector_resize", dynlib: libz3.}
proc Z3_ast_vector_push*(c: Z3_context,v: Z3_ast_vector,a: Z3_ast) {.importc: "Z3_ast_vector_push", dynlib: libz3.}
proc Z3_ast_vector_translate*(s: Z3_context,v: Z3_ast_vector,t: Z3_context): Z3_ast_vector {.importc: "Z3_ast_vector_translate", dynlib: libz3.}
proc Z3_ast_vector_to_string*(c: Z3_context,v: Z3_ast_vector): Z3_string {.importc: "Z3_ast_vector_to_string", dynlib: libz3.}
proc Z3_mk_ast_map*(c: Z3_context): Z3_ast_map {.importc: "Z3_mk_ast_map", dynlib: libz3.}
proc Z3_ast_map_inc_ref*(c: Z3_context,m: Z3_ast_map) {.importc: "Z3_ast_map_inc_ref", dynlib: libz3.}
proc Z3_ast_map_dec_ref*(c: Z3_context,m: Z3_ast_map) {.importc: "Z3_ast_map_dec_ref", dynlib: libz3.}
proc Z3_ast_map_contains*(c: Z3_context,m: Z3_ast_map,k: Z3_ast): Z3_bool {.importc: "Z3_ast_map_contains", dynlib: libz3.}
proc Z3_ast_map_find*(c: Z3_context,m: Z3_ast_map,k: Z3_ast): Z3_ast {.importc: "Z3_ast_map_find", dynlib: libz3.}
proc Z3_ast_map_insert*(c: Z3_context,m: Z3_ast_map,k: Z3_ast,v: Z3_ast) {.importc: "Z3_ast_map_insert", dynlib: libz3.}
proc Z3_ast_map_erase*(c: Z3_context,m: Z3_ast_map,k: Z3_ast) {.importc: "Z3_ast_map_erase", dynlib: libz3.}
proc Z3_ast_map_reset*(c: Z3_context,m: Z3_ast_map) {.importc: "Z3_ast_map_reset", dynlib: libz3.}
proc Z3_ast_map_size*(c: Z3_context,m: Z3_ast_map): cuint {.importc: "Z3_ast_map_size", dynlib: libz3.}
proc Z3_ast_map_keys*(c: Z3_context,m: Z3_ast_map): Z3_ast_vector {.importc: "Z3_ast_map_keys", dynlib: libz3.}
proc Z3_ast_map_to_string*(c: Z3_context,m: Z3_ast_map): Z3_string {.importc: "Z3_ast_map_to_string", dynlib: libz3.}
proc Z3_mk_goal*(c: Z3_context,models: Z3_bool,unsat_cores: Z3_bool,proofs: Z3_bool): Z3_goal {.importc: "Z3_mk_goal", dynlib: libz3.}
proc Z3_goal_inc_ref*(c: Z3_context,g: Z3_goal) {.importc: "Z3_goal_inc_ref", dynlib: libz3.}
proc Z3_goal_dec_ref*(c: Z3_context,g: Z3_goal) {.importc: "Z3_goal_dec_ref", dynlib: libz3.}
proc Z3_goal_precision*(c: Z3_context,g: Z3_goal): Z3_goal_prec {.importc: "Z3_goal_precision", dynlib: libz3.}
proc Z3_goal_assert*(c: Z3_context,g: Z3_goal,a: Z3_ast) {.importc: "Z3_goal_assert", dynlib: libz3.}
proc Z3_goal_inconsistent*(c: Z3_context,g: Z3_goal): Z3_bool {.importc: "Z3_goal_inconsistent", dynlib: libz3.}
proc Z3_goal_depth*(c: Z3_context,g: Z3_goal): cuint {.importc: "Z3_goal_depth", dynlib: libz3.}
proc Z3_goal_reset*(c: Z3_context,g: Z3_goal) {.importc: "Z3_goal_reset", dynlib: libz3.}
proc Z3_goal_size*(c: Z3_context,g: Z3_goal): cuint {.importc: "Z3_goal_size", dynlib: libz3.}
proc Z3_goal_formula*(c: Z3_context,g: Z3_goal,idx: cuint): Z3_ast {.importc: "Z3_goal_formula", dynlib: libz3.}
proc Z3_goal_num_exprs*(c: Z3_context,g: Z3_goal): cuint {.importc: "Z3_goal_num_exprs", dynlib: libz3.}
proc Z3_goal_is_decided_sat*(c: Z3_context,g: Z3_goal): Z3_bool {.importc: "Z3_goal_is_decided_sat", dynlib: libz3.}
proc Z3_goal_is_decided_unsat*(c: Z3_context,g: Z3_goal): Z3_bool {.importc: "Z3_goal_is_decided_unsat", dynlib: libz3.}
proc Z3_goal_translate*(source: Z3_context,g: Z3_goal,target: Z3_context): Z3_goal {.importc: "Z3_goal_translate", dynlib: libz3.}
proc Z3_goal_to_string*(c: Z3_context,g: Z3_goal): Z3_string {.importc: "Z3_goal_to_string", dynlib: libz3.}
proc Z3_mk_tactic*(c: Z3_context,name: Z3_string): Z3_tactic {.importc: "Z3_mk_tactic", dynlib: libz3.}
proc Z3_tactic_inc_ref*(c: Z3_context,t: Z3_tactic) {.importc: "Z3_tactic_inc_ref", dynlib: libz3.}
proc Z3_tactic_dec_ref*(c: Z3_context,g: Z3_tactic) {.importc: "Z3_tactic_dec_ref", dynlib: libz3.}
proc Z3_mk_probe*(c: Z3_context,name: Z3_string): Z3_probe {.importc: "Z3_mk_probe", dynlib: libz3.}
proc Z3_probe_inc_ref*(c: Z3_context,p: Z3_probe) {.importc: "Z3_probe_inc_ref", dynlib: libz3.}
proc Z3_probe_dec_ref*(c: Z3_context,p: Z3_probe) {.importc: "Z3_probe_dec_ref", dynlib: libz3.}
proc Z3_tactic_and_then*(c: Z3_context,t1: Z3_tactic,t2: Z3_tactic): Z3_tactic {.importc: "Z3_tactic_and_then", dynlib: libz3.}
proc Z3_tactic_or_else*(c: Z3_context,t1: Z3_tactic,t2: Z3_tactic): Z3_tactic {.importc: "Z3_tactic_or_else", dynlib: libz3.}
proc Z3_tactic_par_and_then*(c: Z3_context,t1: Z3_tactic,t2: Z3_tactic): Z3_tactic {.importc: "Z3_tactic_par_and_then", dynlib: libz3.}
proc Z3_tactic_try_for*(c: Z3_context,t: Z3_tactic,ms: cuint): Z3_tactic {.importc: "Z3_tactic_try_for", dynlib: libz3.}
proc Z3_tactic_when*(c: Z3_context,p: Z3_probe,t: Z3_tactic): Z3_tactic {.importc: "Z3_tactic_when", dynlib: libz3.}
proc Z3_tactic_cond*(c: Z3_context,p: Z3_probe,t1: Z3_tactic,t2: Z3_tactic): Z3_tactic {.importc: "Z3_tactic_cond", dynlib: libz3.}
proc Z3_tactic_repeat*(c: Z3_context,t: Z3_tactic,max: cuint): Z3_tactic {.importc: "Z3_tactic_repeat", dynlib: libz3.}
proc Z3_tactic_skip*(c: Z3_context): Z3_tactic {.importc: "Z3_tactic_skip", dynlib: libz3.}
proc Z3_tactic_fail*(c: Z3_context): Z3_tactic {.importc: "Z3_tactic_fail", dynlib: libz3.}
proc Z3_tactic_fail_if*(c: Z3_context,p: Z3_probe): Z3_tactic {.importc: "Z3_tactic_fail_if", dynlib: libz3.}
proc Z3_tactic_fail_if_not_decided*(c: Z3_context): Z3_tactic {.importc: "Z3_tactic_fail_if_not_decided", dynlib: libz3.}
proc Z3_tactic_using_params*(c: Z3_context,t: Z3_tactic,p: Z3_params): Z3_tactic {.importc: "Z3_tactic_using_params", dynlib: libz3.}
proc Z3_probe_const*(x: Z3_context,val: cdouble): Z3_probe {.importc: "Z3_probe_const", dynlib: libz3.}
proc Z3_probe_lt*(x: Z3_context,p1: Z3_probe,p2: Z3_probe): Z3_probe {.importc: "Z3_probe_lt", dynlib: libz3.}
proc Z3_probe_gt*(x: Z3_context,p1: Z3_probe,p2: Z3_probe): Z3_probe {.importc: "Z3_probe_gt", dynlib: libz3.}
proc Z3_probe_le*(x: Z3_context,p1: Z3_probe,p2: Z3_probe): Z3_probe {.importc: "Z3_probe_le", dynlib: libz3.}
proc Z3_probe_ge*(x: Z3_context,p1: Z3_probe,p2: Z3_probe): Z3_probe {.importc: "Z3_probe_ge", dynlib: libz3.}
proc Z3_probe_eq*(x: Z3_context,p1: Z3_probe,p2: Z3_probe): Z3_probe {.importc: "Z3_probe_eq", dynlib: libz3.}
proc Z3_probe_and*(x: Z3_context,p1: Z3_probe,p2: Z3_probe): Z3_probe {.importc: "Z3_probe_and", dynlib: libz3.}
proc Z3_probe_or*(x: Z3_context,p1: Z3_probe,p2: Z3_probe): Z3_probe {.importc: "Z3_probe_or", dynlib: libz3.}
proc Z3_probe_not*(x: Z3_context,p: Z3_probe): Z3_probe {.importc: "Z3_probe_not", dynlib: libz3.}
proc Z3_get_num_tactics*(c: Z3_context): cuint {.importc: "Z3_get_num_tactics", dynlib: libz3.}
proc Z3_get_tactic_name*(c: Z3_context,i: cuint): Z3_string {.importc: "Z3_get_tactic_name", dynlib: libz3.}
proc Z3_get_num_probes*(c: Z3_context): cuint {.importc: "Z3_get_num_probes", dynlib: libz3.}
proc Z3_get_probe_name*(c: Z3_context,i: cuint): Z3_string {.importc: "Z3_get_probe_name", dynlib: libz3.}
proc Z3_tactic_get_help*(c: Z3_context,t: Z3_tactic): Z3_string {.importc: "Z3_tactic_get_help", dynlib: libz3.}
proc Z3_tactic_get_param_descrs*(c: Z3_context,t: Z3_tactic): Z3_param_descrs {.importc: "Z3_tactic_get_param_descrs", dynlib: libz3.}
proc Z3_tactic_get_descr*(c: Z3_context,name: Z3_string): Z3_string {.importc: "Z3_tactic_get_descr", dynlib: libz3.}
proc Z3_probe_get_descr*(c: Z3_context,name: Z3_string): Z3_string {.importc: "Z3_probe_get_descr", dynlib: libz3.}
proc Z3_probe_apply*(c: Z3_context,p: Z3_probe,g: Z3_goal): cdouble {.importc: "Z3_probe_apply", dynlib: libz3.}
proc Z3_tactic_apply*(c: Z3_context,t: Z3_tactic,g: Z3_goal): Z3_apply_result {.importc: "Z3_tactic_apply", dynlib: libz3.}
proc Z3_tactic_apply_ex*(c: Z3_context,t: Z3_tactic,g: Z3_goal,p: Z3_params): Z3_apply_result {.importc: "Z3_tactic_apply_ex", dynlib: libz3.}
proc Z3_apply_result_inc_ref*(c: Z3_context,r: Z3_apply_result) {.importc: "Z3_apply_result_inc_ref", dynlib: libz3.}
proc Z3_apply_result_dec_ref*(c: Z3_context,r: Z3_apply_result) {.importc: "Z3_apply_result_dec_ref", dynlib: libz3.}
proc Z3_apply_result_to_string*(c: Z3_context,r: Z3_apply_result): Z3_string {.importc: "Z3_apply_result_to_string", dynlib: libz3.}
proc Z3_apply_result_get_num_subgoals*(c: Z3_context,r: Z3_apply_result): cuint {.importc: "Z3_apply_result_get_num_subgoals", dynlib: libz3.}
proc Z3_apply_result_get_subgoal*(c: Z3_context,r: Z3_apply_result,i: cuint): Z3_goal {.importc: "Z3_apply_result_get_subgoal", dynlib: libz3.}
proc Z3_apply_result_convert_model*(c: Z3_context,r: Z3_apply_result,i: cuint,m: Z3_model): Z3_model {.importc: "Z3_apply_result_convert_model", dynlib: libz3.}
proc Z3_mk_solver*(c: Z3_context): Z3_solver {.importc: "Z3_mk_solver", dynlib: libz3.}
proc Z3_mk_simple_solver*(c: Z3_context): Z3_solver {.importc: "Z3_mk_simple_solver", dynlib: libz3.}
proc Z3_mk_solver_for_logic*(c: Z3_context,logic: Z3_symbol): Z3_solver {.importc: "Z3_mk_solver_for_logic", dynlib: libz3.}
proc Z3_mk_solver_from_tactic*(c: Z3_context,t: Z3_tactic): Z3_solver {.importc: "Z3_mk_solver_from_tactic", dynlib: libz3.}
proc Z3_solver_get_help*(c: Z3_context,s: Z3_solver): Z3_string {.importc: "Z3_solver_get_help", dynlib: libz3.}
proc Z3_solver_get_param_descrs*(c: Z3_context,s: Z3_solver): Z3_param_descrs {.importc: "Z3_solver_get_param_descrs", dynlib: libz3.}
proc Z3_solver_set_params*(c: Z3_context,s: Z3_solver,p: Z3_params) {.importc: "Z3_solver_set_params", dynlib: libz3.}
proc Z3_solver_inc_ref*(c: Z3_context,s: Z3_solver) {.importc: "Z3_solver_inc_ref", dynlib: libz3.}
proc Z3_solver_dec_ref*(c: Z3_context,s: Z3_solver) {.importc: "Z3_solver_dec_ref", dynlib: libz3.}
proc Z3_solver_push*(c: Z3_context,s: Z3_solver) {.importc: "Z3_solver_push", dynlib: libz3.}
proc Z3_solver_pop*(c: Z3_context,s: Z3_solver,n: cuint) {.importc: "Z3_solver_pop", dynlib: libz3.}
proc Z3_solver_reset*(c: Z3_context,s: Z3_solver) {.importc: "Z3_solver_reset", dynlib: libz3.}
proc Z3_solver_get_num_scopes*(c: Z3_context,s: Z3_solver): cuint {.importc: "Z3_solver_get_num_scopes", dynlib: libz3.}
proc Z3_solver_assert*(c: Z3_context,s: Z3_solver,a: Z3_ast) {.importc: "Z3_solver_assert", dynlib: libz3.}
proc Z3_solver_assert_and_track*(c: Z3_context,s: Z3_solver,a: Z3_ast,p: Z3_ast) {.importc: "Z3_solver_assert_and_track", dynlib: libz3.}
proc Z3_solver_get_assertions*(c: Z3_context,s: Z3_solver): Z3_ast_vector {.importc: "Z3_solver_get_assertions", dynlib: libz3.}
proc Z3_solver_check*(c: Z3_context,s: Z3_solver): Z3_lbool {.importc: "Z3_solver_check", dynlib: libz3.}
proc Z3_solver_get_model*(c: Z3_context,s: Z3_solver): Z3_model {.importc: "Z3_solver_get_model", dynlib: libz3.}
proc Z3_solver_get_proof*(c: Z3_context,s: Z3_solver): Z3_ast {.importc: "Z3_solver_get_proof", dynlib: libz3.}
proc Z3_solver_get_unsat_core*(c: Z3_context,s: Z3_solver): Z3_ast_vector {.importc: "Z3_solver_get_unsat_core", dynlib: libz3.}
proc Z3_solver_get_reason_unknown*(c: Z3_context,s: Z3_solver): Z3_string {.importc: "Z3_solver_get_reason_unknown", dynlib: libz3.}
proc Z3_solver_get_statistics*(c: Z3_context,s: Z3_solver): Z3_stats {.importc: "Z3_solver_get_statistics", dynlib: libz3.}
proc Z3_solver_to_string*(c: Z3_context,s: Z3_solver): Z3_string {.importc: "Z3_solver_to_string", dynlib: libz3.}
proc Z3_stats_to_string*(c: Z3_context,s: Z3_stats): Z3_string {.importc: "Z3_stats_to_string", dynlib: libz3.}
proc Z3_stats_inc_ref*(c: Z3_context,s: Z3_stats) {.importc: "Z3_stats_inc_ref", dynlib: libz3.}
proc Z3_stats_dec_ref*(c: Z3_context,s: Z3_stats) {.importc: "Z3_stats_dec_ref", dynlib: libz3.}
proc Z3_stats_size*(c: Z3_context,s: Z3_stats): cuint {.importc: "Z3_stats_size", dynlib: libz3.}
proc Z3_stats_get_key*(c: Z3_context,s: Z3_stats,idx: cuint): Z3_string {.importc: "Z3_stats_get_key", dynlib: libz3.}
proc Z3_stats_is_uint*(c: Z3_context,s: Z3_stats,idx: cuint): Z3_bool {.importc: "Z3_stats_is_uint", dynlib: libz3.}
proc Z3_stats_is_double*(c: Z3_context,s: Z3_stats,idx: cuint): Z3_bool {.importc: "Z3_stats_is_double", dynlib: libz3.}
proc Z3_stats_get_uint_value*(c: Z3_context,s: Z3_stats,idx: cuint): cuint {.importc: "Z3_stats_get_uint_value", dynlib: libz3.}
proc Z3_stats_get_double_value*(c: Z3_context,s: Z3_stats,idx: cuint): cdouble {.importc: "Z3_stats_get_double_value", dynlib: libz3.}
proc Z3_set_logic*(c: Z3_context,logic: Z3_string): Z3_bool {.importc: "Z3_set_logic", dynlib: libz3.}
proc Z3_push*(c: Z3_context) {.importc: "Z3_push", dynlib: libz3.}
proc Z3_pop*(c: Z3_context,num_scopes: cuint) {.importc: "Z3_pop", dynlib: libz3.}
proc Z3_get_num_scopes*(c: Z3_context): cuint {.importc: "Z3_get_num_scopes", dynlib: libz3.}
proc Z3_persist_ast*(c: Z3_context,a: Z3_ast,num_scopes: cuint) {.importc: "Z3_persist_ast", dynlib: libz3.}
proc Z3_assert_cnstr*(c: Z3_context,a: Z3_ast) {.importc: "Z3_assert_cnstr", dynlib: libz3.}
proc Z3_check_and_get_model*(c: Z3_context,m: ptr Z3_model): Z3_lbool {.importc: "Z3_check_and_get_model", dynlib: libz3.}
proc Z3_check*(c: Z3_context): Z3_lbool {.importc: "Z3_check", dynlib: libz3.}
proc Z3_del_model*(c: Z3_context,m: Z3_model) {.importc: "Z3_del_model", dynlib: libz3.}
proc Z3_soft_check_cancel*(c: Z3_context) {.importc: "Z3_soft_check_cancel", dynlib: libz3.}
proc Z3_get_search_failure*(c: Z3_context): Z3_search_failure {.importc: "Z3_get_search_failure", dynlib: libz3.}
proc Z3_mk_label*(c: Z3_context,s: Z3_symbol,is_pos: Z3_bool,f: Z3_ast): Z3_ast {.importc: "Z3_mk_label", dynlib: libz3.}
proc Z3_get_relevant_labels*(c: Z3_context): Z3_literals {.importc: "Z3_get_relevant_labels", dynlib: libz3.}
proc Z3_get_relevant_literals*(c: Z3_context): Z3_literals {.importc: "Z3_get_relevant_literals", dynlib: libz3.}
proc Z3_get_guessed_literals*(c: Z3_context): Z3_literals {.importc: "Z3_get_guessed_literals", dynlib: libz3.}
proc Z3_del_literals*(c: Z3_context,lbls: Z3_literals) {.importc: "Z3_del_literals", dynlib: libz3.}
proc Z3_get_num_literals*(c: Z3_context,lbls: Z3_literals): cuint {.importc: "Z3_get_num_literals", dynlib: libz3.}
proc Z3_get_label_symbol*(c: Z3_context,lbls: Z3_literals,idx: cuint): Z3_symbol {.importc: "Z3_get_label_symbol", dynlib: libz3.}
proc Z3_get_literal*(c: Z3_context,lbls: Z3_literals,idx: cuint): Z3_ast {.importc: "Z3_get_literal", dynlib: libz3.}
proc Z3_disable_literal*(c: Z3_context,lbls: Z3_literals,idx: cuint) {.importc: "Z3_disable_literal", dynlib: libz3.}
proc Z3_block_literals*(c: Z3_context,lbls: Z3_literals) {.importc: "Z3_block_literals", dynlib: libz3.}
proc Z3_get_model_num_constants*(c: Z3_context,m: Z3_model): cuint {.importc: "Z3_get_model_num_constants", dynlib: libz3.}
proc Z3_get_model_constant*(c: Z3_context,m: Z3_model,i: cuint): Z3_func_decl {.importc: "Z3_get_model_constant", dynlib: libz3.}
proc Z3_get_model_num_funcs*(c: Z3_context,m: Z3_model): cuint {.importc: "Z3_get_model_num_funcs", dynlib: libz3.}
proc Z3_get_model_func_decl*(c: Z3_context,m: Z3_model,i: cuint): Z3_func_decl {.importc: "Z3_get_model_func_decl", dynlib: libz3.}
proc Z3_eval_func_decl*(c: Z3_context,m: Z3_model,decl: Z3_func_decl,v: ptr Z3_ast): Z3_bool {.importc: "Z3_eval_func_decl", dynlib: libz3.}
proc Z3_is_array_value*(c: Z3_context,m: Z3_model,v: Z3_ast,num_entries: ptr cuint): Z3_bool {.importc: "Z3_is_array_value", dynlib: libz3.}
proc Z3_get_model_func_else*(c: Z3_context,m: Z3_model,i: cuint): Z3_ast {.importc: "Z3_get_model_func_else", dynlib: libz3.}
proc Z3_get_model_func_num_entries*(c: Z3_context,m: Z3_model,i: cuint): cuint {.importc: "Z3_get_model_func_num_entries", dynlib: libz3.}
proc Z3_get_model_func_entry_num_args*(c: Z3_context,m: Z3_model,i: cuint,j: cuint): cuint {.importc: "Z3_get_model_func_entry_num_args", dynlib: libz3.}
proc Z3_get_model_func_entry_arg*(c: Z3_context,m: Z3_model,i: cuint,j: cuint,k: cuint): Z3_ast {.importc: "Z3_get_model_func_entry_arg", dynlib: libz3.}
proc Z3_get_model_func_entry_value*(c: Z3_context,m: Z3_model,i: cuint,j: cuint): Z3_ast {.importc: "Z3_get_model_func_entry_value", dynlib: libz3.}
proc Z3_eval*(c: Z3_context,m: Z3_model,t: Z3_ast,v: ptr Z3_ast): Z3_bool {.importc: "Z3_eval", dynlib: libz3.}
proc Z3_context_to_string*(c: Z3_context): Z3_string {.importc: "Z3_context_to_string", dynlib: libz3.}
proc Z3_statistics_to_string*(c: Z3_context): Z3_string {.importc: "Z3_statistics_to_string", dynlib: libz3.}
proc Z3_get_context_assignment*(c: Z3_context): Z3_ast {.importc: "Z3_get_context_assignment", dynlib: libz3.}
proc Z3_algebraic_is_value*(c: Z3_context,a: Z3_ast): Z3_bool {.importc: "Z3_algebraic_is_value", dynlib: libz3.}
proc Z3_algebraic_is_pos*(c: Z3_context,a: Z3_ast): Z3_bool {.importc: "Z3_algebraic_is_pos", dynlib: libz3.}
proc Z3_algebraic_is_neg*(c: Z3_context,a: Z3_ast): Z3_bool {.importc: "Z3_algebraic_is_neg", dynlib: libz3.}
proc Z3_algebraic_is_zero*(c: Z3_context,a: Z3_ast): Z3_bool {.importc: "Z3_algebraic_is_zero", dynlib: libz3.}
proc Z3_algebraic_sign*(c: Z3_context,a: Z3_ast): cint {.importc: "Z3_algebraic_sign", dynlib: libz3.}
proc Z3_algebraic_add*(c: Z3_context,a: Z3_ast,b: Z3_ast): Z3_ast {.importc: "Z3_algebraic_add", dynlib: libz3.}
proc Z3_algebraic_sub*(c: Z3_context,a: Z3_ast,b: Z3_ast): Z3_ast {.importc: "Z3_algebraic_sub", dynlib: libz3.}
proc Z3_algebraic_mul*(c: Z3_context,a: Z3_ast,b: Z3_ast): Z3_ast {.importc: "Z3_algebraic_mul", dynlib: libz3.}
proc Z3_algebraic_div*(c: Z3_context,a: Z3_ast,b: Z3_ast): Z3_ast {.importc: "Z3_algebraic_div", dynlib: libz3.}
proc Z3_algebraic_root*(c: Z3_context,a: Z3_ast,k: cuint): Z3_ast {.importc: "Z3_algebraic_root", dynlib: libz3.}
proc Z3_algebraic_power*(c: Z3_context,a: Z3_ast,k: cuint): Z3_ast {.importc: "Z3_algebraic_power", dynlib: libz3.}
proc Z3_algebraic_lt*(c: Z3_context,a: Z3_ast,b: Z3_ast): Z3_bool {.importc: "Z3_algebraic_lt", dynlib: libz3.}
proc Z3_algebraic_gt*(c: Z3_context,a: Z3_ast,b: Z3_ast): Z3_bool {.importc: "Z3_algebraic_gt", dynlib: libz3.}
proc Z3_algebraic_le*(c: Z3_context,a: Z3_ast,b: Z3_ast): Z3_bool {.importc: "Z3_algebraic_le", dynlib: libz3.}
proc Z3_algebraic_ge*(c: Z3_context,a: Z3_ast,b: Z3_ast): Z3_bool {.importc: "Z3_algebraic_ge", dynlib: libz3.}
proc Z3_algebraic_eq*(c: Z3_context,a: Z3_ast,b: Z3_ast): Z3_bool {.importc: "Z3_algebraic_eq", dynlib: libz3.}
proc Z3_algebraic_neq*(c: Z3_context,a: Z3_ast,b: Z3_ast): Z3_bool {.importc: "Z3_algebraic_neq", dynlib: libz3.}
proc Z3_polynomial_subresultants*(c: Z3_context,p: Z3_ast,q: Z3_ast,x: Z3_ast): Z3_ast_vector {.importc: "Z3_polynomial_subresultants", dynlib: libz3.}
proc Z3_rcf_del*(c: Z3_context,a: Z3_rcf_num) {.importc: "Z3_rcf_del", dynlib: libz3.}
proc Z3_rcf_mk_rational*(c: Z3_context,val: Z3_string): Z3_rcf_num {.importc: "Z3_rcf_mk_rational", dynlib: libz3.}
proc Z3_rcf_mk_small_int*(c: Z3_context,val: cint): Z3_rcf_num {.importc: "Z3_rcf_mk_small_int", dynlib: libz3.}
proc Z3_rcf_mk_pi*(c: Z3_context): Z3_rcf_num {.importc: "Z3_rcf_mk_pi", dynlib: libz3.}
proc Z3_rcf_mk_e*(c: Z3_context): Z3_rcf_num {.importc: "Z3_rcf_mk_e", dynlib: libz3.}
proc Z3_rcf_mk_infinitesimal*(c: Z3_context): Z3_rcf_num {.importc: "Z3_rcf_mk_infinitesimal", dynlib: libz3.}
proc Z3_rcf_add*(c: Z3_context,a: Z3_rcf_num,b: Z3_rcf_num): Z3_rcf_num {.importc: "Z3_rcf_add", dynlib: libz3.}
proc Z3_rcf_sub*(c: Z3_context,a: Z3_rcf_num,b: Z3_rcf_num): Z3_rcf_num {.importc: "Z3_rcf_sub", dynlib: libz3.}
proc Z3_rcf_mul*(c: Z3_context,a: Z3_rcf_num,b: Z3_rcf_num): Z3_rcf_num {.importc: "Z3_rcf_mul", dynlib: libz3.}
proc Z3_rcf_div*(c: Z3_context,a: Z3_rcf_num,b: Z3_rcf_num): Z3_rcf_num {.importc: "Z3_rcf_div", dynlib: libz3.}
proc Z3_rcf_neg*(c: Z3_context,a: Z3_rcf_num): Z3_rcf_num {.importc: "Z3_rcf_neg", dynlib: libz3.}
proc Z3_rcf_inv*(c: Z3_context,a: Z3_rcf_num): Z3_rcf_num {.importc: "Z3_rcf_inv", dynlib: libz3.}
proc Z3_rcf_power*(c: Z3_context,a: Z3_rcf_num,k: cuint): Z3_rcf_num {.importc: "Z3_rcf_power", dynlib: libz3.}
proc Z3_rcf_lt*(c: Z3_context,a: Z3_rcf_num,b: Z3_rcf_num): Z3_bool {.importc: "Z3_rcf_lt", dynlib: libz3.}
proc Z3_rcf_gt*(c: Z3_context,a: Z3_rcf_num,b: Z3_rcf_num): Z3_bool {.importc: "Z3_rcf_gt", dynlib: libz3.}
proc Z3_rcf_le*(c: Z3_context,a: Z3_rcf_num,b: Z3_rcf_num): Z3_bool {.importc: "Z3_rcf_le", dynlib: libz3.}
proc Z3_rcf_ge*(c: Z3_context,a: Z3_rcf_num,b: Z3_rcf_num): Z3_bool {.importc: "Z3_rcf_ge", dynlib: libz3.}
proc Z3_rcf_eq*(c: Z3_context,a: Z3_rcf_num,b: Z3_rcf_num): Z3_bool {.importc: "Z3_rcf_eq", dynlib: libz3.}
proc Z3_rcf_neq*(c: Z3_context,a: Z3_rcf_num,b: Z3_rcf_num): Z3_bool {.importc: "Z3_rcf_neq", dynlib: libz3.}
proc Z3_rcf_num_to_string*(c: Z3_context,a: Z3_rcf_num,compact: Z3_bool,html: Z3_bool): Z3_string {.importc: "Z3_rcf_num_to_string", dynlib: libz3.}
proc Z3_rcf_num_to_decimal_string*(c: Z3_context,a: Z3_rcf_num,prec: cuint): Z3_string {.importc: "Z3_rcf_num_to_decimal_string", dynlib: libz3.}
proc Z3_rcf_get_numerator_denominator*(c: Z3_context,a: Z3_rcf_num,n: ptr Z3_rcf_num,d: ptr Z3_rcf_num) {.importc: "Z3_rcf_get_numerator_denominator", dynlib: libz3.}
proc Z3_mk_interpolant*(c: Z3_context,a: Z3_ast): Z3_ast {.importc: "Z3_mk_interpolant", dynlib: libz3.}
proc Z3_mk_interpolation_context*(cfg: Z3_config): Z3_context {.importc: "Z3_mk_interpolation_context", dynlib: libz3.}
proc Z3_get_interpolant*(c: Z3_context,pf: Z3_ast,pat: Z3_ast,p: Z3_params): Z3_ast_vector {.importc: "Z3_get_interpolant", dynlib: libz3.}
proc Z3_compute_interpolant*(c: Z3_context,pat: Z3_ast,p: Z3_params,interp: ptr Z3_ast_vector,model: ptr Z3_model): Z3_lbool {.importc: "Z3_compute_interpolant", dynlib: libz3.}
proc Z3_interpolation_profile*(ctx: Z3_context): Z3_string {.importc: "Z3_interpolation_profile", dynlib: libz3.}
proc Z3_mk_fpa_rounding_mode_sort*(c: Z3_context): Z3_sort {.importc: "Z3_mk_fpa_rounding_mode_sort", dynlib: libz3.}
proc Z3_mk_fpa_round_nearest_ties_to_even*(c: Z3_context): Z3_ast {.importc: "Z3_mk_fpa_round_nearest_ties_to_even", dynlib: libz3.}
proc Z3_mk_fpa_rne*(c: Z3_context): Z3_ast {.importc: "Z3_mk_fpa_rne", dynlib: libz3.}
proc Z3_mk_fpa_round_nearest_ties_to_away*(c: Z3_context): Z3_ast {.importc: "Z3_mk_fpa_round_nearest_ties_to_away", dynlib: libz3.}
proc Z3_mk_fpa_rna*(c: Z3_context): Z3_ast {.importc: "Z3_mk_fpa_rna", dynlib: libz3.}
proc Z3_mk_fpa_round_toward_positive*(c: Z3_context): Z3_ast {.importc: "Z3_mk_fpa_round_toward_positive", dynlib: libz3.}
proc Z3_mk_fpa_rtp*(c: Z3_context): Z3_ast {.importc: "Z3_mk_fpa_rtp", dynlib: libz3.}
proc Z3_mk_fpa_round_toward_negative*(c: Z3_context): Z3_ast {.importc: "Z3_mk_fpa_round_toward_negative", dynlib: libz3.}
proc Z3_mk_fpa_rtn*(c: Z3_context): Z3_ast {.importc: "Z3_mk_fpa_rtn", dynlib: libz3.}
proc Z3_mk_fpa_round_toward_zero*(c: Z3_context): Z3_ast {.importc: "Z3_mk_fpa_round_toward_zero", dynlib: libz3.}
proc Z3_mk_fpa_rtz*(c: Z3_context): Z3_ast {.importc: "Z3_mk_fpa_rtz", dynlib: libz3.}
proc Z3_mk_fpa_sort*(c: Z3_context,ebits: cuint,sbits: cuint): Z3_sort {.importc: "Z3_mk_fpa_sort", dynlib: libz3.}
proc Z3_mk_fpa_sort_half*(c: Z3_context): Z3_sort {.importc: "Z3_mk_fpa_sort_half", dynlib: libz3.}
proc Z3_mk_fpa_sort_16*(c: Z3_context): Z3_sort {.importc: "Z3_mk_fpa_sort_16", dynlib: libz3.}
proc Z3_mk_fpa_sort_single*(c: Z3_context): Z3_sort {.importc: "Z3_mk_fpa_sort_single", dynlib: libz3.}
proc Z3_mk_fpa_sort_32*(c: Z3_context): Z3_sort {.importc: "Z3_mk_fpa_sort_32", dynlib: libz3.}
proc Z3_mk_fpa_sort_double*(c: Z3_context): Z3_sort {.importc: "Z3_mk_fpa_sort_double", dynlib: libz3.}
proc Z3_mk_fpa_sort_64*(c: Z3_context): Z3_sort {.importc: "Z3_mk_fpa_sort_64", dynlib: libz3.}
proc Z3_mk_fpa_sort_quadruple*(c: Z3_context): Z3_sort {.importc: "Z3_mk_fpa_sort_quadruple", dynlib: libz3.}
proc Z3_mk_fpa_sort_128*(c: Z3_context): Z3_sort {.importc: "Z3_mk_fpa_sort_128", dynlib: libz3.}
proc Z3_mk_fpa_nan*(c: Z3_context,s: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_nan", dynlib: libz3.}
proc Z3_mk_fpa_inf*(c: Z3_context,s: Z3_sort,negative: Z3_bool): Z3_ast {.importc: "Z3_mk_fpa_inf", dynlib: libz3.}
proc Z3_mk_fpa_zero*(c: Z3_context,s: Z3_sort,negative: Z3_bool): Z3_ast {.importc: "Z3_mk_fpa_zero", dynlib: libz3.}
proc Z3_mk_fpa_fp*(c: Z3_context,sgn: Z3_ast,exp: Z3_ast,sig: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_fp", dynlib: libz3.}
proc Z3_mk_fpa_numeral_float*(c: Z3_context,v: cfloat,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_numeral_float", dynlib: libz3.}
proc Z3_mk_fpa_numeral_double*(c: Z3_context,v: cdouble,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_numeral_double", dynlib: libz3.}
proc Z3_mk_fpa_numeral_int*(c: Z3_context,v: cint,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_numeral_int", dynlib: libz3.}
proc Z3_mk_fpa_numeral_int_uint*(c: Z3_context,sgn: Z3_bool,exp: cint,sig: cuint,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_numeral_int_uint", dynlib: libz3.}
proc Z3_mk_fpa_numeral_int64_uint64*(c: Z3_context,sgn: Z3_bool,exp: clonglong,sig: culonglong,ty: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_numeral_int64_uint64", dynlib: libz3.}
proc Z3_mk_fpa_abs*(c: Z3_context,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_abs", dynlib: libz3.}
proc Z3_mk_fpa_neg*(c: Z3_context,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_neg", dynlib: libz3.}
proc Z3_mk_fpa_add*(c: Z3_context,rm: Z3_ast,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_add", dynlib: libz3.}
proc Z3_mk_fpa_sub*(c: Z3_context,rm: Z3_ast,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_sub", dynlib: libz3.}
proc Z3_mk_fpa_mul*(c: Z3_context,rm: Z3_ast,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_mul", dynlib: libz3.}
proc Z3_mk_fpa_div*(c: Z3_context,rm: Z3_ast,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_div", dynlib: libz3.}
proc Z3_mk_fpa_fma*(c: Z3_context,rm: Z3_ast,t1: Z3_ast,t2: Z3_ast,t3: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_fma", dynlib: libz3.}
proc Z3_mk_fpa_sqrt*(c: Z3_context,rm: Z3_ast,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_sqrt", dynlib: libz3.}
proc Z3_mk_fpa_rem*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_rem", dynlib: libz3.}
proc Z3_mk_fpa_round_to_integral*(c: Z3_context,rm: Z3_ast,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_round_to_integral", dynlib: libz3.}
proc Z3_mk_fpa_min*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_min", dynlib: libz3.}
proc Z3_mk_fpa_max*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_max", dynlib: libz3.}
proc Z3_mk_fpa_leq*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_leq", dynlib: libz3.}
proc Z3_mk_fpa_lt*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_lt", dynlib: libz3.}
proc Z3_mk_fpa_geq*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_geq", dynlib: libz3.}
proc Z3_mk_fpa_gt*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_gt", dynlib: libz3.}
proc Z3_mk_fpa_eq*(c: Z3_context,t1: Z3_ast,t2: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_eq", dynlib: libz3.}
proc Z3_mk_fpa_is_normal*(c: Z3_context,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_is_normal", dynlib: libz3.}
proc Z3_mk_fpa_is_subnormal*(c: Z3_context,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_is_subnormal", dynlib: libz3.}
proc Z3_mk_fpa_is_zero*(c: Z3_context,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_is_zero", dynlib: libz3.}
proc Z3_mk_fpa_is_infinite*(c: Z3_context,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_is_infinite", dynlib: libz3.}
proc Z3_mk_fpa_is_nan*(c: Z3_context,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_is_nan", dynlib: libz3.}
proc Z3_mk_fpa_is_negative*(c: Z3_context,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_is_negative", dynlib: libz3.}
proc Z3_mk_fpa_is_positive*(c: Z3_context,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_is_positive", dynlib: libz3.}
proc Z3_mk_fpa_to_fp_bv*(c: Z3_context,bv: Z3_ast,s: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_to_fp_bv", dynlib: libz3.}
proc Z3_mk_fpa_to_fp_float*(c: Z3_context,rm: Z3_ast,t: Z3_ast,s: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_to_fp_float", dynlib: libz3.}
proc Z3_mk_fpa_to_fp_real*(c: Z3_context,rm: Z3_ast,t: Z3_ast,s: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_to_fp_real", dynlib: libz3.}
proc Z3_mk_fpa_to_fp_signed*(c: Z3_context,rm: Z3_ast,t: Z3_ast,s: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_to_fp_signed", dynlib: libz3.}
proc Z3_mk_fpa_to_fp_unsigned*(c: Z3_context,rm: Z3_ast,t: Z3_ast,s: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_to_fp_unsigned", dynlib: libz3.}
proc Z3_mk_fpa_to_ubv*(c: Z3_context,rm: Z3_ast,t: Z3_ast,sz: cuint): Z3_ast {.importc: "Z3_mk_fpa_to_ubv", dynlib: libz3.}
proc Z3_mk_fpa_to_sbv*(c: Z3_context,rm: Z3_ast,t: Z3_ast,sz: cuint): Z3_ast {.importc: "Z3_mk_fpa_to_sbv", dynlib: libz3.}
proc Z3_mk_fpa_to_real*(c: Z3_context,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_to_real", dynlib: libz3.}
proc Z3_fpa_get_ebits*(c: Z3_context,s: Z3_sort): cuint {.importc: "Z3_fpa_get_ebits", dynlib: libz3.}
proc Z3_fpa_get_sbits*(c: Z3_context,s: Z3_sort): cuint {.importc: "Z3_fpa_get_sbits", dynlib: libz3.}
proc Z3_fpa_get_numeral_sign*(c: Z3_context,t: Z3_ast,sgn: ptr cint): Z3_bool {.importc: "Z3_fpa_get_numeral_sign", dynlib: libz3.}
proc Z3_fpa_get_numeral_significand_string*(c: Z3_context,t: Z3_ast): Z3_string {.importc: "Z3_fpa_get_numeral_significand_string", dynlib: libz3.}
proc Z3_fpa_get_numeral_significand_uint64*(c: Z3_context,t: Z3_ast,n: ptr culonglong): Z3_bool {.importc: "Z3_fpa_get_numeral_significand_uint64", dynlib: libz3.}
proc Z3_fpa_get_numeral_exponent_string*(c: Z3_context,t: Z3_ast): Z3_string {.importc: "Z3_fpa_get_numeral_exponent_string", dynlib: libz3.}
proc Z3_fpa_get_numeral_exponent_int64*(c: Z3_context,t: Z3_ast,n: ptr clonglong): Z3_bool {.importc: "Z3_fpa_get_numeral_exponent_int64", dynlib: libz3.}
proc Z3_mk_fpa_to_ieee_bv*(c: Z3_context,t: Z3_ast): Z3_ast {.importc: "Z3_mk_fpa_to_ieee_bv", dynlib: libz3.}
proc Z3_mk_fpa_to_fp_int_real*(c: Z3_context,rm: Z3_ast,exp: Z3_ast,sig: Z3_ast,s: Z3_sort): Z3_ast {.importc: "Z3_mk_fpa_to_fp_int_real", dynlib: libz3.}

