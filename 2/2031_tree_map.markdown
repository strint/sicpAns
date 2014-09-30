# Question
Exercise 2.31.

# Answer
## Codes
```scheme
(define (tree-map proc tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree)) (tree-map proc (cdr tree))))))
(define (square-tree t)
  (tree-map square t))

; test
(define tr (list 1 (list 2 (list 3 4) 5) (list 6 7)))
```

## Running
```
1 ]=> tr

;Value 14: (1 (2 (3 4) 5) (6 7))

1 ]=> (square-tree tr)

;Value 15: (1 (4 (9 16) 25) (36 49))
```
