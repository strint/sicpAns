# Question
Exercise 1.35.

# Answer
x -> 1 + 1/x => x^2 - x - 1 = 0 => x = (1 +- 5^(1/2))/2
## Codes
```scheme
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))
(define (golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
```
## Running
```
1 ]=> (golden-ratio)

;Value: 1.6180327868852458

1 ]=> (/ (+ 1 (sqrt 5)) 2)

;Value: 1.618033988749895
```
