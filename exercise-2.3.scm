;; looked at the documentation for loading files since it's not covered in the book yet
(load "exercise-2.2.scm")

;; to make sure that both representations use the same area + perimeter,
;; we can define two functions:
;; 1) rectangle-length-of-shorter-side
;; 2) rectangle-length-of-longer-side
(define (area rec) (* (rectangle-length-of-shorter-side rec) (rectangle-length-of-longer-side rec)))
(define (perimeter rec) (* (+ (rectangle-length-of-shorter-side rec) (rectangle-length-of-longer-side rec)) 2))

;; now let's actually make the rectangle representations happen...
;; here are the ways I can think of to implement a rectangle representation (using the primitives so far):
;; 1) using three points
;; 2) using two segments
;; 3) using a starting point, angle with the horizontal, and then length of the two sides
;; each one will require its own validations to make sure it's actually representing a rectangle...
;; also we haven't actually learned how to represent non-pairs yet, so 2+ points may be problematic...
;; anyway, I can't be arsed to write trigonometric identities + validations required for 1) and 2), so I'm gonna do 3)
;; also gonna use what I believe is going to be the list representation, where you just cons an additional element to the left each time
(define (make-rectangle starting-point angle-with-horizontal length-along-angle length-along-angle-perpendicular)
  (cons starting-point (cons angle-with-horizontal (cons length-along-angle length-along-angle-perpendicular))))
(define (rectangle-starting-point rec) (car rec))
(define (rectangle-angle-with-horizontal rec) (car (cdr rec)))
(define (rectangle-length-along-angle rec) (car (cdr (cdr rec))))
(define (rectangle-length-along-angle-perpendicular rec) (cdr (cdr (cdr rec))))
(define (rectangle-length-of-shorter-side rec)
  (min (rectangle-length-along-angle rec) (rectangle-length-along-angle-perpendicular rec)))
(define (rectangle-length-of-longer-side rec)
  (max (rectangle-length-along-angle rec) (rectangle-length-along-angle-perpendicular rec)))

;; (area (make-rectangle (make-point 2 5) 0.15 2 5))
;; (perimeter (make-rectangle (make-point 2 5) 0.15 2 5))
