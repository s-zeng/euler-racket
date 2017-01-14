#lang racket
(define (root2 i)
  (define (realroot2 j)
    (if (= j 0)
        2
        (+ 2 (/ 1 (realroot2 (sub1 j))))))
  (sub1 (realroot2 i)))
(define (digitcount x) (ceiling (/ (log x) (log 10))))
(define (euler57 [x 0] [counter 0])
  (cond
    [(> x 1000) counter]
    [(> (digitcount (numerator (root2 x))) (digitcount (denominator (root2 x)))) (euler57 (add1 x) (add1 counter))]
    [else (euler57 (add1 x) counter)]))
(euler57)