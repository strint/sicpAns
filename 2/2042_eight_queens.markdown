# Question
Exercise 2.42.

# Answer
## Codes
```scheme
(define (count-queens queens-list)
  (accumulate + 0 (map (lambda (l) 1) queens-list)))
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position k new-row rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

;tested
(define (enumerate-interval i j)
  (if (> i j)
      '()
      (cons i (enumerate-interval (+ i 1) j))))
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

; tested
(define (adjoin-position k new-row rest-of-queens)
  (if (= k 1)
      (list (list k new-row))
      (append rest-of-queens (list (list k new-row)))))

; tested
(define empty-board (list '()))

; tested
(define (safe? k positions)
  (if (= k 1)
      #t
      (and (safe-row? k positions) (safe-diag-135? k positions) (safe-diag-225? k positions))))
(define (safe-row? k positions)
  (let ((new-position (car (reverse positions)))
        (rest-positions (cdr (reverse positions))))
       (equal? '()
               (filter (lambda (posi) (= (car (cdr new-position))
                                         (car (cdr posi))))
                       rest-positions))))

(define (safe-diag-135? k positions)
  (let* ((new-position (car (cdr (car (reverse positions)))))
         (rest-positions (reverse (cdr (reverse positions))))
         (const-positions (const-pos-135 new-position k)))
        (compare-pos const-positions rest-positions)))
(define (safe-diag-225? k positions)
  (let* ((new-position (car (cdr (car (reverse positions)))))
         (rest-positions (reverse (cdr (reverse positions))))
         (const-positions (const-pos-225 new-position k)))
        (compare-pos const-positions rest-positions)))
(define (const-pos-135 new-position k)
  (define (const-iter i result)
    (if (= i 0)
        result
        (const-iter (- i 1) (append (list (list i (- new-position (- k i)))) result))))
  (const-iter (- k 2) (list (list (- k 1) (- new-position 1)))))  
(define (const-pos-225 new-position k)
  (define (const-iter i result)
    (if (= i 0)
        result
        (const-iter (- i 1) (append (list (list i (+ new-position (- k i)))) result))))
  (const-iter (- k 2) (list (list (- k 1) (+ new-position 1)))))  
(define (compare-pos pos1 pos2)
  (cond ((equal? pos1 '()) #t)
        ((equal? (car pos1) (car pos2)) #f)
        (else (compare-pos (cdr pos1) (cdr pos2)))))
```

## Running
现实的是解的个数，符合wikipedia中的结果：http://en.wikipedia.org/wiki/Eight_queens_puzzle#Counting_solutions
```
1 ]=> (count-queens (queens 0))
;Value: 1

1 ]=> (count-queens (queens 1))
;Value: 1

1 ]=> (count-queens (queens 2))
;Value: 0

1 ]=> (count-queens (queens 3))
;Value: 0

1 ]=> (count-queens (queens 4))
;Value: 2

1 ]=> (count-queens (queens 5))
;Value: 10

1 ]=> (count-queens (queens 6))
;Value: 4

1 ]=> (count-queens (queens 7))
;Value: 40

1 ]=> (count-queens (queens 8))
;Value: 92

1 ]=> (count-queens (queens 9))
;Value: 352

1 ]=> (count-queens (queens 10))
;Value: 724

1 ]=> (count-queens (queens 11))
;Aborting!: maximum recursion depth exceeded
```
# Note
* 现在还有好多重复代码，有空再精减一下
* 之前写出了好多bug。尤其是k=0和k=1时导致的bug
* 写的函数没有测试，结果后来出错了一个一个重新测，去找bug
* 不会在scheme里面debug，只有写例子一个一个函数的测，好苦逼
