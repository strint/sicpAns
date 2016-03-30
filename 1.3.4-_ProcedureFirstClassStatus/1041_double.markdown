# Question
Exercise 1.41.

# Answer
## Codes
```scheme
(define (double p)
  (lambda (x) (p (p x))))

(define (inc x)
  (+ x 1))

(define (incinc x)
  ((double inc) x))
```

## Running
```
1 ]=> (incinc 2)

;Value: 4

1 ]=> (incinc 5)

;Value: 7

1 ]=> (((double (double double)) inc) 5)

;Value: 21
```
