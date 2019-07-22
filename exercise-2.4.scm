;; the way this works is that cons returns a lambda that accepts a lambda and applies to
;; it the two arguments that you originally passed in (x and y)
;; this lambda then gets passed in to car/cdr and gets a lambda applied to it that returns x or y
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))
