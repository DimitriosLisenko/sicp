;; applicative-order (like Scheme)
;; (test 0 (p))
;; => (test 0 (p))
;; => (test 0 (p))
;; => infinite loop
;; normal-order (like Haskell I think?)
;; (test 0 (p))
;; => (if (= 0 0) 0 (p))
;; => (if #t 0 (p))
;; => 0

