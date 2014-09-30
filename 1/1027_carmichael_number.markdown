# Question
Exercise 1.27.

# Answer
## Codes
```scheme
(define (fermat-test n)
  (define (test-all-a count result)
    (display count) (display result) (newline)
    (if result
      (if (> count 1)
        (test-all-a (- count 1) (try-it (- count 1))) ;test all a, 1 < a < n
        #t)
      #f))
  (define (try-it a)
    (= (expmod a n n) a))
  (test-all-a n #t)) 

(define (expmod base expo m)
  (cond ((= expo 0) 1)
        ((even? expo) (remainder (square
                                  (expmod base (/ expo 2) m))
                                m))
        (else (remainder (* base (expmod base (- expo 1) m))
                         m))))
```
## Running
561, 1105, 1729,2465, 2821, 6601 did fool the farmat test.
