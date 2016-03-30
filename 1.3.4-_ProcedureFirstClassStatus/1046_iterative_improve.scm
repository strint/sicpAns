(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
      guess
      ((iterative-improve good-enough? improve) (improve guess)))))

(define (sqrt2 x)
  (define (g? gs)
    (< (abs (- (square gs) x)) 0.001))
  (define (imp gs)
    (/ (+ gs (/ x gs)) 2))
  ((iterative-improve g? imp) 1))

(define (fixed-point2 imp first-guess)
  (define tolerance 0.00001)
  (define (g? gs)
    (< (abs (- gs (imp gs)))
       tolerance))
  ((iterative-improve g? imp) first-guess))

(define (sqrt3 x)
  (fixed-point2 (lambda (y) (/ (+ y (/ x y)) 2)) 1))
