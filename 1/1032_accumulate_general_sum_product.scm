(define (accumulate_r combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate_r combiner null-value term (next a) next b))))

(define (accumulate_i combiner null-value term a next b result)
  (if (> a b)
    result
    (accumulate_i combiner null-value term (next a) next b (combiner result (term a)))))

(define (sum term a next b)
  (define (plus x y)
    (+ x y))
  (accumulate_r plus 0 term a next b))

(define (product term a next b)
  (define (multiply x y)
    (* x y))
  (accumulate_i multiply 1 term a next b 1))
