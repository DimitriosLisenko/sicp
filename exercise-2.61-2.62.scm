#lang sicp

(#%provide ordered-list/element-of-set?
           ordered-list/intersection-set
           ordered-list/adjoin-set
           ordered-list/union-set)

(define (ordered-list/element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (ordered-list/element-of-set? x (cdr set)))))


(define (ordered-list/intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1 (ordered-list/intersection-set (cdr set1)
                                                       (cdr set2))))
              ((< x1 x2)
               (ordered-list/intersection-set (cdr set1) set2))
              ((< x2 x1)
               (ordered-list/intersection-set set1 (cdr set2)))))))

(define (ordered-list/adjoin-set x set)
  (cond ((null? set) (list x))
        ((<= x (car set)) (cons x set))
        (else (cons (car set) (ordered-list/adjoin-set x (cdr set))))))
;; (ordered-list/adjoin-set 1 (list 2 3))
;; (ordered-list/adjoin-set 2 (list 1 3))
;; (ordered-list/adjoin-set 3 (list 1 2))

;; basic principle: iterate through both sets, and stick the minimum car into a new set
(define (ordered-list/union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((x1 (car set1))
                    (x2 (car set2)))
                (cond ((= x1 x2)
                       (cons x1 (ordered-list/union-set (cdr set1) (cdr set2))))
                      ((> x1 x2)
                       (cons x2 (ordered-list/union-set set1 (cdr set2))))
                      ((< x1 x2)
                       (cons x1 (ordered-list/union-set (cdr set1) set2))))))))
;; (ordered-list/union-set (list 1 3 5 7 9) (list 2 4 6))
;; (ordered-list/union-set (list 1 3 5 7) (list 2 4 6 8 10))
;; (ordered-list/union-set (list 1 2 3 4 5) (list 3 4 5 6 7))
;; (ordered-list/union-set '() (list 3 4 5 6 7))
;; (ordered-list/union-set (list 1 2 3 4 5) '())
