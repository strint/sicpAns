# Question
Exercise 1.12.  Pascal's triangle.The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it.35 Write a procedure that computes elements of Pascal's triangle by means of a recursive process.


## Answer
### Codes
```scheme
(define (pasc n k)
  (define (pasci high pos)
          (if (or (< high 3) (= pos 1) (= pos high))
              1
              (+ (pasci (- high 1) (- pos 1))
                 (pasci (- high 1) pos))))
  (pasci n k))
```
### Running
```
1 ]=> (pasc 4 3)

;Value: 3

1 ]=> (pasc 6 3)

;Value: 10
```

