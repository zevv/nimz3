
# Nim Z3

> "_Z3 is a cat with a funny hat_"
> -TheLemonMan

NimZ3 is an early stage Nim binding for the [Z3 theorem prover](https://github.com/Z3Prover/z3)


## Documentation

* [Module documentation](http://htmlpreview.github.io/?https://github.com/zevv/nimz3/blob/master/src/z3.html)
* [Examples](https://github.com/zevv/nimz3/blob/master/tests/test1.nim)


## Status

This is still a work in progress and a lot of Z3 is still missing, but the most
important basics are available:

* bool, bit vector, int and float types
* solving
* optimization
* simplification

The API uses template magic to hide Z3 contexts and allows normal Nim syntax for defining Z3 model assertions.


## Example

```nim
z3:
  let x = Int("x")
  let y = Int("y")
  let z = Int("z")
  let s = Solver()
  s.assert 3 * x + 2 * y - z == 1
  s.assert 2 * x - 2 * y + 4 * z == -2
  s.assert x * -1 + y / 2 - z == 0
  s.check_model:
    echo model
```

Answer:

```
z -> (- 2)
y -> (- 2)
x -> 1
```

More examples are available in the tests directory, run with `nimble test`.


## More Z3 info

Some helpful documents and tutorials about Z3:

* [Z3 - guide](https://rise4fun.com/z3/tutorialcontent/guide)
* [Programming Z3](https://theory.stanford.edu/~nikolaj/programmingz3.html)


## Open questions

Things I'm not sure how to solve yet. Any input appreciated:

* Should there be distinct types for signed and unsigned bit vectors? This would 
  make it easier to implement operators for things like Z3_mk_bvXXX_no_overflow()

* What is a good way to create Z3 consts? The current method of doing
  `let x = Int "x"` is redundant and prone to mistakes. Is it better to create
  some kind of declaration template instead?
