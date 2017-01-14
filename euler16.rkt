#lang racket
(define (digitlist x lst)
  (cond
    [(< x 1) lst]
    [else (digitlist (floor (/ x 10)) (cons (modulo x 10) lst))]))
(define (listsum lst n)
  (cond
    [(empty? lst) n]
    [else (listsum (cdr lst) (+ n (car lst)))]))
(listsum (digitlist (expt 2 1000) empty) 0)