#lang sicp
;; x^x = 1000
;; => ln(x^x) = ln(1000)
;; => x*ln(x) = ln(1000)
;; => x = ln(1000) / ln(x)

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (newline)
  (display first-guess)
  (newline)
  (try first-guess))
(fixed-point (lambda (x) (/ (log 1000.0) (log x))) 2.0)
