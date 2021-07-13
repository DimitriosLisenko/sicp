#lang sicp
;; a) the number of times p is applies is 5:
;; (sine 12.15)
;; (p (sine 4.05))
;; (p (p (sine 1.35)))
;; (p (p (p (sine 0.45))))
;; (p (p (p (p (sine 0.15)))))
;; (p (p (p (p (p (sine 0.05))))))
;;
;; b) in general, time and space requirement is the number of times p is applied,
;; which is the number of times n must be divided by 3 in order to be smaller than 0.1
;; division by 3 is equivalent to multiplication by (1/3)
;; n * (1/3) * (1/3) * (1/3) * ... m times ... * (1/3) <= 0.1
;; => n * (1/3)^m <= 0.1
;; => (1/3)^m <= 0.1 / n
;; => (1/3)^m <= 0.1 / n
;; => log3((1/3)^m) <= log3(0.1 / n)
;; => m*log3((1/3)) <= log3(0.1 / n)
;; note that log3(x) is the power to which 3 has to be raised to get x
;; => -m <= log3(0.1 / n)
;; => m >= -log3(0.1 / n)
;; => m >= log3(n / 0.1)
;; so the result is actually ceil(log3(n / 0.1))
;; this means that this function is Θ(log(n))
;;
;; and on a completely different note, writing this down in the terminal suchs actual balls
;; looks much better on paper
