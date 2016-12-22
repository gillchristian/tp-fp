#lang racket

(require "utils.rkt")

(provide cambiarModoNodo)

(define cambiarModoNodo (lambda (M id mode)
  (if (isLeaf M) M
    (if (isCurrenNode M id) (list (updateNode (getRoot M) mode) (getLeft M) (getRight M))
      (list (getRoot M) (cambiarModoNodo (getLeft M) id mode) (cambiarModoNodo (getRight M) id mode))))))

; --- Helpers --- ;
(define updateNode (lambda (node mode)
  (cons (list (getNodeId node) mode) (list (getNodeState node)))))

(define isCurrenNode (lambda (M id)
  (eqv? (getNodeId (getRoot M)) id)))
