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
pa1 doesn't equal pa2, so Lem is right.

```
1 ]=> x 

;Value 15: (1 . 3)

1 ]=> y

;Value 16: (2 . 5)


1 ]=> (define x/y (div-interval x y))

;Value: x/y

1 ]=> x/y

;Value 17: (.2 . 1.5)

1 ]=> (center x/y)

;Value: .85

1 ]=> (percent x/y)

;Value: .7647058823529412


1 ]=> (define x/x (div-interval x x))

;Value: x/x

1 ]=> x/x

;Value 18: (.3333333333333333 . 3.)

1 ]=> (center x/x)

;Value: 1.6666666666666667

1 ]=> (percent x/x)

;Value: .7999999999999999


1 ]=> (define y/y (div-interval y y))

;Value: y/y

1 ]=> y/y

;Value 19: (.4 . 2.5)

1 ]=> (center y/y)

;Value: 1.45

1 ]=> (percent y/y)

;Value: .7241379310344828


1 ]=> (define c (make-center-percent 1 0.001))

;Value: c

1 ]=> c

;Value 20: (.999 . 1.001)

1 ]=> (center c)  

;Value: 1.

1 ]=> (percent c)

;Value: 9.999999999999454e-4


1 ]=> (define c/c (div-interval c c))

;Value: c/c

1 ]=> c/c

;Value 22: (.9980019980019982 . 1.002002002002002)

1 ]=> (center c/c)

;Value: 1.000002000002

1 ]=> (percent c/c)

;Value: 1.999998000001888e-3


1 ]=> (define d (make-center-percent 2 0.003))

;Value: d

1 ]=> d

;Value 23: (1.994 . 2.006)


1 ]=> (define d/d (div-interval d d))

;Value: d/d

1 ]=> (center d/d)

;Value: 1.0000180001620016

1 ]=> (percent d/d)

;Value: 5.999946000485912e-3


1 ]=> (define c/d (div-interval c d))

;Value: c/d

1 ]=> (center c/d)

;Value: .5000060000540005

1 ]=> (percent c/d)

;Value: 3.999988000035889e-3

```
We can see that when the width of interval I1 and I2 is small, center of I1/I1 and I2/I2 is almost 1, I1/I2 almost equals (center I1)/(center I2).
But when the width of I1 and I2 is quite big, the rules above do not exist.
When R1R2/(R1+R2) = 1/(1/R1+1/R2), R1/R1 and R2/R2 need to be 1, but this is not true when the width of R1 and R2 are big.
