(define add1 (lambda (a) (+ 1 a)))
(map add1 '(1 2 3) )

;
(define facto (lambda (n)
    (if (= n 0)
      1
      (* n (facto (- n 1)) )
    )
  ))
;
(define fib (lambda (n)
  (if (<= n 1)
    1
    (+ (fib (- n 1)) (fib (- n 2)))
    )
  ))
;
(define pot (lambda (n p)
  (if (= p 0)
    1
    (* n ( pot n (- p 1) ) )
    )
  ))
;
(define has (lambda (e l)
  (if (null? l) #f
    (if (= (car l) e)
      #t
      (has e (cdr l))
      )
    )
  ))
;
(define cat (lambda (l1 l2)
  (if (null? l1)
    l2
    (cons (car l1) (cat (cdr l1) l2))
    )
  ))
;
(define getN (lambda (l n)
  (if (= 0 n)
    (car l)
    (getN (cdr l) (- n 1))
    )
  ))
