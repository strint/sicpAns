# Question
Exercise 1.8.: Newton's method for cube roots

# Answer
## Codes
```scheme
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
```

## Running
### Test of very small numbers
```
    1 ]=> (load "1008_cube_roots.scm")
    
    ;Loading "1008_cube_roots.scm"... done
    ;Value: cube-roots-test
    
    1 ]=> (cube-roots-test 0.1 5)
    1.0000000000000002e-3
    .1
    .10000000000000005
    
    1.0000000000000007e-9
    1.0000000000000002e-3
    1.0000000000009621e-3
    
    1.0000000000000022e-27
    1.0000000000000007e-9
    1.0000000000037852e-9
    
    1.0000000000000065e-81
    1.0000000000000022e-27
    1.0000000001554544e-27
    
    1.0000000000000195e-243
    1.0000000000000065e-81
    1.0000000000003848e-81
    
    ;Floating-point underflow
    ;To continue, call RESTART with an option number:
    ; (RESTART 1) => Return to read-eval-print level 1.
```

### Test of very large numbers
```
    1 ]=> (cube-roots-test 2 5)
    8
    2
    2.000000000012062
    
    512
    8
    8.00000003355707
    
    134217728
    512
    512.0000000007934
    
    2417851639229258349412352
    134217728
    134217729.04449657
    
    14134776518227074636666380005943348126619871175004951664972849610340958208
    2417851639229258349412352
    2.417851639305756e24
    
    2824013958708217496949108842204627863351353911851577524683401930862693830361198499905873920995229996970897865498283996578123296865878390947626553088486946106430796091482716120572632072492703527723757359478834530365734912
    14134776518227074636666380005943348126619871175004951664972849610340958208
    ;Floating-point overflow
    ;To continue, call RESTART with an option number:
    ; (RESTART 1) => Return to read-eval-print level 1.
```    
