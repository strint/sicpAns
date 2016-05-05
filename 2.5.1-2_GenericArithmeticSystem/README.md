# 一个支持泛型的算数系统
> I'm the **type** of person, I have to study to get an A on the test.
    Taylor Swift 泰勒·斯威夫特

> If my doctor told me I had only six minutes to live, I wouldn't brood. I'd **type** a little faster.
    Isaac Asimov 艾萨克·阿西莫夫

同样的内容，加上不同的类型（type），就变成了不同的东西。所以可以使用类型，利用简单的东西构造复杂的东西。

下面是利用类型来构造一个支持泛型的算数系统。

## 支持泛型的算数系统

数学中常见的数有整数、小数、有理数、实数、虚数、复数等。为了简化，实现了整数、有理数（分数）、实数、复数四种数的泛型运算。

程序是用scheme实现的。scheme是一种lisp的方言，来自MIT的一种函数式编程语言。scheme中的数字被叫做scheme-number，有自己的加减乘除等运算。系统使用scheme-number加类型标签（type-tag）的方式来表示四种数，并使用scheme-number的运算来构建带类型标签的数的运算。

如下依次是整数1、有理数3/2、实数0.40794577223746264、复数4+5i：
```
(integer . 1.)
(rational 3 . 2)
(real . .40794577223746264)
(complex rectangular (integer . 4) integer . 5)
```

系统的结构如下：
* 利用scheme-number加类型标签来构建整数、有理数、实数，利用整数、有理数、实数来构建复数。
* 利用raise、project来实现类型转换，利用raise-n、drop实现多次类型转换
* 利用scheme-number的算数运算来实现新类型的算数运算
* 利用类型转换将不同类型转换到同一类型来实现不同类型的算数运算

```
; ***************Generic arithmetic system structure*************
;                                                                                                                                      
;                                +-----------------------------+          
;                                | complex(reatangular/polar)  |<-------+            \                                 \                   \      
;                                |-----------------------------|        |            |                                 |                   |
;                                | make-complex-from-real-imag |        |            |                                 |                   |
;                                | make-complex-from-mag-ang   |        |            |                                 |                   |
;                                |-----------------------------|        |            |                                 |                   |
;                                |                             |        |            |                                 |                   |
;                                +-----------------------------+        |            |                                 |                   |
;                                             /\  ||                    |      +-----------+                     +-----------+       +-----------+
;                                      raise  ||  || project            |      | add       |                     | type-tag  |       | raise-n   |
;                                             ||  \/                    |      | sub       |                     | contents  |       | drop      |
;                                +-----------------------------+        |      | mul       |          \          |           |       |           |
;                       +------->| real                        |------->|      | div       |          |          |           |       |           |
;                       |        |-----------------------------|        |      | equ?      |          |          |           |       |           |
;                       |        | make-real                   |        |      | =zero?    |          |          |           |       |           |
;                       |        |-----------------------------|        |      +-----------+          |          +-----------+       +-----------+
;                       |        |                             |        |            |          +-----------+          |                   |      
;                       |        +-----------------------------+        |            |          | square-x  |          |                   |      
;                       |                     /\  ||                    |            |          | sqrt-x    |          |                   |      
;                       |              raise  ||  || project            |            |          | atan-x    |          |                   |      
;                       |                     ||  \/                    |            |          | cos-x     |          |                   |      
;+---------------+      |        +-----------------------------+        |            |          | sin-x     |          |                   |      
;| scheme-number |------+------->| rational                    |------->|            |          +-----------+          |                   |      
;|---------------|      |        |-----------------------------|        |            |                |                |                   |      
;|               |      |        | make-rational               |        |            |                |                |                   |      
;|---------------|      |        |-----------------------------|        |            |                |                |                   |      
;| +             |      |        |                             |        |            |                |                |                   |      
;| -             |      |        +-----------------------------+        |            |                |                |                   |      
;| *             |      |                     /\  ||                    |            |                |                |                   |      
;| /             |      |              raise  ||  || project            |            |                |                |                   |      
;| square        |      |                     ||  \/                    |            |                |                |                   |      
;| sqrt          |      |        +-----------------------------+        |            |                |                |                   |      
;| atan          |      +------->| integer                     |------->|            |                |                |                   |      
;| cos           |               |-----------------------------|                     |                |                |                   |      
;| sin           |               | make-integer                |                     |                |                |                   |      
;| =             |               |-----------------------------|                     |                |                |                   |      
;+---------------+               |                             |                     |                |                |                   |      
;                                +-----------------------------+                     /                /                /                   /      
;   
; ***************Generic arithmetic system structure(end)*************
```
提供的接口如下
```
; 数的构造器
(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))
(define (make-real n)
  ((get 'make 'real) n))
(define (make-rational n d)
  ((get 'make 'rational) n d))
(define (make-integer n)
  ((get 'make 'integer) n))

; 数的选择器
(define (real-part-x c) (apply-generic 'real-part-x c))
(define (imag-part-x c) (apply-generic 'imag-part-x c))
(define (magnitude-x c) (apply-generic 'magnitude-x c))
(define (angle-x c) (apply-generic 'angle-x c))
(define (numer r) (apply-generic 'numer r))
(define (denom r) (apply-generic 'denom r))

;泛型算数运算接口
(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))
(define (square-x x) (apply-generic 'square-x x))
(define (sqrt-x x) (apply-generic 'sqrt-x x))
(define (atan-x x y) (apply-generic 'atan-x x y))
(define (cos-x x) (apply-generic 'cos-x x))
(define (sin-x x) (apply-generic 'sin-x x))
(define (equ? x y) (apply-generic 'equ? x y))
(define (=zero? x) (apply-generic '=zero? x))
```

## 测试

源代码见： https://github.com/strint/sicpAns/blob/master/2.5.1-2_GenericArithmeticSystem/2086_generic_arithmetic_system_summary.scm

scheme的解释器可以在这里下载：http://www.gnu.org/software/mit-scheme/ . 安装运行后，进入scheme解释器，使用`(load "2086_generic_arithmetic_system_summary.scm")`命令将系统源代码load到解释器中来，这样就可以使用这个泛型算数系统了。

如下是测试的例子：
```
1 ]=> (load "2086_generic_arithmetic_system_summary.scm")

;Loading "2086_generic_arithmetic_system_more_generic.scm"... done
;Value: c6

1 ]=> c5

;Value 36: (complex rectangular (integer . 4) integer . 5)

1 ]=> c6

;Value 37: (complex rectangular (rational 1 . 2) rational 8 . 9)

1 ]=> (real-part-x c6)

;Value 38: (rational 1 . 2)

1 ]=> (imag-part-x c6)

;Value 39: (rational 8 . 9)

1 ]=> (magnitude-x c6)

;Value 43: (real . 1.0198644305936566)

1 ]=> (sqrt (+ (square (/ 1 2)) (square (/ 8 9))))

;Value: 1.0198644305936566

1 ]=> c7

;Value 46: (complex rectangular (rational 3 . 2) rational 2 . 1)

1 ]=> (add c6 c7)

;Value 82: (complex rectangular (integer . 2.) rational 26 . 9)

1 ]=> (sub c7 c6)

;Value 85: (complex rectangular (integer . 1.) rational 10 . 9)

1 ]=> (mul c6 c7)

;Value 86: (complex polar (real . 2.5496610764841416) real . 1.9857020844857711)

1 ]=> (div c6 c7)

;Value 87: (complex polar (real . .40794577223746264) real . .13111164848254664)

1 ]=> i1 

;Value 103: (integer . 4)

1 ]=> (add i1 c6)

;Value 102: (complex rectangular (real . 4.5) real . .8888888888888888)
```
