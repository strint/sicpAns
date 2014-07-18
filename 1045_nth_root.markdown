# Question
Exercise 1.45.

# Answer
## Codes
```scheme
(define (i-expt b n)
  (define (iter-expt b n a k c)
    (if (= n 0)
        c
        (cond ((< (- n (* 2 k)) 0) (iter-expt b (- n k) b 1 (* a c))) ;n=[may have some 0,may have some 1]1 or [must have some 1, may have some 0]0 (binary)
              ((= (- n (* 2 k)) 0) (iter-expt b 0 b 0 (* a a c))) ;n=1[all 0] (binary)
              (else (iter-expt b n (* a a) (* 2 k) c)))))
  (iter-expt b n b  1 1))

(define (repeated f n)
  (define (repe-iter g i)
    (if (> i 1)
      (repe-iter (lambda (x) (f (g x))) (- i 1)) ;(repe-iter (lambda (x) (g (f x))) (- i 1)) also works
      g))
  (repe-iter (lambda (x) (f x)) n))

(define (average-damp f)
  (lambda (y) (/ (+ y (f y)) 2)))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))


(define (nth-root x nth k)
  (fixed-point (repeated (average-damp (lambda (y) (/ x (i-expt y (- nth 1))))) k) 1))
```

## Running
```
1 ]=> (nth-root 2.0 2 1)

;Value: 1.4142135623746899

1 ]=> (nth-root 2.0 2 2)

;Value: 1.414213562373095

1 ]=> (nth-root 8 3 1)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 8.0 3 1)

;Value: 1.9999981824788517

1 ]=> (nth-root 8.0 3 2)

;Value: 2.0000009087630515

1 ]=> (nth-root 8.0 3 3)

;Value: 1.9999995456190938

1 ]=> (nth-root 16.0 4 1)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 16.0 4 2)

;Value: 1.9829851551723494

1 ]=> (nth-root 32.0 5 1)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 32.0 5 2)

;Value: 2.8804315666156364

1 ]=> (nth-root 32.0 5 3)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 32.0 5 4)

;Value: 2.88042559337537

1 ]=> (nth-root 32.0 5 5)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 64.0 6 1)

;Value: 2.0000050404244165

1 ]=> (nth-root 128.0 7 1)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 128.0 7 2)

;Value: 1.7183312192217728

1 ]=> (nth-root 128.0 7 3)

;Value: 1.6075802728770112

1 ]=> (nth-root 128.0 7 4)

;Value: 2.1981552960176938

1 ]=> ^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 256.0 8 1)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 256.0 8 2)

;Value: 1.7470678130839874

1 ]=> (nth-root 256.0 8 3)

;Value: 1.675266584416704

1 ]=> (nth-root 256.0 8 4)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 256.0 8 5)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 256.0 8 6)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 256.0 8 9)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 512.0 9 1)
^C
Interrupt option (? for help): 
;Up!

1 ]=> (nth-root 512.0 9 2)

;Value: 2.0000004587096187

1 ]=> (nth-root 512.0 9 3)

;Value: 2.0000056192094

1 ]=> (nth-root 1024.0 10 1)

;Value: 1.9999947011920205

1 ]=> (nth-root 1024.0 10 2)

;Value: 1.7926372505649877

1 ]=> (nth-root 1024.0 10 5)
 
 ;Value: 2.2686725350057584

 1 ]=> (nth-root 1024.0 10 8)

 ;Value: 1.388957307981453
 ```
