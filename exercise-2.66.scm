#lang sicp

;; (#%require racket/trace) ;; this is for debugging purposes and lets you trace a function call

(define (make-record key name)
  (list key name))
(define (record-key record)
  (car record))
(define non-existent-record '())

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define empty-record-database '())
(define (add-record-to-database record database)
  (cond ((null? database) (make-tree record '() '()))
        ((= (record-key record) (record-key (entry database))) database)
        ((< (record-key record) (record-key (entry database)))
         (make-tree (entry database)
                    (add-record-to-database record (left-branch database))
                    (right-branch database)))
        ((> (record-key record) (record-key (entry database)))
         (make-tree (entry database) (left-branch database)
                    (add-record-to-database record (right-branch database))))))
(define (get-record-from-database the-record-key database)
  (cond ((null? database) non-existent-record)
        ((= the-record-key (record-key (entry database))) (entry database))
        ((< the-record-key (record-key (entry database)))
         (get-record-from-database the-record-key (left-branch database)))
        ((> the-record-key (record-key (entry database)))
         (get-record-from-database the-record-key (right-branch database)))))



(define (lookup record-key database)
  (let ((record (get-record-from-database record-key database)))
    (if (equal? record non-existent-record)
        false
        record)))

;; wasn't quite sure how to incrementally add records and overwrite the previous database...
(define the-database
  (add-record-to-database
   (make-record 69 "jazz")
   (add-record-to-database
    (make-record 4 "crass")
    (add-record-to-database
     (make-record 8 "bass")
     (add-record-to-database
      (make-record 11 "ass")
      (add-record-to-database
       (make-record 1 "dima")
       empty-record-database))))))

;; (trace lookup)
;; (trace get-record-from-database)
;; (trace entry)
;; (trace record-key)
;; the bug was something silly - I have a function called record-key, and an argument called record-key as well - renamed it to the-record-key

(lookup 1 the-database)
(lookup 69 the-database)
(lookup 96 the-database)
