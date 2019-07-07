(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
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

;; the book suggests to find the first three prime numbers larger than
;; i) 1,000
;; ii) 10,000
;; iii) 100,000
;; iv) 1,000,000
;; however, these complete so fast on my machine that there is no way to obtain data
;; I have to up to these much larger numbers to find anything - yay advancing technology!
(search-for-primes 100000000000 100000001000) ;; this takes about .26s when it's a prime number, and much faster when not
(search-for-primes 1000000000000 1000000001000) ;; this takes about .82s when it's a prime number, and much faster when not
(search-for-primes 10000000000000 10000000001000) ;; this takes about 2.56 when it's a prime number, and much faster when not
;; these results coincide with the fact that each addition of a zero increases the runtime by (sqrt 10)
