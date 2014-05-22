(define (xysqrt in)
  (sqrt-iter 1.0 in in))

(define (sqrt-iter guess pre-guess x)
  (if (good-enough? guess pre-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (improve g b)
  (/ (+ g
        (/ b g))
     2.0))

;使用前后两次计算结果的变化率不超过0.0001来作为证明计算结果达到精度的条件
(define (good-enough? guess pre-guess)
  (< (/ (abs (- guess pre-guess))
        pre-guess)
     0.0001))

(define (sqrt-test num test-times)
  (begin (display (* num num)) (newline) (display num) (newline) (display (xysqrt (* num num))) (newline) (newline)
         (if (> test-times 0)
           (sqrt-test (* num num) (- test-times 1))
           (display test-times))))
