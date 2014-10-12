# Question
Exercise 2.37.

# Answer
# Codes
```scheme
(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(define (matrix-*-vector m v)
  (map (lambda (w) (accumulate + 0 (map * v w))) m))
(define (transpose m)
  (accumulate-n cons '() m))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector cols v)) m)))
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (first seqs))
            (accumulate-n op init (rest seqs)))))
(define (first seqs)
  (if (null? seqs)
      '()
      (cons (car (car seqs))
            (first (cdr seqs)))))
(define (rest seqs)
  (if (null? seqs)
      '()
      (cons (cdr (car seqs))
            (rest (cdr seqs)))))

; test
(define m1 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define m2 (list (list 1 1 1) (list 2 2 2) (list 3 3 3) (list 4 4 4)))
(define v1 (list 1 2 3 4))
(define v2 (list 4 3 2 1))
```

# Running
```
1 ]=> v1

;Value 13: (1 2 3 4)

1 ]=> v2

;Value 14: (4 3 2 1)

1 ]=> (map * v1 v2)

;Value 15: (4 6 6 4)

1 ]=> (dot-product v1 v2)

;Value: 20

1 ]=> (matrix-*-vector m1 v1)

;Value 18: (30 56 80)

1 ]=> (transpose m2)

;Value 25: ((1 2 3 4) (1 2 3 4) (1 2 3 4))

1 ]=> (matrix-*-matrix m1 m2)

;Value 26: ((30 30 30) (56 56 56) (80 80 80))
```
