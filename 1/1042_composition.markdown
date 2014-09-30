# Question
Exercise 1.42.

# Answer
## Codes
```scheme
(define (compose f g)
  (lambda (x) (f (g x))))
```

## Running
```
1 ]=> ((compose square inc) 6)

;Value: 49
```
