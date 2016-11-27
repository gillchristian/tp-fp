#lang racket

; Función potencia de N sobre P

(define pow (lambda (N P)
  (if (= P 0) 1
    (* N (pow N (- P 1))))))

; Funcion factorial de N

(define factorial (lambda (N)
  (if (= N 0) 1
    (* N (factorial (- N 1))))))

; Función maximo de una lista
; NO FUNCA
(define maximo(lambda (lista)
  (if ( null? (cdr lista) ) (car lista)
    (if ( > (car lista) (cadr lista) ) (maximo (cons (car lista) (cddr lista)) )
      (maximo (cdr lista) )))))

; Funcion para hallar longitud de una lista

(define long (lambda (list)
  (if (null? list) 0
    (+ 1 (long (cdr list)))
    )))

; Funcion para sumar los elementos de una lista

(define suma(lambda (list)
  (if (null? list) 0
    (+ (car list) (suma (cdr list))))))

; Funcion para saber si un elemento está en una lista

(define existe (lambda (list N)
  (if (null? list) #f
    (if (equal? N (car list)) #t
      (existe (cdr list) N)))))

; Concatenar dos listas

(define concatenar (lambda (L1 L2)
  (if (null? L1) L2
    (cons (car L1) (concatenar (cdr L1) L2))
    )))

; Encontrar el n-esimo numero de una lista

(define enesimo (lambda (L N)
  (if (= N 1) (car L)
    (enesimo (cdr L) (- N 1)))))
;

(define includes (lambda (L N)
  (if (null? L) #f
    (if (equal? N (car L)) #t
      (includes (cdr L) N)))))

; Función maximo de una lista
; NO FUNCA
(define is-prefix (lambda (L headL)
  (if (null? headL) #t
    (if (null? L) #f
      (if (equal? (car L) (car headL)) (is-prefix (cdr L) (cdr headL))
        #f)))))

;
(define is-sub-list (lambda (L subL)
  (if (null? L) #f
    (if (is-prefix L subL) #t
      (is-prefix (cdr L) subL)))))

;(is-sub-list '(1 2 '(1 2) 3 5) '('(1 2) 3))


(define replace (lambda (has for L)
  (if (null? L) L
    (if (equal? has (car L)) (cons for ( replace has for (cdr L)))
      (cons (car L) (replace has for (cdr L)))))))

;(replace 1 2 '(1 2 3 5 1 1))


; TREES
(define belongs (lambda (node tree)
  (if (null? tree) #f
    (if (equal? node (car tree)) #t
      (or (belongs node (cadr tree)) (belongs node (caddr tree)) )))))

;(belongs 19 '(2 ( 5 () ()) ( 9 ( 19 () ()) () )))
; #t

(define pre-order (lambda (tree)
  (if (null? tree) '()
    (cons (car tree) (append (pre-order (cadr tree)) (pre-order (caddr tree)))))))

(pre-order '(2 ( 5 () ( 3 ()  ())) ( 9 ( 19 () ()) () )))

; Higher Order Functions

(define cuadrado (lambda (x) (* x x)))

(define cubo (lambda (x) (* (cuadrado x) x)))

(define lf (list cubo cuadrado))

(define apply (lambda (val func) (func val)))

(map apply '(2 3)  lf)

;

(define componer (lambda (f g)
  (lambda (x) (f (g x)))))

(define cubo-cuadrado (componer cubo cuadrado))

(cubo-cuadrado 2)

; MAP implementation
(define mapper (lambda (f l)
  (if (null? l) '()
    (cons (f (car l)) (mapper f (cdr l))))))

(define plus-one (lambda (x) (+ 1 x)))

(mapper  plus-one '(1 2))

; FILTER implementation
(define filtrar (lambda (f lista)
  (if (null? lista) '()
    (if (f (car lista)) (cons (car lista) (filtrar f (cdr lista)))
      (filtrar f (cdr lista))))))

(filtrar (lambda (x) (> x 1)) '(0 1 2 3))

;

(define compose-map (lambda (funcs lista)
  (if (null? funcs) lista
    (compose-map (cdr funcs) (map (car funcs) lista)))))

(define cuadrado (lambda (x) (* x x)))

(define cubo (lambda (x) (* (cuadrado x) x)))

(define cuarta (lambda (x) (* (cuadrado x) (cuadrado x))))

(define lf (list cubo cuadrado cuarta))

(compose-map lf '(2 3 4))

;

(define apply-filters (lambda (filters)
  (lambda (lista)
    (if (null? filters) lista
      (filter (car filters) ((apply-filters (cdr filters)) lista)) ))))

(define more-than-4 (lambda (x) (> x 4)))

(define less-than-6 (lambda (x) (< x 6)))

(define filters (list more-than-4 less-than-6))

( (apply-filters filters) '( 5 4 6 6 5 4 6 5) )

;
(define apply-n (lambda (f n)
  (lambda (x)
    (if (equal? n 1) (f x)
        ( (apply-n f (- n 1)) ( f x ) )))))

(define add-1 (lambda (x) (+ 1 x)))

((apply-n add-1 5 ) 1)
