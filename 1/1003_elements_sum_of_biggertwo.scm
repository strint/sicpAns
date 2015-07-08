(define (sum-of-biggertwo a b c)
  (- (+ a b c)
     (little a
             (little b c))))

(define (little x y)
  (if (< x y)
    x
    y))


