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

;; exercise 1.6
;; new-if is a function, so its arguments get evaluated, so it will get stuck in an infinite loop of calling sqrt-iter

;; exerise 1.7
;; the current implementation of good-enough? is not good for very small numbers because:
;; - the difference will be smaller than the tolerance after very few iterations
;;   e.g. (sqrt 0.00001) => .03135649010771716, which squared results in .0009832294718753643
;; the current implementation of good-enough? is not good for very large numbers because:
;; - the way IEEE 754 works is that the larger the number represented, the larger the distance between numbers that can actually be represented
;;   which means that after a certain amount, it will jump to the next available representation, which will be off the actual answer by a lot
;;   e.g. (sqrt 66666666666666666666666666666) => 258198889747161.12, which squared results in 66666666666666666819495919616
;;   interesting note - I tried to get this done starting from 100 and adding 2 zeros each time (so the answer is the 1 followed by half the number of zeros)
;;   however, this led to correct results, which probably means there's an exact representation for these powers of 10
;;   for odd number of zeros, sometimes end up in infinite loop because guess can not be improved (never jumps to the next representation)

(define (sqrt-iter previous-guess current-guess x)
  (if (good-enough? previous-guess current-guess x)
      current-guess
      (sqrt-iter current-guess (improve current-guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? previous-guess current-guess x)
  (< (abs (/ (- current-guess previous-guess) previous-guess)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))

;; old version
;; (sqrt 2) => 1.4142156862745097
;; (square (sqrt 2)) => 2.0000060073048824
;; (sqrt 0.00001) => 0.03135649010771716
;; (square (sqrt 0.00001)) => 9.832294718753643e-4 (0.0009832294718753643)
;; (sqrt 66666666666666666666666666666) => 258198889747161.12
;; (square (sqrt 66666666666666666666666666666)) => 6.666666666666667e28 (66666666666666666819495919616)

;; new version
;; (sqrt 2) => 1.4142135623746899
;; (square (sqrt 2)) => 2.0000000000045106
;; (sqrt 0.00001) => 3.1622776602038957e-3
;; (square (sqrt 0.00001)) => 1.0000000000224625e-5
;; (sqrt 66666666666666666666666666666) => 258198903483181.25
;; (square (sqrt 66666666666666666666666666666)) => 6.6666673759917145e28 (66666673759917144721319788544)

;; overall, better for small numbers, not sure about large numbers, but at least it does *not hang* for large numbers

;; future improvements I made:
;; 1) rate of change is (new - old) / old, not (new - old) / new
;; 2) changed initial values from 0.0 and 1.0 to 1.0 and 2.0 so that starting from 0 doesn't cause divide by 0 exception

;; exercise 1.8
;; this is literally just changing the improve function to the one described in the book... I'll leave it as an exercise to the reader
;; OK fine... here it is:
(define (improve guess x) (/ (+ (/ x (square guess)) (* 2 guess)) 3))


