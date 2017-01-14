#lang racket
(define (dina m y)
  (cond
    [(or (= m 4) (= m 6) (= m 9) (= m 11))
     30]
    [(or (= m 1) (= m 3) (= m 5) (= m 7) (= m 8) (= m 10) (= m 12))
     31]
    [(= m 2)
     (if (= (modulo y 4) 0)
         (if (= (modulo y 100) 0)
             (if (= (modulo y 400) 0)
                 29
                 28)
             29)
         28)]
    [(= m 0)
     0]
    [else (dina (- m (* 12 (quotient (sub1 m) 12))) (- y 1))]))

(define (diny d m y)
  (cond
    [(>= m 1) (diny (+ d (dina (sub1 m) y)) (sub1 m) y)]
    [else d]))

(define (reversediny d m y)
  (cond
    [(> d (dina m y))
     (if (>= m 12)
         (reversediny (- d (dina m y)) 1 (add1 y))
         (reversediny (- d (dina m y)) (add1 m) y))]
    [else (list d (- m (* 12 (quotient (sub1 m) 12))) y)]))
(define (final d m y n)
   (reversediny (+ n (diny d m y)) 0 y))

;(define (euler19 counter current)
 ; (if (< current 36525)
  ;    (if (= (car (final 1 1 1901 current)) 1)
   ;       (euler19 (add1 counter) (+ current 7))
    ;      (euler19 counter (+ current 7)))
     ; counter))

;(euler19 0 5)
