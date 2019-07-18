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
