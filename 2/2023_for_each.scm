(define (for-each-i p l)
  (if (null? l)
    #t
    (begin (p (car l))
           (for-each-i p (cdr l)))))
