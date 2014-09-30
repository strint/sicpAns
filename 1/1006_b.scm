(define (xysqrt in)
  (sqrt-iter 1.0 in))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (new-if pred if-then if-else)
  (cond (pred if-then)
        (else if-else)))

(define (improve g b)
  (/ (+ g
        (/ b g))
     2.0))

(define (good-enough? c d)
  (< (abs (- (square c)
             d))
     0.001))

(define (square x)
  (* x x))
