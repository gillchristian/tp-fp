#lang racket

(require "utils.rkt")

(provide ingresaFicha)

; --- main function --- ;
(define ingresaFicha (lambda (M)
(if (isLeaf M) (increaseLeaf M)
  (if (isLeft (getRoot M))
    (if (isZero (getRoot M))
      ; mode 'izq & state 0 -> add chip to the left machine
      (list (updateNodeState (getRoot M)) (ingresaFicha (getLeft M)) (getRight M))
      ; mode 'izq & state 1 -> add chip to the right machine
      (list (updateNodeState (getRoot M)) (getLeft M) (ingresaFicha (getRight M))))
    (if (isZero (getRoot M))
      ; mode 'der & state 0 -> add chip to the right machine
      (list (updateNodeState (getRoot M)) (getLeft M) (ingresaFicha (getRight M)))
      ; mode 'der & state 1 -> add chip to the left machine
      (list (updateNodeState (getRoot M)) (ingresaFicha (getLeft M)) (getRight M)) )))))

; --- Helpers --- ;

(define increaseLeaf (lambda (leaf)
  (list (car leaf) (cadr leaf) (+ (caddr leaf) 1))))

(define updateNodeMode (lambda (node)
  (cons (list (getNodeId node) (toggleNodeMode node)) (cdr node))))

(define toggleNodeMode (lambda (node)
  (if (eqv? (getNodeMode node) 'izq) 'der 'izq)))

(define updateNodeState (lambda (node)
  (cons (car node) (list (toggleNodeState node)))))

(define toggleNodeState (lambda (node)
  (if (eq? (cadr node) 1) 0 1)))
