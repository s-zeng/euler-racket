#lang racket
;(define (factor x temp lst)
  ;(cond
   ; [(= (modulo x temp) 0) (factor (/ x temp) 2 (append lst (list temp)))]
  ;  [(>= temp x) lst]
 ;   [else (factor x (add1 temp) lst)]))
;(define (howmanytrue lst f)
  ;(define (iter lst f counter)
    ;(cond
    ;  [(empty? lst) counter]
   ;   [(f (car lst)) (iter (cdr lst) f (+ counter 1))]
  ;    [else (iter (cdr lst) f counter)]))
 ; (iter lst f 0))
;(define (length1? lst)
  ;(if (= (length lst) 1)
  ;    #t
 ;     #f))
;(length (filter length1? (map (lambda (x) (factor x 2 empty)) (cdr (build-list 100000 values)))))
;Honestly this is just ridiculous
(define (divides? a b) (= (modulo a b) 0))
(define (sieve x)
  (define (iter lst)
    (cond
      [(> (car lst) (floor (sqrt x))) lst]
      [else (cons (car lst) (iter (filter (lambda (n) (not (= (modulo n (car lst)) 0))) lst)))]))
  (iter (cdr (build-list x add1))))
(list-ref (sieve 200000) 10000)
;Time: 36 seconds
;New record: <1 second!
;Answer: 104743