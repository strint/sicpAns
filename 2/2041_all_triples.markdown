# Question
Exercise 2.41.

# Answer
## Codes
```scheme
; (pairs n)生成所有小于n的两个正数组成的数对，
; 然后每个数对的和被s减掉后得到的数作为三元组的第三个元素，
; 最后(fit? t)去掉那些第三个元素是负数的或大于n的三元组，得到符合要求的结果。

(define (all-triples n s)
  (define (fit? t)
    (let ((third (car (cdr (cdr t)))))
       (and (> third 0) (< third (+ n 1)))))
  (filter fit? (map (lambda (p) (append p (list (- s (+ (car p) (car (cdr p))))))) (pairs n))))

; pairs
(define (pairs n)
  (accumulate append '()
    (map (lambda (i) 
           (map (lambda (j) (list j i))
     	        (enumerate-interval 1 n)))
  	 (enumerate-interval 1 n))))
(define (enumerate-interval i j)
  (if (> i j)
      '()
      (cons i (enumerate-interval (+ i 1) j))))
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))
```

## Running
```
1 ]=> (all-triples 4 6)

;Value 12: ((1 1 4) (2 1 3) (3 1 2) (4 1 1) (1 2 3) (2 2 2) (3 2 1) (1 3 2) (2 3 1) (1 4 1))
```
