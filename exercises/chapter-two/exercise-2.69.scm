#lang sicp

(#%require "exercise-2.67.scm")

(#%provide generate-huffman-tree)

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;; 1) remove the minimum two elements
;; 2) merge them (with make-code-tree), and
;; 3) call adjoin-set on the leaf-set to stick the new element in the right place
(define (successive-merge leaf-set)
  (if (= (length leaf-set) 1)
      (car leaf-set)
      (successive-merge
       (adjoin-set
        (make-code-tree (car leaf-set) (cadr leaf-set))
        (cddr leaf-set)))))

(define example-pairs '((A 4) (B 2) (C 1) (D 1)))
;; (make-leaf-set example-pairs) ;; ((leaf D 1) (leaf C 1) (leaf B 2) (leaf A 4))
(generate-huffman-tree example-pairs)

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree
                    (make-leaf 'D 1)
                    (make-leaf 'C 1)))))

(equal? sample-tree (generate-huffman-tree example-pairs)) ;; #t
