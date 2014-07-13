# Question
Exercise 1.31.

# Answer
## Codes
```scheme
(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (factorial n)
  (define (te x)
    x)
  (define (ne x)
    (+ x 1))
  (product te 1 ne n)) 

(define (pi n)
  (define (te x)
    (/ (* (- x 1) (+ x 1))
       (* x x)))
  (define (ne x)
    (+ x 2))
  (* (product te 3 ne (+ n 2))
     4.0))
```
## Running
```
1 ]=> (factorial 4)

;Value: 24

1 ]=> (factorial 5)

;Value: 120
```

```
1 ]=> (pi 10)

;Value: 3.2751010413348074

1 ]=> (pi 100)

;Value: 3.1570301764551676

1 ]=> (pi 1000)

;Value: 3.1431607055322663

1 ]=> (pi 10000)

;Value: 3.1417497057380523

1 ]=> (pi 100000)

;Aborting!: maximum recursion depth exceeded
```
