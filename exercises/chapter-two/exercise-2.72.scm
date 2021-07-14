;; Let's say:
;; alphabet has n letters,
;; message has m such letters

;; speaking about encode-symbol only, for the least frequent symbol, you have to search lists of sizes n, n-1, n-2,...,1
;; => this is O(n^2)

;; this is then done for each letter in the message
;; => this is O(m*n^2)

;; this is assuming that the member operation compares elements inconstant time, which is not necessarily true

;; if we make a hash of letter => encoding, then it can become O(m) time complexity with O(n) space requirement
