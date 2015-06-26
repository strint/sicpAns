# Question
Exercise 2.50.

# Answer
## Codes
```scheme
(load "2049_picture_language_painters.scm")

(define (flip-horiz painter)
   (transform-painter painter
     (make-vect 1.0 0.0)
     (make-vect 0.0 0.0)
     (make-vect 1.0 1.0)))
(define (flip-ccw180 painter)
   (transform-painter painter
     (make-vect 1.0 1.0)
     (make-vect 0.0 1.0)
     (make-vect 1.0 0.0)))
(define (flip-ccw270 painter)
   (transform-painter painter
     (make-vect 0.0 1.0)
     (make-vect 0.0 0.0)
     (make-vect 1.0 1.0)))
(define (transform-painter painter origin corner-x corner-y)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame
                   new-origin
                   (sub-vect (m corner-x) new-origin)
                   (sub-vect (m corner-y) new-origin)))))))
```

## Running
```
1 ]=> (load "2050_flip_horiz.scm")

;Loading "2050_flip_horiz.scm"... 
;  Loading "2049_painters.scm"... done
;... done
;Value: transform-painter

1 ]=> (painter-wave f0)

;Unspecified return value

1 ]=> ((flip-horiz painter-wave) f1)

;Unspecified return value

1 ]=> ((flip-ccw180 painter-wave) f2)

;Unspecified return value

1 ]=> ((flip-ccw270 painter-wave) f3)

;Unspecified return value
```
结果如图：
<img src="2050_flip.png">

## Notes
* 由于对frame-coord-map的理解不清晰，导致实现make-frame时出现错误
