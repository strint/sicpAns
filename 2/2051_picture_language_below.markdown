# Question
Exercise 2.51.

# Answer
## Codes
```scheme
(load "2049_picture_language_painters.scm")
(load "2050_picture_language_flip_horiz.scm")
(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-down
            (transform-painter
              painter1
              (make-vect 0.0 0.0)
              (make-vect 1.0 0.0)
              split-point))
          (paint-up
            (transform-painter
              painter2
              split-point
              (make-vect 1.0 0.5)
              (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-down frame)
        (paint-up frame)))))
(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
            (transform-painter
              painter1
              (make-vect 0.0 0.0)
              split-point
              (make-vect 0.0 1.0)))
          (paint-right
            (transform-painter
              painter2
              split-point
              (make-vect 1.0 0.0)
              (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))
(define (below2 painter1 painter2)
  (lambda (frame)
    ((flip-ccw90 (beside (flip-ccw270 painter1) (flip-ccw270 painter2))) frame)))

; test corner-split
(load "2045_split.scm")
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))
; test square-limit
(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity rotate180 flip-vert)))
    (combine4 (corner-split painter n))))
(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
         (below bottom top))))
```

## Running
```
1 ]=> ((below2 painter-wave painter-wave) f0)

;Unspecified return value

1 ]=> ((below painter-wave painter-wave) f1)
```
结果如图：
<img src="2051_picture_language_below.png">

```
1 ]=> ((flip-ccw90 (beside (flip-ccw270 painter-wave) (flip-ccw270 painter-wave))) f0)

;Unspecified return value

1 ]=> ((flip-ccw90 (beside painter-wave painter-wave)) f1)

;Unspecified return value

1 ]=> ((flip-ccw90 painter-wave) f2)

;Unspecified return value

1 ]=> (painter-wave f3)

;Unspecified return value
```
对'below2'原理的测试，结果如图：
<img src="2051_picture_language_below2.png">
通过对'transform-painter'的分析可知，'((painter-op painter) frame)'这样的结构，运算过程实际上可以看作是'(painter (painter-op frame))'，即转换'painter'的输入参数完成的。

按照这种分析，那么'below2'的替换过程如下：
```
((flip-ccw90 (beside (flip-ccw270 painter-x) (flip-ccw270 painter-y))) f0)

((beside (flip-ccw270 painter-x) (flip-ccw270 painter-y)) (FLIP-CCW90 f0)) 

(
 ((flip-ccw270 painter-x) (BESIDE-LEFT (FLIP-CCW90 f0)))
 ((flip-ccw270 painter-y) (BESIDE-RIGHT (FLIP-CCW90 f0)))
)

(
 (painter-x (FLIP-CCW270 (BESIDE-LEFT (FLIP-CCW90 f0))))
 (painter-y (FLIP-CCW270 (BESIDE-RIGHT (FLIP-CCW90 f0))))
)
```
```
1 ]=> ((corner-split painter-wave 4) f0)
```
测试'corner-split'，结果如图：
<img src="2051_picture_language_below_corner.png">

```
1 ]=> ((square-limit painter-wave 3) f0)

;Unspecified return value
```
测试'square-limit'，结果如图：
<img src="2051_picture_language_square_limit.png">

## Notes
* 对于below2的原理不是很清楚，试出来的结果。现在知道原理了:叠加operation，这里是通过修改叠加修改输入的frame实现的(闭包：修改frame得到一个新的frame，而这个frame是operation的参数)。
