(define (euler18 [lst (reverse (map (lambda (x) (map string->number (string-split x))) (file->lines "p067_triangle.txt")))] [temp empty] [ref 0])
  (cond
    [(= (length lst) 1) (caar lst)]
    [(> ref (- (length (car lst)) 2)) (euler18 (cons temp (cddr lst)))]
    [else (euler18 lst (append temp (list (+ (list-ref (cadr lst) ref) (max (list-ref (car lst) ref) (list-ref (car lst) (add1 ref)))))) (add1 ref))]))
(euler18)     
