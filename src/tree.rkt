#lang racket

(define maquinaEstadoInicial (lambda (n)
  (if (<= n 0) (list (getRoot 1))
    (if (<= n 1) (list (getRoot 1) (getLeaf 2) (getLeaf 3))
      (list (getRoot 1)
        (getMachine 2 (- n 1))
        (getMachine 3 (- n 1)))))))

(provide maquinaEstadoInicial)

; --- Helpers --- ;
(define getRoot (lambda (id)
  (cons (list id 'izq) (list 0) )))

(define getLeaf (lambda (id)
  (list 'tronera id 0)))

(define idIzq (lambda (prev)
  (* 2 prev)))

(define idDer (lambda (prev)
  (+ (* 2 prev) 1) ))

(define getMachine (lambda (id n)
  (if (equal? n 1) (list (getRoot id) (getLeaf (idIzq id)) (getLeaf (idDer id)))
    (list (getRoot id)
      (getMachine (idIzq id) (- n 1))
      (getMachine (idDer id) (- n 1)) ))))
