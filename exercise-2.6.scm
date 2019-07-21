(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
(add-1 zero)

;; one
;; => (add-1 zero)
;; => (lambda (f) (lambda (x) (f ((zero f) x))))
;; => (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;; => (lambda (f) (lambda (x) (f x)))

;; two
;; => (add-1 one)
;; => (lambda (f) (lambda (x) (f ((one f) x))))
;; => (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
;; => (lambda (f) (lambda (x) (f (f x))))

;; so basically, it's the number of times that f is applied to x
;; to accomplish this, add-1 applies f and x in order to get the inner statement, and then applies f to it,
;; and then wraps it back inside λf.λx

;; the confusing part for me here is whether f is actually executed, or whether it's just a variable rename of sorts,
;; i.e. the f inside this lambda is actually the f of the outer lambda
;; but we don't know the f of the outer lambda yet, so don't actually execute
;; I think that is indeed the case

;; this applies e.g. f(f(x)) as the x inside f(f(f(x))) to produce f(f(f(f(f(x)))))
(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x))
      )))

(define (debug num)
  ((num (lambda (x) (+ x 1))) 0))

(define two (add-1 (add-1 zero)))
(debug two)
 
(define three (add-1 (add-1 (add-1 zero))))
(debug three)

(debug (add (add (add two three) three) zero))
