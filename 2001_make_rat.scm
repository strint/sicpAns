(define (make-rat n d)
  (if (< 0.0 (* n d))
     (cons (- (abs n)) (abs d))
     (cons (abs n) (abs d))))
