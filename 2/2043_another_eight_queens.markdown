# Question
Exercise 2.43.

# Answer
## Codes

## Analysis
对于(queens n)，我们通过算'adjoin-position'次数来衡量方案的时间复杂度。
(另外，递归本身是比较耗费时间的，原方案与现在方案在递归次数上差异巨大；因为有'safe?'，所以实际的'adjoin-position'次数要小于不考虑'safe?'的次数)
对于原来的方案，有n^n次'adjoin-position'。

对于现在的方案，是一个树递归的过程，最后的n^n个叶子节点，每个节点经过n次'adjoin-position'生成结果，所以一共有(n^n)*n次'adjoin-position'。

所以如果原方案的时间是T，则现在方案的时间是T*n.

## Notes
* 之前写这个程序出错是因为我按书上的例子来写'queen-cols'，但其中的'adjoin-position'在实现时参数顺序被我修改了（为了保持先列后行这样的顺序），导致参数传错
