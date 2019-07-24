(define x (list 1 2 3))
(define y (list 4 5 6))

;; append takes the elements of list x and shoves them before y
;; so I expect the result to be (1 2 3 4 5 6)
(append x y)

;; cons takes the single element x and appends it as an extra element to y
;; so I expect the result to be ((1 2 3) 4 5 6)
(cons x y)

;; list takes the elements given to it and makes a list out of them
;; so I expect the result to be ((1 2 3) (4 5 6))
(list x y)
