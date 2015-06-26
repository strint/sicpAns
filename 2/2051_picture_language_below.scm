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
