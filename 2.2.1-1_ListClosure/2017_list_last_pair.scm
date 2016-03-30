(define (last-pair iterms)
  (define (last-iter iterms pre)
    (if (null? iterms)
      pre
      (last-iter (cdr iterms) (car iterms))))
  (last-iter iterms '()))

; test
(define l (list 1 2 3 4 5))
(define last (last-pair l))
