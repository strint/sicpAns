# Question
Exercise 2.24.

# Answer
## Codes
```scheme
(list 1 (list 2 (list 3 4)))
```
* The interpreter will print ` (1 (2 (3 4)))

* Box-and-pointer structure:
```
-->[ ][ ]-->[ ][ ]-->[ ][ ]-->[ ][/]
    |        |        |        |
   [1]      [2]      [3]      [4]
```

* Tree
(1 (2 (3 4)))
  |
|   |
1   (2 (3 4))
      |
    |   |
    2   (3 4)
          |
        |   |
        3   4
