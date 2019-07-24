(define x (list 1 3 (list 5 7) 9))
(define y (list (list 7)))
(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(car (cdr (car (cdr (cdr x)))))
(car (car y))
(cadr (cadr (cadr (cadr (cadr (cadr z))))))

;; cadr is required because:
;; (cons 1 (cons 2 (list))) => (1 2)
;; (cons 1 (cons (cons 2 (list)) ()) => (1 (2))
;; also:
;; (list 1 2) => (1 2)
;; (list 1 (list 2)) => (1 (2))
;; also
;; (list 1 2) => (cons 1 (cons 2 ()))
;; (list 1 (list 2)) => (cons 1 (cons (list 2) ())) => (cons 1 (cons (cons 2 ()) ()))
