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

(define (total-weight mobile)
  (define (conditional-total-weight branch)
    (if (pair? (branch-structure branch))
               (total-weight (branch-structure branch))
               (branch-structure branch)))
  (+
   (conditional-total-weight (left-branch mobile))
   (conditional-total-weight (right-branch mobile))))
