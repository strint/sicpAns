; product
(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (factorial n)
  (define (te x)
    x)
  (define (ne x)
    (+ x 1))
  (product te 1 ne n)) 

(define (pi n)
  (define (te x)
    (/ (* (- x 1) (+ x 1))
       (* x x)))
  (define (ne x)
    (+ x 2))
  (* (product te 3 ne (+ n 2))
     4.0))
