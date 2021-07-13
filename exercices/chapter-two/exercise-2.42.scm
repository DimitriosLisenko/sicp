#lang sicp
(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (enumerate-interval lower upper)
  (define (iter lower upper result)
    (if (> lower upper)
        result
        (iter lower (- upper 1) (cons upper result))))
  (iter lower upper '()))

(define (list-n-elements n element)
  (define (iter n element result)
    (if (<= n 0)
        result
        (iter (- n 1) element (cons element result))))
  (iter n element '()))

(define (map-only-nth-element f n list)
  (define (iter i list)
    (if (null? list)
        list
        (cons
         (if (= i n)
             (f (car list))
             (car list))
         (iter (+ i 1) (cdr list)))))
  (iter 0 list))

(define (queens board-size)
  (define empty-column
    (list-n-elements board-size false))
  (define empty-board
    (list-n-elements board-size empty-column))
  (define (adjoin-position row column board)
    (let
        ((column-with-queen
          (map-only-nth-element
           (lambda (_) true)
           (- row 1)
           empty-column)))
      (map-only-nth-element
       (lambda (_) column-with-queen)
       (- column 1)
       board)))
  (define (safe? column board)
    (define (row-of-queen column board)
      (define (iter row board-column)
        (if
         (car board-column) ;; BUG1: I previously wrote this as (= (car board-column) true) but this threw "The object #t, passed as the first argument to integer-equal?, is not the correct type."...
         row
         (iter (+ row 1) (cdr board-column))))
      (iter 1 (list-ref board (- column 1))))
    (let
        ((row
          (row-of-queen column board)))
      (define (safe-generic? row column next-row next-column)
        (cond ((or
                (< row 1)
                (> row board-size)
                (< column 1)
                (> column board-size))
               true)
              ((list-ref (list-ref board (- column 1)) (- row 1)) false)
              (else (safe-generic? (next-row row) (next-column column) next-row next-column))))
      (define safe-horizontally? (safe-generic? row (- column 1) (lambda (x) x) (lambda (x) (- x 1)))) ;; BUG2: I passed the decrementing lambda as the row-next instead of column-next
      (define safe-diagonally-upwards? (safe-generic? (- row 1) (- column 1) (lambda (x) (- x 1)) (lambda (x) (- x 1))))
      (define safe-diagonally-downwards? (safe-generic? (+ row 1) (- column 1) (lambda (x) (+ x 1)) (lambda (x) (- x 1))))
      (and safe-horizontally? safe-diagonally-upwards? safe-diagonally-downwards?)))
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;; so I got two bugs when writing this function (documented above as BUG1 and BUG2)
;; they were really annoying to find because I couldn't find any decent debugging tools (e.g. backtrace)
;; what I did find was:
;; pp - pretty prints a value
;; trace - you pass it a function that's in scope and it shows you every time it calls it with what arguments and what the return values are
;; the output of trace is a bit cryptic, for example:
;;      [Entering #[compound-procedure 2 safe?]
;;                Args: 8
;;                ((#f #f #f #f #f #f #f #t) (#f #f #f #f #f #t #f #f) (#f #f #f #t #f #f #f #f) (#f #t #f #f #f #f #f #f) (#f #f #f #f #f #f #t #f) (#f #f #f #f #t #f #f #f) (#f #f #t #f #f #f #f #f) (#t #f #f #f #f #f #f #f))]
;;      [#f
;;       <== #[compound-procedure 2 safe?]
;;       Args: 8
;;       ((#f #f #f #f #f #f #f #t) (#f #f #f #f #f #t #f #f) (#f #f #f #t #f #f #f #f) (#f #t #f #f #f #f #f #f) (#f #f #f #f #f #f #t #f) (#f #f #f #f #t #f #f #f) (#f #f #t #f #f #f #f #f) (#t #f #f #f #f #f #f #f))]
;; what that means is the Entering part is when a function is entered with what args
;; then [#f is the return value of the function
;; and then it repeats itself again after <== to say which function did that return, presumably for recursive functions so you can match them
;; anyway, a backtrace would be *really* useful, but I couldn't find it yet

;; also I seem to be running out of stack (and memory when running with mit-scheme --stack 10000) when running for board-size > 10
;; we could do a pretty massive space optimization by storing the board as a list of n numbers (where n is the board-size and each number is the row on which the queen is placed)
