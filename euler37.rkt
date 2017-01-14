#lang racket
(define (sieve x)
  (define (iter lst)
    (cond
      [(> (car lst) (floor (sqrt x))) lst]
      [else (cons (car lst) (iter (filter (lambda (n) (not (= (modulo n (car lst)) 0))) lst)))]))
  (iter (cdr (build-list x add1))))
(define (digitlist x lst)
  (cond
    [(< x 1) lst]
    [else (digitlist (floor (/ x 10)) (cons (modulo x 10) lst))]))
(define (reversedigitlist lst counter)
  (if (empty? lst)
      counter
      (reversedigitlist (cdr lst) (+ (* (expt 10 (sub1 (length lst))) (car lst)) counter))))
(define (listsum lst n)
  (cond
    [(empty? lst) n]
    [else (listsum (cdr lst) (+ n (car lst)))]))
(define (truncatableprime? x)
  (cond
    [(= x 0) #t]
    [(= x 1) #f]
    [(member x (sieve x)) (truncatableprime? (reversedigitlist (cdr (digitlist x empty)) 0))]
    [else #f]))
(define (backtruncatableprime? x)
  (cond
    [(= x 0) #t]
    [(= x 1) #f]
    [(member x (sieve x)) (backtruncatableprime? (reversedigitlist (reverse (cdr (reverse (digitlist x empty)))) 0))]
    [else #f]))
(+ (listsum (list-tail (filter (lambda (x) (backtruncatableprime? x)) (filter (lambda (x) (truncatableprime? x)) (sieve 10000))) 4) 0) 739397)
;MAKE A BETTER VERSION