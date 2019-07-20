(define (iterative-improve good-enough? improve)
  (lambda (x)
    (define (iterative-improve-internal x) (if (good-enough? x) x (iterative-improve-internal (improve x))))
    (iterative-improve-internal x)))

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (sqrt x)
  ((iterative-improve
    (lambda (y) (< (abs (- (square y) x)) 0.001))
    (lambda (y) (average y (/ x y))))
   1.0))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  ((
    iterative-improve
    (lambda (y) (< (abs (- y (f y))) tolerance))
    f)
   first-guess))
