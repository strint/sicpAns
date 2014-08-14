(define (square-tree t)
  (cond ((null? t) '())
        ((not (pair? t)) (square t))
        (else (cons (square-tree (car t)) (square-tree (cdr t))))))
(define (map2 proc items)
  (if (null? items)
    '()
    (cons (proc (car items))
          (map2 proc (cdr items)))))
(define (square-tree2 t)
  (map2 (lambda (sub-tree) 
          (if (not (pair? sub-tree))
            (square sub-tree) ;sequence operation
            (square-tree2 sub-tree))) ;recursion
        t))
; test
(define tr (list 1 (list 2 (list 3 4) 5) (list 6 7)))

