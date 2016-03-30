# Question
Exercise 2.57.

# Answer
## Codes
```scheme
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2) (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num) (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
(define (sum? x)  (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) ;修改了这个selector
  (if (null? (cdddr s)) 
      (caddr s)
      (cons '+ (cddr s))));当超过两个数相加时,把被加数当成一个新的sum，同sum?判断结合，就形成的递归的selector，可以处理多于两个terms的加法式子

(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p);修改了这个selector
  (if (null? (cdddr p)) 
      (caddr p)
      (cons '* (cddr p))));当超过两个数相乘时,把被乘数当成一个新的product

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1) ;当指数是0时
        ((=number? exponent 1) base) ;当指数是1时
        (else (list '** base exponent))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base e)
  (cadr e))
(define (exponent e)
  (caddr e))

(define (deriv expr var)
  (cond ((number? expr) 0)
        ((variable? expr)
         (if (same-variable? expr var) 1 0))
        ((sum? expr)
         (make-sum (deriv (addend expr) var)
                   (deriv (augend expr) var)))
        ((product? expr)
         (make-sum
           (make-product (multiplier expr)
                         (deriv (multiplicand expr) var))
           (make-product (deriv (multiplier expr) var)
                         (multiplicand expr))))
        ((exponentiation? expr) ;d(** u n)/dx = (* n (* (** u (+ n -1)) du/dx))，注意在测试时u如果不是以x为未知数的表达式时，du/dx=0，导致整个求导结果为0
         (make-product (exponent expr)
                       (make-product (make-exponentiation (base expr) (make-sum (exponent expr) -1))
                                     (deriv (base expr) var))))
        (else (error "unknown expression type -- DERIV" expr))))
```

## Running
```
1 ]=> (define s '(+ 1 2 3))

;Value: s

1 ]=> s

;Value 11: (+ 1 2 3)

1 ]=> (cdddr s)

;Value 12: (3)

1 ]=> (cddddr s)

;Value: ()

1 ]=> (null? '())

;Value: #t

1 ]=> (augend s)

;Value 13: (+ 2 3)

1 ]=> (deriv '(* x y (+ x 3)) 'x)

;Value 15: (+ (* x y) (* y (+ x 3)))
```
