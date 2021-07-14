#lang sicp
(define (double f) (lambda (x) (f (f x))))

(define (inc x) (+ x 1))
(((double (double double)) inc) 5)

;; (((double (double double)) inc) 5)
;; (((double (lambda (x) (double (double x)))) inc) 5)
;; (((lambda (y) ((lambda (x) (double (double x))) ((lambda (x) (double (double x))) y))) inc) 5)
;; (((lambda (x) (double (double x))) ((lambda (x) (double (double x))) inc)) 5)
;; (((lambda (x) (double (double x))) (double (double inc))) 5)
;; ((double (double (double (double inc)))) 5)
;; following the above pattern:
;; first double makes 2 incs: (inc (inc x))
;; second double makes 4 incs
;; third double makes 8 incs
;; fourth double makes 16 incs
;; so the result will be 16 + 5 = 21
