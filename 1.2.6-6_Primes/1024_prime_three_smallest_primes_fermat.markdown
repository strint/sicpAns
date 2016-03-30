# Question
Exercise 1.24.  Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime? (the Fermat method), and test each of the 12 primes you found in that exercise. Since the Fermat test has (log n) growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you find?

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
  (cond ((= expo 0) 1)
        ((even? expo) (remainder (square
                                  (expmod base (/ expo 2) m))
                                m))
        (else (remainder (* base (expmod base (- expo 1) m))
                         m))))

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
1 ]=> (test 1000 30)

1009***0.
1013***0.
1019***0.
10007***0.
10009***0.
10037***0.
100003***0.
100019***0.
100043***0.
1000003***0.
1000033***0.
1000037***0.
10000019***0.
10000079***0.
10000103***0.
100000007***0.
100000037***0.
100000039***0.
1000000007***0.
1000000009***0.
1000000021***0.
10000000019***0.
10000000033***0.
10000000061***0.
100000000003***0.
100000000019***0.
100000000057***0.
1000000000039***0.
1000000000061***0.
1000000000063***0.
10000000000037***0.
10000000000051***0.
10000000000099***0.
100000000000031***0.
100000000000067***0.
100000000000097***0.
1000000000000037***0.
1000000000000091***0.
1000000000000159***0.
10000000000000061***0.
10000000000000069***0.
10000000000000079***9.999999999990905e-3
100000000000000003***0.
100000000000000013***0.
100000000000000019***0.
1000000000000000003***0.
1000000000000000009***0.
1000000000000000031***0.
10000000000000000051***0.
10000000000000000087***9.999999999990905e-3
10000000000000000091***0.
100000000000000000039***0.
100000000000000000129***0.
100000000000000000151***0.
1000000000000000000117***0.
1000000000000000000193***0.
1000000000000000000213***0.
10000000000000000000009***0.
10000000000000000000057***0.
10000000000000000000081***0.
100000000000000000000117***0.
100000000000000000000157***0.
100000000000000000000171***0.
1000000000000000000000007***0.
1000000000000000000000049***0.
1000000000000000000000121***0.
10000000000000000000000013***0.
10000000000000000000000223***0.
10000000000000000000000343***0.
100000000000000000000000067***0.
100000000000000000000000123***0.
100000000000000000000000127***0.
1000000000000000000000000103***0.
1000000000000000000000000279***0.
1000000000000000000000000283***0.
10000000000000000000000000331***0.
10000000000000000000000000457***0.
10000000000000000000000000469***0.
100000000000000000000000000319***0.
100000000000000000000000000379***0.
100000000000000000000000000459***0.
1000000000000000000000000000057***0.
1000000000000000000000000000099***0.
1000000000000000000000000000211***0.
10000000000000000000000000000033***0.
10000000000000000000000000000057***0.
10000000000000000000000000000099***9.999999999990905e-3
100000000000000000000000000000049***0.
100000000000000000000000000000253***0.
100000000000000000000000000000309***0.over
;Unspecified return value
```
We can see that the `fast-primes?` is so fast that the elapsed time to test 1000*10^30 is still to small and was counted as 0. So it hard to test this on a fast computer.
