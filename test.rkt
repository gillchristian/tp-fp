#lang racket

(define pre-order (lambda (tree)
  (if (null? tree) '()
    (cons (car tree) (append (pre-order (cadr tree)) (pre-order (caddr tree)))))))

(pre-order '(2 ( 5 () ( 3 ()  ())) ( 9 ( 19 () ()) () )))

; '(2 5 3 9 19)
