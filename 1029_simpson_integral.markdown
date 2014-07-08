# Question
Exercise 1.29.

# Answer
## Codes
```scheme
(define (si f a b n)
  (let ((h (/ (- b a) n)))
    (define (next x)
      (+ x 1))
    (define (yk k)
      (f (+ a (* k h))))
    (* (+ (sum yk 1 next (- n 1))
          (yk 0)
          (yk n))
       (/ h 3))))

(define (sum term a ne b)
  (if (> a b)
    0
    (+ (* (if (even? a)
            2
            4)
          (term a))
       (sum term (ne a) ne b))))

(define (cube x)
  (* x x x))
```
## Running
```
1 ]=> (si cube 0 1.0 100)

;Value: .24999999999999992

(integral cube 0 1 0.01)
.24998750000000042

1 ]=> (si cube 0 1.0 1000)

;Value: .2500000000000003

(integral cube 0 1 0.001)
.249999875000001
```
