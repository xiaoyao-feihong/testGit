### JVM学习

<hr>

##### 1、认识JVM

（1）JVM语言规范：定义什么是Java虚拟机

Java语言和Java虚拟机相对独立的，很多其他语言也是支持Java虚拟机规范的，比如如Clojure、Groovy、JRuby、Jython、Scala等

+ Class文件类型
+ 运行时数据
+ 帧栈
+ 虚拟机的启动
+ 虚拟机指令集



整数的表示：

> -6												-1
>
> 原码：10000110					10000001
>
> 反码：11111001					11111110
>
> 补码：11111010					11111111
>
> 为什么用补码？
>
> 1）计算0（既不是正数，也不是负数），因为我们不知道0是整数还是负数
>
> 使用补码可以没有歧义的表示0（0的补码无论是正数还是负数都是全0表示的）
>
> 2）补码让计算更方便
>
> -6 + 5															-3 + 5
>
> 11111010		-6									11111101
>
> 00000101		 5									00000101
>
> =====================================
>
> 11111111		-1									00000010	(2)

浮点数的表示：

> （1）Float类型：符号位（1） 指数位（8） 位数（23）
>
> s	e e e e e e e e	m m m m m m m m m m m m m m m m m m m m m m m 
>
> 如果指数位e全0，则附加位为0，否则尾数附加位为1
>
> -5的表示：1 <font color="red">1 0 0 0 0 0 0 1</font>	01000000000000000000000
>
> -1\* 2^(129-127)*(2^0+2^-2)   完整表达式：-1 \* 2^(2^7+1)
>
> 值的计算：s\*m\*2 ^ (e-127)  \* (隐藏位 + m \* 2^-1 + m*2^-2 + m \* 2^-3 + ... + m \* 2^-23)；127是固定位移数



（2）JVM需要对Java Library提供以下支持

这些都是Java语言本身是无法实现的，必须通过底层实现，这些真正的loader是无法访问到的

+ 反射	java.lang.reflect
+ ClassLoader
+ 初始化class和interface
+ 安全相关：java.security
+ 多线程
+ 弱引用



（3）VM指令集

+ l2i类型转化
+ aload astore出栈入栈操作（进栈，出栈）
+ iadd isub运算（相加，相减）
+ ifeq ifne流程控制（相等和不等）
+ invokevirtual invokeinterface invokespecial invokestatic函数调用
+ javap反编译



##### 2、Java虚拟机的运行机制

（1）JVM启动流程

java xxx.java --->  装载配置（jvm.cfg）--->   根据配置找到JVM.dll ----> 初始化JVM（获得JNIEnv接口，findClass通过它来实现） ----> 找main方法并运行



（2）JVM基本结构

![](testGit/typoraImg/JVM.png)

PC寄存器

+ 每一个线程拥有一个PC寄存器
+ 在线程创建时，创建寄存器
+ 指向下一条指令的地址
+ 执行本地方法时，PC的值是undefined























