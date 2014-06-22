# Question
Exercise 1.11.  A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process

# Answer
## Recursive process
### Codes
```scheme
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))
```
### Running 
```
1 ]=> (f 1)

;Value: 1

1 ]=> (f 2)

;Value: 2

1 ]=> (f 3)

;Value: 4

1 ]=> (f 4)

;Value: 11

1 ]=> (f 5)

;Value: 25
```

## Iterative process
### Codes
```scheme
(define (f n)
  (define (fi a b c k)
          (if (< k 3)
              c
              (fi b
                  c
                  (+ (* 3 a)
                     (* 2 b)
                     c)
                  (- k 1))))
  (if (< n 3)
      n
      (fi 0 1 2 n)))
```

### Running 
```
1 ]=> (f 1)

;Value: 1

1 ]=> (f 2)

;Value: 2

1 ]=> (f 3)

;Value: 4

1 ]=> (f 4)

;Value: 11

1 ]=> (f 5)

;Value: 25
```
