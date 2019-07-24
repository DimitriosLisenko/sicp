(define (for-each f x)
  (cond ((null? x)
         true)
        (else
         (f (car x))
         (for-each f (cdr x)))))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))
