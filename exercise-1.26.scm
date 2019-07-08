;; by calling (* (...) (...) instead of (square (...)))
;; you're actually creating a binary tree of execution
;; instead of a straight line
;; this binary tree has depth log2(n)
;; and number of nodes 2^(depth) - 1 = 2^(log2(n)) - 1 = n - 1
;; therefore this algorith is now O(n) instead of O(log(n))
