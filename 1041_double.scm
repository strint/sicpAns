(define (double p)
  (lambda (x) (p (p x))))

(define (inc x)
  (+ x 1))

(define (incinc x)
  ((double inc) x))
