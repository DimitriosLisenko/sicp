#lang sicp

(#%require racket/include)
(include "exercise-2.7-2.8.scm")

(define (make-center-percent c p)
  (let ((w (* c (/ p 100))))
    (make-interval (- c w) (+ c w))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (abs (/ (- (upper-bound i) (lower-bound i)) 2)))
(define (percent i)
  (abs (* (/ (width i) (center i)) 100)))

(define (print-percent-interval x)
  (newline)
  (display (center x))
  (display " +/- ")
  (display (percent x))
  (display "%"))

(print-interval (make-center-percent 100 5))
(center (make-center-percent 101 9))
(percent (make-center-percent 101 9))
