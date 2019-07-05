(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))

(define (min x y) (if (< x y) x y))
(define (min-of-three x y z) (min (min x y) z))

(define (the-exercise x y z) (cond ((= x (min-of-three x y z)) (sum-of-squares y z))
                                   ((= y (min-of-three x y z)) (sum-of-squares x z))
                                   ((= z (min-of-three x y z)) (sum-of-squares x y))))

