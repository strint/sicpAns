(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) <>)
              0
              coefficient-sequence)
