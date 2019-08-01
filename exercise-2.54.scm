(define (equal? lst mst)
  (cond
   ((and (null? lst)
         (null? mst)) true)
   ((and (symbol? lst)
         (symbol? mst))
    (eq? lst mst))
   ((and (pair? lst) (pair? mst))
    (and
     (equal? (car lst) (car mst))
     (equal? (cdr lst) (cdr mst))))
   (else false)))

(equal? '() '())
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
(equal? '(this (is a) list) '(this (is a) list))
