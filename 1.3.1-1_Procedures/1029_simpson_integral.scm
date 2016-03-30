(define (si f a b n)
  (let ((h (/ (- b a) n)))
    (define (next x)
      (+ x 1))
    (define (yk k)
      (f (+ a (* k h))))
    (* (+ (sum yk 1 next (- n 1))
          (yk 0)
          (yk n))
       (/ h 3))))

(define (sum term a ne b)
  (if (> a b)
    0
    (+ (* (if (even? a)
            2
            4)
          (term a))
       (sum term (ne a) ne b))))

(define (cube x)
  (* x x x))
