#lang sicp

(#%require racket/include)
(include "exercise-2.36.scm") ;; defines accumulate

;; reminds me of good old Haskell's foldl and foldr!
;; there's a really neat pictorial explanation here: https://wiki.haskell.org/Fold
(define fold-right accumulate)
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;; check the commented version to the left to see what it does - makes it more obvious
;; (fold-right / 1 (list 1 2 3)) ;; (/ 1 (/ 2 (/ 3 1)))
;; (fold-left / 1 (list 1 2 3)) ;; (/ (/ (/ 1 1) 2) 3)
;; (fold-right list '() (list 1 2 3)) ;; (list 1 (list 2 (list 3 '())))
;; (fold-left list '() (list 1 2 3)) ;; (list (list (list '() 1) 2) 3)

;; an even more obvious visual explanation:
;; fold-left will apply the initial as the LHS of op and the leftmost element as the RHS of op and kinda smash it leftwards
;; so e.g. (fold-left list '() (list 1 2 3))
;; can be visualised as ((('() -> 1) -> 2) -> 3) where -> is my awesome visual smash operator
;; fold-right will apply the initial as the RHS of op and the rightmost element as the LHS of op and kinda smash it rightwards
;; so e.g. (fold-right list '() (list 1 2 3))
;; can be visualised as (1 <- (2 <- (3 <- '()))) where -> is my awesome visual smash operator
;; EDIT 2020-01-02: maybe a better explanation is that:
;; fold-left will apply the operation starting with the initial value on the left and the left-most value in the list on the right,
;; which becomes the new value on the left for the next left-most value
;; fold-right will apply the operation starting with the initial value on the right and the right-most value in the list on the left,
;; which becomes the new value on the right for the next right-most value

;; the property that op needs to satisfy if fold-left and fold-right are to return the same results...
;; well suppose (fold-left f i s) = (fold-right f i s)
;; then (f x y) = (foldl f x (list y)) = (foldr f x (list y)) = (f y x)
;; therefore f is commutative
