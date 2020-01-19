#lang sicp
;; I expect that it will try apply (2 2) and say that 2 is not something you can apply to
(define (f g) (g 2))
(f f)
;; yep, got:
;; ;The object 2 is not applicable.
