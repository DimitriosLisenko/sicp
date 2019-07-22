(define (make-rat n d)
  (let ((g (gcd n d)))
    (cond ((or
            (and (>= n 0) (>= d 0))
            (and (< n 0) (>= d 0)))
           (cons (/ n g) (/ d g)))
          ((or
            (and (>= n 0) (< d 0))
            (and (< n 0) (< d 0)))
           (cons (/ (- n) g) (/ (- d) g))))))
