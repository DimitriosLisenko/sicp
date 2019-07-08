;; This is technically correct, but she will be creating
;; huge intermediate numbers, which are not efficient to operate
;; on. This is because once they exceed what can fit inside 64 bits, they
;; are represented as an array.
