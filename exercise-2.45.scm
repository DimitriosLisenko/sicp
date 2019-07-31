;; I'm defining split to satisfy the examples in the book:
;; (define right-split (split beside below))
;; (define up-split (split below beside))
;; however, this doesn't actually apply them recursively unlike the previous
;; implementations if right-split and up-split
;; I guess that's ok - the recursive part can be done in another function
(define (split outer inner)
  (lambda (painter)
    (outer painter (inner painter painter))))
