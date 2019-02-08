
# Nim Z3

First try for a Nim binding for the [Z3 theorem prover](https://github.com/Z3Prover/z3)

Most of Z3 is still missing, but basic boolean and integer solving is working. The API uses template magic to hide Z3 contexts and allows normal Nim syntax for defining Z3 model assertions.

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
  s.with_model:
    echo model
```

Answer:

```
z -> (- 2)
y -> (- 2)
x -> 1
```

More examples in the tests directory, run with `nimble test`.

Some helpful documents and tutorials about Z3:

* [Z3 - guide](https://rise4fun.com/z3/tutorialcontent/guide)
* [Programming Z3](https://theory.stanford.edu/~nikolaj/programmingz3.html)
