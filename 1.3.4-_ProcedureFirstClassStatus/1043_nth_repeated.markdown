# Question
Exercsie 1.43.

# Answer
## Codes
```scheme
(define (repeated f n)
  (define (repe-iter g i)
    (if (> i 1)
      (repe-iter (lambda (x) (f (g x))) (- i 1)) ;(repe-iter (lambda (x) (g (f x))) (- i 1)) also works
      g))
  (repe-iter (lambda (x) (f x)) n))
```

## Runnig
```
1 ]=> ((repeated square 2) 5)

;Value: 625
```
