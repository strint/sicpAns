# Question
[Exercise 2.75.](https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-17.html#%_sec_2.4.3)

# Answer
## Codes
```scheme
(define (make-from-real-imag x y)
  (define (dispatch op)
    (cond ((eq? op 'real-part) x)
          ((eq? op 'imag-part) y)
          ((eq? op 'magnitude)
           (sqrt (+ (* x x) (* y y))))
          ((eq? op 'angle)
           (atan y x))
          (else (error "Unknown op: MAKE-FROM-REAL-IMAG" op))))
  dispatch)

(define (make-from-mag-ang m a)
  (define (dispatch op)
    (cond ((eq? op 'real-part) (* m (cos a)))
          ((eq? op 'imag-part) (* m (sin a)))
          ((eq? op 'magnitude) m)
          ((eq? op 'angle) a)
          (else (error "Unknown op: MAKE-FROM-REAL-IMAG" op))))
  dispatch)

(define (apply-generic op arg) (arg op))

; test data
(define r-i-data (make-from-real-imag 1 1))
(define m-a-data (make-from-mag-ang 1.41 0.785))
```

## Running
```
1 ]=> (apply-generic 'real-part r-i-data)

;Value: 1

1 ]=> (apply-generic 'imag-part r-i-data)

;Value: 1

1 ]=> (apply-generic 'magnitude r-i-data)

;Value: 1.4142135623730951

1 ]=> (apply-generic 'angle r-i-data)

;Value: .7853981633974483

1 ]=> (apply-generic 'real-part m-a-data)

;Value: .9974174595257517

1 ]=> (apply-generic 'imag-part m-a-data)

;Value: .9966235053585659

1 ]=> (apply-generic 'magnitude m-a-data)

;Value: 1.41

1 ]=> (apply-generic 'angle m-a-data)

;Value: .785
```

## Notes
* 这种过程作为数据的模式在sicp中叫做message passing，中文对应的可以是信息传递
* 写message passing的时候感觉特别像是oop：将数据塞进一个函数（初始化成员变量），然后这个函数根据你发给它的不同请求消息返回不同的结果（oop中的成员函数）
* 果然早期的oop里面的object叫做receiver：http://web.stanford.edu/class/cs193j/handouts_old/03OOPConcepts.pdf
* 看来message passing的确对应oop
