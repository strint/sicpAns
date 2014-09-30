# Question
Exercise 2.4.

# Answer on car
## Codes
```scheme
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
```
## Analysis
(define z (cons x y))

(car z)
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) x y)
x

# Answer on cdr
## Codes
```scheme
(define (cdr z)
  (z (lambda (p q) q)))
```
