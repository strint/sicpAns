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
;------------------
;以上的代码来自2057
;------------------
; define new selector
(define (operator expr) (car expr))
(define (operands expr) (cdr expr))

; creat operation-and-type table
(define op-type-table (make-hash-table))
(define (put op-name data-type procdure)
  (hash-table/put! op-type-table (list op-name data-type) procdure))
(define (get op-name data-type)
  (hash-table/get op-type-table (list op-name data-type) '()))

; store new op method
(define (install-op-packge)
  ; internal procedures
  (define (sum operand var)
    (make-sum (deriv (car operand) var)
              (deriv (cadr operand) var)))
  (define (product operand var)
    (make-sum (make-product (car operand) (deriv (cadr operand) var))
              (make-product (cadr operand) (deriv (car operand) var))))
  (define (exponentiation operand var)
    (make-product (cadr operand) 
                  (make-product (make-exponentiation 
                                  (car operand)
                                  (make-sum -1 (cadr operand)))
                                (deriv (car operand) var))))
                            
  ; interface to the rest of the program
  (put 'deriv '+ sum)
  (put 'deriv '* product)
  (put 'deriv '** exponentiation))

; new deriv
(install-op-packge)
(define (deriv expr var)
  (cond ((number? expr) 0)
        ((variable? expr)
         (if (same-variable? expr var) 1 0))
        (else ((get 'deriv (operator expr))
               (operands expr) var))))
