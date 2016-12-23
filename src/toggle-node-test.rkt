#lang racket

(require rackunit rackunit/text-ui "tree.rkt" "toggle-node.rkt" "add-n-chips.rkt")

; --- Expected values --- ;
(define maquina (maquinaEstadoInicial 2))
(define maquina-alterada (cambiarModoNodo maquina 3 'der))

(define esperado-maquina '(((1 izq) 0)
  (((2 izq) 1) (tronera 4 1) (tronera 5 0))
  (((3 izq) 1) (tronera 6 1) (tronera 7 0))))

(define esperado-maquina-alterada '(((1 izq) 0)
  (((2 izq) 1) (tronera 4 1) (tronera 5 0))
  (((3 der) 1) (tronera 6 0) (tronera 7 1))))

; --- actual test case --- ;
(define cambiarModoNodo-test
  (test-suite "cambiarModoNodo"
    (test-case "cambia el modo de un nodo y devuelve la maquina actualizada"
      (check-not-equal? maquina maquina-alterada "maquina original vs maquina con nodo cambiado")
      (check-equal? (ingresaVariasFichas maquina 2) esperado-maquina "fichas 2 en maquina original")
      (check-equal? (ingresaVariasFichas maquina-alterada 2) esperado-maquina-alterada "fichas 2 en maquina alterada") )))

(run-tests cambiarModoNodo-test 'verbose)
