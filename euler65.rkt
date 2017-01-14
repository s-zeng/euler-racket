#lang racket
;(define (e i)
 ; (define (reale j)
  ;  (cond
   ;   [(= j 0) (if (= (modulo (- i j) 3) 0)
    ;               (* 2 (/ (- i j) 3))
     ;              1)]
     ; [(= (modulo (- i j) 3) 0) (+ (* 2 (/ (- i j) 3)) (/ 1 (reale (sub1 j))))]
      ;[else (+ 1 (/ 1 (reale (sub1 j))))]))
;  (if (= i 1)
 ;     2
  ;    (+ 2 (/ 1 (reale (- i 2))))))

(define (e i)
  (define (reale j)
    (cond
      [(and (= j 0) (= (modulo (- i j) 3) 0)) (* 2 (/ (- i j) 3))]
      [(and (= j 0) (not (= (modulo (- i j) 3) 0))) 1]
      [(= (modulo (- i j) 3) 0) (+ (* 2 (/ (- i j) 3)) (/ 1 (reale (sub1 j))))]
      [else (+ 1 (/ 1 (reale (sub1 j))))]))
  (if (= i 1)
      2
      (+ 2 (/ 1 (reale (- i 2))))))

(foldl + 0 (map (λ (x) (- (char->integer x) 48)) (string->list (number->string (numerator (e 100))))))

