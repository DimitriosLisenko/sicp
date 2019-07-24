(define (deep-reverse x)
  (define (conditional-deep-reverse x) (if (pair? x) (deep-reverse x) x))
  (define (reverse-internal res curr)
    (if (null? curr)
        res
        (reverse-internal
         (cons (conditional-deep-reverse (car curr)) res)
         (cdr curr))))
  (reverse-internal (list) x))

;; my fucking god - it worked!
(define x (list (list 1 2) (list 3 4) 5 (list 6 7 8)))
(reverse x)
(deep-reverse x)
