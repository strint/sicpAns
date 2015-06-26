(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                 (+ this-coeff
                    (* x higher-terms)))
              0
              coefficient-sequence))
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

; test
(define l1 (list 1 3 0 5 0 1))
