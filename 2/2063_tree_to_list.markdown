# Question
Exercise 2.63.

# Answer
* a. 两个方法得到的结果都一样，对于每个子树，都是左子树位于根节点左边，右子树位于根节点右边，所以对于一个递增排序二叉树而言，得到的结果刚好是对树中节点的一个递增的排序结果。图2.16中的树的结果都是(1 3 5 7 9 11)
* b. tree->list-1是一个广度优先的递归过程，tree->list-2是一个深度优先（右子树优先）的递归过程。假设树中有n个节点，把每次cons看作一个step，则两个递归过程都有n个cons，另外广度优先的过程还有n个append，这n个append，假设树的某层有x个节点，则这层的append相当于x/2个cons，可以发现，没层都是(n+1)/4次cons，共有((n+1)/4) * log2(n+1)次cons。所以tree->list-1的时间复杂度是theta(n * logn)，tree->list-2的时间复杂度是theta(n)，所以随节点数的增加，深度优先的过程所需要的步骤数增长得慢

## Codes
```scheme
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set) 
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (begin
        (display '+) ;每调用一次append、cons(append调用次数和cons相同)，显示一个+
        (append (tree->list-1 (left-branch tree))
                (cons (entry tree)
                    (tree->list-1 (right-branch tree)))))))
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (begin
        (display '+);每调用一次cons，显示一个+
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list))))))
  (copy-to-list tree '()))
```

## Running
```
1 ]=> (define t (list 7 (list 3 (list 1 '() '()) (list 5 '() '())) (list 9 '() (list 11 '() '()))))

;Value: t

1 ]=> t

;Value 12: (7 (3 (1 () ()) (5 () ())) (9 () (11 () ())))

1 ]=> (tree->list-1 t)
++++++
;Value 19: (1 3 5 7 9 11)

1 ]=> (tree->list-2 t)
++++++
;Value 20: (1 3 5 7 9 11)
```
