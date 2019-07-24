(define (reverse lst)
  (if
   (null? lst)
   lst
   (append (reverse (cdr lst)) (list (car lst)))))

(reverse (list))
(reverse (list 1))
(reverse (list 1 2))
(reverse (list 1 2 3))
(reverse (list 1 2 3 4))
(reverse (list 1 2 3 4 5))
