#lang racket
;(define (multipleof? x m) (if (= (modulo x m) 0) #t #f))
;(define (fibonaccilist lst)
 ; (cond
  ;  [(>= (last lst) 4000000) lst]
   ; [else (fibonaccilist (append lst (list (+ (car (cdr (reverse lst))) (car (reverse lst))))))]))
;(define (listadd lst counter)
 ; (cond
  ;  [(empty? lst) counter]
   ; [else (listadd (cdr lst) (+ counter (car lst)))]))
;(listadd (filter even? (fibonaccilist (list 1 2))) 0)

(define (euler2 n [start 2] [sum 0])
  (if (>= start n)
      sum
      (euler2 n (inexact->exact (round (* start (expt (/ (+ 1 (sqrt 5)) 2) 3)))) (+ start sum))))

(define (hackerrank t lst)
  (unless (<= t 0)
    (display (euler2 (car lst))) (newline)
    (hackerrank (sub1 t) (cdr lst))))


(define (inputhelper t) (hackerrank t (build-list t (lambda (x) (read)))))
(inputhelper (read))