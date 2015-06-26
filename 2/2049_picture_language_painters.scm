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
; the origin vector specifies the offset of the frame’s origin from some absolute origin in the plane, and the edge vectors specify the offsets of the frame’s corners from its origin.
; according to the implemtation of 'frame-coord-map', 'edge1-frame' and 'edge2-frame' return the corners' relative position to the origin
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
(define f1 (make-frame (make-vect -0.9 0.0) (make-vect 0.9 0.0) (make-vect 0.0 0.9) ))
(define f2 (make-frame (make-vect -0.9 -0.9) (make-vect 0.9 0.0) (make-vect 0.0 0.9)))
(define f3 (make-frame (make-vect 0.0 -0.9) (make-vect 0.9 0.0) (make-vect 0.0 0.9)))
