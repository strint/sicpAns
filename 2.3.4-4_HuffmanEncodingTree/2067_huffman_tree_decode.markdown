# Question
Exercise 2.67.

# Answer
## Codes
```scheme
; leaf
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf leaf)
  (cadr leaf))
(define (weight-leaf leaf)
  (caddr leaf))

; code tree
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

; decode
; bits is a list of 1s and 0s
(define (decode bits tree)
  (define (decode-1 bits current-branch) ;定义一个辅助函数的作用是为了保存完整的encode tree，当解码完一个字符后，再从encode tree的根节点开始解码下一个字符
    (if (null? bits)
        '()
        (let ((next-branch (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch) 
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit tree)
  (cond ((= bit 0) (left-branch tree))
        ((= bit 1) (right-branch tree))
        (else (error "bad bit: CHOOSE-BRANCH" bit))))

; prepare to construct code tree
; x is a tree, set is a set of trees arranged in incresing order of weight
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjon-set x (cdr set))))))

;这个方法用map把pair转成leaf后再做排序代码更清晰
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair) (cdr pair))
                    (make-leaf-set (cdr pairs))))))

; define a tree
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree (make-leaf 'B 2)
                                  (make-code-tree (make-leaf 'D 1)
                                                  (make-leaf 'C 1)))))

; define a coded massage
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
```

## Running
```
1 ]=> sample-tree

;Value 11: ((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8)

1 ]=> 'A

;Value: a

1 ]=> sample-message

;Value 12: (0 1 1 0 0 1 0 1 0 1 1 1 0)

1 ]=> (decode sample-message sample-tree)

;Value 13:(a d a b b c a) 
```

## Notes
* 勇气和毅力
