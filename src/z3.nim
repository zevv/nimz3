
import z3/z3_api

export Z3_ast


type
  Z3Exception* = object of Exception


# Z3 type constructors

template mk_var(name: string, ty: Z3_sort): Z3_ast =
  let sym = Z3_mk_string_symbol(ctx, name)
  Z3_mk_const(ctx, sym, ty)

template Bool*(name: string): Z3_ast = mk_var(name, Z3_mk_bool_sort(ctx))
template Int*(name: string): Z3_ast = mk_var(name, Z3_mk_int_sort(ctx))
template Float*(name: string): Z3_ast = mkvar(name, Z3_mk_fpa_sort_double(ctx))


# Nim -> Z3 type converters

proc to_z3*(ctx: Z3_context, v: bool): Z3_ast =
  if v: Z3_mk_true(ctx) else: Z3_mk_false(ctx)
    
proc to_z3*(ctx: Z3_context, v: int): Z3_ast =
  Z3_mk_int(ctx, v.cint,  Z3_mk_int_sort(ctx))

proc to_z3*(ctx: Z3_context, v: float): Z3_ast =
  Z3_mk_fpa_numeral_double(ctx, v.cdouble, Z3_mk_fpa_sort(ctx, 11, 53))


# Stringifications

template `$`*(v: Z3_ast): string =
  $Z3_ast_to_string(ctx, v)

template `$`*(m: Z3_model): string =
  $Z3_model_to_string(ctx, m)

template `$`*(m: Z3_solver): string =
  $Z3_solver_to_string(ctx, m)


# Helper templates to generate multiple operators accepting (Z3_ast, Z3_ast),
# (T, Z3_ast) or (Z3_ast, T). This allows for easy mixing with native Nim types

proc vararg_helper[T](ctx: Z3_context, fn: T, vs: varargs[Z3_ast]): Z3_ast =
  fn(ctx, vs.len.cuint, unsafeAddr(vs[0]))

template unop[T](name: untyped, fn: untyped) =
  # Uni operation
  template name*(v: Z3_ast): Z3_ast = fn(ctx, v)
  #template name*(v: T): Z3_ast = fn(ctx, to_z3(ctx, v))

template binop[T](name: untyped, fn: untyped) =
  # Binary operation
  template name*(v1: Z3_ast, v2: Z3_ast): Z3_ast = fn(ctx, v1, v2)
  template name*(v1: Z3_ast, v2: T): Z3_ast = fn(ctx, v1, to_z3(ctx, v2))
  template name*(v1: T, v2: Z3_ast): Z3_ast = fn(ctx, to_z3(ctx, v1), v2)

template binop_rm[T](name: untyped, fn: untyped) =
  # Binary operation with rounding mode
  template name*(v1: Z3_ast, v2: Z3_ast): Z3_ast = fn(ctx, fpa_rm, v1, v2)
  template name*(v1: Z3_ast, v2: T): Z3_ast = fn(ctx, fpa_rm,v1, to_z3(ctx, v2))
  template name*(v1: T, v2: Z3_ast): Z3_ast = fn(ctx, fpa_rm, to_z3(ctx, v1), v2)

template varop[T](name: untyped, fn: untyped) =
  # Varargs operation, reduced to binary operation
  template name*(v1: Z3_ast, v2: Z3_ast): Z3_ast = vararg_helper(ctx, fn, v1, v2)
  template name*(v1: Z3_ast, v2: T): Z3_ast = vararg_helper(ctx, fn, v1, to_z3(ctx, v2))
  template name*(v1: T, v2: Z3_ast): Z3_ast = vararg_helper(ctx, fn, to_z3(ctx, v1), v2)


# Boolean operations

unop[bool](`not`, Z3_mk_not)
binop[bool](`==`, Z3_mk_eq)
varop[bool](`or`, Z3_mk_or)
varop[bool](`and`, Z3_mk_and)
binop[bool](`xor`, Z3_mk_xor)

# Integer operations

unop[int](`-`, Z3_mk_unary_minus)
binop[int](`<`, Z3_mk_lt)
binop[int](`<=`, Z3_mk_le)
binop[int](`/`, Z3_mk_div)
binop[int](`mod`, Z3_mk_mod)
binop[int](`==`, Z3_mk_eq)
binop[int](`<->`, Z3_mk_iff)
varop[int](`+`, Z3_mk_add)
varop[int](`-`, Z3_mk_sub)
varop[int](`*`, Z3_mk_mul)
varop[int](`and`, Z3_mk_and)
varop[int](`or`, Z3_mk_or)

# Floating point operations (experimental)

binop[float](`<`, Z3_mk_fpa_lt)
binop[float](`<=`, Z3_mk_fpa_le)
binop[float](`==`, Z3_mk_fpa_eq)
binop[float](max, Z3_mk_fpa_max)
binop[float](min, Z3_mk_fpa_min)
binop_rm[float](`*`, Z3_mk_fpa_mul)
binop_rm[float](`/`, Z3_mk_fpa_div)
binop_rm[float](`+`, Z3_mk_fpa_add)
binop_rm[float](`-`, Z3_mk_fpa_sub)

# Generic operations

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
  else:
    raise newException(Z3Exception, "UNSAT")


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

proc on_err(ctx: Z3_context, e: Z3_error_code) {.nimcall.} =
  let msg = $Z3_get_error_msg_ex(ctx, e)
  echo "ERROR: ", msg
  raise newException(Z3Exception, msg)


template z3*(code: untyped) =

  block:
  
    let cfg = Z3_mk_config()
    Z3_set_param_value(cfg, "model", "true");
    let ctx {.inject.} = Z3_mk_context(cfg)
    Z3_del_config(cfg)
    Z3_set_error_handler(ctx, on_err)
    let fpa_rm {.inject.} = Z3_mk_fpa_round_nearest_ties_to_even(ctx)

    block:
      code


# vim: ft=nim

