# Question
Exercise 2.21.

# Answer
## Codes
```scheme
(define (square-list1 items)
  (if (null? items)
    '()
    (cons (square (car items))
          (square-list1 (cdr items)))))
(define (square-list2 items)
  (map square items))
```

## Runnig
```
1 ]=> (square-list1 (list 1 2 3))

;Value 20: (1 4 9)

1 ]=> (square-list2 (list 1 2 3))

;Value 21: (1 4 9)
```
