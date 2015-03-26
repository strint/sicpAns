# Question
Exercise 2.66.

# Answer
有序二叉树的查找，时间复杂度为log(n)
## Codes
```scheme
; tree operater
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
; tree operater, end

(define (lookup key set)
  (cond ((null? set) #f)
        ((equal? key (entry set)) (entry set))
        ((< key (entry set)) (lookup key (left-branch set)))
        ((> key (entry set)) (lookup key (right-branch set)))))
```

## Running
```
1 ]=> (define t (list 7 (list 3 (list 1 '() '()) (list 5 '() '())) (list 9 '() (list 11 '() '()))))

;Value: t

1 ]=> t

;Value 12: (7 (3 (1 () ()) (5 () ())) (9 () (11 () ())))

1 ]=> (lookup 9 t)

;Value: 9

1 ]=> (lookup 3 t)

;Value: 3

1 ]=> (lookup 8 t)

;Value: #f
```

