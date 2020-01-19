#lang sicp
(define (stairway-division-iterative numerator-function denominator-function steps)
  (define (stairway-division-internal step result)
    (if (= step 0)
        result
        (stairway-division-internal
         (- step 1)
         (/ (numerator-function step) (+ (denominator-function step) result)))))
  (stairway-division-internal steps 0))

(define (tan-sd x k)
  (stairway-division-iterative
   (lambda (i) (if (= i 1) x (* (* x x) -1)))
   (lambda (i) (- (* i 2) 1))
   k))
;; 0.785398163397448309615660845819875721049292349843776455243 is pi/4
(tan-sd 0.785398163397448309615660845819875721049292349843776455243 30)
