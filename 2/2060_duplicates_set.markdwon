# Question
Exercise 2.60.

# Answer
相对与之前的实现：
* 因为集合中有重复元素，element-of-set?遍历第一个集合的次数会变多，遍历效率降低，这也导致intersection-set效率降低
* adjoin-set和union-set因为允许重复元素而可以直接合并，所以效率提高
* 暂时没想到允许重复元素的集合有什么应用场景
## Codes
```scheme
;不用改变
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set));直接加进来

(define (union-set set1 set2)
  (append set1 set2));直接合并

;不用改变
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
           (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))
```

## Running
```
1 ]=> (define s1 '( 1 2 3 2 1))

;Value: s1

1 ]=> (define s2 '(3 4 5 4 3))

;Value: s2

1 ]=> s1

;Value 12: (1 2 3 2 1)

1 ]=> s2

;Value 13: (3 4 5 4 3)

1 ]=> (element-of-set? '4 s1)

;Value: #f

1 ]=> (element-of-set? '3 s1)

;Value: #t

1 ]=> (adjoin-set '1 s1)

;Value 14: (1 1 2 3 2 1)

1 ]=> (union-set s1 s2)

;Value 15: (1 2 3 2 1 3 4 5 4 3)

1 ]=> (intersection-set s1 s2)

;Value 16: (3)
```
