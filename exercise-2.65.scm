#lang sicp

;; looks like this is how requiring files will have to happen in racket - load doesn't work
(#%require racket/include)
(include "exercise-2.61-2.62.scm")
(include "exercise-2.63.scm")
(include "exercise-2.64.scm")

;; union-set can be done by
;; - converting both sets to ordered lists (works because the tree->list functions are in-order)
;; - creating a new list by sticking in the min element from each at a time
;; - converting it to a balanced tree
;; intersection-set is similar, but the list will be the matching elements
;; in fact... these are just the union-set and intersection-set operations for when we represented sets as ordered lists
;; so... just gonna use the methods from exerices 2.61-2.62

(define (balanced-tree/union-set set1 set2)
  (list->tree (ordered-list/union-set (tree->list-2 set1) (tree->list-2 set2))))

(define (balanced-tree/intersection-set set1 set2)
  (list->tree (ordered-list/intersection-set (tree->list-2 set1) (tree->list-2 set2))))
