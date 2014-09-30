# Question
Exercise 2.23.

# Answer
## Codes
```scheme
(define (for-each-i p l)
  (if (null? l)
    #t
    (begin (p (car l))
           (for-each-i p (cdr l)))))
```

## Running
```
1 ]=> (for-each-i (lambda (x) (display x)) (list 1 2 3))
123
;Value: #t
```
