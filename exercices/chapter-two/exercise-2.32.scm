#lang sicp
;; (1 2 3) becomes (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
;; this works because it's basically saying:
;; define rest as all the subsets without the first element
;; then the result is rest appended with rest where each element also has the first element
(define (subsets s)
  (if (null? s)
      (list (list))
      (let ((rest (subsets (cdr s))))
        (append
         rest
         (map (lambda (x) (append (list (car s)) x)) rest)))))
(subsets (list 1 2 3))

;; EDIT 2019-12-30: used cons instead of append because it's more efficient
(define (subsets s)
  (if (null? s)
      (list s)
      (let ((rest (subsets (cdr s))))
        (append rest
                (map (lambda (x) (cons (car s) x))
                     rest)))))
(subsets (list))
(subsets (list 1))
(subsets (list 1 2))
(subsets (list 1 2 3))
