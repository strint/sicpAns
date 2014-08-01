;the rule is to get the biggest interval
(define (sub-interval x y)
  (make-interval (- (+ (lower-bound x) (lower-bound y)) (* 2 (max (lower-bound x) (lower-bound y))))
                 (- (+ (upper-bound x) (upper-bound y)) (* 2 (min (upper-bound x) (upper-bound y))))))
