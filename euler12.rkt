#lang racket
(define (badfactor x [lst (list 1)] [counter 2])
  (if (<= counter (sqrt x))
      (if (= (modulo x counter) 0)
          (badfactor x (append lst (list counter (/ x counter))) (add1 counter))
          (badfactor x lst (add1 counter)))
      (append lst (list x))))

(define (euler12 a b)
  (display (/ (* a b) 2)) (newline)
  (if (> (length (badfactor (/ (* a b) 2))) 500)
      (/ (* a b) 2)
      (euler12 (add1 a) (add1 b))))

(euler12 1 2)
