# Question
Exercise 2.38.

# Answer
## Codes
```scheme
(define (fold-left2 op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))
(define (fold-right2 op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
	(iter (op (last rest) result)
	      (except-last rest))))
  (iter initial sequence))
(define (last seq)
  (if (null? (cdr seq))
      (car seq)
      (last  (cdr seq))))
(define (except-last seq)
  (define (iter result rest)
    (if (null? (cdr rest))
        result
	(iter (cons (car rest) result) (cdr rest))))
  (reverse (iter '() seq)))
```

## Runnig
```
1 ]=> (fold-right / 1 (list 1 2 3))

;Value: 3/2

1 ]=> (fold-right2 / 1 (list 1 2 3))

;Value: 3/2

1 ]=> (fold-left / 1 (list 1 2 3))

;Value: 1/6

1 ]=> (fold-left2 / 1 (list 1 2 3))

;Value: 1/6

1 ]=> (fold-right list '() (list 1 2 3))

;Value 11: (1 (2 (3 ())))

1 ]=> (fold-right2 list '() (list 1 2 3))

;Value 23: (1 (2 (3 ())))

1 ]=> (fold-left list '() (list 1 2 3))

;Value 24: (((() 1) 2) 3)

1 ]=> (fold-left2 list '() (list 1 2 3))

;Value 12: (((() 1) 2) 3)
```

## Analysis
The operation should satisfy associative laws.
