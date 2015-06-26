(define (split outer-op inner-op)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split outer-op inner-op) painter (- n 1)))) ; 有一点疑惑：这样的递归operation，如此定义是否正确
          (outer-op painter (inner-op smaller smaller))))))
(define right-split (split beside below))
(define up-split (split below beside))
