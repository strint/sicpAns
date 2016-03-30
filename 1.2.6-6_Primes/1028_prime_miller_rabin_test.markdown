# Question
Exercise 1.28.

# Answer
## Codes
```scheme
(define (mr n)
  (define (test-all-a count result)
    (display count) (display result) (newline)
    (if result
      (if (> count 1)
        (test-all-a (- count 1) (try-it (- count 1))) ;test all a, 1 < a < n
        #t)
      #f))
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (test-all-a n #t)) 

(define (expmod base expo m)
  (cond ((= expo 0) 1)
        ((even? expo) (let* ((x (expmod base (/ expo 2) m)) (r (remainder (square x) m)))
                          (if (and (= r 1) (not (= x 1)) (not (= x (- m 1)))) 0 r)))
        (else (remainder (* base (expmod base (- expo 1) m))
                         m))))
```
## Running
```
1 ]=> (mr 561)
561#t
560#t
559#f
;Value: #f

1 ]=> (mr 1105)
1105#t
1104#t
1103#f
;Value: #f

1 ]=> (mr 1729)
1729#t
1728#t
1727#f
;Value: #f

1 ]=> (mr 2465)
2465#t
2464#t
2463#f
;Value: #f

1 ]=> (mr 2821)
2821#t
2820#t
2819#f
;Value: #f

1 ]=> (mr 6601)
6601#t
6600#t
6599#f
;Value: #f
```
The Carmichael numbers cannot fool the Miller-Rabin test.

```
1 ]=> (mr 13)
13#t
12#t
11#t
10#t
9#t
8#t
7#t
6#t
5#t
4#t
3#t
2#t
1#t
;Value: #t

1 ]=> (mr 17)
17#t
16#t
15#t
14#t
13#t
12#t
11#t
10#t
9#t
8#t
7#t
6#t
5#t
4#t
3#t
2#t
1#t
;Value: #t

1 ]=> (mr 19)
19#t
18#t
17#t
16#t
15#t
14#t
13#t
12#t
11#t
10#t
9#t
8#t
7#t
6#t
5#t
4#t
3#t
2#t
1#t
;Value: #t
```
Miller-Rabin test works for real prime nubers too.
