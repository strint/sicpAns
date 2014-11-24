(load "2051_below.scm")

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
(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
         (below bottom top))))
(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity rotate180 flip-vert)))
    (combine4 (corner-split painter n))))


