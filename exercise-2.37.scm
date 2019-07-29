(load "exercise-2.36.scm") ;; defines accumulate and accumulate-n

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (m-row) (dot-product m-row v)) m))

;; accumulate-n already maps the elements of a column together
;; all we have to do is make sure that's not changed
;; calling cons and '() kind of acts as an identity function here
(define (transpose mat)
  (accumulate-n cons '() mat))

;; multiplying a transposed n by a row of m gives the equivalent row in the result
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-row) (matrix-*-vector cols m-row)) m)))

;; (define matrix (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12))) 
;; (matrix-*-matrix matrix (list (list 1 2) (list 1 2) (list 1 2) (list 1 2))) 
