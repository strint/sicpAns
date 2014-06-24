# Question
Exercise 1.16.  Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the observation that (bn/2)2 = (b2)n/2, keep, along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that the product a bn is unchanged from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)

# Answer
## Codes
```scheme
(define (i-expt b n)
  (iter-expt b n b  1 1))
(define (iter-expt b n a k c)
  (if (= n 0)
      c
      (cond ((< (- n (* 2 k)) 0) (iter-expt b (- n k) b 1 (* a c))) ;n=[may have some 0,may have some 1]1 or [must have some 1, may have some 0]0 (binary)
            ((= (- n (* 2 k)) 0) (iter-expt b 0 b 0 (* a a c))) ;n=1[all 0] (binary)
            (else (iter-expt b n (* a a) (* 2 k) c)))))
```
## Running
```
1 ]=> (i-expt 2 10)

;Value: 1024

1 ]=> (i-expt 3 2)

;Value: 9

1 ]=> (i-expt 5 4)

;Value: 625

1 ]=> (i-expt 3 3)

;Value: 27
```
