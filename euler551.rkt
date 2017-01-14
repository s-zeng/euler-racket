#lang racket
(define (s n [b 31054319])
  (if (<= n 1000000)
      b
      (s (sub1 n) (+ b (foldl (λ (x y) (+ (- (char->integer x) 48) y)) 0 (string->list (number->string b)))))))
(display (s 1000000000000000))
(read)