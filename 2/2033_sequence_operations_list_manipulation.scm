(define (map2 p sequence)
  (accumulate (lambda (x y) (cons (if (not (pair? x))
                                    (p x)
                                    (map2 p x))
                                    y))
              '() sequence))
(define (append2 seq1 seq2)
  (accumulate cons seq2 seq1))
(define (length2 sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

; test
(define l1 (list 1 2 (list 3 4)))
(define l2 (list 5 6 (list 7 8)))
