;; exercise 1.3
(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))

(define (min x y) (if (< x y) x y))
(define (min-of-three x y z) (min (min x y) z))

(define (the-exercise x y z) (cond ((= x (min-of-three x y z)) (sum-of-squares y z))
				   ((= y (min-of-three x y z)) (sum-of-squares x z))
				   ((= z (min-of-three x y z)) (sum-of-squares x y))))

;; exercise 1.4
;; that's pretty cool - so a compound expression can return an *operator* value that is the applied to other expressions
;; in this particular case, it will add the absolute value of b to a

;; exercise 1.5
;; applicative-order (like Scheme)
;; (test 0 (p))
;; => (test 0 (p))
;; => (test 0 (p))
;; => infinite loop
;; normal-order (like Haskell I think?)
;; (test 0 (p))
;; => (if (= 0 0) 0 (p))
;; => (if #t 0 (p))
;; => 0
