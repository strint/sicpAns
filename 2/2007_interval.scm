(define (make-interval a b) (cons a b))
(define (upper-bound i) (car i))
(define (lower-bound i) (cdr i))
