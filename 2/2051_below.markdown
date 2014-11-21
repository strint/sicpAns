# Question
Exercise 2.51.

# Answer
## Codes
```scheme
(load "2049_painters.scm")
(load "2050_flip_horiz.scm")
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
```

## Running
```
1 ]=> ((below2 painter-wave painter-wave) f0)

;Unspecified return value

1 ]=> ((below painter-wave painter-wave) f1)
```
结果如图：
<img src="2051_below.png">

## Notes
* 对于below2的原理不是很清楚，试出来的结果。
