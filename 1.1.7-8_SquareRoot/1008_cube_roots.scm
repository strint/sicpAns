(define (cube-roots in)
  (cube-roots-iter 1.0 in in))

(define (cube-roots-iter guess pre-guess x)
  (if (good-enough? guess pre-guess)
      guess
      (cube-roots-iter (improve guess x) guess x)))

(define (improve g x)
  (/ (+ (/ x (* g g))
        (* 2 g))
     3))

;使用前后两次计算结果的变化率不超过0.0001来作为证明计算结果达到精度的条件
(define (good-enough? guess pre-guess)
  (< (/ (abs (- guess pre-guess))
        pre-guess)
     0.0001))

(define (cube-roots-test num test-times)
  (begin (display (* num num num)) (newline) (display num) (newline) (display (cube-roots (* num num num))) (newline) (newline)
         (if (> test-times 0)
           (cube-roots-test (* num num num) (- test-times 1))
           (display test-times))))
