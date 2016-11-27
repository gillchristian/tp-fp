#lang racket

(require rackunit "foo.rkt")
(require rackunit/text-ui)

(define file-tests
  (test-suite "foo"
   (test-case
     "one plus-one"
     (check-equal? (plus-one 1) 2 "is two")
     (check-not-equal? (plus-one 1) 3 "is not three"))))

; CLI test-ui
(run-tests file-tests)
