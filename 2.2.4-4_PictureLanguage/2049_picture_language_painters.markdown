# Question
Exercise 2.49.

# Answer
## Codes
```scheme
; painters
; a. the outline
(define (painter-outline frame)
  (let ((segment-list (list (make-segment 0 0 0 1) (make-segment 0 0 1 0) (make-segment 0 1 1 1) (make-segment 1 0 1 1))))
    ((segments->painter segment-list) frame)))
; b. the x
(define (painter-x frame)
  (let ((segment-list (list (make-segment 0 1 1 0) (make-segment 0 0 1 1))))
    ((segments->painter segment-list) frame)))
; c. the diamond
(define (painter-diamond frame)
  (let ((segment-list (list (make-segment 0 0.5 0.5 0) (make-segment 0 0.5 0.5 1) (make-segment 0.5 0.0 1.0 0.5) (make-segment 1 0.5 0.5 1))))
    ((segments->painter segment-list) frame)))
; d. the wave
(define (painter-wave frame)
  (let ((segment-list (list (make-segment 0 0.75 1 0.5) (make-segment 0.5 0.5 0.5 1) (make-segment 0.5 0.5 0.25 0) (make-segment 0.5 0.5 0.75 0))))
    ((segments->painter segment-list) frame)))

; painter maker
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line ((frame-coord-map frame) (start-segment segment)) 
                   ((frame-coord-map frame) (end-segment segment))))
      segment-list)))

; draw-line
(define device (make-graphics-device (car (enumerate-graphics-types))))
(define (draw-line v1 v2)
        (graphics-draw-line device (xcor-vect v1) (ycor-vect v1) (xcor-vect v2) (ycor-vect v2))
        ; (graphics-close device)
        )

; map 将在frame中坐标map到标准的直角坐标系中
(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
      (origin-frame frame)
      (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
                (scale-vect (ycor-vect v) (edge2-frame frame))))))

; frame
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin-frame f)
  (car f))
(define (edge1-frame f)
  (car (cdr f)))
(define (edge2-frame f)
  (cdr (cdr f)))

; segment
(define (make-segment x1 y1 x2 y2)
  (cons (make-vect x1 y1) (make-vect x2 y2)))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

; vector
(define (make-vect x y)
  (cons x y))
(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cdr v))
(define (add-vect v1 v2)
  (cons (+ (car v1) (car v2))
        (+ (cdr v1) (cdr v2))))
(define (sub-vect v1 v2)
  (cons (- (car v1) (car v2))
        (- (cdr v1) (cdr v2))))
(define (scale-vect s v)
  (cons (* s (car v)) (* s (cdr v))))

;frame f0
(define f0 (make-frame (make-vect 0.0 0.0) (make-vect 0.9 0.0) (make-vect 0.0 0.9))) ; 这个语句必须放在make-vecct定义之后，因为scheme是解释性语言，并且这个语言会被直接evaluate，如果放在make-vect定义之前，就会报错说make-vect无定义
```

## Running
```
1 ]=> (load "2049_painters.scm")

;Loading "2049_painters.scm"...
;  Loading "/usr/lib/mit-scheme-i386/lib/prx11.so"... done
;... done
;Value: scale-vect

1 ]=> (painter-outline f0)

;Unspecified return value

1 ]=> (painter-x f0)

;Unspecified return value

1 ]=> (painter-diamond f0)

;Unspecified return value
```
画出outline、x、diamond，如图：
<img src="2049_picture_language_painters_o_x_d.png">

```
1 ]=> (load "2049_painters.scm")

;Loading "2049_painters.scm"...
;  Loading "/usr/lib/mit-scheme-i386/lib/prx11.so"... done
;... done
;Value: scale-vect

1 ]=> (painter-wave f0)

;Unspecified return value
```
画出wave，如图：
<img src="2049_picture_language_painters_wave.png">

## Notes
* 在draw-line这个部分花费了很多时间，之前一直画出的图缺几条线，开始以为是输入的数据有问题，就修改输入数据测试，还是不行；最后写了一个draw-line的例子测了一下，才知道enumerate-graphics-type是什么样子，之前的一些线可能画到device外面去了，发现graphics-draw-line的参数顺序跟我之前认为的好像不一样，然后又读了下官方的graphics-draw-line文档，才发现的确把参数的顺序输入错了。然后调整了一下frame f0的大小，修改了graphics-draw-line的参数输入顺序，就得到想要的结果了。
