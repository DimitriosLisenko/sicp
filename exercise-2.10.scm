(load "exercise-2.7+2.8.scm")
(define (div-interval x y)
  (if (and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
      (error "Attempting to divide by an interval that spans 0")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

;; (div-interval
;;  (make-interval 2 5)
;;  (make-interval -2 5))
