# Question
Exercise 1.23.  The smallest-divisor procedure shown at the start of this section does lots of needless testing: After it checks to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. This suggests that the values used for test-divisor should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... To implement this change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the smallest-divisor procedure to use (next test-divisor) instead of (+ test-divisor 1). With timed-prime-test incorporating this modified version of smallest-divisor, run the test for each of the 12 primes found in exercise 1.22. Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2?

# Answer
## Codes
```scheme
;;;next
(define (timed-prime-test-next n)
  (start-prime-test-next n (runtime)))

(define (start-prime-test-next n start-time)
  (if (prime-next? n)
    (- (runtime) start-time)))

(define (prime-next? n)
  (= n (smallest-divisor-next n)))

(define (smallest-divisor-next n) (find-divisor-next n 2))

(define (find-divisor-next n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-next n (next test-divisor)))))

(define (next x)
  (if (= x 2)
    3
    (+ x 2)))

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
```
## Running
```
1 ]=> (test 1000 12)


1000

1009
time:0.;time-next:0.;time/time-next:#[NaN]

1013
time:0.;time-next:0.;time/time-next:#[NaN]

1019
time:0.;time-next:0.;time/time-next:#[NaN]

10000

10007
time:0.;time-next:0.;time/time-next:#[NaN]

10009
time:0.;time-next:0.;time/time-next:#[NaN]

10037
time:0.;time-next:0.;time/time-next:#[NaN]

100000

100003
time:0.;time-next:0.;time/time-next:#[NaN]

100019
time:0.;time-next:0.;time/time-next:#[NaN]

100043
time:0.;time-next:0.;time/time-next:#[NaN]

1000000

1000003
time:0.;time-next:0.;time/time-next:#[NaN]

1000033
time:0.;time-next:0.;time/time-next:#[NaN]

1000037
time:0.;time-next:0.;time/time-next:#[NaN]

10000000

10000019
time:9.999999999990905e-3;time-next:0.;time/time-next:#[+inf]

10000079
time:0.;time-next:1.0000000000005116e-2;time/time-next:0.

10000103
time:0.;time-next:0.;time/time-next:#[NaN]

100000000

100000007
time:.01999999999999602;time-next:0.;time/time-next:#[+inf]

100000037
time:1.0000000000005116e-2;time-next:9.999999999990905e-3;time/time-next:1.000000000001421

100000039
time:1.0000000000005116e-2;time-next:9.999999999990905e-3;time/time-next:1.000000000001421

1000000000

1000000007
time:.03999999999999204;time-next:.01999999999999602;time/time-next:2.

1000000009
time:.04000000000000625;time-next:.01999999999999602;time/time-next:2.0000000000007105

1000000021
time:.04000000000000625;time-next:.01999999999999602;time/time-next:2.0000000000007105

10000000000

10000000019
time:.10999999999999943;time-next:.07000000000000739;time/time-next:1.5714285714283973

10000000033
time:.10999999999999943;time-next:.0799999999999983;time/time-next:1.3750000000000222

10000000061
time:.12000000000000455;time-next:.07000000000000739;time/time-next:1.7142857142855983

100000000000

100000000003
time:.37000000000000455;time-next:.21999999999999886;time/time-next:1.6818181818182112

100000000019
time:.36999999999999034;time-next:.23000000000000398;time/time-next:1.6086956521738431

100000000057
time:.37999999999999545;time-next:.23000000000000398;time/time-next:1.6521739130434299

1000000000000

1000000000039
time:1.1700000000000017;time-next:.7399999999999949;time/time-next:1.5810810810810942

1000000000061
time:1.1599999999999966;time-next:.7199999999999989;time/time-next:1.611111111111109

1000000000063
time:1.1600000000000108;time-next:.7199999999999989;time/time-next:1.6111111111111287

10000000000000

10000000000037
time:3.6599999999999966;time-next:2.3100000000000023;time/time-next:1.5844155844155814

10000000000051
time:3.6799999999999926;time-next:2.3000000000000114;time/time-next:1.599999999999989

10000000000099
time:3.680000000000007;time-next:2.289999999999992;time/time-next:1.6069868995633274

100000000000000

100000000000031
time:11.639999999999986;time-next:7.230000000000004;time/time-next:1.6099585062240636

100000000000067
time:11.660000000000025;time-next:7.269999999999982;time/time-next:1.6038514442916167

100000000000097
time:11.719999999999999;time-next:7.289999999999992;time/time-next:1.6076817558299055
```
We can see that most of the time time/time-next is less than 2(about 1.6, 1/1.6=0.625).
```
(define (timed-prime-test-next n)
  (start-prime-test-next n (runtime)))

(define (start-prime-test-next n start-time)
  (if (prime-next? n)
    (- (runtime) start-time)))

(define (prime-next? n)
  (= n (smallest-divisor-next n)))

(define (smallest-divisor-next n) (find-divisor-next n 2))

(define (find-divisor-next n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-next n (next test-divisor)))))

(define (next x)
  (if (= x 2)
    3
    (+ x 2)))
```

### Refine `next`
#### Remove if in next
##### Codes1
remove `if`
```
(define (smallest-divisor-next n) (find-divisor-next n 3))
 
(define (find-divisor-next n test-divisor)
   (cond ((> (* test-divisor test-divisor) n) n)
         ((divides? test-divisor n) test-divisor)
         (else (find-divisor-next n (next test-divisor)))))
(define (next x)
  (+ next 2))
```
##### Running
```
1 ]=> (test 1000 12)


1000

1009
time:0.;time-next:0.;time/time-next:#[NaN]

1013
time:0.;time-next:0.;time/time-next:#[NaN]

1019
time:0.;time-next:0.;time/time-next:#[NaN]

10000

10007
time:9.999999999990905e-3;time-next:0.;time/time-next:#[+inf]

10009
time:0.;time-next:0.;time/time-next:#[NaN]

10037
time:0.;time-next:0.;time/time-next:#[NaN]

100000

100003
time:0.;time-next:0.;time/time-next:#[NaN]

100019
time:0.;time-next:0.;time/time-next:#[NaN]

100043
time:0.;time-next:0.;time/time-next:#[NaN]

1000000

1000003
time:1.0000000000104592e-2;time-next:0.;time/time-next:#[+inf]

1000033
time:0.;time-next:0.;time/time-next:#[NaN]

1000037
time:0.;time-next:0.;time/time-next:#[NaN]

10000000

10000019
time:0.;time-next:0.;time/time-next:#[NaN]

10000079
time:9.999999999990905e-3;time-next:0.;time/time-next:#[+inf]

10000103
time:9.999999999990905e-3;time-next:0.;time/time-next:#[+inf]

100000000

100000007
time:9.999999999990905e-3;time-next:9.999999999990905e-3;time/time-next:1.

100000037
time:9.999999999990905e-3;time-next:9.999999999990905e-3;time/time-next:1.

100000039
time:1.0000000000104592e-2;time-next:0.;time/time-next:#[+inf]

1000000000

1000000007
time:.03999999999996362;time-next:.01999999999998181;time/time-next:2.

1000000009
time:.03999999999996362;time-next:.01999999999998181;time/time-next:2.

1000000021
time:.03999999999996362;time-next:2.0000000000095497e-2;time/time-next:1.9999999999886313

10000000000

10000000019
time:.12000000000000455;time-next:.06000000000005912;time/time-next:1.9999999999981053

10000000033
time:.12000000000000455;time-next:.05999999999994543;time/time-next:2.000000000001895

10000000061
time:.12000000000000455;time-next:.06000000000005912;time/time-next:1.9999999999981053

100000000000

100000000003
time:.37000000000000455;time-next:.2099999999999227;time/time-next:1.7619047619054322

100000000019
time:.37999999999999545;time-next:.20000000000004547;time/time-next:1.8999999999995452

100000000057
time:.37000000000000455;time-next:.21000000000003638;time/time-next:1.7619047619044783

1000000000000

1000000000039
time:1.17999999999995;time-next:.6399999999999864;time/time-next:1.8437499999999611

1000000000061
time:1.17999999999995;time-next:.6399999999999864;time/time-next:1.8437499999999611

1000000000063
time:1.169999999999959;time-next:.6499999999999773;time/time-next:1.8

10000000000000

10000000000037
time:3.740000000000009;time-next:2.0299999999999727;time/time-next:1.8423645320197337

10000000000051
time:3.7199999999999136;time-next:2.0400000000000773;time/time-next:1.8235294117645944

10000000000099
time:3.7099999999999227;time-next:2.060000000000059;time/time-next:1.8009708737863186

100000000000000

100000000000031
time:11.780000000000086;time-next:6.5;time/time-next:1.8123076923077055

100000000000067
time:11.700000000000045;time-next:6.470000000000027;time/time-next:1.8083462132921169

100000000000097
time:11.720000000000027;time-next:6.480000000000018;time/time-next:1.8086419753086411
```
The ratio is refined to 1.8 when removing `if` in `next`.

#### Remove next
##### Codes2
remove `next`
```
(define (smallest-divisor-next n) (find-divisor-next n 3))
 
(define (find-divisor-next n test-divisor)
   (cond ((> (* test-divisor test-divisor) n) n)
         ((divides? test-divisor n) test-divisor)
         (else (find-divisor-next n (+ test-divisor 2)))))
```
##### Running
```
1 ]=> (test 1000 12)

1000

1009
time:0.;time-next:0.;time/time-next:#[NaN]

1013
time:0.;time-next:0.;time/time-next:#[NaN]

1019
time:0.;time-next:0.;time/time-next:#[NaN]

10000

10007
time:0.;time-next:0.;time/time-next:#[NaN]

10009
time:0.;time-next:0.;time/time-next:#[NaN]

10037
time:0.;time-next:0.;time/time-next:#[NaN]

100000

100003
time:0.;time-next:0.;time/time-next:#[NaN]

100019
time:9.999999999990905e-3;time-next:0.;time/time-next:#[+inf]

100043
time:0.;time-next:0.;time/time-next:#[NaN]

1000000

1000003
time:0.;time-next:0.;time/time-next:#[NaN]

1000033
time:9.999999999990905e-3;time-next:0.;time/time-next:#[+inf]

1000037
time:0.;time-next:0.;time/time-next:#[NaN]

10000000

10000019
time:9.999999999990905e-3;time-next:0.;time/time-next:#[+inf]

10000079
time:0.;time-next:0.;time/time-next:#[NaN]

10000103
time:0.;time-next:0.;time/time-next:#[NaN]

100000000

100000007
time:9.999999999990905e-3;time-next:9.999999999990905e-3;time/time-next:1.

100000037
time:9.999999999990905e-3;time-next:9.999999999990905e-3;time/time-next:1.

100000039
time:9.999999999990905e-3;time-next:9.999999999990905e-3;time/time-next:1.

1000000000

1000000007
time:2.9999999999972715e-2;time-next:.01999999999998181;time/time-next:1.5

1000000009
time:.04000000000007731;time-next:.01999999999998181;time/time-next:2.0000000000056843

1000000021
time:3.0000000000086402e-2;time-next:.01999999999998181;time/time-next:1.5000000000056843

10000000000

10000000019
time:.11999999999989086;time-next:.06000000000005912;time/time-next:1.9999999999962104

10000000033
time:.12000000000000455;time-next:.05000000000006821;time/time-next:2.3999999999968167

10000000061
time:.12000000000000455;time-next:.05999999999994543;time/time-next:2.000000000001895

100000000000

100000000003
time:.36000000000001364;time-next:.19000000000005457;time/time-next:1.8947368421047908

100000000019
time:.37000000000000455;time-next:.1999999999999318;time/time-next:1.8500000000006538

100000000057
time:.37000000000000455;time-next:.18999999999994088;time/time-next:1.9473684210532614

1000000000000

1000000000039
time:1.169999999999959;time-next:.6000000000000227;time/time-next:1.9499999999998578

1000000000061
time:1.17999999999995;time-next:.5900000000000318;time/time-next:1.9999999999998073

1000000000063
time:1.1499999999999773;time-next:.5900000000000318;time/time-next:1.9491525423727376

10000000000000

10000000000037
time:3.740000000000009;time-next:1.8600000000000136;time/time-next:2.0107526881720332

10000000000051
time:3.740000000000009;time-next:1.8799999999999955;time/time-next:1.9893617021276693

10000000000099
time:3.7899999999999636;time-next:1.8899999999999864;time/time-next:2.0052910052910007

100000000000000

100000000000031
time:11.809999999999945;time-next:5.960000000000036;time/time-next:1.9815436241610527

100000000000067
time:11.769999999999982;time-next:5.92999999999995;time/time-next:1.9848229342327286

100000000000097
time:11.840000000000032;time-next:5.949999999999932;time/time-next:1.9899159663865829
```
We can see the ratio is refined to 2 when remove `next`.So the new procedure `next` that can make the `prime?` to check only half of steps as before but add add quite a lot of cost beacuse invoke a new procedure and the procedure use a `if`.
