(define zero (lambda (f) (lambda (x) x))) ;turn f into procedure (lambda (x) x)
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x))))) ;'add' f to n

;(add-1 zero)
;(define one (add-1 zero))
;(define one (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))))
;(define one (lambda (f) (lambda (x) (f ((lambda (x) x) x)))))
(define one (lambda (f) (lambda (x) (f x))))

;(add-1 one)
;(define two (add-1 one))
;(define two (lambda (f) (lambda (x) (f ((one f) x)))))
;(define two (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x)))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define + (lambda (x y) (lambda (f) (lambda (x) ((x f) ((y f) x))))))

;test
(newline)
(define (inc x) (+ x 1))
(display ((zero inc) 0))
(newline)
(display ((one inc) 0))
(newline)
(display ((two inc) 0))
(newline)
(display (((+ one two) inc) 0))


