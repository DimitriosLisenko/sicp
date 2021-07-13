#lang sicp
(define (fringe x)
  (cond ((null? x) x) ;; fringe of an empty list is an empty list
        ((not (pair? x)) (list x)) ;; fringe of a leaf is a list containing the leaf
        (else
         (append (fringe (car x))
                 (fringe (cdr x)))))) ;; fringe of a tree is the fringe of the subtrees combined

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
(fringe '(1 (2 (3 4 5 (6 7)) 8 9)))

;; EDIT 2019-12-30:made this version on my second run through
;; I kinda hate it more than the above one though
;; I annotated the above one while I was at it too
(define (fringe t)
  (define (iter t res)
    (cond ((null? t) res) ;; return the result unchanged
          ((not (pair? t)) (append res (list t))) ;; append this leaf to the result and return it
          (else (append (iter (car t) res)
                        (iter (cdr t) res))))) ;; run through all the subtrees and append the result
  (iter t '()))
