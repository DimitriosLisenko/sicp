(define (last-pair list)
  (cond ((= (length list) 0) (error "Empty list can not have last pair"))
        ((= (length list) 1) list)
        (else (last-pair (cdr list)))))
