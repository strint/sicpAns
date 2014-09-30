# Question
Exercise 1.44.

# Answer
## Codes
```scheme
(define (smooth f)
  (lambda (x dx) (/ (+ (f (- x dx))
                       (f x)
                       (f (+ x dx)))
                    3)))
(define (repeated f n)
  (define (repe-iter g i)
    (if (> i 1)
      (repe-iter (lambda (x dx) (f (g x dx) dx)) (- i 1)) ;(repe-iter (lambda (x) (g (f x))) (- i 1)) also works
      g))
  (repe-iter (lambda (x dx) (f x dx)) n))

(define (n-smooth f x dx n)
  ((repeated (smooth f) n) x dx))
```

## Running
```
1 ]=> (n-smooth square 0 1.0 10)

;Value: 8.522136766213654e40
;increased

1 ]=> (n-smooth square 0 0.1 10)

;Value: 6.711713768375265e-3
;increased slowly

1 ]=> (n-smooth square 1 0.1 10)

;Value: 707.0943692831548
;increased

1 ]=> (n-smooth (lambda (x) x) 1 0.1 10)

;Value: 1.
;donot change

1 ]=> (n-smooth sqrt 1 0.1 10)

;Value: .9983248542092643
;decreased
```
