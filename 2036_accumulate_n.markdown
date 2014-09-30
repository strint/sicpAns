# Question
Exercise 2.36.

# Answer
## Codes
```scheme
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (first seqs))
            (accumulate-n op init (rest seqs)))))
(define (first seqs)
  (if (null? seqs)
      '()
      (cons (car (car seqs))
            (first (cdr seqs)))))
(define (rest seqs)
  (if (null? seqs)
      '()
      (cons (cdr (car seqs))
            (rest (cdr seqs)))))
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

; test
(define l (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
```

## Running
```
1 ]=> l

;Value 14: ((1 2 3) (4 5 6) (7 8 9) (10 11 12))

1 ]=> (first l)

;Value 15: (1 4 7 10)

1 ]=> (rest l)

;Value 16: ((2 3) (5 6) (8 9) (11 12))

1 ]=> (accumulate-n + 0  l)

;Value 17: (22 26 30)
```
