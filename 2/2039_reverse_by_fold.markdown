# Question
Exercise 2.39.

# Answer
## Codes
```scheme
(define (reverse1 sequence)
  (fold-right (lambda (x y) (add-at-end x y)) '() sequence))
(define (add-at-end x seq)
  (define (cons-iter rest)
    (if (null? rest)
        (cons x '())
	(cons (car rest) (cons-iter (cdr rest)))))
  (cons-iter seq))
(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
```

## Running
```
1 ]=> (add-at-end 3 (list 1 2))

;Value 12: (1 2 3)

1 ]=> (reverse1 (list 1 2 3))

;Value 13: (3 2 1)

1 ]=> (reverse2 (list 1 2 3))

;Value 14: (3 2 1)
```
