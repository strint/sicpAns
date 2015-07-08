# Question
Exercise 1.21.  Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999. http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html#%_sec_1.2.6

# Answer
## Codes
```scheme
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))

(define (divides? a b)
  (= 0 (remainder b a)))
```
## Running
```
1 ]=> (smallest-divisor 199)

;Value: 199

1 ]=> (smallest-divisor 1999)

;Value: 1999

1 ]=> (smallest-divisor 19999)

;Value: 7
```
