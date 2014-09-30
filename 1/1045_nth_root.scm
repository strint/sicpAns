(define (i-expt b n)
  (define (iter-expt b n a k c)
    (if (= n 0)
        c
        (cond ((< (- n (* 2 k)) 0) (iter-expt b (- n k) b 1 (* a c))) ;n=[may have some 0,may have some 1]1 or [must have some 1, may have some 0]0 (binary)
              ((= (- n (* 2 k)) 0) (iter-expt b 0 b 0 (* a a c))) ;n=1[all 0] (binary)
              (else (iter-expt b n (* a a) (* 2 k) c)))))
  (iter-expt b n b  1 1))

(define (repeated f n)
  (define (repe-iter g i)
    (if (> i 1)
      (repe-iter (lambda (x) (f (g x))) (- i 1)) ;(repe-iter (lambda (x) (g (f x))) (- i 1)) also works
      g))
  (repe-iter (lambda (x) (f x)) n))

(define (average-damp f)
  (lambda (y) (/ (+ y (f y)) 2)))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))


(define (nth-root x nth k)
  (fixed-point (repeated (average-damp (lambda (y) (/ x (i-expt y (- nth 1))))) k) 1))
