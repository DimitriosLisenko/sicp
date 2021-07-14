#lang sicp

(#%require "exercise-2.67.scm")

(#%provide encode)

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree
                    (make-leaf 'D 1)
                    (make-leaf 'C 1)))))
(define sample-encoded-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(define sample-decoded-message (decode sample-encoded-message sample-tree))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (if (leaf? tree)
      '()
      (cond ((member symbol (symbols (left-branch tree)))
             (cons 0 (encode-symbol symbol (left-branch tree))))
            ((member symbol (symbols (right-branch tree)))
             (cons 1 (encode-symbol symbol (right-branch tree))))
            (else (error "bad symbol: ENCODE-SYMBOL" symbol)))))

(equal? sample-encoded-message (encode sample-decoded-message sample-tree)) ; #t
