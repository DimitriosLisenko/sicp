(define (tree-map f x)
  (map
   (lambda (x)
     (if (not (pair? x))
         (f x)
         (tree-map f x)))
   x))
(define (square-tree tree) (tree-map square tree))

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(square-tree x)
