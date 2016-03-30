(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) (cons (car s) x)) ; subsets equals subsets that don't contains (car s) and that contains (car s)
                          rest)))))

; test
(define s1 (list 1 2 3))
