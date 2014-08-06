# Question
Exercise 2.17.

# Answer
## Codes
```scheme
(define (last-pair iterms)
  (define (last-iter iterms pre)
    (if (null? iterms)
      pre
      (last-iter (cdr iterms) (car iterms))))
  (last-iter iterms '()))

; test
(define l (list 1 2 3 4 5))
(define last (last-pair l))
```

## Running
```
1 ]=> l

;Value 13: (1 2 3 4 5)

1 ]=> last

;Value: 5
```
