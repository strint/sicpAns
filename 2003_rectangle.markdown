# Question
Exercise 2.3.

# Answer1
## Codes
```scheme
;rectangle
(define (make-rectangle ax ay bx by cx cy dx dy)
  (cons (cons (cons ax ay) (cons bx by)) (cons (cons cx cy) (cons dx dy))))

(define (perimeter r)
  (define ax (car (car (car r))))
  (define ay (cdr (car (car r))))
  (define bx (car (cdr (car r))))
  (define by (cdr (cdr (car r))))
  (define cx (car (car (cdr r))))
  (define cy (cdr (car (cdr r))))
  (* 2
     (+ (sqrt (+ (square (- bx ax))
                 (square (- by ay))))
        (sqrt (+ (square (- bx cx))
                 (square (- by cy)))))))

(define (area r)
  (define ax (car (car (car r))))
  (define ay (cdr (car (car r))))
  (define bx (car (cdr (car r))))
  (define by (cdr (cdr (car r))))
  (define cx (car (car (cdr r))))
  (define cy (cdr (car (cdr r))))
  (* (sqrt (+ (square (- bx ax))
              (square (- by ay))))
     (sqrt (+ (square (- bx cx))
              (square (- by cy))))))
```

## Running
```
1 ]=> (define r (make-rectangle 0 0 0 1 2 1 2 0))

;Value: r

1 ]=> (perimeter r)

;Value: 6

1 ]=> (area r)

;Value: 2
```

# Answer2
## Codes
```scheme
(define (make-point x y)
  (cons x y))
(define (make-segment p1 p2)
  (cons p1 p2))
(define (make-rectangle s1 s2)
  (cons s1 s2))
(define (get-length s)
  (sqrt (+ (square (- (car (car s)) (car (cdr s))))
           (square (- (cdr (car s)) (cdr (cdr s)))))))
(define (perimeter r)
  (* 2 (+ (get-length (car r))
          (get-length (cdr r)))))
(define (area r)
  (* (get-length (car r))
     (get-length (cdr r))))

;test
(define a (make-point 0 0))
(define b (make-point 0 1))
(define c (make-point 2 1))
(define s1 (make-segment a b))
(define s2 (make-segment b c))
(define r (make-rectangle s1 s2))
(newline)
(display (perimeter r))
(newline)
(display (area r))
```
## Running
```
1 ]=> (load "2003_rectangle_b.scm")

;Loading "2003_rectangle_b.scm"... 
6
2
;... done
```

# Answer 3
## Codes
```scheme
(define (make-point x y)
  (cons x y))
(define (make-segment p1 p2)
  (cons p1 p2))
(define (make-rectangle s1 s2)
  (cons (get-length s1)
        (get-length s2)))
(define (get-length s)
  (sqrt (+ (square (- (car (car s)) (car (cdr s))))
           (square (- (cdr (car s)) (cdr (cdr s)))))))
(define (perimeter r)
  (* 2 (+ (car r)
          (cdr r))))
(define (area r)
  (* (car r)
     (cdr r)))

;test
(define a (make-point 0 0))
(define b (make-point 0 1))
(define c (make-point 2 1))
(define s1 (make-segment a b))
(define s2 (make-segment b c))
(define r (make-rectangle s1 s2))
(newline)
(display (perimeter r))
(newline)
(display (area r))
```
## Running
```
1 ]=> (load "2003_rectangle_c.scm")

;Loading "2003_rectangle_c.scm"... 
6
2
;... done
```
