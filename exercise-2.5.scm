;; this works because of prime decomposition, and both 2 and 3 are primes
(define (int-pair-cons a b)
  (* (expt 2 a) (expt 3 b)))
(define (int-pair-car x)
  (car-cdr-internal x 2 0))
(define (int-pair-cdr x)
  (car-cdr-internal x 3 0))
(define (car-cdr-internal x divisor counter)
  (if (= (modulo x divisor) 0) (car-cdr-internal (/ x divisor) divisor (+ counter 1)) counter))
