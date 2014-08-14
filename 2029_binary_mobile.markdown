# Question
Exercise 2.29.

# Answer
## Codes
```scheme
(define (make-mobile left right)
  (list left right))
(define (make-branch len structure)
  (list len structure))
(define (left-branch m)
  (car m))
(define (right-branch m)
  (car (cdr m)))
(define (branch-length b)
  (car b))
(define (branch-structure b)
  (car (cdr b)))
(define (total-weight m)
  (if (pair? m)
    (+ (total-weight (branch-structure (left-branch m)))
       (total-weight (branch-structure (right-branch m))))
    m))
(define (torque b)
  (if (pair? (branch-structure b))
    (* (branch-length b) (+ (torque (left-branch (branch-structure b)))
                            (torque (right-branch (branch-structure b)))))
    (* (branch-length b) (branch-structure b))))
(define (balanced? m)
  (define (balance-test mob)
    (if (pair? mob)
      (if (= (torque (left-branch mob)) (torque (right-branch mob)))
        (and (balance-test (branch-structure (left-branch mob))) 
             (balance-test (branch-structure (right-branch mob))))
        #f)
      #t))
  (balance-test m))

; test
(define b1 (make-branch 1 2))
(define b2 (make-branch 2 3))
(define b3 (make-branch 3 4))
(define m1 (make-mobile b1 b2))
(define b4 (make-branch 5 m1))
(define m2 (make-mobile b3 b4))
(define m3 (make-mobile b4 b4))
(define b5 (make-branch 2 6))
(define b6 (make-branch 3 2))
(define m4 (make-mobile b5 b3))
(define m5 (make-mobile b6 b2))
(define m6 (make-mobile (make-branch 2 m5) (make-branch 1 m4)))
```

## Running
```
;--total-weight--
1 ]=> m1

;Value 20: ((1 2) (2 3))

1 ]=> m2

;Value 19: ((3 4) (5 ((1 2) (2 3))))

1 ]=> (total-weight m1)

;Value: 5

1 ]=> (total-weight m2)

;Value: 9

;--torque--
1 ]=> b3    

;Value 23: (3 4)

1 ]=> b4

;Value 24: (5 ((1 2) (2 3)))

1 ]=> (torque b3)

;Value: 12

1 ]=> (torque b4)

;Value: 40

;--balanced?--
1 ]=> (balanced? m2)

;Value: #f

1 ]=> (balanced? m1)

;Value: #f

1 ]=> m6

;Value 13: ((2 ((3 2) (2 3))) (1 ((2 6) (3 4))))

1 ]=> (balanced? m6)

;Value: #t

```
## Codes for (d)
```scheme
(define (make-mobile left right)
  (cons left right)) ;change
(define (make-branch len structure)
  (cons len structure)) ;change
(define (left-branch m)
  (car m))
(define (right-branch m)
  (cdr m)) ;change
(define (branch-length b)
  (car b))
(define (branch-structure b)
  (cdr b)) ;change
(define (total-weight m)
  (if (pair? m)
    (+ (total-weight (branch-structure (left-branch m)))
       (total-weight (branch-structure (right-branch m))))
    m))
(define (torque b)
  (if (pair? (branch-structure b))
    (* (branch-length b) (+ (torque (left-branch (branch-structure b)))
                            (torque (right-branch (branch-structure b)))))
    (* (branch-length b) (branch-structure b))))
(define (balanced? m)
  (define (balance-test mob)
    (if (pair? mob)
      (if (= (torque (left-branch mob)) (torque (right-branch mob)))
        (and (balance-test (branch-structure (left-branch mob))) 
             (balance-test (branch-structure (right-branch mob))))
        #f)
      #t))
  (balance-test m))

; test
(define b1 (make-branch 1 2))
(define b2 (make-branch 2 3))
(define b3 (make-branch 3 4))
(define m1 (make-mobile b1 b2))
(define b4 (make-branch 5 m1))
(define m2 (make-mobile b3 b4))
(define m3 (make-mobile b4 b4))
(define b5 (make-branch 2 6))
(define b6 (make-branch 3 2))
(define m4 (make-mobile b5 b3))
(define m5 (make-mobile b6 b2))
(define m6 (make-mobile (make-branch 2 m5) (make-branch 1 m4)))
```

## Running of codes for (d)
```
1 ]=> m1

;Value 14: ((1 . 2) 2 . 3)

1 ]=> m2

;Value 15: ((3 . 4) 5 (1 . 2) 2 . 3)

1 ]=> (total-weight m1)

;Value: 5

1 ]=> (total-weight m2)

;Value: 9

1 ]=> b3 

;Value 16: (3 . 4)

1 ]=> b4

;Value 17: (5 (1 . 2) 2 . 3)

1 ]=> (torque b3)

;Value: 12

1 ]=> (torque b4)

;Value: 40

1 ]=> (balanced? m2)

;Value: #f

1 ]=> (balanced? m1)

;Value: #f

1 ]=> m6

;Value 18: ((2 (3 . 2) 2 . 3) 1 (2 . 6) 3 . 4)

1 ]=> (balanced? m6)

;Value: #t
```
It is only needed to change the `right-branch` and the `branch-structure`.
