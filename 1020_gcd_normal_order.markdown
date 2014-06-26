# Question
Exercise 1.20.  The process that a procedure generates is of course dependent on the rules used by the interpreter. As an example, consider the iterative gcd procedure given above. Suppose we were to interpret this procedure using normal-order evaluation, as discussed in section 1.1.5. (The normal-order-evaluation rule for if is described in exercise 1.5.) Using the substitution method (for normal order), illustrate the process generated in evaluating (gcd 206 40) and indicate the remainder operations that are actually performed. How many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation?
http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html#%_sec_1.2.5

# Answer
## Codes
```scheme
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))
```

## Running
### In normal order
```
(gcd 206 40)

(gcd 40 (remainder 206 40))

;1 remainder
;(remainder 206 40) = 6
(gcd (rmainder 206 40) (remainder 40 (remainder 206 40)))

;2 remainder
;(remainder 40 (remainder 206 40)) = 4
(gcd (remainder 40 (remainder 206 40)) (remainder (remiander 206 40) (remainder 40 (remainder 206 40))))

;4 remainder
;(remainder (remiander 206 40) (remainder 40 (remainder 206 40))) = 2
(gcd (remainder (remiander 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remiander 206 40) (remainder 40 (remainder 206 40)))))

;7 remainder
;(remainder (remainder 40 (remainder 206 40)) (remainder (remiander 206 40) (remainder 40 (remainder 206 40)))) = 0

;4 remainder
(remainder (remiander 206 40) (remainder 40 (remainder 206 40)))
2
```
There are totally 18 remainder operations.

### In applicative order
```
(gcd 206 40)

(gcd 40 (remainder 206 40))
;1 remainder
;(remainder 206 40) = 6
(gcd 40 6)

(gcd 6 (remainder 40 6))
;1 remainder
;(remainder 40 6) = 4
(gcd 6 4)

(gcd 4 (remainder 6 4))
;1 remainder
;(remainder 6 4) = 2
(gcd 4 2)

(gcd 2 (remainder 4 2))
;1 remainder
;(remainder 4 2) = 0
(gcd 2 0)

2
```
There are totally 4 remainder operations.
