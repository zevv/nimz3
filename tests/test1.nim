
import unittest
import nimz3pkg/z3
import nimz3pkg/z3_api

suite "z3":

  test "demorgan":
    z3:
      # De Morgan: !(!(x && y) <-> (!x || !y)) 
      let x = Bool("x")
      let y = Bool("y")
      let exp = not (not (x and y )) <-> ((not x) or (not y))
      echo exp
      assert (x and y) or (not x and y)
      check_and_get_model:
        echo $model

  test "tie or shirt?":
    z3:
      let tie = Bool("tie")
      let shirt = Bool("shirt")
      assert (not tie) or shirt
      assert (not tie) or not(shirt)
      check_and_get_model:
        echo $model


  test "math school problem":
    z3:
      let x = Int("x")
      let y = Int("y")
      let z = Int("z")
      assert 3 * x + 2 * y - z == 1
      assert 2 * x - 2 * y + 4 * z == -2
      assert x * -1 + y / 2 - z == 0
      check_and_get_model:
        echo $model

  test "XKCD restaurant order":

    z3:
      let a = Int("a")
      let b = Int("b")
      let c = Int("c")
      let d = Int("d")
      let e = Int("e")
      let f = Int("f")

      assert a*215 + b*275 + c*335 + d*355 + e*420 + f*580 == 1505
      assert a<100 and b<100 and c<100 and d<100 and e<100 and f<100
      assert a>=0 and b>=0 and c>=0 and d>=0 and e>=0 and f>=0
      check_and_get_model:
        echo $model

  test "sudoku":

    let sudoku = [
      [ 5, 0, 0, 0, 8, 0, 0, 4, 9 ],
      [ 0, 0, 0, 5, 0, 0, 0, 3, 0 ],
      [ 0, 6, 7, 3, 0, 0, 0, 0, 1 ],
      [ 1, 5, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 2, 0, 8, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 1, 8 ],
      [ 7, 0, 0, 0, 0, 4, 1, 5, 0 ],
      [ 0, 3, 0, 0, 0, 2, 0, 0, 0 ],
      [ 4, 9, 0, 0, 5, 0, 0, 0, 3 ],
    ]

    z3:
      var cs: array[9, array[9, Z3_Ast]]

      # Create sudoku cells

      for y, row in sudoku.pairs():
        for x, v in row.pairs():
          let c = Int($x & "," & $y)
          cs[x][y] = c
          if v != 0:
            assert c == v
          else:
            assert c >= 1 and c <= 9

      # Each row and col contains each digit only once

      for y in 0..8:
        var col: seq[Z3_ast]
        let row = cs[y]
        for x in 0..8:
          col.add cs[x][y]
        assert distinc(col)
        assert distinc(row)
      
      # Each 3x3 square contains each digit only once

      for x in [0, 3, 6]:
        for y in [0, 3, 6]:
          var sq: seq[Z3_ast]
          for dx in 0..2:
            for dy in 0..2:
              sq.add cs[x+dx][y+dy]
          assert distinc sq

      # Get and print solution

      check_and_get_model:
        for y in 0..8:
          for x in 0..8:
            var v: Z3_ast
            stdout.write eval(cs[y][x]) & " "
          stdout.write "\n"

# vim: ft=nim

