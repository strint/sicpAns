(define (reverse-list l)
  (define (rev l new-l)
    (if (null? l)
      new-l
      (rev (cdr l) (cons (car l) new-l))))
  (rev l '()))



