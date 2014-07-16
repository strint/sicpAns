;a
(define (cont-frac n d k)
  (define (cf-iter i)
    (if (< i k)
      (/ (n i) 
         (+ (d i)
            (cf-iter (+ i 1))))
      0))
  (cf-iter 1))

(define (test k)
  (let ((g (/ 1 (/ (+ 1 (sqrt 5)) 2))))
    (if (< (abs (- g 
                   (cont-frac (lambda (i) 1.0)
                              (lambda (i) 1.0)
                              k)))
           0.0001)
      (display (- k 1))
      (test (+ k 1)))))


;b the iterative version
(define (cont-frac-i n d k)
  (define (cf-iter2 i k-to-i)
    (if (> i 1)
      (cf-iter2 (- i 1) (/ (n (- i 1)) (+ (d (- i 1)) k-to-i)))
      k-to-i))
  (cf-iter2 (+ k 1) 0))

(define (test-i k)
  (let ((g (/ 1 (/ (+ 1 (sqrt 5)) 2))))
    (if (< (abs (- g 
                   (cont-frac-i (lambda (i) 1.0)
                                (lambda (i) 1.0)
                                k)))
           0.0001)
      (display k)
      (test-i (+ k 1)))))
