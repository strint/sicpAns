# Question
Exercise 2.28.

# Answer
## Codes
```scheme
(define (fringe l)
  (define (deep-first-cons left right leaves)
    (cond ((and (null? left) (null? right)) leaves) ;when left tree and right tree are all empty, all nodes are handled
          ((and (null? left) (not (null? right))) (deep-first-cons (car right) (cdr right) leaves)) ;when left tree is empty and the right tree is not empty, move (car right) to the left tree.
          (else (cond ((not (pair? (car left))) (deep-first-cons (cdr left) right (cons (car left) leaves))) ;when the (car left) is a leave, add it to the leaves, the left tree reduced to (cdr left), the right tree didn't change
                      (else (deep-first-cons (car left) (cons (cdr left) right) leaves)))))) ;when the (car left) is a list, make (car left) as the left tree, add (cdr left) to the right tree 
  (reverse (deep-first-cons (car l) (cdr l) '()))) ;reverse to get the result

; test
(define x (list (list 1 2) (list 3 4)))
(define y (list (list 4 5) (list 6 7)))
(define xy (list x y))
```

## Running
```
1 ]=> x

;Value 28: ((1 2) (3 4))

1 ]=> (fringe x)

;Value 29: (1 2 3 4)

1 ]=> y

;Value 32: ((4 5) (6 7))

1 ]=> (fringe y)

;Value 36: (4 5 6 7)

1 ]=> xy   

;Value 34: (((1 2) (3 4)) ((4 5) (6 7)))

1 ]=> (fringe xy)

;Value 35: (1 2 3 4 4 5 6 7)
```
