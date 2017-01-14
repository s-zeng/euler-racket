#lang racket
(define (collatz x temp)
  (cond
    [(= x 1) (add1 temp)]
    [(= (modulo x 2) 1) (collatz (add1 (* x 3)) (add1 temp))]
    [else (collatz (/ x 2) (add1 temp))]))

(define (euler9 x n templength)
  (cond
    [(> x 1000000) n]
    [(> (collatz x 0) templength) (euler9 (add1 x) x (collatz x 0))]
    [else (euler9 (add1 x) n templength)]))
(euler9 2 0 0)
