#lang racket
(define squares (map (lambda (x) (* x x)) (build-list 101 values)))
(define (listadd lst counter)
  (cond
    [(empty? lst) counter]
    [else (listadd (cdr lst) (+ counter (car lst)))]))
(- (* (listadd (build-list 101 values) 0) (listadd (build-list 101 values) 0)) (listadd squares 0))