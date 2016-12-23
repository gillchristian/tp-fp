#lang racket

(require rackunit rackunit/text-ui "tree.rkt")

; --- Expected values --- ;
(define maquina1 '(((1 izq) 0) (tronera 2 0) (tronera 3 0)))

(define maquina2 '(((1 izq) 0)
  (((2 izq) 0) (tronera 4 0) (tronera 5 0))
  (((3 izq) 0) (tronera 6 0) (tronera 7 0))))

(define maquina3 '(((1 izq) 0)
  (((2 izq) 0) (((4 izq) 0) (tronera 8 0) (tronera 9 0)) (((5 izq) 0) (tronera 10 0) (tronera 11 0)))
  (((3 izq) 0) (((6 izq) 0) (tronera 12 0) (tronera 13 0)) (((7 izq) 0) (tronera 14 0) (tronera 15 0)))))

(define maquina4 '(((1 izq) 0)
  (((2 izq) 0)
    (((4 izq) 0) (((8 izq) 0) (tronera 16 0) (tronera 17 0)) (((9 izq) 0) (tronera 18 0) (tronera 19 0)))
    (((5 izq) 0) (((10 izq) 0) (tronera 20 0) (tronera 21 0)) (((11 izq) 0) (tronera 22 0) (tronera 23 0))))
  (((3 izq) 0)
    (((6 izq) 0) (((12 izq) 0) (tronera 24 0) (tronera 25 0)) (((13 izq) 0) (tronera 26 0) (tronera 27 0)))
    (((7 izq) 0) (((14 izq) 0) (tronera 28 0) (tronera 29 0)) (((15 izq) 0) (tronera 30 0) (tronera 31 0))))))

; --- actual test case --- ;
(define maquinaEstadoInicial-test
  (test-suite "maquinaEstadoInicial"
    (test-case "genera un arbor binario completo con la cantidad de niveles dados"
      (check-equal? (maquinaEstadoInicial 1) maquina1 "1 nivel")
      (check-equal? (maquinaEstadoInicial 2) maquina2 "2 niveles")
      (check-equal? (maquinaEstadoInicial 3) maquina3 "3 niveles")
      (check-equal? (maquinaEstadoInicial 4) maquina4 "4 niveles"))))

(run-tests maquinaEstadoInicial-test 'verbose)
