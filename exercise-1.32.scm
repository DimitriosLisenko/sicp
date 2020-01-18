#lang sicp
(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recursive combiner null-value term (next a) next b))))

(define (identity x) x)
(define (inc x) (+ x 1))

(accumulate-recursive + 0 identity 1 inc 10) ;; sum from 1 to 10
(accumulate-iterative * 1 identity 1 inc 10) ;; product from 1 to 10
