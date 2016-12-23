#lang racket

(require rackunit rackunit/text-ui "tree.rkt" "add-chip.rkt")

; --- Expected values --- ;
(define esperado-maquina1 '(((1 izq) 1) (tronera 2 1) (tronera 3 0)))

(define esperado-maquina2
'(((1 izq) 1)
  (((2 izq) 1) (tronera 4 1) (tronera 5 0))
  (((3 izq) 0) (tronera 6 0) (tronera 7 0))))

(define esperado-maquina3 '(((1 izq) 1)
  (((2 izq) 1) (((4 izq) 1) (tronera 8 1) (tronera 9 0)) (((5 izq) 0) (tronera 10 0) (tronera 11 0)))
  (((3 izq) 0) (((6 izq) 0) (tronera 12 0) (tronera 13 0)) (((7 izq) 0) (tronera 14 0) (tronera 15 0)))))

(define esperado-maquina2-fichas2 '(((1 izq) 0)
  (((2 izq) 1) (tronera 4 1) (tronera 5 0))
  (((3 izq) 1) (tronera 6 1) (tronera 7 0))))

; --- actual test case --- ;
(define add-chip-test
  (test-suite "ingresaFicha"
    (test-case "agrega una ficha a la maquina y devuelve la maquina actualizada"
      (check-equal? (ingresaFicha (maquinaEstadoInicial 1)) esperado-maquina1 "1 ficha, maquina 1 niveles")
      (check-equal? (ingresaFicha (maquinaEstadoInicial 2)) esperado-maquina2 "1 ficha, maquina 2 niveles")
      (check-equal? (ingresaFicha (maquinaEstadoInicial 3)) esperado-maquina3 "1 ficha, maquina 3 niveles")
      (check-equal? (ingresaFicha (ingresaFicha (maquinaEstadoInicial 2))) esperado-maquina2-fichas2 "2 fichas, maquina 2 niveles"))))

(run-tests add-chip-test 'verbose)
