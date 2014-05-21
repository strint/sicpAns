(define (xysqrt in)
  (sqrt-iter 1.0 in))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve g b)
  (/ (+ g
        (/ b g))
     2.0))

(define (good-enough? c d)
  (< (abs (- (square c)
             d))
     0.001))

(define (square x)
  (* x x))

;num 表示初始值，test-times表示进行test-times次测试,每次测试将num平方作为新的num
;每进行一次测试，先显示num的平方，然后显示num最后显示xysqrt对num的平方进行的开方操作
(define (sqrt-test num test-times)
  (begin (display (* num num)) (newline) (display num) (newline) (display (xysqrt (* num num))) (newline) (newline)
         (if (> test-times 0)
           (sqrt-test (* num num) (- test-times 1))
           num)))

