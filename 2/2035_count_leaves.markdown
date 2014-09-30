# Question
Exercise 2.35.

# Answer
## Codes
```scheme
(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x) 1) (enumerate-tree t))))
(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

;test
(define l1 (list 1 2 (list 3 4 5)))
```

## Running
```
1 ]=> l1

;Value 17: (1 2 (3 4 5))

1 ]=> (count-leaves l1)

;Value: 5
```
