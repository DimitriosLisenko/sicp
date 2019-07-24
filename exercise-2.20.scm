(define (same-parity . x)
  (define (correct-parity? y) (= (modulo (car x) 2) (modulo y 2)))
  (define (same-parity-internal res curr)
    (if (null? curr)
        (reverse res)
        (same-parity-internal
         (if
          (correct-parity? (car curr))
          (cons (car curr) res)
          res)
         (cdr curr))))
  (same-parity-internal (list) x))

(same-parity)
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
