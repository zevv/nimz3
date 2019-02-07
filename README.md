
First try for a Nim binding for the Z3 theorem prover [https://github.com/Z3Prover/z3]

Example:

```nim
z3:
  let x = Int("x")
  let y = Int("y")
  let z = Int("z")
  assert 3 * x + 2 * y - z == 1
  assert 2 * x - 2 * y + 4 * z == -2
  assert x * -1 + y / 2 - z == 0
  check_and_get_model:
    echo $model
```

More examples in the tests directory
