# Question
Exercise 1.17.  The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:
```
(define (* a b)
  (if (= b 0)
        0
              (+ a (* a (- b 1)))))
```
This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.

# Answer
## Codes
```scheme
(define (mlt a b)
  (m a b 0))

(define (m a b c)
  (define (double x)
    (* x 2))
  (define (halve x)
    (/ x 2))
  (define (even x)
    (= (remainder x 2) 0))
  (if (= b 1)
    (+ a c) 
    (if (even b)
      (m (double a) (halve b) c)
      (m a (- b 1) (+ a c)))))
```
## Running
```
1 ]=> (mlt 1 1)

;Value: 1

1 ]=> (mlt 1 4)

;Value: 4

1 ]=> (mlt 5 9)

;Value: 45

1 ]=> (mlt 9 5)

;Value: 45

1 ]=> (mlt  4 7)

;Value: 28

1 ]=> (mlt 8 8)

;Value: 64

1 ]=> (mlt 25 25)

;Value: 625
```
