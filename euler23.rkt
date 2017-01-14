#lang racket
(define (badfactor x [lst (list 1)] [counter 2])
  (cond
    [(> counter (sqrt x)) lst]
    [(= counter (sqrt x)) (append lst (list counter))]
    [(= (modulo x counter) 0) (badfactor x (append lst (list counter (/ x counter))) (add1 counter))]
    [else (badfactor x lst (add1 counter))]))
(define (listsum lst [n 0])
  (cond
    [(empty? lst) n]
    [else (listsum (cdr lst) (+ n (car lst)))]))
(define (sumpairs x [counter 1] [lst empty])
  (if (<= counter (/ x 2))
      (sumpairs x (add1 counter) (cons (list counter (- x counter)) lst))
      lst))
(define (abundant? x) (> (listsum (badfactor x)) x))

(define (euler23 [counter 1] [temp 0])
  (define (so2an? x testlst)
    (cond
      [(empty? testlst) #f]
      [(and (abundant? (caar testlst)) (abundant? (cadar testlst))) #t]
      [else (so2an? x (cdr testlst))]))
  (display counter) (newline)
  (cond
    [(> counter 28123) temp]
    [(so2an? counter (sumpairs counter)) (euler23 (add1 counter) temp)]
    [else (euler23 (add1 counter) (+ temp counter))]))

(euler23)