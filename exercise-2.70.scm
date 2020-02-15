#lang sicp

(#%require "exercise-2.68.scm")
(#%require "exercise-2.69.scm")


(define rock-music-pairs '((A 2) (GET 2) (SHA 3) (WAH 1) (BOOM 1) (JOB 2) (NA 16) (YIP 9)))
(define rock-music-huffman-tree (generate-huffman-tree rock-music-pairs))
(define rock-song '(GET A JOB
                        SHA NA NA NA NA NA NA NA NA
                        GET A JOB
                        SHA NA NA NA NA NA NA NA NA
                        WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
                        SHA BOOM))

(length
 (encode rock-song rock-music-huffman-tree)) ;; number of bits using Huffman encoding: 84

(*
 (/ (log (length rock-music-pairs)) (log 2))
 (length rock-song)) ;; number of bits using fixed-length encoding: 108
