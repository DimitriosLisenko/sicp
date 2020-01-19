#lang sicp
;; this version of same-parity follows the same logic as reverse with an additional condition
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

;; this version of same-parity follows the same logic as append with an additional condition
(define (same-parity . x)
  (define (correct-parity? y) (= (modulo (car x) 2) (modulo y 2)))
  (define (same-parity-internal curr)
    (if (null? curr)
        (list)
        (if (correct-parity? (car curr))
            (cons (car curr) (same-parity-internal (cdr curr)))
            (same-parity-internal (cdr curr)))))
  (same-parity-internal x))

(same-parity)
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)

;; this version is after I came back to the problem on my second attempt of the book
(define (same-parity . x)
  (define (selector-lambda)
    (if (even? (car x))
        even?
        odd?))
  (if (null? x)
      x
      (filter (selector-lambda) x)))
(same-parity)
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
