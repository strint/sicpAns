(define (xysqrt in count)
  (sqrt-iter 1.0 in count))

(define (sqrt-iter guess x count)
  (begin (display count) (newline) (display guess) (newline) (display (- (square guess) x)) (newline) (newline)
         (if (good-enough? guess x)
                 guess
                 (sqrt-iter (improve guess x) x (+ count 1)))))

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
