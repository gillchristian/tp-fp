#lang racket

(provide
  isLeaf
  isZero
  isLeft
  getRight
  getLeft
  getNodeMode
  getNodeState
  getNodeId
  getRoot)

(define isLeaf (lambda (node)
  (eqv? (car node) 'tronera)))

(define isZero (lambda (node)
  (eq? (cadr node) 0)))

(define isLeft (lambda (node)
  (eqv? (getNodeMode node) 'izq)))

(define getRight (lambda (machine)
  (caddr machine)))

(define getLeft (lambda (leaf)
  (cadr leaf)))

(define getNodeMode (lambda (node)
  (cadar node)))

(define getNodeState (lambda (node)
  (cadr node)))

(define getNodeId (lambda (node)
  (caar node)))

(define getRoot (lambda (machine)
  (car machine)))
