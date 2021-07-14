#lang sicp
(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square-tree x)
  (cond ((null? x) x)
        ((not (pair? x)) (square x))
        (else (cons (square-tree (car x)) (square-tree (cdr x))))))
(square-tree x)

(define (square-tree x)
  (map
   (lambda (x)
     (if (not (pair? x))
         (square x)
         (square-tree x)))
   x))
(square-tree x)
