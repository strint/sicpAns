# Question
Exercise 2.15.

# Answer
## Running
```
1 ]=> c

;Value 20: (.999 . 1.001)

1 ]=> d

;Value 23: (1.994 . 2.006)

1 ]=> (define p1 (par1 c d))

;Value: p1

1 ]=> p1

;Value 24: (.6624562687063519 . .6709007684597392)

1 ]=> (center p1)

;Value: .6666785185830455

1 ]=> (percent p1)

;Value: .0063332622230991

1 ]=> (define p2 (par2 c d))

;Value: p2

1 ]=> (center p2)

;Value: .6666660740708477

1 ]=> (percent p2)

;Value: 1.6666702222447056e-3
```
We can see that (percent p2) is smaller than (percent p1).

When an interval I1 operates with I2 and get I3, the percent of I3 is bigger as width of I2 is not 0.

So I think she is right, but not very sure.
