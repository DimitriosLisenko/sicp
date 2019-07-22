(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (midpoint-segment segment)
  (let (
        (min-x (min (x-point(start-segment segment)) (x-point(end-segment segment))))
        (max-x (max (x-point(start-segment segment)) (x-point(end-segment segment))))
        (min-y (min (y-point(start-segment segment)) (y-point(end-segment segment))))
        (max-y (max (y-point(start-segment segment)) (y-point(end-segment segment)))))
    (make-point
     (+ min-x (/ (- max-x min-x) 2))
     (+ min-y (/ (- max-y min-y) 2)))))
(define (print-segment segment)
  (print-point (start-segment segment))
  (print-point (end-segment segment)))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
