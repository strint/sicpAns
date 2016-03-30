;Alyssa's interval arithmetic is to represent the range of possible value of inexact quantities, so when we asumming the range of x is (a, b), the range of y is (c, d), the range of x-y is (a-d, b-c)
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
