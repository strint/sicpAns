# Question
Exercise 2.77.

# Answer
## Codes
```scheme
```

## Running
```
1 ]=> (load "2077_generic_add_complex_package.scm")

;Loading "2077_generic_add_complex_package.scm"... done
;Unspecified return value

1 ]=> (define c (make-complex-from-real-imag 1 2))

;Value: c

1 ]=> c

;Value 17: (complex rectangular 1 . 2)

1 ]=> (magnitude-x c)

[Entering #[compound-procedure 18 magnitude-x]
    Args: (complex rectangular 1 . 2)]
[Entering #[compound-procedure 19 apply-generic]
    Args: magnitude-x
          ((complex rectangular 1 . 2))]
[Entering #[compound-procedure 19 apply-generic]
    Args: magnitude-x
          ((rectangular 1 . 2))]
[2.23606797749979
      <== #[compound-procedure 19 apply-generic]
    Args: magnitude-x
          ((rectangular 1 . 2))]
[2.23606797749979
      <== #[compound-procedure 19 apply-generic]
    Args: magnitude-x
          ((complex rectangular 1 . 2))]
[2.23606797749979
      <== #[compound-procedure 18 magnitude-x]
    Args: (complex rectangular 1 . 2)]
;Value: 2.23606797749979
```
