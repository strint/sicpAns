# Question
Exercise 2.76.

# Answer
## 添加新数据类型时：
* explicit-dispatch需要将每个方法加入到对应的generic方法中。
* data-directed需要构建一个方法包，将该方法包安装到环境里即可，不用修改之前的代码。
* message-passing需要只需要构建自己的数据生成方法，添加到环境中即可，不需要修改之前的代码。

## 添加新方法时：
* explicit dispatch需要将新方法组成一个generic方法，不修改之前的代码。
* data-directed需要修改每个数据类型的安装包，并重新安装。
* message-passing需要修改每个数据类型的生成方法，重新添加到环境中。

## 变化
根据上面的分析，可知：
* 对于经常添加数据类型的系统，最好使用data-directed或者message-passing
* 对于经常添加方法的系统，最好使用explicit-dispatch
