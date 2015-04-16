# Question
Exercise 2.72.

# Answer
## Codes
```
(define (encode-symbol symbol tree)
  (if (leaf? tree)
      (if (eq? symbol (symbol-leaf tree))
          '()
          (error "symbol is not in this encoding tree" symbol))
      (cond ((in-tree? symbol (left-branch tree))
             (cons 0 (encode-symbol symbol (left-branch tree))))
            ((in-tree? symbol (right-branch tree))
             (cons 1 (encode-symbol symbol (right-branch tree))))
            (else (error "symbol is not in this encoding tree" symbol)))))

(define (in-tree? symbol tree)
  (if (leaf? tree)
      (eq? symbol (symbol-leaf tree))
      (if (eq? (memq symbol (symbols tree)) #f)
          #f
          #t)))
```
'encode-symbol'的过程是一个在huffman树中查找符号的过程，每到一个节点，先判断是否是叶子节点如果不是则判断该去左子树还是去右子树接着找，这样查找的复杂度就与huffman树的高度相关。在判断位于哪个子树时，需要用memq进行顺序查找，这时复杂度与该子树包含的叶子节点树相关。以2.71中的n个符号的huffman树为例：
* 对于频率最最高的节点，如果先进行右子树的判断，则复杂度为O(1)；如果先进行左子树的判断，左子树包含除了频率最高的节点外的所有节点，查找失败后去查找右子树，复杂度为O(n);
* 对于频率最低的节点，该节点位于huffman树的最高层n-1层，在美一层的判断位于哪个子树时，安现在的实现，频率最低的在symbols的第一个，所以一次就可以查找到，这样，只需要一层一层往下查，经过n-1层就可以查到，所以复杂度是O(n);
