# Question
Exercise 2.18.

# Answer
## Codes
```scheme
(define (reverse-list l)
  (define (rev l new-l)
    (if (null? l)
      new-l
      (rev (cdr l) (cons (car l) new-l))))
  (rev l '()))
```

## Running
```
1 ]=> (reverse-list (list 1 2 3 4 5))

;Value 16: (5 4 3 2 1)
```
