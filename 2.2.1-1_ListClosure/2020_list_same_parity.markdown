# Quesion
Exercise 2.20.

# Answer
## Codes
```scheme
(define (same-parity . l)
  (if (= (remainder (car l) 2) 0)
    (even-l l)
    (odd-l l)))
(define (even-l l)
  (define (filter-even li even-li)
    (if (null? li)
      even-li
      (filter-even (cdr li)
                   (if (= (remainder (car li) 2) 0)
                     (cons (car li) even-li)
                     even-li))))
  (reverse (filter-even l '())))
(define (odd-l l)
  (define (filter-odd li odd-li)
    (if (null? li)
      odd-li
      (filter-odd (cdr li)
                   (if (= (remainder (car li) 2) 1)
                     (cons (car li) odd-li)
                     odd-li))))
  (reverse (filter-odd l '())))

```

## Running
```
1 ]=> (same-parity 1 2 3 4 5)

;Value 16: (1 3 5)

1 ]=> (same-parity 2 3 4 5 6)

;Value 17: (2 4 6)
```
