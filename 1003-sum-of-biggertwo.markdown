# Question: sum of bigger two numbers
    Exercise 1.3.  Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

## Codes

    ;1003-sum-of-biggertwo.scm
    (define (sum-of-biggertwo a b c)
      (- (+ a b c)
         (little a
                 (little b c))))
    
    (define (little x y)
      (if (< x y)
        x
        y))

## Running

    1 ]=> (load "c01e03.scm")
    
    ;Loading "c01e03.scm"... done
    ;Value: little
    
    1 ]=> (sum-of-biggertwo 1 2 3)
    
    ;Value: 5
    
    1 ]=> (sum-of-biggertwo -1 -2 -3)
    
    ;Value: -3
