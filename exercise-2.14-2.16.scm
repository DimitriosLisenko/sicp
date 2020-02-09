#lang sicp
(load "exercise-2.7+2.8.scm")
(load "exercise-2.12.scm")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))

(print-interval
 (par1
  (make-center-percent 100 5)
  (make-center-percent 50 2)))
;; [29.839743589743588, 37.1875]

(print-interval
 (par2
  (make-center-percent 100 5)
  (make-center-percent 50 2)))
;; [32.326388888888886, 34.32692307692307]

;; big yikes!

(print-percent-interval
 (par1
  (make-center-percent 100 5)
  (make-center-percent 50 2)))
;; 33.513621794871796 +/- 10.962343096234314%

(print-percent-interval
 (par2
  (make-center-percent 100 5)
  (make-center-percent 50 2)))
;; 33.326655982905976 +/- 3.0014025245441793%


(define a (make-center-percent 1000 5))
(define b (make-center-percent 2000 1))
(define c (make-center-percent 20 10))
(define d (make-center-percent 5000 5))
(define e (make-center-percent -10000 2))
(print-percent-interval (div-interval a a))
;; 1.0050125313283207 +/- 9.975062344139646%
(print-percent-interval (div-interval b b))
;; 1.000200020002 +/- 1.9998000199979968%
(print-percent-interval (div-interval a b))
;; .5003000300030003 +/- 5.997001499250369%
(print-percent-interval (div-interval c c))
;; 1.02020202020202 +/- 19.801980198019795%
(print-percent-interval (div-interval a c))
;; 50.75757575757575 +/- 14.925373134328357%
(print-percent-interval (div-interval b c))
;; 101.11111111111111 +/- 10.989010989010985%

(print-percent-interval (add-interval a a))
;; 2000 +/- 5%
(print-percent-interval (add-interval b b))
;; 4000 +/- 1%
(print-percent-interval (add-interval c c))
;; 40 +/- 10%
(print-percent-interval (add-interval a b))
;; 3000 +/- 7/3%
(print-percent-interval (add-interval a c))
;; 1020 +/- 260/51%
(print-percent-interval (add-interval b c))
;; 2020 +/- 110/101%
(print-percent-interval (sub-interval a b))
;; -1000 +/- 7%
(print-percent-interval (add-interval d e))
;; -5000 +/- 1%


;; right, so looks like:
;; - dividing adds the percentages
;; - adding adds the fractions of the original to the result multiplied by the percentage
;;   e.g. 2000 +/- 1% + 1000 +/- 5% leads to (2000 / 3000) * 1% + (1000 / 3000) * 5% = 7/3%
;;   e.g. 1000 +/- 5% - 2000 +/- 1% leads to (1000 / -1000) * 5% + (2000 / -1000) * 1% = -7% => 7%
;;   e.g. -10000 +/- 2% - -5000 +/- 5% leads to (-10000 / -5000) * 2% + (-5000 / -5000) * 5% = 9%
;; I'm guessing that multiplying is the same as dividing and subtracting is the same as adding in terms of what happens to the percentage
;; if that's the case, then the order in which things happen has an effect on the final result

;; gives same result...
(print-percent-interval (add-interval (div-interval a c) (div-interval b c)))
(print-percent-interval (div-interval (add-interval a b) c))

;; gives different result!
;; (define a (make-center-percent 1000 5))
;; (define c (make-center-percent 20 10))
(print-percent-interval a)
(print-percent-interval (div-interval (mul-interval a c) c))

;; this is the easiest counter-example - it shows that interval algebra is not the same as standard number algebra
;; I wish I studied maths at uni tbh... I don't really have the foundations required to analyse algebra. Will come back to this later!
