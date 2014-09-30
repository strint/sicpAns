# Question
Exercise 2.34.

# Answer
## Codes
```scheme
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                 (+ this-coeff
                    (* x higher-terms)))
              0
              coefficient-sequence))
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

; test
(define l1 (list 1 3 0 5 0 1))
```

## Running
```
1 ]=> l1

;Value 13: (1 3 0 5 0 1)

1 ]=> (horner-eval 2 l1)

;Value: 79
```
