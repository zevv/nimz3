
import z3/z3_api

export Z3_ast

# Global Z3 context, needed for the converters

var g_ctx: Z3_context


# Helpers

proc vararg_helper[T](ctx: Z3_context, fn: T, vs: varargs[Z3_ast]): Z3_ast =
  fn(ctx, vs.len.cuint, unsafeAddr(vs[0]))

template mk_var(name: string, ty: Z3_sort): Z3_ast =
  let sym = Z3_mk_string_symbol(ctx, name)
  Z3_mk_const(ctx, sym, ty)

# Z3 type constructors

template Int*(v: int): Z3_ast = Z3_mk_int(ctx, v, Z3_mk_int_sort(ctx))
template UInt*(v: int): Z3_ast = Z3_mk_int(ctx, v, Z3_mk_int_sort(ctx))
template Float*(v: float): Z3_ast = Z3_mk_fpa_numeral_double(ctx, v, Z3_mk_fpa_sort(ctx, 11, 53))
template Bool*(name: string): Z3_ast = mk_var(name, Z3_mk_bool_sort(ctx))
template Int*(name: string): Z3_ast = mk_var(name, Z3_mk_int_sort(ctx))
template Float*(name: string): Z3_ast = mkvar(name, Z3_mk_fpa_sort_double(ctx))


# Z3 type converters. These rely on an implicit global state, I have no clue
# how to avoid this

converter bool_to_z3*(v: bool): Z3_ast =
  if v: Z3_mk_true(g_ctx) else: Z3_mk_false(g_ctx)
    
converter int_to_z3*(v: int): Z3_ast =
  Z3_mk_int(g_ctx, v.cint,  Z3_mk_int_sort(g_ctx))

converter float_to_z3*(v: float): Z3_ast =
  Z3_mk_fpa_numeral_double(g_ctx, v.cdouble, Z3_mk_fpa_sort(g_ctx, 11, 53))


# Stringifications

template `$`*(v: Z3_ast): string =
  $Z3_ast_to_string(ctx, v)

template `$`*(m: Z3_model): string =
  $Z3_model_to_string(ctx, m)

template `$`*(m: Z3_solver): string =
  $Z3_solver_to_string(ctx, m)

# Basic operations

template `>`*(v1, v2: Z3_ast): Z3_ast = Z3_mk_gt(ctx, v1, v2)
template `>=`*(v1, v2: Z3_ast): Z3_ast = Z3_mk_ge(ctx, v1, v2)
template `<`*(v1, v2: Z3_ast): Z3_ast = Z3_mk_lt(ctx, v1, v2)
template `<=`*(v1, v2: Z3_ast): Z3_ast = Z3_mk_le(ctx, v1, v2)
template `and`*(vs: varargs[Z3_ast]): Z3_ast = vararg_helper(ctx, Z3_mk_and, vs)
template `or`*(vs: varargs[Z3_ast]): Z3_ast = vararg_helper(ctx, Z3_mk_or, vs)
template `+`*(vs: varargs[Z3_ast]):Z3_ast = vararg_helper(ctx, Z3_mk_add, vs)
template `-`*(vs: varargs[Z3_ast]): Z3_ast = vararg_helper(ctx, Z3_mk_sub, vs)
template `*`*(vs: varargs[Z3_ast]): Z3_ast = vararg_helper(ctx, Z3_mk_mul, vs)
template `<->`*(v1, v2: Z3_ast): Z3_ast = Z3_mk_iff(ctx, v1, v2)
template `==`*(v1, v2: Z3_ast): Z3_ast = Z3_mk_eq(ctx, v1, v2)
template `not`*(v: Z3_ast): Z3_ast = Z3_mk_not(ctx, v)
template `/`*(v1, v2: Z3_ast): Z3_ast = Z3_mk_div(ctx, v1, v2)
template `mod`*(v1, v2: Z3_ast): Z3_ast = Z3_mk_mod(ctx, v1, v2)
template distinc*(vs: varargs[Z3_ast]): Z3_ast = vararg_helper(ctx, Z3_mk_distinct, vs)


# Misc

template simplify*(s: Z3_ast): Z3_ast =
  Z3_simplify(ctx, s)


# Solver

template Solver*(): Z3_solver = Z3_mk_solver(ctx)

template assert*(s: Z3_solver, e: Z3_ast) =
  Z3_solver_assert(ctx, s, e)

template check*(s: Z3_solver): Z3_lbool =
  Z3_solver_check(ctx, s)

template get_model*(s: Z3_Solver): Z3_model =
  Z3_solver_get_model(ctx, s)

template push*(s: Z3_Solver, code: untyped) =
  Z3_solver_push(ctx, s)
  block:
    code
  Z3_solver_pop(ctx, s, 1)

template check_model*(s: Z3_solver, code: untyped) =
  if Z3_solver_check(ctx, s) == Z3_L_TRUE:
    let model {.inject.} = Z3_solver_get_model(ctx, s)
    code


# Optimizer

template Optimizer*(): Z3_optimize = Z3_mk_optimize(ctx)

template minimize*(o: Z3_optimize, e: Z3_ast) =
  echo Z3_optimize_minimize(ctx, o, e)

template maximize*(o: Z3_optimize, e: Z3_ast) =
  echo Z3_optimize_maximize(ctx, o, e)

template assert*(o: Z3_optimize, e: Z3_ast) =
  Z3_optimize_assert(ctx, o, e)


template eval*(v: Z3_ast): string =
  var r: Z3_ast
  if Z3_eval(ctx, model, v, addr r):
    $r
  else:
    ""

template check_and_get_model*(code: untyped) =
  var model {.inject.}: Z3_model
  if Z3_check_and_get_model(ctx, addr model) == Z3_L_TRUE:
    let mstr = $Z3_model_to_string(ctx, model)
    code
    Z3_del_model(ctx, model)
  else:
    echo "unsat"

proc on_err(ctx: Z3_context,e: Z3_error_code) {.nimcall.} =
  raise newException(IOError, $Z3_get_error_msg(e))


template z3*(code: untyped) =

  block:
  
    let cfg = Z3_mk_config()
    Z3_set_param_value(cfg, "model", "true");
    let ctx {.inject.} = Z3_mk_context(cfg)
    Z3_del_config(cfg)
    Z3_set_error_handler(ctx, on_err)
    g_ctx = ctx

    block:
      code

    g_ctx = nil


# vim: ft=nim

