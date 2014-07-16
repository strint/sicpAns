# Question
Exercise 1.40.

# Answer
## Codes
```scheme
(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) (* a x x) (* b x) c)))

(define (derive g)
  (define dx 0.00001)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
(define (newton-transform g)
  (lambda (x)
    (- x
       (/ (g x)
          ((derive g) x)))))
(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))
(define (newton-method g guss)
  (fixed-point (newton-transform g) guss))

(define (zero-cubic a b c)
  (newton-method (cubic a b c) 1))
```

## Running
``
1 ]=> (zero-cubic 0 0 27)

;Value: -2.9999999999999836
```
