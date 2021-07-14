;; since the weights are powers of 2, creating the tree from the minimum weights never surpasses a higher weight one
;; then, at each level of the tree, the branches are the largest power of 2 as the left branch, and the remaining powers of two as the right branch
;; therefore, the minimum number of bits is 1, and the maximum number of bits is (- n 1)
