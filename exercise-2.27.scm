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
(reverse x) ;; ((6 7 8) 5 (3 4) (1 2))
(deep-reverse x) ;; ((8 7 6) 5 (4 3) (2 1))

(define y (list (list 1 2) (list 3 4) 5 (list 6 7 8 (list 9 10 (list 11 12) (list 13 14)))))
(reverse y) ;; ((6 7 8 (9 10 (11 12) (13 14))) 5 (3 4) (1 2))
(deep-reverse y) ;; ((((14 13) (12 11) 10 9) 8 7 6) 5 (4 3) (2 1))

(deep-reverse (list))
(deep-reverse (list (list)))
