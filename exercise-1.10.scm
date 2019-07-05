;; (define (f n) (A 0 n))
;; => (define (f n) (* 2 n))
;; => computes 2 * n

;; (define (g n) (A 1 n))
;; => (define (g n) (A 0 (A 1 (n-1))))
;; => (define (g n) (A 0 (A 0 (A 1 (n-2)))))
;; => (define (g n) (A 0 (...(n-1 times) (A 1 (n - (n-1))))))
;; => (define (g n) (A 0 (...(n-1 times) (A 1 1))))
;; => (define (g n) (A 0 (...(n-1 times) 2)))
;; => computes 2^n

;; (define (h n) (A 2 n))
;; => (define (h n) (A 1 (A 2 (n-1)))
;; => (define (h n) (A 1 (A 1 (...(n-1 times) (A 2 (n - (n-1)))))))
;; => (define (h n) (A 1 (A 1 (...(n-1 times) (A 2 1)))))
;; => (define (h n) (A 1 (A 1 (...(n-2 times) (A 1 2)))))
;; => because (A 1 n) computes 2^n, this computes 2^2^... where the power is raised (n-1) times

;; (define (k n) (* 5 n n))
;; => computer 5 * n^2

;; (A 1 10) => 2^10 => 1024

;; (A 2 4) => 2^2^2^2 => 65536

;; (A 3 3)
;; => (A 2 (A 3 2))
;; => (A 2 (A 2 (A 3 1)))
;; => (A 2 (A 2 2))
;; => (A 2 4)
;; => 65536 as above

;; so...
;; 2 + 2 + 2 ... + 2 (n times) gives 2 * n (A 0 n)
;; 2 * 2 * 2 ... * 2 (n times) gives 2^n (A 1 n)
;; 2 ^ 2 ^ 2 ... ^ 2 (n times) gives some mathematical function (A 2 n), let's give it symbol &, so 2 & n
;; 2 & 2 & 2 ... & 2 (n times) gives some mathematical function (A 3 n)
;; e.g. (a 3 3) => (2 & 2 & 2) => (2 & (2 ^ 2)) => (2 & 4) => (2 ^ 2 ^ 2 ^ 2) => 65536
;; so the next iteration is 2 ^ 2 ^ 2 ... ^ 2 *65536 times*
;; and so on - each increment of x in (A x y) gives a new operator of sorts
;; pretty amazing stuff
;; this can be notated using Knuth's up-arrow notation: https://en.wikipedia.org/wiki/Knuth%27s_up-arrow_notation
