(define (mr n)
  (define (test-all-a count result)
    (display count) (display result) (newline)
    (if result
      (if (> count 1)
        (test-all-a (- count 1) (try-it (- count 1))) ;test all a, 1 < a < n
        #t)
      #f))
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (test-all-a n #t)) 

(define (expmod base expo m)
  (cond ((= expo 0) 1)
        ((even? expo) (let* ((x (expmod base (/ expo 2) m)) (r (remainder (square x) m)))
                          (if (and (= r 1) (not (= x 1)) (not (= x (- m 1)))) 0 r)))
        (else (remainder (* base (expmod base (- expo 1) m))
                         m))))
