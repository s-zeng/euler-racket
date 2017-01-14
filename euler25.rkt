#lang racket
(define (fibonacci n)
  (define (iter f f2 i)
    (if (or (= i 1) (= i 2))
        f2
        (iter f2 (+ f f2) (sub1 i))))
  (iter 1 1 n))
(define (euler25 n)
  (if (= (ceiling (/ (log (fibonacci n)) (log 10))) 1000)
      n
      (euler25 (add1 n))))
(euler25 5)