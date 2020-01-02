(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (enumerate-interval lower upper)
  (if (> lower upper)
      '()
      (cons lower (enumerate-interval (+ 1 lower) upper))))

;; EDIT 2020-01-02: I wrote an iterative process this time around
(define (enumerate-interval min max)
  (define (iter min max result)
    (if (> min max)
        result
        (iter min (- max 1) (cons max result))))
  (iter min max '()))

(define (ordered-triplets n)
  (flatmap
   (lambda (i)
     (flatmap
      (lambda (j)
        (map
         (lambda (k) (list i j k))
         (enumerate-interval 1 (- j 1))))
      (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

;; EDIT 2020-01-02: I changed my pretty-print style this time around
(define (ordered-triples n)
  (flatmap (lambda (i)
         (flatmap (lambda (j)
                (map (lambda (k) (list i j k))
                     (enumerate-interval 1 (- j 1))))
              (enumerate-interval 1 (- i 1))))
       (enumerate-interval 1 n)))

;; now that I think about it, this can also be written recursively
;; give me all the ordered triplets for (- n 1) and for reach one, generate the additional results that are obtained by adding n
;; the combination step is a bit weird though because e.g.
;; all (ordered-triplets 3) returns ((3 2 1))
;; so to get (ordered-triplets 4)
;; you substitute 4 in all possible locations
;; => ((3 2 1) (4 2 1) (3 4 1) (3 2 4))
;; that's kinda dodgy, so I won't implement it

(define (ordered-triplets-with-sum n s)
  (filter
   (lambda (triplet)
     (= s (fold-right + 0 triplet)))
   (ordered-triplets n)))
