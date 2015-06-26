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
