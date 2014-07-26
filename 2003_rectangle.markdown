# Question
Exercise 2.3.

# Answer
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
