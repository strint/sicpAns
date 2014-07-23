(define (make-rat n d)
  (if (< (* n d) 0)
     (cons (- (abs n)) (abs d))
     (cons (abs n) (abs d))))
