;; so this is what I originally wanted to write for the reverse function conceptually:
;; go to the very end of the list, and then start appending it from backwards
;; except I wrote this function as a solution for exercise 2.20 as same-parity before using the parity check!
;; and was like whoops this actually reverses the list! WTF
(define (reverse x)
  (define (reverse-internal res curr)
    (if (null? curr)
        res
        (reverse-internal (cons (car curr) res) (cdr curr))))
  (reverse-internal (list) x))

(reverse (list))
(reverse (list 1))
(reverse (list 1 2))
(reverse (list 1 2 3))
(reverse (list 1 2 3 4))
(reverse (list 1 2 3 4 5))
