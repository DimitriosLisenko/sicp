#lang sicp
;; φ is a solution to φ^2 = φ + 1
;; φ^2 = φ + 1
;; => φ = (φ + 1) / φ 
;; => φ = 1 + (1 / φ )

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(fixed-point (lambda (x) (+ 1.0 (/ 1.0 x))) 2.0)
