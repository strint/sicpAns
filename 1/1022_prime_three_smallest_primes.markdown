# Answer
## Codes
```scheme
(define (timed-prime-test n)
  (newline) (display n) (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display "***") (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))

(define (divides? a b)
  (= 0 (remainder b a)))

(define (search-for-primes start number)
  (se start number))

(define (se st num)
  (if (> num 0)
    (if (prime? st)
      (begin (timed-prime-test st)
              (se (+ st 1) (- num 1)))
      (se (+ st 1) num))))
```
## Running
```
1 ]=> (search-for-primes 1000 3)

1009***0.
1013***0.
1019***0.
;Unspecified return value

1 ]=> (search-for-primes 10000 3)

10007***0.
10009***0.
10037***9.999999999999998e-3
;Unspecified return value

1 ]=> (search-for-primes 100000 3)

100003***0.
100019***0.
100043***0.
;Unspecified return value

1 ]=> (search-for-primes 1000000 3)

1000003***1.0000000000000002e-2
1000033***0.
1000037***0.
;Unspecified return value

1 ]=> (search-for-primes 10000000 3)

10000019***9.999999999999995e-3
10000079***1.0000000000000009e-2
10000103***9.999999999999995e-3
;Unspecified return value

1 ]=> (search-for-primes 100000000 3)

100000007***.01999999999999999
100000037***1.0000000000000009e-2
100000039***9.999999999999981e-3
;Unspecified return value

1 ]=> (search-for-primes 1000000000 3)

1000000007***.03999999999999998
1000000009***4.0000000000000036e-2
1000000021***.03999999999999998
;Unspecified return value

1 ]=> (search-for-primes 10000000000 3)

10000000019***.10999999999999999
10000000033***.12
10000000061***.1200000000000001
;Unspecified return value

1 ]=> (search-for-primes 100000000000 3)

100000000003***.3799999999999999
100000000019***.36999999999999966
100000000057***.3599999999999999
;Unspecified return value

1 ]=> (search-for-primes 1000000000000 3)

1000000000039***1.1400000000000006
1000000000061***1.1399999999999997
1000000000063***1.1400000000000006
;Unspecified return value
```
We can see that the time to test a prime goes up sqrt(10) times when the number goes up 10 times, so the result is compatible with the notion that programs on machine run in time proportional to the number of steps required for the computation.
