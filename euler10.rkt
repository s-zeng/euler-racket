#lang racket
(define (listadd lst counter)
  (cond
    [(empty? lst) counter]
    [else (listadd (cdr lst) (+ counter (car lst)))]))
(define (divides? a b) (= (modulo a b) 0))
(define (sieve x)
  (define (iter lst)
    (cond
      [(> (car lst) (floor (sqrt x))) lst]
      [else (cons (car lst) (iter (filter (lambda (n) (not (divides? n (car lst)))) lst)))]))
  (iter (cdr (build-list x add1))))
(listadd (sieve 2000000) 0)
;Time: 9 seconds
;Answer: 142913828922