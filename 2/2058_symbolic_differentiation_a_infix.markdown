# Question
Exercise 2.58a.

# Answer
## Codes
```scheme
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2) (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num) (and (number? exp) (= exp num)))

; 修改了constructor，predicate， selector
(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))
(define (sum? x)  (and (pair? x) (eq? (cadr x) '+)))
(define (addend s) (car s))
(define (augend s) (caddr s))

; 修改了constructor，predicate， selector
(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))
(define (product? x) (and (pair? x) (eq? (cadr x) '*)))
(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))

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
        (else (error "unknown expression type -- DERIV" expr))))
```

## Running
```
1 ]=> (define p (make-product 3 '(x + (y + 2))))

;Value: p

1 ]=> p

;Value 17: (3 * (x + (y + 2)))

1 ]=> (define s (make-sum 'x p))

;Value: s

1 ]=> s

;Value 18: (x + (3 * (x + (y + 2))))

1 ]=> (sum? s)

;Value: #t

1 ]=> (addend s)

;Value: x

1 ]=> (augend s)

;Value 17: (3 * (x + (y + 2)))

1 ]=> (deriv s 'x)

;Value: 4

1 ]=> (deriv s 'y)

;Value: 3

1 ]=> (deriv '(x * x) 'x)

;Value 19: (x + x)

1 ]=> (deriv '(x * (x * x)) 'x)

;Value 20: ((x * (x + x)) + (x * x))
```
