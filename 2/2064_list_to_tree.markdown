# Quesiton
Exercise 2.64.

# Answer
* a. partial-tree采用的是递归的思路，对于一个list，list的中间位置的值是树的根节点，根节点左边的子list是左子树，根节点的右边的子list是右子树，左右子树递归地调用partial-tree得到。本质上是根据升序list的中间位置找到每个子树的根节点来构建平衡二叉树。list (1 3 5 7 9 11)生成的树的结构如下：
```
     5
   /   \
  1     9
   \   / \
   3  7  11
```
* b. 根据a中的分析，每一步找到一个子树的根节点，则复杂度为theta(n)

## Codes
```scheme
(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(define (make-tree entry left right)
  (list entry left right))
```

## Running
```
1 ]=> (list->tree (list 1 3 5 7 9 11))

;Value 11: (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
```
