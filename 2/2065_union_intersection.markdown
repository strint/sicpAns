# Question
Exercise 2.65.

# Answer
## Codes
```scheme
; tree operater
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
; tree operater, end

; tree to list
;根据2.63，时间复杂度为theta(n)
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))
; tree to list, end

; ordered list set operation
; 根据2.61&2.62，时间复杂度为theta(n)
(define (intersection-set-ol set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
         (cond ((= x1 x2) (cons x1 (intersection-set-ol (cdr set1) (cdr set2))))
               ((< x1 x2) (intersection-set-ol (cdr set1) set2))
               ((> x1 x2) (intersection-set-ol set1 (cdr set2)))))))
; 根据2.61&2.62，时间复杂度为theta(n)
(define (union-set-ol set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((x1 (car set1)) (x2 (car set2)))
                (cond ((= x1 x2) (cons x1 (union-set-ol (cdr set1) (cdr set2))))
                      ((< x1 x2) (cons x1 (union-set-ol (cdr set1) set2)));取小的
                      ((> x1 x2) (cons x2 (union-set-ol set1 (cdr set2)))))))));取小的
; ordered list set operation, end

; ordered list to balanced tree
;根据2.64，时间复杂度为theta(n)
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
; ordered list to balanced tree, end

; balanced tree set operation
; tree->list-2:theta(n), union-set-ol & intersection-set-ol:theta(n), list->tree:theta(n)。所以总的时间复杂度为theta(n)
(define (op-set-bt operation tree1 tree2)
  (list->tree (operation
                (tree->list-2 tree1)
                (tree->list-2 tree2))))
(define (union-set-bt tree1 tree2)
  (op-set-bt union-set-ol tree1 tree2))
(define (intersection-set-bt tree1 tree2)
  (op-set-bt intersection-set-ol tree1 tree2))
; balanced tree set operation, end
```

## Running
```
1 ]=> (define t (list 7 (list 3 (list 1 '() '()) (list 5 '() '())) (list 9 '() (list 11 '() '()))))

;Value: t

1 ]=> t

;Value 12: (7 (3 (1 () ()) (5 () ())) (9 () (11 () ())))

1 ]=> (tree->list-2 t)

;Value 13: (1 3 5 7 9 11)

1 ]=> (define t2 (list->tree (list 2 4 5 8 9 10)))

;Value: t2

1 ]=> t2

;Value 18: (5 (2 () (4 () ())) (9 (8 () ()) (10 () ())))

1 ]=> (union-set-bt t t2)

;Value 19: (5 (2 (1 () ()) (3 () (4 () ()))) (9 (7 () (8 () ())) (10 () (11 () ()))))

1 ]=> (tree->list-2 (union-set-bt t t2))

;Value 20: (1 2 3 4 5 7 8 9 10 11)

1 ]=> (intersection-set-bt t t2)

;Value 21: (5 () (9 () ()))

1 ]=> (tree->list-2 (intersection-set-bt t t2))

;Value 22: (5 9)
```
## Notes
* 2.62 2.63 2.64 这三个习题的结果刚好可以为2.65所用，题目设计的真是巧妙
