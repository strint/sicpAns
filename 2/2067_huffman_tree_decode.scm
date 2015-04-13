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
  (if (null? bits)
      '()
      (let ((next-branch (choose-branch (car bits) tree)))
        (if (leaf? next-branch)
            (cons (symbol-leaf next-branch) 
                  (decode (cdr bits) tree))
            (decode (cdr bits) next-branch)))))
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
