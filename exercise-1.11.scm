;; recursive procedure
(define (i n)
  (cond ((< n 3) n)
        (else (+ (i (- n 1)) (* 2 (i (- n 2))) (* 3 (i (- n 3)))))))

;; iterative procedure
(define (j n)
  (if (< n 3)
      n
      (j-iter 0 1 2 3 n)))

(define (j-iter ppp pp p counter n)
  (if (> counter n)
      p
      (j-iter pp p (+ (* 3 ppp) (* 2 pp) p) (+ counter 1) n)))
