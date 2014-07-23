# Question
Exercise 2.1.

# Answer
## Codes
```scheme
(define (make-rat n d)
  (if (< (* n d) 0)
     (cons (- (abs n)) (abs d))
     (cons (abs n) (abs d))))
```

## Running
```
1 ]=> (make-rat 1 2)

;Value 18: (1 . 2)

1 ]=> (make-rat -1 2)

;Value 19: (-1 . 2)

1 ]=> (make-rat 1 -2)

;Value 20: (-1 . 2)

1 ]=> (make-rat -1 -2)

;Value 21: (1 . 2)

```
