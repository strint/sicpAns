# Question
Exercise 2.59.

# Answer
set1中的元素不在set2中时，将该元素加入set2，最后得到的set2就是所求的并集
## Codes
```scheme
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2)
           (union-set (cdr set1) set2))
        (else (union-set (cdr set1) (cons (car set1) set2)))))
```

## Running
```
1 ]=> (union-set '(1 2 3) '(3 4 5))

;Value 11: (2 1 3 4 5)
```
