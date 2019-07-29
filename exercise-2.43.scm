;; his solution calculates queens for the (k-1)th column board-size times!
;; this means that it becomes a nested loop of depth board-size that calculates elements until board-size
;; so for a board of size 8 we just went from time T to time (8^8)T
