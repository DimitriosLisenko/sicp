;; the painter that draws the outline of the designated frame
(segments->painter
 (list
  (make-segment (make-vector 0 0) (make-vector 1 0))
  (make-segment (make-vector 1 0) (make-vector 1 1))
  (make-segment (make-vector 0 1) (make-vector 1 1))
  (make-segment (make-vector 0 0) (make-vector 0 1)))

;; the painter that draws an X by connecting opposite corners of the frame
 (segments->painter
  (list
   (make-segment (make-vector 0 0) (make-vector 1 1))
   (make-segment (make-vector 0 1) (make-vector 1 0)))

;; the painter that draws a diamond shape by connecting the midpoints of the sides of the frame
  (segments->painter
   (list
    (make-segment (make-vector 0 0.5) (make-vector 0.5 1))
    (make-segment (make-vector 0.5 1) (make-vector 1 0.5))
    (make-segment (make-vector 1 0.5) (make-vector 0.5 0))
    (make-segment (make-vector 0.5 0) (make-vector 0 0.5)))

;; the wave painter
;; no thank you :)
