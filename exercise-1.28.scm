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
  (define (fermat-test-internal n a)
    (= (expmod a (- n 1) n) 1))
  (define (fermat-test-loop n a)
    (cond ((= a n) #t)
          (else (if (fermat-test-internal n a) (fermat-test-loop n (+ a 1)) #f))))
  (fermat-test-loop n 1))

;; non-prime numbers
(fermat-test 15)
(fermat-test 39)

;; Carmichael numbers
(fermat-test 561)
(fermat-test 1105)
(fermat-test 1729)
(fermat-test 2465)
(fermat-test 2821)
(fermat-test 6601)

;; even numbers
(fermat-test 302)
(fermat-test 640)
(fermat-test 828)
(fermat-test 594)
(fermat-test 804)
(fermat-test 128)
(fermat-test 414)
(fermat-test 12)
(fermat-test 436)
(fermat-test 888)

;; prime numbers
(fermat-test 7)
(fermat-test 2)
(fermat-test 311)
(fermat-test 641)
(fermat-test 37)
(fermat-test 829)
(fermat-test 599)
(fermat-test 809)
(fermat-test 127)
(fermat-test 419)
(fermat-test 13)
(fermat-test 431)
(fermat-test 883)
