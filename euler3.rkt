#lang racket
;(define (factor x temp lst)
 ; (cond
  ;  [(= (modulo x temp) 0) (factor (/ x temp) 2 (append lst (list temp)))]
   ; [(>= temp x) lst]
    ;[else (factor x (+ 2 temp) lst)]))
;This factor code sucks crap! (but works lol)
;(last (factor 600851475143 3 empty))

(define (euler3 n [output 1] [i 2])
  (cond
    [(> i (sqrt n)) n]
    [(<= n 1) output]
    [(= (modulo n i) 0) (euler3 (/ n i) i 2)]
    [else (euler3 n output (add1 i))]))
    

(define (hackerrank t lst)
  (unless (<= t 0)
    (display (euler3 (car lst))) (newline)
    (hackerrank (sub1 t) (cdr lst))))


(define (inputhelper t) (hackerrank t (build-list t (lambda (x) (read)))))
(inputhelper (read))