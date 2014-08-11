(define (reverse-list l)
  (define (rev l new-l)
    (if (null? l)
      new-l
      (rev (cdr l) (cons (car l) new-l))))
  (rev l '()))
(define (deep-reverse l)
  (define (d-rev l new-l)
    (cond ((null? l) new-l) ; before reaching the end of a list, l will always be a pair, and if l is not a pair, it is nil
          ((not (pair? (car l))) (d-rev (cdr l) (cons (car l) new-l))) ; when l is a pair and (car l) is not a pair, just add it to new-l
          (else (d-rev (cdr l) (cons (d-rev (car l) '()) new-l))))) ; when l is a pair(list)  and (car l) is also a pair(list), add (dev-rev (car l) '()) to new-l
  (d-rev l '()))

; test
(define x (list (list 1 2) (list 3 4)))
