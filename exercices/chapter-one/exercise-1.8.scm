#lang sicp
;; this is literally just changing the improve function to the one described in the book... I'll leave it as an exercise to the reader
;; OK fine... here it is:
(define (improve guess x) (/ (+ (/ x (square guess)) (* 2 guess)) 3))

