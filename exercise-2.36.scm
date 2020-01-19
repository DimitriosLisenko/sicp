#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      (car seqs)
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

;; tricky dicky little thing I'm not meant to know about yet in the book:
;; sticking a quote before how the interpreter represents a list actually makes that list
;; commenting these out so I can include them in other files
;; (define s '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
;; (accumulate-n + 0 s)
