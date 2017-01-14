#lang racket
;(define (2combinations lst tempout)
 ; (define (combinations lst temp tempout)
  ;  (cond
   ;   [(empty? lst) tempout]
    ;  [else (combinations (cdr lst) temp (cons (list temp (car lst)) tempout))]))
  ;(cond
   ; [(empty? lst) (reverse tempout)]
    ;[else (2combinations (cdr lst) (append (combinations (cdr lst) (car lst) empty) tempout))]))
;(define 3digitlist (list-tail (build-list 1000 values) 100))
;(define (listmultiply lst temp)
 ; (cond
  ;  [(empty? lst) temp]
   ; [else (listmultiply (cdr lst) (* temp (car lst)))]))
;(define (listmultiply lst [temp 0]) (foldl * 1 lst))

;(last (sort (filter palindrome? (map (lambda (x) (listmultiply x 1)) (2combinations 3digitlist empty))) <))

(define (palindrome? x) (equal? (string->list (number->string x)) (reverse (string->list (number->string x)))))
(define (euler4 n) (argmax values (filter (λ (y) (and (palindrome? y) (< y n))) (map (λ (x) (foldl * 1 x)) (combinations (list-tail (build-list 1000 values) 100) 2)))))

(define (hackerrank t lst)
  (unless (<= t 0)
    (display (euler4 (car lst))) (newline)
    (hackerrank (sub1 t) (cdr lst))))


(define (inputhelper t) (hackerrank t (build-list t (lambda (x) (read)))))
(inputhelper (read))