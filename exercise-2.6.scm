(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

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

