# Question
Exercise 1.25.  Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all, she says, since we already know how to compute exponentials, we could have simply written

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

Is she correct? Would this procedure serve as well for our fast prime tester? Explain.

# Answer
## Codes
```scheme
;report
(define (timed-prime-test n)
  (newline) (display n) (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display "***") (display elapsed-time))

;prime?
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base expo m)
  (remainder (fast-expt base expo) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;test
(define (test start times)
  (if (> times 0)
    (begin (search-for-primes start 3) (test (* start 10) (- times 1)))
    (display "over")))

(define (search-for-primes start number)
  (se start number))

;search
(define (se st num)
  (if (> num 0)
    (if (fast-prime? st 1)
      (begin (timed-prime-test st)
              (se (+ st 1) (- num 1)))
      (se (+ st 1) num))))

```
## Running
```
1 ]=> (test 1000 12)

1009***0.
1013***0.
1019***0.
10007***0.
10009***0.
10037***9.999999999990905e-3
100003***.8199999999999932
100019***.8799999999999955
100043***.8100000000000023^C
```
It is so slow to use fast-expt to compute expmod.

```scheme
(define (expmod base expo m) ;expmod(base^expo) = O(log(expo)) + O(remainder(base^expo)) = O(log(expo)) + O(expo) = O(expo)
  (remainder (fast-expt base expo) m)) ; remainder(base^expo, m) = O(expo), maybe the time complexity of remainder is larger because  base^expo is quite a large number.
(define (fast-expt b n) ;fast-expt(expo)=O(log(expo))
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
```
```
(define (expmod base expo m) ; expmod(base^expo) = remainder(square(expmod(base^(expo/2)))) = O(log(expo)), this is very fast.
  (cond ((= expo 0) 1)
        ((even? expo) (remainder (square
                                  (expmod base (/ expo 2) m))
                                m))
        (else (remainder (* base (expmod base (- expo 1) m))
                         m))))
```
