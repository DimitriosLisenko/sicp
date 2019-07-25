(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (branch-weight b)
  (if (pair? (branch-structure b))
             (total-weight (branch-structure b))
             (branch-structure b)))

(define (total-weight mobile)
  (+
   (branch-weight (left-branch mobile))
   (branch-weight (right-branch mobile))))
