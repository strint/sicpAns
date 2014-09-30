# Question
Exercise 1.26.  Louis Reasoner is having great difficulty doing exercise 1.24. His fast-prime? test seems to run more slowly than his prime? test. Louis calls his friend Eva Lu Ator over to help. When they examine Louis's code, they find that he has rewritten the expmod procedure to use an explicit multiplication, rather than calling square:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
          ((even? exp)
                   (remainder (* (expmod base (/ exp 2) m)
                                          (expmod base (/ exp 2) m))
                                                              m))
                                                                      (else
                                                                               (remainder (* base (expmod base (- exp 1) m))
                                                                                                   m))))

``I don't see what difference that could make,'' says Louis. ``I do.'' says Eva. ``By writing the procedure like that, you have transformed the (log n) process into a (n) process.'' Explain.

# Answer
The expmod process is a recursive process. When using (square (expmod base (/ exp e) m)), (expmod base (/ exp e) m) is computed only once by applicative order, so it's a linear recursive process, and the time complexity is theta(log(exp)) because exp shiranks half each in each recursion. But when using (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m)), (expmod base (/ exp 2) m) needs to be computer twice each recursion, so it's a binary tree recursive process, and the total steps is (1 + 2 + 4 + ... + 2^(ln(exp)/ln(2))) which equals (exp - 1), so the time complexity turns to theta(exp).
