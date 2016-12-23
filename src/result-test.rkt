#lang racket

(require rackunit rackunit/text-ui "tree.rkt" "result.rkt")

; --- Expected values --- ;
(define maquina (maquinaEstadoInicial 2))

(define tres-fichas '((tronera 4 1) (tronera 5 1) (tronera 6 1) (tronera 7 0)))
(define siete-fichas '((tronera 4 2) (tronera 5 2) (tronera 6 2) (tronera 7 1)))

; --- actual test case --- ;
(define resultado-test
  (test-suite "resultado"
    (test-case "agrega una cantidad de fichas y devuelve una lista con las troneras"
      (check-equal? (resultado maquina 3) tres-fichas "3 fichas")
      (check-equal? (resultado maquina 7) siete-fichas "7 fichas"))))

(run-tests resultado-test 'verbose)
