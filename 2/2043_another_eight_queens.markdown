# Question
Exercise 2.43.

# Answer
对于(queens n)，我们通过算'adjoin-position'次数来衡量方案的时间复杂度。

对于原来的方案，有n^n次'adjoin-position'。

对于现在的方案，是一个树递归的过程，最后的n^n个叶子节点，每个节点经过n次'adjoin-position'生成结果，所以一共有(n^n)*n次'adjoin-position'。

所以如果原方案的时间是T，则现在方案的时间是T*n.
