# Question
Exercise 2.86.

# Answer
## Codes
```scheme
```

## Runnig
```
1 ]=> (load "2086_generic_arithmetic_system_more_generic.scm")

;Loading "2086_generic_arithmetic_system_more_generic.scm"... done
;Value: c6

1 ]=> c5

;Value 36: (complex rectangular (integer . 4) integer . 5)

1 ]=> c6

;Value 37: (complex rectangular (rational 1 . 2) rational 8 . 9)

1 ]=> (real-part-x c6)

;Value 38: (rational 1 . 2)

1 ]=> (imag-part-x c6)

;Value 39: (rational 8 . 9)

1 ]=> (magnitude-x c6)

;Value 43: (real . 1.0198644305936566)

1 ]=> (sqrt (+ (square (/ 1 2)) (square (/ 8 9))))

;Value: 1.0198644305936566

1 ]=> c7

;Value 46: (complex rectangular (rational 3 . 2) rational 2 . 1)

1 ]=> (real-part-x c7)

;Value 47: (rational 3 . 2)

1 ]=> (imag-part-x c7)

;Value 48: (rational 2 . 1)

1 ]=> (add (real-part-x c7) (real-part-x c6))

;Value 49: (integer . 2.)

1 ]=> (add (imag-part-x c6) (imag-part-x c7))

;Value 50: (rational 26 . 9)
```
