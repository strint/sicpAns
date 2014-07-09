# Question
Exercise 1.30.

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
  (define (iter c result)
    (if (> c b)
      result
      (iter (ne c) (+ result
                      (* (if (even? c)
                           2
                           4)
                         (term c))))))
  (iter a 0))

(define (cube x)
  (* x x x))
```

## Running
```
1 ]=> (si cube 0 1.0 1000)

;Value: .25000000000000006

1 ]=> (si cube 0 1.0 100)

;Value: .25000000000000006
```
