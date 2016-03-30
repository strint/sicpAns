# Question
Exercise 2.40.

# Answer
## Codes
```scheme
; unique-pairs
(define (unique-pairs n)
  (accumulate append '()
    (map (lambda (i) 
           (map (lambda (j) (list j i))
     	        (enumerate-interval 1 (- i 1))))
  	 (enumerate-interval 2 n))))
(define (enumerate-interval i j)
  (if (> i j)
      '()
      (cons i (enumerate-interval (+ i 1) j))))
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

; prime-sum-pairs
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
(define (prime-sum? p)
  (prime? (+ (car p) (car (cdr p)))))
(define (make-pair-sum p)
  (append p (list (+ (car p) (car (cdr P))))))

; prime?
(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))
(define (divides? a b)
  (= 0 (remainder b a)))

```

## Running
```
1 ]=> (unique-pairs 4)

;Value 17: ((1 2) (1 3) (2 3) (1 4) (2 4) (3 4))

1 ]=> (prime-sum-pairs 4)

;Value 21: ((1 2 3) (2 3 5) (1 4 5) (3 4 7))
```
