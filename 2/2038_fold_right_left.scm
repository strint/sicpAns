(define (fold-left2 op initial sequence)
  (if (null? sequence)
      initial
      (op (
