(define (dot-product v w)
  (accumulate + 0 (map * v w)))


; test
(define m1 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define m2 (list (list 1 1 1 1) (list 2 2 2 2) (list 3 3 3 3)))
