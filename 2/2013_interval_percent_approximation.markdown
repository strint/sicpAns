# Question
Exercise 2.13.

# Answer
It's easy to find that when
```
(define A (make-center-percent a p1))
(define B (make-center-percent b p2))
```
and assuming a>0, b>0, p1p2 are small,

```
(define C (mul-interval A B))
```
then (center C) equals a*b*(1+p1*p2), and (width C) equals a*b*(p1+p2), so (percent C) equals (p1+p2)/(1+(p1*p2)).
