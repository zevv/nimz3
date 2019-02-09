
# Nim Z3

Early stage/alpha Nim binding for the [Z3 theorem prover](https://github.com/Z3Prover/z3)

This is still a work in progress and a lot of Z3 is still missing, but the most
important basics are available:

* integer and boolean solving
* optimization
* simplification

The API uses template magic to hide Z3 contexts and allows normal Nim syntax for defining Z3 model assertions.

Example:

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

The current implementation uses converters and some global state to allow
mixing nim native types and Z3_ast nodes. I don't like this at all, so this
will require some reworking.

Some helpful documents and tutorials about Z3:

* [Z3 - guide](https://rise4fun.com/z3/tutorialcontent/guide)
* [Programming Z3](https://theory.stanford.edu/~nikolaj/programmingz3.html)
