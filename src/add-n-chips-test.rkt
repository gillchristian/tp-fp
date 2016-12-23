#lang racket

(require rackunit rackunit/text-ui "tree.rkt" "add-n-chips.rkt")

; --- Expected values --- ;
(define maquina2-fichas3'(((1 izq) 1)
  (((2 izq) 0) (tronera 4 1) (tronera 5 1))
  (((3 izq) 1) (tronera 6 1) (tronera 7 0))))

(define maquina2-fichas7 '(((1 izq) 1)
  (((2 izq) 0) (tronera 4 2) (tronera 5 2))
  (((3 izq) 1) (tronera 6 2) (tronera 7 1))))

(define maquina3-fichas10 '(((1 izq) 0)
  (((2 izq) 1) (((4 izq) 1) (tronera 8 2) (tronera 9 1)) (((5 izq) 0) (tronera 10 1) (tronera 11 1)))
  (((3 izq) 1) (((6 izq) 1) (tronera 12 2) (tronera 13 1)) (((7 izq) 0) (tronera 14 1) (tronera 15 1)))))

; --- actual test case --- ;
(define add-n-chips-test
  (test-suite "ingresaVariasFichasFicha"
    (test-case "agrega N fichas a la maquina y devuelve la maquina actualizada"
      (check-equal? (ingresaVariasFichas (maquinaEstadoInicial 2) 3) maquina2-fichas3 "3 fichas, maquina 2 niveles")
      (check-equal? (ingresaVariasFichas (maquinaEstadoInicial 2) 7) maquina2-fichas7 "7 fichas, maquina 2 niveles")
      (check-equal? (ingresaVariasFichas (maquinaEstadoInicial 3) 10) maquina3-fichas10 "10 fichas, maquina 3 niveles")
       )))

(run-tests add-n-chips-test 'verbose)
