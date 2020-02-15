#lang sicp

;; this is still an O(n) operation, but now there are duplicates too
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;; this is now an O(1) operation instead of an O(n) operation
(define (adjoin-set x set)
  (cons x set))

;; this is now an O(n) operation instead of an O(n^2) operation
(define (union-set set1 set2)
  (append set1 set2))

;; this is still an O(n^2) operation, but now there are duplicates too
;; a possible improvement is that we can remove (car set1) from set2 before calling intersection-set again if (car set1) is an element of set2
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; (intersection-set (list 1 1 2 1 2 1 2) (list 2 3 3 2 3 2 3))
;; (union-set (list 1 2 1 2 1 2) (list 2 3 2 3 2 3))
