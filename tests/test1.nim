import unittest
import z3


suite "z3":

  test "demorgan":
    z3:
      # De Morgan: !(!(x && y) <-> (!x || !y)) 
      let x = Bool("x")
      let y = Bool("y")
      let exp = not (not (x and y )) <-> ((not x) or (not y))
      echo exp
      let s = Solver()
      s.assert (x and y) or (not x and y)
      s.check_model:
        echo model

  test "tie or shirt?":
    z3:
      let tie = Bool("tie")
      let shirt = Bool("shirt")
      let s = Solver()
      s.assert (not tie) or shirt
      s.assert (not tie) or not(shirt)
      s.check_model:
        echo model


  test "math school problem":
    z3:
      let x = Int("x")
      let y = Int("y")
      let z = Int("z")
      let s = Solver()
      s.assert 3 * x + 2 * y - z == 1
      s.assert 2 * x - 2 * y + 4 * z == -2
      s.assert x * -1 + y / 2 - z == 0
      echo s
      s.check_model:
        echo model

  test "XKCD restaurant order":

    z3:
      let a = Int("a")
      let b = Int("b")
      let c = Int("c")
      let d = Int("d")
      let e = Int("e")
      let f = Int("f")

      let s = Solver()
      s.assert a*215 + b*275 + c*335 + d*355 + e*420 + f*580 == 1505
      s.assert a<100 and b<100 and c<100 and d<100 and e<100 and f<100
      s.assert a>=0 and b>=0 and c>=0 and d>=0 and e>=0 and f>=0
      s.check_model:
        echo model

  test "sudoku":

    # "Extreme" sudoku: http://www.sudokuwiki.org/Weekly_Sudoku.asp?puz=28

    let · = 0
    let sudoku = [
      [ ·, ·, ·, ·, ·, 8, 9, 4, · ],
      [ 9, ·, ·, ·, ·, 6, 1, ·, · ],
      [ ·, 7, ·, ·, 4, ·, ·, ·, · ],
      [ 2, ·, ·, 6, 1, ·, ·, ·, · ],
      [ ·, ·, ·, ·, ·, ·, 2, ·, · ],
      [ ·, 8, 9, ·, ·, 2, ·, ·, · ],
      [ ·, ·, ·, ·, 6, ·, ·, ·, 5 ],
      [ ·, ·, ·, ·, ·, ·, ·, 3, · ],
      [ 8, ·, ·, ·, ·, 1, 6, ·, · ],
    ]

    z3:
      let s = Solver()
      var cs: array[9, array[9, Z3_Ast]]

      # Create sudoku cells

      for y, row in sudoku.pairs():
        for x, v in row.pairs():
          let c = Int($x & "," & $y)
          cs[y][x] = c
          if v != 0:
            s.assert c == v
          else:
            s.assert c >= 1 and c <= 9

      # Each row and col contains each digit only once

      for row in cs:
        s.assert distinc row

      for y in 0..8:
        var col: seq[Z3_ast]
        for x in 0..8:
          col.add cs[x][y]
        s.assert distinc(col)
      
      # Each 3x3 square contains each digit only once

      for x in [0, 3, 6]:
        for y in [0, 3, 6]:
          var sq: seq[Z3_ast]
          for dx in 0..2:
            for dy in 0..2:
              sq.add cs[x+dx][y+dy]
          s.assert distinc sq

      # Get model and print solution

      s.check_model:
        for row in cs:
          for c in row:
            var v: Z3_ast
            stdout.write eval(c) & " "
          stdout.write "\n"

  test "scopes":
    z3:
      let x = Int "x"
      let y = Int "y"
      let z = Int "z"
      let s = Solver()
      s.push:
        s.assert x + y == 10
        s.assert x + y * 2 == 20
        echo s.check
      s.push:
        s.assert 3 * x + y == 10
        s.assert 2 * x + 2 * y == 21
        echo s.check

  test "simplify":
    z3:
      let x = Int "x"
      let y = Int "y"
      let e =  x + 2 * y + 3 * x - y - y
      echo e
      echo simplify e

# vim: ft=nim

