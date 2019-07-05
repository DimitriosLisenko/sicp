(define (binomial-coefficient n k)
  (cond ((or (< k 0) (> k n)) 0)
        ((or (= 0 k) (= k n)) 1)
        (else (+ (binomial-coefficient (- n 1) (- k 1)) (binomial-coefficient (- n 1) k)))))
