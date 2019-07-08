(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))
(define (fermat-test n)
  (define (fermat-test-internal n a)
    (= (expmod a n n) a))
  (define (fermat-test-loop n a)
    (cond ((= a n) #t)
          (else (if (fermat-test-internal n a) (fermat-test-loop n (+ a 1)) #f))))
  (fermat-test-loop n 1))

(fermat-test 561) ;; 561 is a Carmichael number - it is not a prime number, but it fools the Fermat test

