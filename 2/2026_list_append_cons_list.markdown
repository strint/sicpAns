# Question
Exercise 2.26.

# Answer
## Codes
```scheme
(define x (list 1 2 3))
(define y (list 4 5 6))

(define a (append x y))
(define c (cons x y))
(define l (list x y))
```

## Running
```
1 ]=> a

;Value 13: (1 2 3 4 5 6)

1 ]=> c

;Value 14: ((1 2 3) 4 5 6)

1 ]=> l

;Value 15: ((1 2 3) (4 5 6))
```

