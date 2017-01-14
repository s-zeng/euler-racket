#lang racket
(define (digitlist x lst)
  (cond
    [(< x 1) lst]
    [else (digitlist (floor (/ x 10)) (cons (modulo x 10) lst))]))
(define (listsum lst n)
  (cond
    [(empty? lst) n]
    [else (listsum (cdr lst) (+ n (car lst)))]))
(define (factorial n temp)
  (cond
    [(= n 1) temp]
    [else (factorial (sub1 n) (* temp n))]))
(listsum (digitlist (factorial 100 1) empty) 0)