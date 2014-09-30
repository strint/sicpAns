# Question
Exercise 1.10.  The following procedure computes a mathematical function called Ackermann's function.

    (define (A x y)
      (cond ((= y 0) 0)
            ((= x 0) (* 2 y))
            ((= y 1) 2)
            (else (A (- x 1)
                     (A x (- y 1))))))

Q1: What are the values of the following expressions?

    (A 1 10)
    
    (A 2 4)
    
    (A 3 3)

Q2: Consider the following procedures, where A is the procedure defined above:

    (define (f n) (A 0 n))
    
    (define (g n) (A 1 n))
    
    (define (h n) (A 2 n))
    
    (define (k n) (* 5 n n))

Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5n2.

# Analyzing
## Q1
### (A 1 10)

    (A 1 10)
    
    (A (- 1 1) (A 1 (- 10 1)))
    (A 0 (A 1 9))

    (A 0 (A 0 (A 1 8)))

    (A 0 (A 0 (A 0 (A 1 7))))

    ...

    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))

       
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2))))))))))


    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (* 2 2))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))))

    ;每一步y被乘以2作为下一个y
    ...

答案为1024.

### (A 2 4)

    (A 2 4)

    (A (- 2 1) (A 2 (- 4 1)))
    (A 1 (A 2 3))

    (A 1 (A (- 2 1) (A 2 (- 3 1))))
    (A 1 (A 1 (A 2 2)))

    (A 1 (A 1 (A (- 2 1) (A 2 (- 2 1)))))
    (A 1 (A 1 (A 1 (A 2 1))))

    (A 1 (A 1 (A 1 2)))

    (A 1 (A 1 (A (- 1 1) (A 1 (- 2 1)))))
    (A 1 (A 1 (A 0 (A 1 1))))

    (A 1 (A 1 (A 0 2)))

    (A 1 (A 1 (* 2 2)))
    (A 1 (A 1 4))

    (A 1 16);根据上一小题的结果推测

答案为2^16

### (A 3 3)

    (A 3 3)

    ...

    (A 2 (A 2 (A 3 1)))
    (A 2 (A 2 2)); (A 3 3) 经过3-1次替换，x都减1

    ...

    (A 2 (A 1 (A 2 1)))
    (A 2 (A 1 2); (A 2 2)经过2-1次替换，x都减1

    ...
    
    (A 2 (A 0 2); (A 1 2)经过2-1次替换，x都减1

    (A 2 4);x降到了x-1

    ...

    (A 1 (A 1 (A 1 2))); (A 2 4)经过4-1次替换，x都减1

    ...

    (A 1 (A 1 (A 0 2)))
    (A 1 (A 1 4))

    ...

    (A 1 (A 0 (A 0 (A 0 2)))); (A 1 4)经过4-1次替换，x都减1

    ...

    (A 1 16); (A 1 16)经过16-1次替换，x都减1

答案为2的16次方。

## Q2

    (define (f n) (A 0 n))

f(n) = 2*n

    (define (g n) (A 1 n))

g(n) = 2*g(n-1) = 2^n; g(1) = 1;
    
    (define (h n) (A 2 n))

h(n) = 2^(h(n-1)); h(1) = 1;

规律：A(x,y) = A(x-1, A(x-1, ... A(x-1, 1))); 中间有y-1个'A(x-1,'。
