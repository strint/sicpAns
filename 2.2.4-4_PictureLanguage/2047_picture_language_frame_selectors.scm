; origin-frame, edge1-frame, and edge2-frame
(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame1 f)
  (car f))
(define (edge1-frame1 f)
  (car (cdr f)))
(define (edge2-frame1 f)
  (car (cdr (cdr f))))

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
