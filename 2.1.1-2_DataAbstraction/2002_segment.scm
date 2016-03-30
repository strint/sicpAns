;point
(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p)) 
(define (y-point p)
  (cdr p))

;segment
(define (make-segment x1 y1 x2 y2)
  (cons (make-point x1 y1)
        (make-point x2 y2)))
;http://download.plt-scheme.org/doc/html/guide/Pairs__Lists__and_Scheme_Syntax.html
;The only thing more confusing to new Schemers than non-list pairs is the printing convention for pairs where the second element is a pair, but is not a list:
;
;  > (cons 0 (cons 1 2))
;    (0 1 . 2)
;
;In general, the rule for printing a pair is as follows: use the dot notation always, but if the dot is immediately followed by an open parenthesis, then remove the dot, the open parenthesis, and the matching close parenthesis. Thus, (0 . (1 . 2)) becomes (0 1 . 2), and (1 . (2 . (3 . ()))) becomes (1 2 3).
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))
(define (midpoint-segment s)
  (make-point (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2)
              (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2)))

;print
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
