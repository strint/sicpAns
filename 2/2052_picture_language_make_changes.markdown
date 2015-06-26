# Question
Exercise 2.52.

# Answer
## Codes
```scheme
(load "2051_picture_language_below.scm")

; change painter-wave
(define (painter-wave2 frame)
  (let ((segment-list (list (make-segment 0.35 0.85 0.65 0.85) (make-segment 0 0.75 1 0.5) (make-segment 0.5 0.5 0.5 1) (make-segment 0.5 0.5 0.25 0) (make-segment 0.5 0.5 0.75 0))))
    ((segments->painter segment-list) frame)))

; change corner-split
(define (corner-split2 painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

; change square-limit
(define (square-limit2 painter n)
  (let ((combine4 (square-of-four identity flip-horiz flip-vert rotate180)))
    (combine4 (corner-split painter n))))
```

## Running
```
1 ]=> (painter-wave2 f0)

;Unspecified return value

1 ]=> ((corner-split2 painter-wave 3) f1)

;Unspecified return value

1 ]=> ((square-limit2 painter-wave 3) f2)

;Unspecified return value

```
测试结果如图：
<img src="2052_make_changes.png">

# Notes
* 这次比较顺利，虽然牵扯的代码比较多，但是采用了修改后就测试的方式，所以没有出现比较难找的bug
* 使用了'load'加载之前的代码，而不是复制过来
