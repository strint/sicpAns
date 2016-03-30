(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (car set)) #t)
        ((< x (car set)) #f)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set2)
  (cond ((null? set2) (cons x set2))
        ((< x (car set2)) (cons x set2))
        ((= x (car set2)) set2)
        ((> x (car set2)) (cons (car set2) (adjoin-set x (cdr set2))))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
         (cond ((= x1 x2) (cons x1 (intersection-set (cdr set1) (cdr set2))))
               ((< x1 x2) (intersection-set (cdr set1) set2))
               ((> x1 x2) (intersection-set set1 (cdr set2)))))))

; 每次至少减少一个元素，所以时间复杂度为theta(n)
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((x1 (car set1)) (x2 (car set2)))
                (cond ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2))))
                      ((< x1 x2) (cons x1 (union-set (cdr set1) set2)));取小的
                      ((> x1 x2) (cons x2 (union-set set1 (cdr set2)))))))));取小的
