# Question
Exercise 2.9.

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
(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))
(define (width i)
  (* 0.5 (- (upper-bound i) (lower-bound i))))

;test
(define x (make-interval 1 3))
(define y (make-interval 2 5))
(define x+y (add-interval x y))
(define x-y (sub-interval x y))
(define x*y (mul-interval x y))
(define x/y (div-interval x y))
```
## Analysis
Assumption: x belongs to (a, b), y belongs to (c, d)
* sum of x and y belongs to (a+c, b+d), width of the sum belongs to ((b+d)-(a+c))/2 which equals (b-a)/2 + (d-c)/2 = (width x) + (width y)
* diff of x and y belongs to (a-d, b-c), width of the diff belongs to ((b-c)-(a-d))/2 which equals (b-a)/2 + (d-c)/2 = (width x) + (width y)
```
1 ]=> x

;Value 19: (1 . 3)

1 ]=> (width x)

;Value: 1.

1 ]=> y  

;Value 20: (2 . 5)

1 ]=> (width y)

;Value: 1.5

1 ]=> x+y 

;Value 21: (3 . 8)

1 ]=> (width x+y)

;Value: 2.5

1 ]=> x-y

;Value 22: (-4 . 1)

1 ]=> (width x-y)

;Value: 2.5

1 ]=> x*y

;Value 23: (2 . 15)

1 ]=> (width x*y)

;Value: 6.5

1 ]=> x/y

;Value 24: (.2 . 1.5)

1 ]=> (width x/y)

;Value: .65
```
