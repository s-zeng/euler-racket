#lang racket
;(define (multipleof? x m) (if (= (modulo x m) 0) #t #f))
;(define (35list lst size counter)
 ; (cond
  ;  [(> counter size) lst]
   ; [(or (multipleof? counter 3) (multipleof? counter 5)) (35list (append lst (list counter)) size (+ counter 1))]
    ;[else (35list lst size (+ counter 1))]))
;(define (listadd lst counter)
 ; (cond
  ;  [(empty? lst) counter]
   ; [else (listadd (cdr lst) (+ counter (car lst)))]))
;(listadd (35list empty 1000 0) -1000)

;(define (euler1 n) (foldl + 0 (filter (λ (x) (or (= (modulo x 3) 0) (= (modulo x 5) 0))) (cdr (build-list n values)))))
(define (euler1 n) (- (+ (/ (* 3 (floor (/ (sub1 n) 3)) (add1 (floor (/ (sub1 n) 3)))) 2) (/ (* 5 (floor (/ (sub1 n) 5)) (add1 (floor (/ (sub1 n) 5)))) 2)) (/ (* 15 (floor (/ (sub1 n) 15)) (add1 (floor (/ (sub1 n) 15)))) 2)))

(define (hackerrank t lst)
  (unless (<= t 0)
    (display (euler1 (car lst))) (newline)
    (hackerrank (sub1 t) (cdr lst))))


(define (inputhelper t) (hackerrank t (build-list t (lambda (x) (read)))))
(inputhelper (read))


;(define (inputhelper t [lst empty] [temp 0])
 ; (cond
  ;  [(zero? t) (hackerrank temp lst)]
   ; [(zero? temp) (inputhelper t lst t)]
    ;[else (inputhelper (sub1 t) (append lst (list (read))) temp)]))