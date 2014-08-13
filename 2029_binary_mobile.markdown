# Question
Exercise 2.29.

# Answer
## Codes
```scheme
```

## Running
```
;--total-weight--
1 ]=> m1

;Value 20: ((1 2) (2 3))

1 ]=> m2

;Value 19: ((3 4) (5 ((1 2) (2 3))))

1 ]=> (total-weight m1)

;Value: 5

1 ]=> (total-weight m2)

;Value: 9

;--torque--
1 ]=> b3    

;Value 23: (3 4)

1 ]=> b4

;Value 24: (5 ((1 2) (2 3)))

1 ]=> (torque b3)

;Value: 12

1 ]=> (torque b4)

;Value: 40

```
