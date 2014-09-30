(define (smooth f)
  (lambda (x dx) (/ (+ (f (- x dx))
                       (f x)
                       (f (+ x dx)))
                    3)))
(define (repeated f n)
  (define (repe-iter g i)
    (if (> i 1)
      (repe-iter (lambda (x dx) (f (g x dx) dx)) (- i 1)) ;(repe-iter (lambda (x) (g (f x))) (- i 1)) also works
      g))
  (repe-iter (lambda (x dx) (f x dx)) n))

(define (n-smooth f x dx n)
  ((repeated (smooth f) n) x dx))
