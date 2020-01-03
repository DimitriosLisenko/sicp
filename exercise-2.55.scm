;; (car ''abracadabra)
;; => (car (quote (quote abracadabra)))
;; EDIT 2020-01-02: the way it apparently works in the interpreter is that the FIRST occurrence of quote will quote the remaining object
;; therefore the OUTER quote quotes the INNER (quote abracadabra) list, such that it becomes a list of two *symbols*: quote and abracadabra
;; i.e. the inner quote is NOT quote the procedure, but is quote a symbol
;; => (car (quote abracadabra))
;; => quote
