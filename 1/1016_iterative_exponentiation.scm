(define (i-expt b n)
  (iter-expt b n b  1 1))
(define (iter-expt b n a k c)
  (if (= n 0)
      c
      (cond ((< (- n (* 2 k)) 0) (iter-expt b (- n k) b 1 (* a c))) ;n=[may have some 0,may have some 1]1 or [must have some 1, may have some 0]0 (binary)
            ((= (- n (* 2 k)) 0) (iter-expt b 0 b 0 (* a a c))) ;n=1[all 0] (binary)
            (else (iter-expt b n (* a a) (* 2 k) c)))))
