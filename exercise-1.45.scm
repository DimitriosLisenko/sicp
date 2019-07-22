;; copying this part from the book
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

;; copying this part from exercise 1.16
(define (expt b n)
  (define (square x) (* x x))
  (define (even? x) (= (remainder x 2) 0))
  (define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (square b) (/ n 2) a))
          (else (fast-expt-iter b (- n 1) (* a b)))))
  (fast-expt-iter b n 1))

;; copying this part from the book
(define (average x y) (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))

;; copying this part from exerise 1.45
(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 1)
      f
      (repeated (compose f f) (- n 1))))

;; actual solution
;; [2-3]th roots need 1 average-damp repeats
;; [4-7]th roots need 2 average-damp repeats
;; [8-31]th roots need 3 average-damp repeats
;; [32-511]th roots need 4 average-damp repeats
;; I'm approximating it with (floor (log2 n)), but it's actually quite complicated (this will overdamp)
;; because if you take the log2 of those numbers, there's still a exponential progression there...
;; taking the log of which gives you a quadratic progression...
(define (log2 x) (/ (log x) (log 2)))
(define (nroot x n)
  (fixed-point
   ((repeated average-damp (floor (log2 n))) (lambda (y) (/ x (expt y (- n 1)))))
   1.0))
(nroot 32 5)
