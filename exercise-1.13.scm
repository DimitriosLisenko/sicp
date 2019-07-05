;; note that φ and ψ both satisfy the equation x^2 = x + 1
;; true for n = 0 because (φ^0 - ψ^0) / root(5) = 0
;; true for n = 1 because (φ^1 - ψ^1) / root(5) = root(5) / root(5) = 1
;; now assume it's true for (n - 2) and (n - 1)
;; and prove that it's true for n
;; Fib(n) = Fib(n - 2) + Fib(n - 1) by definition
;; => Fib(n) = ((φ^(n - 1) - ψ^(n - 1)) / root(5)) + ((φ^(n - 2) - ψ^(n - 2)) / root(5))
;; => Fib(n) = (φ^(n - 2)(φ + 1) - ψ^(n - 2)(ψ + 1)) / root(5)
;; => Fib(n) = (φ^(n - 2)(φ^2) - ψ^(n - 2)(ψ^2)) / root(5)
;; => Fib(n) = (φ^n - ψ^n) / root(5)
;; QED
;;
;; How does this tie in to Fib(n) being the closest integer to ((φ^n) / root(5)) though?
;; looked up the solution online - it involves proving that (1/12) < ((ψ^n) / root(5)) < (1/2)
;; and hence that ((φ^n) / root(5)) rounds up to the integer that represents Fib(n)
