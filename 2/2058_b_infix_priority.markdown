# Question
Exercise 2.58b.

# Answer
## Codes
```scheme
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2) (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num) (and (number? exp) (= exp num)))

;从list l中查找第一个加号，没有找到加号时返回#f，找到是返回(list 加号前的部分 加号后的部分)，即被加数与加数的组合
(define (separate-with-first-plus l)
  (define (search-plus searched rest got-it)
    (cond ((and (eq? got-it #f) (eq? rest '())) #f)
          ((and (eq? got-it #f) (not (eq? rest '())))
             (if (eq? '+ (car rest))
                 (search-plus searched (cdr rest) #t)
                 (search-plus (append searched (list (car rest))) (cdr rest) #f)))
          (else (list searched rest))))
  (search-plus '() l #f))

(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (sum? x)
  (if (not (eq? (separate-with-first-plus x) #f))
      #t
      #f))
(define (addend s)
  (let* ((sep (separate-with-first-plus s))
         (a (car sep)))
        (if (eq? (cdr a) '())
            (car a);对于加数是字母或者数字的情况
            a)));对于加数是个算式的情况
(define (augend s)
  (let* ((sep (separate-with-first-plus s))
         (a (cadr sep)))
        (if (eq? (cdr a) '())
            (car a);对于加数是字母或者数字的情况
            a)));对于加数是个算式的情况

(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))
;被判断不是sum之后，式中地一层运算关系如果有乘法，则这一层都是乘法
(define (product? x) (and (pair? x) (eq? (cadr x) '*)))
(define (multiplier p) (car p))
(define (multiplicand p)
  (let ((m (cddr p)))
    (if (eq? '() (cdr m)) ;处理乘号后面只有一个乘数的情况
        (car m)
        m)))

(define (deriv expr var)
  (display expr);打印当前的式子，以便观察
  (newline)
  (cond ((number? expr) 0)
        ((variable? expr)
         (if (same-variable? expr var) 1 0))
        ((sum? expr)
         (make-sum (deriv (addend expr) var)
                   (deriv (augend expr) var)))
        ((product? expr) ;product?要在sum?之后
         (make-sum
           (make-product (multiplier expr)
                         (deriv (multiplicand expr) var))
           (make-product (deriv (multiplier expr) var)
                         (multiplicand expr))))
        (else (error "unknown expression type -- DERIV" expr))))
```

## Running
```
1 ]=> (separate-with-first-plus '(x + 3 * (x + y + 2)))

;Value 12: ((x) (3 * (x + y + 2)))

1 ]=> (deriv '(x + 3 * (x + y + 2)) 'x)
(x + 3 * (x + y + 2))
(3 * (x + y + 2))
3
(x + y + 2)
(y + 2)
2
y
x
x
;Value: 4

1 ]=> (deriv '(x * x + x + x * y) 'x)
(x * x + x + x * y)
(x + x * y)
(x * y)
x
y
x
(x * x)
x
x
;Value 24: ((x + x) + (1 + y))
```

# Notes
* 开始认为没有办法，因为没想到先改sum?，而是改selector，根据结合律来设计selector：加法时，加号后面的所有term结合在一起，即向后集合；乘法时，乘号后面的第一个乘数向前结合。但是如果乘号后面还有加法就没法处理了，除非修改deriv。
* 方法想好了，实现代码时，发现3个月没写，有一些语言特性忘记了，比如内部函数、临时变量、map、filter、accumulate、display、newline等，不过去网上看下例子就会用了
* list中的'()、()是很麻烦的东西，使用selector时经常选择'()，括号有时要脱掉，这两点都比较恶心，需要考虑得很细致，程序写完时debug了好久，添加了几个判断条件才搞定
