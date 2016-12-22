#lang racket

(require rackunit rackunit/text-ui "tree.rkt")

(maquina 5)

(maquina 1)
'(((1 izq) 0))

(maquina 2)
'(((1 izq) 0) (2 0) (3 0))

(maquina 3)
'(((1 izq) 0) (((2 izq) 0) (4 0) (5 0)) (((3 izq) 0) (6 0) (7 0)))

(maquina 4)
'(((1 izq) 0)
  (((2 izq) 0) (((4 izq) 0) (8 0) (9 0)) (((5 izq) 0) (10 0) (11 0)))
  (((3 izq) 0) (((6 izq) 0) (12 0) (13 0)) (((7 izq) 0) (14 0) (15 0))))

(maquina 5)
'(((1 izq) 0)
  (((2 izq) 0)
   (((4 izq) 0) (((8 izq) 0) (16 0) (17 0)) (((9 izq) 0) (18 0) (19 0)))
   (((5 izq) 0) (((10 izq) 0) (20 0) (21 0)) (((11 izq) 0) (22 0) (23 0))))
  (((3 izq) 0)
   (((6 izq) 0) (((12 izq) 0) (24 0) (25 0)) (((13 izq) 0) (26 0) (27 0)))
   (((7 izq) 0) (((14 izq) 0) (28 0) (29 0)) (((15 izq) 0) (30 0) (31 0)))))