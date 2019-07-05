;; assume that the total number of change is n
;; space complexity:
;; the deepest branch is the one where you use just 1 cent coins to make up n
;; this means that space complexity is Θ(n)
;; or more generally, Θ(n / smallest-coin-denomination)
;;
;; time complexity:
;; I'm not too sure how to analyze the time requirement here at the moment
;; one approach which I found online is to see that
;; (cc n 1) yields (2n + 1) nodes => Θ(n)
;; (cc n 2) yields floor(n / 5) levels, each with a (cc n 1) node => Θ(n^2)
;; (cc n 3) yields floor(n / 10) levels, each with a (cc n 2) node => Θ(n^3)
;; ...
;; (cc n k) is Θ(n^k)
;; note that the denomination of the coins themselves doesn't matter
;; so this algorithm is monstrously inefficient
;; grows exponentially with the number of allowed denomination of coins
;; grows polynomially with the total number of change
;; in hindsight, should have spent a bit more time on it, I could have figured it out
