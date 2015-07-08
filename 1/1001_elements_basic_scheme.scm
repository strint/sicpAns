; In a Scheme program, any line that begins with one or more semicolons is a comment
; MIT Scheme 的基本使用见 http://www.math.pku.edu.cn/teachers/qiuzy/progtech/scheme/mit_scheme.htm
; 基本的使用概括起来说就是：编辑器编辑代码；在MIT Scheme解释器中使用(load "file")的方式载入代码并运行。
; c01e01照书上敲一遍代码就可以了。
10

(+ 5 3 4)

(- 9 1)

(/ 6 2)

(+ (* 2 4) (- 4 6))

(define a 3)

(define b (+ a 1))

(+ a b (* a b))

(= a b)

(if (and (> b a) (< b (* a b)))
    b
    a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
