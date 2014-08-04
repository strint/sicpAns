# Question
Exercise 2.4.

# Answer
## Codes
```scheme
(define (make-interval a b)
  (cons a b))
(define (lower-bound i)
  (car i))
(define (upper-bound i)
  (cdr i))
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y)) (+ (upper-bound x) (upper-bound y))))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y)) (- (upper-bound x) (lower-bound y))))
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
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (make-center-percent c p)
  (let ((w (abs (* c p))))
    (make-interval (- c w) (+ c w))))
(define (percent i)
  (/ (width i) (center i)))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one (add-interval (div-interval one r1)
                                    (div-interval one r2)))))

; test
(define x (make-interval 1 3))
(define y (make-interval 2 5))
(define pa1 (par1 x y))
(define pa2 (par2 x y))
```

# Running
```
1 ]=> pa1

;Value 16: (.25 . 5.)

1 ]=> pa2

;Value 17: (.6666666666666666 . 1.875)
```
