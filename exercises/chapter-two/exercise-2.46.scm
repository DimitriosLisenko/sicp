#lang sicp
;; constructor
(define (make-vect x y)
  (cons x y))

;; selectors
(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cdr v))

;; procedures
(define (add-vect v w)
  (make-vect
   (+ (xcor-vect v) (xcor-vect w))
   (+ (ycor-vect v) (ycor-vect w))))
(define (sub-vect v w)
  (make-vect
   (- (xcor-vect v) (xcor-vect w))
   (- (ycor-vect v) (ycor-vect w))))
(define (scale-vect v s)
  (make-vect
   (* s (xcor-vect v))
   (* s (ycor-vect v))))
