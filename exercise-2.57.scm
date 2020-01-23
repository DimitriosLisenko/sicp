#lang sicp
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (make-sum . as)
  (define (make-sum-for-two a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2))
           (+ a1 a2))
          (else (list '+ a1 a2))))
  (let ((as-length (length as)))
    (cond ((< as-length 2) (error "at least two arguments required to make-sum" as))
          ((= as-length 2) (make-sum-for-two (car as) (cadr as)))
          ;; NOTE: apply takes a variadic function and a list and applies the list to the variadic function
          (else (apply make-sum (cons (make-sum-for-two (car as) (cadr as))
                                (cddr as)))))))
(define (make-product . ms)
  (define (make-product-for-two m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))
  (let ((ms-length (length ms)))
    (cond ((< ms-length 2) (error "at least two arguments required to make-product" ms))
          ((= ms-length 2) (make-product-for-two (car ms) (cadr ms)))
          ;; NOTE: apply takes a variadic function and a list and applies the list to the variadic function
          (else (apply make-product (cons (make-product-for-two (car ms) (cadr ms))
                                          (cddr ms)))))))
(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e)) (expt b e))
        (else (list '** b e))))
(define (=number? exp num) (and (number? exp) (= exp num)))
(define (sum? x) (and (pair? x) (eq? (car x) '+)))
;; TODO: now that I think about it, maybe support for n arguments can be implemented just in the addend and augend functions without touching make-product? not sure, just an idea
(define (addend s) (cadr s))
(define (augend s) (if (= (length s) 3)
                       (caddr s)
                       (cons '+ (cddr s))))
(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (if (= (length p) 3)
                             (caddr p)
                             (cons '* (cddr p))))
(define (exponentiation? x) (and (pair? x) (eq? (car x) '**))) ;; can only handle numerical exponents, so maybe verify that it is
(define (base e) (cadr e))
(define (exponent e) (caddr e))
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (exponent exp)
          (make-product
           (make-exponentiation
            (base exp)
            (- (exponent exp) 1))
           (deriv (base exp) var))))
        (else
         (error "unknown expression type: DERIV" exp))))

(deriv '(* x x x x) 'x)
(deriv '(+ x x x x) 'x)
