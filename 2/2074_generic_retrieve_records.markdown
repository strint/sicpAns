# Question
Exercise 2.74.

# Answer
使用operation-type-table来管理每个division对各自数据提供的查找方法，需要各个division对自己的数据中加入标记以区分各个division的数据，并定义统一的查找方法的函数，函数内部根据各个division内部的数据结构来实现。
## a
对于get-record方法，indifidual division files需要在文件开始处加一个type tag，标明属于哪个division。每个division需要提供相应的get-record方法。

## b
同上，record中应该有能区分各个division的type tag，这个get-salary就能根据type tag去使用相应division的get-salary方法。

## c
find-employee-record可以循环调用get-record方法，去每个division file中尝试查找

## d
* 新的公司最好使用一个原有division的数据结构和方法。
* 必须定义新的数据结构时，在数据中加本公司的type tag，并提供检索方法，将这些方法打包安装到总部的查找程序中。
