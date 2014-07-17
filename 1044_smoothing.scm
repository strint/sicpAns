(define (smooth f)
  (lambda (x dx) (/ (+ (f (- x dx))
                       (f x)
                       (f (+ x dx)))
                    3)))
(define (repeated f n)
  (define (repe-iter g i)
    (if (> i 1)
      (repe-iter (lambda (x) (f (g x))) (- i 1)) ;(repe-iter (lambda (x) (g (f x))) (- i 1)) also works
      g))
  (repe-iter (lambda (x) (f x)) n))

