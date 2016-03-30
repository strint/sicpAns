# Question
Exercise 1.13.  Prove that Fib(n) is the closest integer to n/5, where  = (1 + 5)/2. Hint: Let  = (1 - 5)/2. Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that Fib(n) = (n - n)/5.

# Answer
1、使用归纳法证明Fib(n)=(phi^n - psi^n)/5^0.5，使用1+phi=phi^2，1+psi=psi^2。
2、|phi^n/5^0.5 - Fib(n)| = (|psi|^n)/5^0.5 < 0.267 < 0.5，得证。
