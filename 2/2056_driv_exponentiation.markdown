# Question
Exercise 2.56.

# Answer
## Codes
```scheme
; codes on the sicp book
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
(define (augend s) (caddr s))

(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

; 用 '(** base exponent)来表示指数
; constructor
(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1) ;当指数是0时
        ((=number? exponent 1) base) ;当指数是1时
        (else (list '** base exponent))))

; predictor
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

; selector
(define (base e)
  (cadr e))
(define (exponent e)
  (caddr e))

; diff exponentiation
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
        (else
         (error "unknown expression type -- DERIV" expr))))
```

## Running
```

1 ]=> (deriv '(** u n) 'x)

;Value: 0

;d(** u n)/dx = (* n (* (** u (+ n -1)) du/dx))，注意在测试时u如果不是以x为未知数的表达式时，du/dx=0，导致整个求导结果为0，上面的式子直接使用了u，而'u与x无关，所以运算结果为0

1 ]=> (deriv '(** x n) 'x) 

;Value 15: (* n (** x (+ n -1)))

1 ]=> (deriv '(** x 3) 'x)

;Value 16: (* 3 (** x 2))

1 ]=> (deriv '(** x 2) 'x)

;Value 17: (* 2 x)
```
# Notes
* 因为实验室的阻碍+考试+寒假，所以中断了几个月，现在接着开始。
