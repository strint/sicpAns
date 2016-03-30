(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (newline) (display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (xx)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2))

(define (xx-a) ;using average damping
  (fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 2))
