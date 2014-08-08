# Question
Exercise 2.24.

# Answer
## Codes
```scheme
(define l (list 1 (list 2 (list 3 4))))
; the last element of a list is a pair whose cdr is nil.
(define l-c (cons
              1
              (cons
                (cons 
                  2
                  (cons
                    (cons
                      3
                      (cons
                        4
                        ()))
                    ()))
                ())))
```
1 ]=> l

;Value 36: (1 (2 (3 4)))

1 ]=> l-c

;Value 35: (1 (2 (3 4)))
```

* The interpreter will print ` (1 (2 (3 4)))

* Box-and-pointer structure:
```
-->[ ][ ]-->[ ][/]
    |        |
    [1]      [ ][ ]-->[ ][/]
              |        |
              [2]      [ ][ ]-->[ ][/]
                        |        |
                        [3]      [4]
```

* Tree
(1 (2 (3 4)))
  |
|   |
1   (2 (3 4))
      |
    |   |
    2   (3 4)
          |
        |   |
        3   4
