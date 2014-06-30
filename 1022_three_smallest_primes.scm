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

