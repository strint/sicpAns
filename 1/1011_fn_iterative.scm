(define (f n)
  (define (fi a b c k)
          (if (< k 3)
              c
              (fi b
                  c
                  (+ (* 3 a)
                     (* 2 b)
                     c)
                  (- k 1))))
  (if (< n 3)
      n
      (fi 0 1 2 n)))
    
