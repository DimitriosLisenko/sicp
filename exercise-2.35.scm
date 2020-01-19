#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves tree)
  (accumulate
   +
   0
   (map
    (lambda (subtree)
      (cond ((null? subtree) 0)
            ((pair? subtree) (count-leaves subtree))
            (else 1)))
    tree)))

(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
(count-leaves (list x x))
(count-leaves (list (list)))
