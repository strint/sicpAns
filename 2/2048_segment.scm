(define (make-segment x1 y1 x2 y2)
  (cons (make-vect x1 y1) (make-vect x2 y2)))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))


(define (make-vect x y)
  (cons x y))
