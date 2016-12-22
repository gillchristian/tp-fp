#lang racket

(require "add-chip.rkt")

(provide ingresaVariasFichas)

(define ingresaVariasFichas (lambda (M N)
  (if (eq? N 1) (ingresaFicha M)
    (ingresaVariasFichas (ingresaFicha M) (- N 1)))))
