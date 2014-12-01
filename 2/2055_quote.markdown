# Question
Exercise 2.55

# Answer
```
1 ]=> (quote b)

;Value: b

1 ]=> (quote (quote b))

;Value 21: (quote b)

1 ]=> ''b

;Value 22: (quote b)
```
'a is actually (quote a) and evaluated to a. So ''absdjl is actually (quote (quote absdjl)) and evaluated to (quote absdjl), and (car ''adsbjl) is evaluated to quote.

