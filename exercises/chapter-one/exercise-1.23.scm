#lang sicp
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (define (next x) (if (= x 2) 3 (+ x 2)))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

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

(search-for-primes 100000000000 100000001000) ;; this takes about .26s originally, .17s with next => 35% improvement
(search-for-primes 1000000000000 1000000001000) ;; this takes about .82s originally, .55 with next => 33% improvement
(search-for-primes 10000000000000 10000000001000) ;; this takes about 2.56 originally, 1.72s with next => 33% improvement
;; this is not the 50% improvement predicted by the book due to the implementation of the next function
;; this is due to the extra if statement that now has to be executed

