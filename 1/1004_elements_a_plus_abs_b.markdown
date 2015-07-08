# Question
Exercise 1.4.

# Answer
## Codes
```scheme
(define (a-plus-abs-b a b)
  ((if (< b 0) - +) a b))
```

## Running
```
1 ]=> (load "1004_elements_a_plus_abs_b.scm")

;Loading "c01e04.scm"... done
;Value: a-plus-abs-b

1 ]=> (a-plus-abs-b 2 -1)

;Value: 3

1 ]=> (a-plus-abs-b 2 0)

;Value: 2

1 ]=> (a-plus-abs-b 2 1)

;Value: 3
```
