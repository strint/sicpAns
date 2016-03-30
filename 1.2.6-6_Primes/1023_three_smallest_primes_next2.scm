;;;next
(define (timed-prime-test-next n)
  (start-prime-test-next n (runtime)))

(define (start-prime-test-next n start-time)
  (if (prime-next? n)
    (- (runtime) start-time)))

(define (prime-next? n)
  (= n (smallest-divisor-next n)))

(define (smallest-divisor-next n) (find-divisor-next n 3))

(define (find-divisor-next n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-next n (+ test-divisor 2)))))

;;;not next
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (- (runtime) start-time)))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))


;;;common
(define (divides? a b)
  (= 0 (remainder b a)))


;;;test
(define (report-prime time time-next)
   (begin (display "time:") (display time) 
          (display ";time-next:") (display time-next)
          (display ";time/time-next:") (display (/ time time-next))))

(define (se st num)
  (if (> num 0)
    (if (prime? st)
      (begin (newline) (newline) (display st) (newline)
             (report-prime (timed-prime-test st) (timed-prime-test-next st))
             (se (+ st 1) (- num 1)))
      (se (+ st 1) num))))

(define (search-for-primes start number)
  (se start number))

(define (test st times)
  (if (> times 0)
    (begin (newline) (newline) (display st) 
           (search-for-primes st 3)
           (test (* st 10) (- times 1)))
    (begin (newline) (display "over"))))
