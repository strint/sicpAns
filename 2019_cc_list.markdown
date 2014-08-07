# Question
Exercise 2.19.

# Answer
## Codes
```scheme
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount (except-first-denomination coin-values))
             (cc (- amount (first-denomination coin-values)) coin-values)))))
(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))

; test
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define us-coins-b (list 1 5 10 25 50))
(define us-coins-c (list 5 25 10 1 50))
```
## Running
```
1 ]=> (cc 100 us-coins)

;Value: 292

1 ]=> (cc 100 us-coins-b)

;Value: 292

1 ]=> (cc 100 us-coins-c)

;Value: 292
```
