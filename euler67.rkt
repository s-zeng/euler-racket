#lang racket
(define (tokenize str)
  (define (helper lst temp tempout)
    (cond
      [(empty? lst) (reverse (cons (list->string (reverse temp)) tempout))]
      [(equal? (car lst) #\space) (helper (cdr (member #\space lst)) empty (cons (list->string (reverse temp)) tempout))]
      [else (helper (cdr lst) (cons (car lst) temp) tempout)]))
  (helper (string->list str) empty empty))
(define (euler18 [lst (reverse (map (lambda (x) (map string->number (tokenize x))) (file->lines "p067_triangle.txt")))] [temp empty] [ref 0])
  (cond
    [(= (length lst) 1) (caar lst)]
    [(> ref (- (length (car lst)) 2)) (euler18 (cons temp (cddr lst)))]
    [else (euler18 lst (append temp (list (+ (list-ref (cadr lst) ref) (max (list-ref (car lst) ref) (list-ref (car lst) (add1 ref)))))) (add1 ref))]))
(euler18)
    
  