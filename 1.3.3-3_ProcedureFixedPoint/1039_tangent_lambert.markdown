# Question
Exercise 1.39.

# Answer
## Codes
```scheme
(define (cont-frac-i n d k)
  (define (cf-iter2 i k-to-i)
    (if (> i 1)
      (cf-iter2 (- i 1) (/ (n (- i 1)) (- (d (- i 1)) k-to-i)))
      k-to-i))
  (cf-iter2 (+ k 1) 0))

(define (tan-cf x k)
  (/ (cont-frac-i (lambda (i) (* x x))
                  (lambda (i) (- (* 2 i) 1)) 
                  k)
     x))
```
## Running
```
1 ]=> (tan-cf (/ 3.14 4) 100)

;Value: .9992039901050428
```
