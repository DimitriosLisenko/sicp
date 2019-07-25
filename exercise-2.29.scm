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

(define (torque branch)
  (*
   (branch-weight branch)
   (branch-length branch)))

;; this is horribly inefficient at the moment because it calls torque -> branch-weight -> total-weight at each node
(define (balanced? mobile)
  (if (not (pair? mobile))
      true
      (and
       (balanced? (branch-structure (left-branch mobile)))
       (balanced? (branch-structure (right-branch mobile)))
       (= (torque (left-branch mobile)) (torque (right-branch mobile))))))

;; (define x (make-mobile (make-branch 1 1) (make-branch 1 1)))
;; (define y (make-mobile (make-branch 2 5) (make-branch 5 x)))
;; (balanced? y)
