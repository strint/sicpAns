# Question
Exercise 1.31.b.

# Answer
# Codes
```scheme
(define (product term a next b prod)
  (if (> a b)
    prod 
    (product term (next a) next b (* prod (term a)))

(define (factorial n)
  (define (te x)
    x)
  (define (ne x)
    (+ x 1))
  (product te 1 ne n 1)) 

(define (pi n)
  (define (te x)
    (/ (* (- x 1) (+ x 1))
       (* x x)))
  (define (ne x)
    (+ x 2))
  (* (product te 3 ne (+ n 2) 1)
     4.0))
```
# Running
```
1 ]=> (factorial 4)

;Value: 24

1 ]=> (factorial 5)

;Value: 120
```
```
1 ]=> (pi 100000)

;Value: 3.1416083612781764
```
