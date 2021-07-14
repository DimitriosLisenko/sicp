#lang sicp

(#%provide list->tree)

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

;; this function:
;; - grabs the middle element
;; - converts the elements to the left of it to a balanced subtree
;; - converts the elements to the right of it to a balanced subtree
;; - joins these three into a resulting balanced tree
;; seems like it's T(n) = Θ(n) because:
;; T(n) = 2T(n ÷ 2) + Θ(1)
;; since we're running the function against two lists half the size, and
;; - splitting the list is constant time because it's just calculating the size of the left and right subtrees
;; - combining the list is constant time because it's just calling make-tree
;; and that's then the result according to the master theorem from Introduction to Algorithms
(define (list->tree elements)
  (car (partial-tree elements (length elements))))
(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result
               (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result
                   (partial-tree
                    (cdr non-left-elts)
                    right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts
                     (cdr right-result)))
                (cons (make-tree this-entry
                                 left-tree
                                 right-tree)
                      remaining-elts))))))))
