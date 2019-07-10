(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons-rule f a b n)
  ;; this really needs to be a let statement, but at this point in the book I don't know it
  (define (h) (/ (- b a) n))
  ;; I really want to curry this, but apparently it's not a lisp thing (though there are shorthands)
  ;; also I don't technically know lambdas at this point... so just gonna have to define two functions... vom...
  ;; (define (next x m) (+ x (* m (h))))
  (define (next-one-h x) (+ x (* 1 (h))))
  (define (next-two-h x) (+ x (* 2 (h))))
  (* (/ (h) 3) (+
                (f a)
                (f b)
                (* 2 (sum f (+ (h) a) next-one-h (- b (h))))
                (* 2 (sum f (+ (h) a) next-two-h (- b (h)))))))

(define (cube x) (* x x x))
(simpsons-rule cube 0 1 100)
(simpsons-rule cube 0 1 1000)
