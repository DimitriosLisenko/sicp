#lang sicp
(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recursive term (next a) next b))))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (factorial x)
  (product-iterative identity 1 inc x))

(define (quarter-pi-approximation n)
  (define (even-ceiling x) (if (= 0 (remainder x 2)) x (inc x)))
  (define (odd-ceiling x) (if (= 1 (remainder x 2)) x (inc x)))
  (/
   (product-iterative even-ceiling 2 inc (+ n 1))
   (product-iterative odd-ceiling 2 inc (+ n 1)))
  )

(quarter-pi-approximation 100)
