#lang racket
;(define square-list (cdr (build-list 401 (lambda (x) (* x x)))))

;(define (2combinations lst tempout)
 ; (define (combinations lst temp tempout)
  ;  (cond
   ;   [(empty? lst) tempout]
    ;  [else (combinations (cdr lst) temp (cons (list temp (car lst)) tempout))]))
 ; (cond
  ;  [(empty? lst) (reverse tempout)]
   ; [else (2combinations (cdr lst) (append (combinations (cdr lst) (car lst) empty) tempout))]))

;(define (lazypythagorean? lst) (integer? (sqrt (+ (car lst) (cadr lst)))))

;(map (lambda (a b) (append b a)) (map (lambda (x) (+ (sqrt (car x)) (sqrt (cadr x)) (sqrt (+ (car x) (cadr x))))) (filter lazypythagorean? (2combinations square-list empty))) (filter lazypythagorean? (2combinations square-list empty)))
;;(40000 140625 . 1000)
;(* (sqrt 40000) (sqrt 140625) (sqrt (+ 40000 140625)))


(define (euler9 a b x y z)
  (cond
    [(= (+ x y z) 1000) (* x y z)]
    [(> b (sqrt 1000)) (euler9 (add1 a) (add1 a) (- (* b b) (* a a)) (* 2 a b) (+ (* a a) (* b b)))]
    [else (euler9 a (add1 b) (- (* b b) (* a a)) (* 2 a b) (+ (* a a) (* b b)))]))
(euler9 1 3 3 4 5)