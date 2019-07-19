(define (stairway-division-recursive numerator-function denominator-function steps)
  (define (stairway-division-internal step)
    (if (> step steps)
        0
        (/
         (numerator-function step)
         (+ (denominator-function step) (stairway-division-internal (+ 1 step))))))
  (stairway-division-internal 1))
(stairway-division-recursive (lambda (x) 1.0) (lambda (x) 1.0) 20)

(define (stairway-division-iterative numerator-function denominator-function steps)
  (define (stairway-division-internal step result)
    (if (= step 0)
        result
        (stairway-division-internal
         (- step 1)
         (/ (numerator-function step) (+ (denominator-function step) result)))))
  (stairway-division-internal steps 0))
(stairway-division-iterative (lambda (x) 1.0) (lambda (x) 1.0) 20)
