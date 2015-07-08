(define (new-if pred if-then if-else)
  (cond (pred if-then)
        (else if-else)))
