(define (pasc n k)
  (define (pasci high pos)
          (if (or (< high 3) (= pos 1) (= pos high))
              1
              (+ (pasci (- high 1) (- pos 1))
                 (pasci (- high 1) pos))))
  (pasci n k))
