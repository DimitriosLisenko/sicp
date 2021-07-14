#lang sicp
(define (filtered-accumulate-iterative filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter
         (next a)
         (combiner result (if (filter a) (term a) null-value)))))
  (iter a null-value))

(define (filtered-accumulate-recursive filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (if (filter a) (term a) null-value)
       (filtered-accumulate-recursive filter combiner null-value term (next a) next b))))

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

(define (prime? x) (fermat-test x))
(define (square x) (* x x))
(define (inc x) (+ x 1))
(filtered-accumulate-recursive prime? + 0 square 1 inc 10)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
;; (define (relatively-prime? i n) (= (gcd i n) 1)) ;; really need to curry this bitch!
(define (relatively-prime-to-10? i) (= (gcd 10 i) 1)) ;; ugh... lambdas not yet taught in the book...
(define (identity x) x)
(filtered-accumulate-iterative relatively-prime-to-10? * 1 identity 1 inc (- 10 1))
