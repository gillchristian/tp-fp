(define add1 (lambda (a) (+ a 1)))

(define addList (lambda (a b) (+ a b)))

(map add1 '(1 2 3))

(map add1 '(1 2 3) '(10 20 30))

(map (lambda (a) "Hello World") '(1 2 3))

(define (hello2 name) (string-append "Hello " name))


(define hello-world
  (case-lambda
    (() "Hello World")
    ((n) (string-append "Hello " n))
    ((n m) (string-append "Hello " n m))))

(define hello-world ( case-lambda ( () "Hello World" ) ( (n) ( string-append "Hello " n ) ) ) )

(hello "Juan")
(hello)

(define (lambda () ("I use vim") ) )

(display (iUseVim))


(if (= 1 2) (write "yes") (write "no") )

(cond ((> 2 2) (error "wrong!"))
      ((< 2 2) (error "wrong again!"))
      (else 'ok))

(cond ((> 2 2) (error "wrong!")) ((< 2 2) (error "wrong again!")) (else 'ok))


(define (lp i)
  (when (< i 10)
    (format #t "i=~a\n" i)
    (lp (1+ i))))
(lp 5)
