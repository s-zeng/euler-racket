#lang racket
(define (badfactor x [lst (list 1)] [counter 2])
  (cond
    [(> counter (sqrt x)) lst]
    [(= counter (sqrt x)) (append lst (list counter))]
    [(= (modulo x counter) 0) (badfactor x (append lst (list counter (/ x counter))) (add1 counter))]
    [else (badfactor x lst (add1 counter))]))
(define (euler21 [x 1] [lst empty])
  (cond
    [(>= x 10000) (foldl + 0 lst)]
    [(and (= x (foldl + 0 (badfactor (foldl + 0 (badfactor x))))) (not (= x (foldl + 0 (badfactor x)))))
     (euler21 (add1 x) (append lst (list x)))]
    [else (euler21 (add1 x) lst)]))
(euler21)
