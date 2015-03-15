# Question
Exercise 2.55

# Answer
```
; test 1
1 ]=> (quote b)

;Value: b

1 ]=> (quote (quote b))

;Value 21: (quote b)

1 ]=> ''b

;Value 22: (quote b)


; test 2
1 ]=> (quote  (car (quote (list a b))))

;Value 13: (car (quote (list a b)))

```
From test 1, we can see that 'a is actually (quote a) and evaluated to a. So ''absdjl is actually (quote (quote absdjl)) and evaluated to (quote absdjl), and (car ''adsbjl) is evaluated to quote.

From test 2, we can see that operator 'quote' works like an normal order but the application order. This means that once the interpreter meets the opetator 'quote', its operand becomes symbolic data other than expressions. This makes sense when you need to use quotation, but this breaks the coherence of this programmnig language.
