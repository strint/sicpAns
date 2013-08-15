(define (sum-of-biggertwo x y z)
  (- (+ x y z)
     (little z 
	     (little x y))))

(define (little a b)
  (cond ((< a b) a)
	(else b)))
