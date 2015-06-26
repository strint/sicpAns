(define (make-interval a b)
  (cons a b))
(define (lower-bound i)
  (car i))
(define (upper-bound i)
  (cdr i))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (width i)
  (* 0.5 (- (upper-bound i) (lower-bound i))))
(define (div-interval x y)
  (if (= (width y) 0)
    (display "the width of the denominator is 0")
    (mul-interval x
                  (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

; test
(define x (make-interval 1 3))
(define y (make-interval 5 5)) ; the width of y is 0


