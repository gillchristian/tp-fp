#lang racket

(require "add-n-chips.rkt" "utils.rkt")

(provide resultado)

(define resultado (lambda (M N)
  (getLeavesList (ingresaVariasFichas M N))))

(define getLeavesList (lambda (M)
  (if (isLeaf M) (list M)
    (append (getLeavesList (getLeft M)) (getLeavesList (getRight M))))))
