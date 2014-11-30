(define (equal2? a b)
  (cond ((and (symbol? a) (symbol? b)) (eq? a b)) ; a、b都不是list，而是symbol
        ((and (not (symbol? a)) (not (symbol? b)) (not (eq? '() (cdr a))) (not (eq? '() (cdr b)))) (and (equal2? (car a) (car b)) (equal2? (cdr a) (cdr b)))) ; a、b都是list，(cdr a)、(cdr b)都不空
        ((and (not (symbol? a)) (not (symbol? b)) (eq? '() (cdr a)) (eq? '() (cdr b))) (equal2? (car a) (car b))) ; a、b都是list，(cdr a)、(cdr b)都空
        (else #f))) ; a、b都是list，(cdr a)、(cdr b)一空、一不空
