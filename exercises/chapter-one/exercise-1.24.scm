#lang sicp
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
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
(define (prime? n)
  (fast-prime? n 10))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes min max)
  (define (is-odd? x) (if (= (remainder x 2) 1) #t #f))
  (define (odd-min) (if (is-odd? min) min (+ min 1)))
  (define (odd-max) (if (is-odd? max) max (- max 1)))
  (define (search-for-primes-internal min max)
    ;; had an interesting bug here with executing multiple statements inside a cond
    ;; I first tried ((condition) ((expr1) (expr2)))
    ;; however this ended up executing the result of expr2 I guess since I got the following error message:
    ;; ;The object #!unspecific is not applicable.
    ;; so it seems that the correct way to do this is ((condition) (expr1) (expr2))
    (cond ((<= min max)
           (timed-prime-test min)
           (search-for-primes-internal (+ 2 min) max))))
  (search-for-primes-internal (odd-min) (odd-max)))

;; when running a n = 1,000 vs n = 1,000,000 on a log(n) alorithm, I expect that:
;; log10(1,000) = 3
;; log10(1,000,000) = 6
;; => (6 / 3) = 2 times slower
;; I expect this to be true in general when doubling the number of zeroes
(search-for-primes 100000000000 100000001000) ;; this takes about .26s with slow prime, but 0 with fast prime
(search-for-primes 1000000000000 1000000001000) ;; this takes about .82s with slow prime, but 0 with fast prime
(search-for-primes 10000000000000 10000000001000) ;; this takes about 2.56 with slow prime, but 0 with fast prime
;; these are literally so monstrously fast now that I can't even compare execution times...
;; even when I tweaked times to be 10 in fast-prime?
(search-for-primes
 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000) ;; 0.05 seconds!
