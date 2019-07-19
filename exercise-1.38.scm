(define (stairway-division-iterative numerator-function denominator-function steps)
  (define (stairway-division-internal step result)
    (if (= step 0)
        result
        (stairway-division-internal
         (- step 1)
         (/ (numerator-function step) (+ (denominator-function step) result)))))
  (stairway-division-internal steps 0))

(define (e)
  (+
   2
   (stairway-division-iterative
    (lambda (i) 1.0)
    (lambda (i) (if (= 0 (modulo (+ i 1) 3)) (* (/ (+ i 1) 3) 2) 1))
    20)))
(e)

