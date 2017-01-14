#lang racket
(define (repetend x [temp 1])
  (if (= (modulo (expt 10 temp) x) 1)
      temp
      (repetend x (add1 temp))))
(define (euler26 [counter 3] [highest (list 1 1)])
  (cond
    [(>= counter 1000) highest]
    [(or (= (modulo counter 2) 0) (= (modulo counter 5) 0)) (euler26 (add1 counter) highest)]
    [(> (repetend counter) (last highest)) (euler26 (add1 counter) (list counter (repetend counter)))]
    [else (euler26 (add1 counter) highest)]))
(euler26)
