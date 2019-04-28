### Java

------

##### 1、 Java历史

+ 学习知识点：语法结构 面向对象核心 工具类 集合 异常 线程 I/O 反射 注解

+ 历史背景：

  - Java创始人：1995诞生 James Gosling （詹姆斯 高斯林）

  - 背景故事：加拿大出生 计算机语言天才的高斯林，14岁记住大学计算机中心的密码，进入中心，自学编程，15岁作为分析卫星、天文数据的临时编程员，80年代初期获得博士学位，就业于IBM公司，工作组不被高层看好，跳槽SUN，Stanford University Network公司，注册公司SUN Microsystems。SUN公司成立了研发团队，试图预测未来软件技术发展趋势 James Gosling成为项目负责人。Green项目智能家居，存在不能跨平台的问题（各种不同规格的芯片），于是想开发一套内部使用的编程语言（沿用了C++语法结构），取名为橡树（Oak），摒弃了C++过于庞大，不能跨平台的缺点。1992年对Oak语言进行展示，硬件生产商不支持，因为新语言没有经过检验，而且需要重新学习新的语言特性，成本较高，所以Oak语言暂且被搁置。1995年Sun公司想参加硅谷全球性的IT盛会，因为Oak已经作为商标被注册了，所以将语言取名为Java。1995.5.23 Sun公司正式发布了Java语言；**1996.1 发布开发JDK1.0**；1997.2 JDK1.1版本问世；1998.12 JavaEE企业版发布；**1999.6 Java第二代平台**（Java2 Standard Edition桌面级），细化了三个不同的小版本（不同方向：Java2 Enterprise Edition企业级，Java2 Micro Edition移动端）

    ​	1）J2SE：Java2 Standard Edition 桌面级

    ​	2）J2EE：Java2 Enterprise Edition 企业级

    ​	3）J2ME：Java2 Micro Edition 移动端

    2004.5 **JDK1.5版本发布 很多新特性 Java5**

    2005.6 **Java6 最经典版本，留存最久的版本**

    2009由于公司运行不当，被全球第二大互联网公司Oracle并购（74亿$）

    2011 Oracle发布Java7版本

    2014 Oracle发布Java8

    2017 Oracle发布Java9

##### 2、Java火爆的原因

+ 跨平台性（最早是针对不同厂商的芯片，现在是支持不同版本的操作系统）
+ 面向对象
+ 简单性：省去了C++的多继承，指针等等
+ 健壮性：垃圾回收机制、异常处理机制等
+ 多线程：并行操作，提高了执行性能，线程安全问题
+ 大数据开发：Java与很多新的技术发展息息相关

##### 3、Java语言特点

+ 跨平台性：平台（操作系统）

  Java通过JVM（Java virtual machine ，Java虚拟机）来跨平台，根据不同得到操作系统下载不同的虚拟机就行

  虚拟机作用：在内存中开辟一块空间，会将Java源文件编译为字节码

  高级编程语言：计算机只认识0（不通电），1（通电），越贴近人类的编程语言越高级

  程序存储在哪里：程序就是英文，存储在一个地方，我们称之为文件

  执行程序的过程：写完的程序，计算机不认识，所以需要编译（将我们写好的源文件编译成计算机能识别的字节码文件），最终有两个文件，源文件和字节码文件（存在硬盘上）

+ 计算机的组成：硬件和软件

  - 软件：操作系统软件（系统级别软件）、应用软件（放在系统级别软件上的软件，具有特定功能的软件）
  - 硬件：主板、CPU、声卡、显卡、网卡、内存、硬盘
    - 硬盘：矩形，容量、扇区，永久性保存；硬盘上的文件，用后缀名区分不同的格式；
    - 内存：程序执行时开辟内存，关闭后释放内存
  - 外部设备：耳机、鼠标、键盘（不是计算机必须的组成）

##### 4、JVM和JRE原理

+ 硬盘上存储的不同格式的文件，需要不同的运行环境来支持（比如txt用文本编辑器打开，.doc用word打开，word和文本编辑器就是一个执行该文件格式的环境）

+ Java源文件格式.java（用文本编辑器可以打开），通过虚拟机编译后为.class的字节码文件
+ JRE（Java Runtime Environment，Java运行环境）包含JVM，JVM将.java文件编译成.class文件，JRE提供可以打开.class格式文件的环境
+ JDK：Java Developement Kit Java开发工具包，JDK包含JRE，JDK（JRE（JVM））

##### 5、搭建环境

+ JDK：JDK安装程序，官网https://www.oracle.com，下载稳定版本Java SE 8u201/202

+ 查看电脑位数：我的电脑/属性/系统类型

+ 申请Oracle账号，下载后搭建环境

+ 卸载不要直接删除文件夹，因为电脑还有注册表，最好使用设置里的卸载程序

+ javac.exe：bin（binary二进制）文件夹下，编译工具（将Java代码编译成字节码.class文件）

+ java.exe：bin（binary二进制）文件夹下，执行工具（解释器，启动JVM，对.class文件内容进行处理，将机器码编译为机器指令），底层DOS命令窗口看效果，编辑器就是一个带颜色和提示功能的记事本
##### 6、  跨平台机制详解

+ JVM：Java虚拟机，将源文件.java翻译为字节码文件.class文件

+ JRE： Java Runtime Environment运行环境，运行别人写好的程序

+ JDK： 开发工具 Java Development Kit

  - bin文件夹： 全部是工具
  - include文件夹： 包含其他语言写的程序（native修饰符）
  - JRE文件夹：包含运行环境
  - lib文件夹：包含了写好的Java类
  - src.zip：源代码

##### 7、如何编写一段Java源代码（Java文件就是.java）

+ 利用JDK包中提供的工具，进行代码的编译及执行

+ doc命令窗口

+ 用记事本尝试写Java代码

 ```java
class Demo {
    
}
 //class是关键字Java类
 //命名规则：字母、数字（不能为类的开头）、下划线、符号（_ $）
 //不使用中文：字符集不一样反而容易出现乱码，且占用内存较多
 //字母（大小写，敏感）；不会以符号开头，内部类以$开头
 //规约：类名首字母大写，两个以上单词，每个单词首字母大写；起名要语义化较好

 ```

+ 代码的编译执行
  - 编译工具在doc命令窗口：win + R输入cmd打开doc窗口
  - 切换盘符：`d:`盘符名不区分大小写，`cd`切换盘符，切换文件夹`cd ..`退出一层；路径c://Program Files/Java/JDK1.8.0_211/bin/javac
  - 文件和编译工具不在一起：将工具箱放在一个公共位置共同使用，先在当前环境寻找编译工具，然后去共有位置查找工具
  - 配置环境变量：让所有专门后缀的文件都可以使用
    - 最好设置为用户环境变量，自己使用
    - 将Path设置为c://Program Files/Java/JDK1.8.0_211/bin
    - 设置环境变量以后，在什么环境下都可以使用JDK提供的exe执行程序
    - 注意将环境变量中java的环境变量放到最前面，否则容易报错


+ 代码的编译

  - cmd窗口切换到java文件夹下，运行`javac test.java`，会在当前文件夹下生成一个.class文件

```java
    class Demo {
        //主方法，固定写法
        public static void main (String[] args) {
            //public访问权限修饰符，修饰元素是公有的
            //static有且只有一个
            //void表示当前主方法执行完没有返回值
            //main方法名，虚拟机会自己找main
            //String[] args：arguments参数列表
            
            //输出不换行
            System.out.print("I am hansome");
            //输出后换行
            System.out.println("I am hansome 2");
            System.out.println("I am hansome 3");
            //输出结果：I am hansomeI am hansome 2 /n
			//I am hansome 3 /n
        }
    }
```

  - 直接执行`java Demo`即可输出

##### 8、  Java的基本数据类型

1）配置环境变量：Path，让工具可以在任何位置都可以使用

classPath：生成的Demo.class存储在，配置的目的是不管源文件在哪，生成的class文件都统一的存储在配置的目录下（百度学习配置）

JAVA_HOME：目的是为了让路径的写法变得简单（统一的把相同的路径用一个变量保存，相对路径的写法）

```
1.JAVA_HOME : C://program files/java/jdk（公共路径）
path: %JAVA%/bin （子路径）
%JAVA_HOME%就是变量 + /b 拼接路径
```

2）源文件与生成的字节码文件名字不一致：它是以类名进行生成的.class文件，两个名字不同会很难看出来联系，尽量将.java的文件名与里面的类名字相同

```java
//加上public后要求类名与文件名一致,demo.java,demo.class
public class Demo {
    public static void main (String[] args) {
        System.out.println("我真是太帅了！！！")
    }
}
```

3）基本数据类型

8种基本数据类型：

+ 4个整型：byte（字节型），short，int，long

  - byte：字节型，1byte，8bit（敏感的单元位），1byte=8bit，1（符号位）0000000，256种组合，表示数值的范围是-128~127
  - short：2byte，16bit，-32768~32767
  - int：4byte，32bit
  - long：8byte，64bit

+ 2个浮点型：

  - float：4byte，32bit，0（符号位）000000000（9整数部分）000...(小数部分)
  - double：8byte，64bit，第1个表示符号位，后面19位为整数位，其余为小数部分

+ 1个字符型：char 2byte，16位，用单引号区分字符中数字和整数的数字，解决冲突

  - 英文，符号，数字是一个字节

    00000000八位  a--------00000000--------97

    ASCII 美国信息交换标准代码，每一个数字对应一个字母 数字 符号，八位有256种组合（大小写字母，数字，符号的和为26*2 + 10 + 100 = 162，256完全够用，但是中文不够用）

  - 中文是两个字节：

    中文是两个字节，16位，使用Unicode编码

+ 1布尔型：boolean，1bit ，1/8byte，true false，布尔类型与数字类型不能转换

引用数据类型：

+ 数组：[ ]；

+ 类class（抽象类）；

+ 接口interface；

+ 枚举enum;

+ 注解@interface；

```java
class Demo {
    //源文件是存储在电脑硬盘中的文件，后缀名为.java
    public static void main (String[] args) {
    	    
    }
}
```

4）常量与变量

​	常量：程序运行过程中，不能再次改变的值，作用是：1.固定的值，代表计算过程中经常用到的值，便于程序计算 2.用来代表一个含义，如1，2，3，4代表四个运动方向。所有基本类型的值都是常量3.14、5、'a'、true，特殊常量是字符串，"abc"，String是一个引用数据类型，值很特殊，可以简单视为常量。自己创建的一个空间，存储一个值，让他固定起来，不能改变；

​	变量：变量指的是程序执行过程中可以被改变，变量是内存空间（小容器），变量空间在创建或声明的时候，必须指定数据类型，变量空间的名字，里面只能存储一个内容（值或引用），遵循小驼峰式命名法。见名知义，增强程序的可读性。

​	变量是一个空间，可以只创建空间，不存放内容；空的变量空间不能拿来使用，会产生编译错误。

​	注释的写法：1、单行注释// 	2.多行注释 /* */ 	3.文档注释/**   */（不会参与编译）

​	[^byte x = 1]这个指令，计算机底层做了什么事情：

​	1、硬盘上创建了一个test.java的文件

​	2、文件中的内容是我们编写的源代码（向计算机发送指令）

​	3、将Test.java源文件---->编译----->Test.class

​	4、执行：在内存中执行，，将硬盘上的Test.class内容加载到内存中

​	5、执行内存空间的赋值，存储，变化等

​	6、javac,java的执行程序工作原理图：

![](C:\Users\86180\Desktop\markdown笔记\typoraImg\java文件编译执行原理图.png)


```java
public class Demo {
    public static void main (String[] args) {
        int a = 1;
        byte c = 2;
        //常量缓冲区中会给1分配32bit的内存空间，但是=会进行自动转化，去掉无用的24个0
        
        String b = "abc";
        //字符串用双引号
        
        char f = 'a';
        //字符用单引号，只能写一个字符，不能多写字符
        //注意""与null是不同的
        
        //final定义的常量值不能被更改
        final int UP = 1;
        
        float d = 3.4;
        //执行会报错double转化到float会有损失
        //常量的存储形式是二进制形式存储的，系统为了保持精确程度，会默认给小数分配一个64bit的空间，这时在栈内存（开辟的是32bit的空间），所以存不下就会报错，解决float d = 3.4F；告诉计算机降低精度
        long e = 2147483648;//2的32次方，报错：过大的整数，计算机会认为是你写错了，其实他内存有64bit，所以要告诉计算机我确实需要这么大的整数，long e = 2147483648L;告诉计算机我需要这么大的整数    
    }
}
```

注意：常量缓冲区中整型默认为int(32bit)，小数默认为double(64bit)

5）数据类型之间的转化问题

```java
byte a = 1;//-128~127 8bit
int b = a;//-2147483648~2147483647 32bit 
```

+ 同种数据类型之间是可以直接进行赋值操作的[^int a = 1;int b = a;]
+ 数据类型不同的空间，之间的赋值 ---> 转换问题

> 同种大数据类型之间才能发生转化
>
> 1.基本类型与基本类型之间：可以直接转换（自动、强制）
>
> 2.引用类型与引用类型之间：可以直接转换（自动 强制--上转型 下转型）
>
> 3.基本类型与引用类型之间： 不可以直接转换（间接--包装类/封装类）

```java
int a = 1;//32bit
byte b = a;//8bit
//大空间放小空间是放不进去的

int a = 1;
byte b = (byte)a;//强制类型转换,前提要求int的值不溢出

float x = 3.4F;
double y = x;//会自动补0

double x = 3.4;
float y = (float)x;//会自动压缩空间

int a = 333;//00000000 00000000 00000001 01001101
byte b = (byte)a;//只保留8bit，01001101，十进制77

int a = 1000;//... 00000011强制砍断 11101000
byte b = (byte)a;
//-24,11101000-->取反-->00010111-->加1-->00011000,-24

int a = 1;
float b = a;//1.0，转换规则

float a = 1.9F;
int b = (int)a;//1，直接砍掉小数部分
//整型与浮点型，比较精确程度 浮点型精确程度高 可以直接存放整数 反之需要强制类型转换

char x = 'a';
int y = x;//97

char x = '我';
int y = x;//y是25105

//布尔类型很特殊，不能与其他基本类型进行转化

byte x = 1;
x = x + 2;//报错
//运行时以整型32bit进行计算，放到8bit的x中报错
//解决：x = (byte)(x + 2)

```

​	总结：

​	1）大数据类型空间可以直接接受小数据类型的值（自动转换）

​	2）小数据类型不可以直接接受大数据类型的值（强制类型转化）

##### 9、Java运算符

运算符：用来指明对于操作数的运算方式

运算符分类：

+ 按照操作数的数目进行分类：

  - 单目++、--，双目+，-，三目？：；

+ 按照运算符功能：

  - 算数运算：+，-，*，/，%，++，--  

    - ++x与x++的区别：

      ```java
      int x = 1;
      int y = x++;//++优先级比=高
      //值传递会产生备份空间
      //x++：做值交换时，先备份，后自增
      //++x：先自增，后备份
      
      int a = 1;
      a = a++;//1
      
      //面试题
      int m = 1;// 2 1 0
      int n = 2;// 3 2 1
      int sum = m++ + ++n - n-- - --m + n-- - --m;
      //sum = 2,m = 0,n = 1;
      ```

  - 赋值运算：= 、+=、 -=、/=、%=（会自动类型提升）

  - 关系运算：==、>=、<=、!=、>、<、instanceof

  - 逻辑运算：&逻辑与、|逻辑或、^逻辑异或、!逻辑非、&&短路与、||短路或

    - &：逻辑与，前后连接的应该是两个boolean的结果
    - |：逻辑或
    - ^：异或，前后结果不一致为true，[^(3>1)^(3>5)  //true]
    - !：将结果取反
    - &&：短路与，当前面结果为false时，性能比一般逻辑&好
    - ||：短路或，当前面结果为true时，后面不在计算（底层实现是短路），性能比逻辑或|好

  - 位运算（bit）

    - &：按位与

    - |：按位或

    - ^：按位异或

    - ~：按位取反

    - <<：按位左位移

    - ">>"：按位右位移

    - ">>>"：按位右位移

      进制转化问题：

      ![](C:\Users\86180\Desktop\markdown笔记\typoraImg\10进制转2进制.png)

      2进制转化为10进制：

      > ^2^5 + 2^4 + 2^3 + 2^2 = 60

      我们为了便于记忆，将二进制分成小单元，进行记忆：

      3个bit记录为一个单元：8进制 [^000 111 100] ,074

      4个bit记录为一个单元：16进制 [^0011 1100],0x3c
    ```java
      3 & 5;
      //..00000011 & ..00000101 --> 00000001 --> 1
      3 | 5;
      // 7
    
    原码：我们计算的码
    反码：正数不变，负数符号不动，其余取反
    补码：负数为反码+1
    
    计算机中不管整数还是负数，存储的形式都是以补码形式进行存储的
    
    6 << 2;//左位移，*2的位移次幂
    //00000110 --> 00011000 --> 24
    
    6 >> 1;//右位移，/2位移次幂
    
    -6 >> 1;//保留符号位置，填1
    //...111 11111010-->...111 11111101
    -6 >>> 1;//不保留符号位置，都填0
    ```

      

##### 10、Java语法结构

```java
//笔试题
1.&与&&的区别：
&前后条件都为true，最终结果就是true，可以视为逻辑运算和位运算
&&当前面条件为false时，发生短路，最终结果为false，只能作为逻辑运算

2.最有效率的方式计算2*8
    计算机2*8过程：
    00000010
   ×00001000
   ----------
    00000000
   00000000
  00000000
 00000010
  -----------
  0000010000(16)
使用乘法，浪费效率
最有效率：2 << 3
5*2//5<<2

3.int a = 1;int b = 2;如何将两个变量的值进行互换
//方式1：采用一个中间变量空间，浪费一个空间
int a = 1;
int b = 2;
int c = b;
b = a;
a = c;

//方式2：不浪费空间，容易产生越界问题
int a = 1;
int b = 2;
a = a + b;
b = a - b;
a = a - b;

//方式3：不浪费空间，也不会产生越界问题
//1^2^2 == 1;
//原理：一个数字异或同一个数字两次，值不会改变
int a = 1;//0000 0001
int b = 2;//0000 0010
a = a^b;//0000 0011
b = a^b;//0000 0001
a = a^b;//0000 0010
```

+ 语法结构：顺序结构、分支结构、循环结构
  - 顺序结构

  - 分支结构：
    - 单分支结构：if...else..

      ```java
      //设计一个小程序 
      //lib提供好的类库 Scanner引用
      Scanner y = new Scanner();
      switch (x) {
          case 1:
              System.out.println("monday");
              break;
          case 2:
              System.out.println("tuesday");
              break;
          ......
      }
      ```

      ```java
      //导包
      import java.util.Scanner;
      //public 要求类名与文件名一致
      public class Test
      	public static void main (String[] args){
      		Scanner input = new Scanner(System.in);
      		System.out.println("请您输入一个数字判断：");
      		int x = input.nextInt();
      		if(x > 100 && x < 150){
      			System.out.println("middle");
      		}else if (x <= 100 && x >= 0) {
      			System.out.println("small");
      		}else if (x >= 150) {
      			System.out.println("large");
      		}
      		else {
      			System.out.println("type not available.");
      		}
      	}
      }
      ```

      ```java
      //猜骰子点数
      import java.util.Scanner;
      public class RandomDice {
      	public static void main (String[] args){
      		//引入库
      		Scanner input  = new Scanner(System.in);
      		//提示玩家输入数字
      		System.out.println("请输入您要猜的点数：");
      		//玩家的输入的数字
      		int assumeNum = input.nextInt();
      		//生成随机点数
      		int randomPoint = (int)(Math.random()*6 + 1);
      		//超出范围的判断（Java类型还不会判断）
      		if (assumeNum > 6 || assumeNum <= 0){
      			System.out.println("请按规定输入1-6之间的数字，谢谢配合！");
      		}
      		else if (assumeNum == randomPoint){
      			System.out.println("666,您猜对了！奖励10分~~~");
      		}else {
      			System.out.print("点数为:" + randomPoint + (char)44);
      			System.out.println("抱歉，您猜错了！积分-10！-_-");
      		}	
      		}
      	}
      ```

      ```java
      import java.util.Scanner;
      public class Season {
          public static void main (String[] args) {
              //345春天，678夏天，9 10 11秋天，12 1 2冬天
              Scanner input  = new Scanner(System.in);
              System.out.println("请输入月份:");
              //nextInt读取整型数字，nextLine()读取字符串
              int month = input.nextInt();
              if (month >= 3 && month <=5){
                  System.out.println("Spring");
              }else if (month >= 6 && month <= 8) {
                  System.out.println("Summer");
              }else if (month >=9 &&  month <= 11 ) {
                  System.out.println("Autumn");
              }else if (month == 12 || month == 1 || month == 2) {
                  System.out.println("Winter");
              }else {
                  System.out.println("Month Error.");
              }
          }
      }
      //最优化的判断，代码量更少
      if(month < 1 || month > 12){
      	  System.out.println("Month Error.");
      }else if (month >= 3 || month <=5){
             System.out.println("Spring");
      }else if (month >= 6 || month <= 8) {
             System.out.println("Summer");
      }else if (month >=9 ||  month <= 11 ) {
             System.out.println("Autumn");
             }else {
                        System.out.println("Winter");
                    }
      ```

      写程序应注意的问题：

      1）增强可读性（起名，缩进，注释）

      2）健壮性（严谨，判断时逻辑要严谨）

      3）实现功能的基础上，能不能还优化（空间）

      c语言编程思想：面向过程（不能复用）；Java：面向对象。

    - 多分支结构：switch...case..

      switch(值)，值可以为byte short int char jdk1.5可以判断enum jdk1.7可以判断String。要注意jdk版本

      ```java
      switch (1) {
          case 1:
              System.out.println("monday");
              break;
          case :
              ...;
              break;
          default:
              ...;
      }
      ```

      不写break会将满足的以后的代码都会执行，因为程序必须找到"}"才认为执行结束，根据需要是否使用break。

      if的好处：可以写复杂的逻辑，缺点是每一个else if都会判断，执行较慢

      switch的好处：判断过程效率更高，缺点是只能做固定值的相等判断

      ```java
      //判断学生成绩所在区间
      import java.util.Scaner;
      public class Score {
          public static void main (String[] args) {
              Scanner input = new Scanner(System.in);
              System.out.println("请输入成绩：");
              int score = input.nextInt();
              //101-109判断
              switch (score/10) {
                  case 0:
                  case 1:
                  case 2:
                  case 3:
                  case 4:
                  case 5:
                      System.out.println("不及格");
                      break;
                  case 6:
                      System.out.println("及格");
                   	break;
                  case 7:
                      System.out.println("中等");
                   	break;
                  case 8:
                      System.out.println("良好");
                   	break;
                  case 9:
                      System.out.println("优秀");
                   	break;
                  case 10:
                      if(score==100){
                          System.out.println("满分");
                          break;
                      }  	
                	default:
                      System.out.println("请输入0-100之间的数字");
              }
          }
      }
      ```

      

  - 循环结构：for循环，while循环，do...while...（流程控制）

    - for循环：

      - 变量的声明周期问题：从声明开始创建出来，用完即回收

        ```java
        for(int i = 1;i < 6; i++){
            System.out.print(i);
        }
        System.out.print(i);
        //报错，因为循环结束声明的变量的生命周期结束了
        
        int round = 1;
        for(; round < 6; round++){
            System.out.print(round);
        }
        System.out.print(round);//6
        ```

        小任务：

        1.甲乙丙加工零件，加工零件总数为370个，如果甲加工的零件数多10，乙加工的零件数少20，丙加工的零件数乘2，三个人加工的零件数就相等

        ```java
        //丙是最大的，2*i<370,i<185;
        for(int i = 1;i < 185; i++){
            if(i - 10 + i + 20 + i/2 == 370) {
                System.out.print(i);//144
            }
        }
        ```

        

        2.小鸡，小兔子关在笼子里，小鸡和小兔子总共50只，脚的总数160只，求小鸡和小兔的数量

        ```java
        for(int i = 1;i < 40; i++){
            if(i*2 + (50-i)*4 == 160) {
                System.out.print(i);//20
            }
        }
        ```

        

+ 扩展："=="比较的是引用地址，引用数据类型比较相等应该用equals方法

##### 11、Java数组的使用

​	数组：Java中数组是数据类型相同的数据的组合，引用数据类型（String也是引用数据类型），数组内存储的类型可以是基本数据类型，也可以是引用数据类型。

​	数组定义（声明）：int[] arr（推荐写法，比较规范）; int x[];int []x;

​	数组的赋值（初始化）：

```java
public class Array {
    public static void main (String[] args) {
        //数组的定义
        int[] arr;
        char[] charArr;
        String[] str;
        
        //静态初始化
        int[] arr = new int[]{10, 20, 30}
        int[] arr = {10, 20, 30, 40}
        
        //取值（访问）
        int value = arr[0];
        System.out.println(value);//10
        arr[6];
        //ArrayIndexOutOfBoundsException数组索引越界
        
        //遍历JDK1.5版本之后新特性，增强for循环，forEach
        for(int val : arr){
            //只能取值，不能存值
            System.out.prinln(val);//10,20,30,40
        }
        
        //动态初始化
        int[] arr = new int[5];//定义数组长度为5
        //整数默认值为0，浮点型默认值为0.0，char默认为0，看不到 String默认为null Boolean 默认为false
    }
}
```

​	基本数据类型与引用数据类型的区别：

​	1）数组是一个引用数据类型

​	2）数组是堆内存中的一串连续的地址存在

​	3）堆内存中的空间长度一旦确定，不能在次改变

​	4）数组内部的存储类型可以是基本的，也可以是引用的数据类型

![](C:\Users\86180\Desktop\markdown笔记\typoraImg\引用与基本数据类型存值.png)

​	**小任务：**

​	*1.给定两个数组a{1,2,3,4} b{5,6,7,8}将两个数组内的元素进行互换*

```java
public class ChangeElem {
    public static void main (String[] args) {
        int[] a = {1, 2, 3, 4};
        int[] b = {5, 6, 7, 8};
        for(int i = 0; i < a.length; i++){
            //利用异或：a^b^b == a
            a[i] = a[i]^b[i];
            b[i] = a[i]^b[i];
            a[i] = a[i]^b[i];
        }
    }
}
```

​	*2.给定一个数组a{1,2,3,4,5,6}将数组中元素头尾对应位置互换*

```java
public class Demo {
    public static void main (String[] args) {
        int[] a = {1,2,3,4,5,6};
        a[a.length - 1] = a[0]^a[a.length - 1];
        a[0] = a[0]^a[a.length - 1];
        a[a.length - 1] = a[0]^a[a.length - 1];
        System.out.println(a[0]);
        System.out.println(a[a.length - 1]);
    }
}
```



​	*3.给定两个数组合并a{1,2,3} b{4,5}*

```java
public class Demo {
    public static void main (String[] args) {
        int[] a = {1,2,3};
        int[] b = {4,5};
        int len = a.length + b.length;
        int[] c = new int[len];
        for(int i = 0; i < len; i++){
            if(i < a.length) {
                c[i] = a[i];
            }else {
                c[i] = b[i - a.length];
            }
        }
    }
}
```



​	*4.给定一个数组a{1,2,3,9,4,5}*按照数组中最大值位置，将数组拆分成两个

```java
public class ArrayDemo {
    public static void main (String[] args){
        int[] arr = {1,2,3,9,4,5};
        int max = arr[0];
        int index = 0;
        //找到数组中最大值和索引
        for(int i = 1; i < arr.length; i++) {
            if(max < arr[i]){
                max = arr[i];
			   index = i;
            }
        }
        int[] arr1 = new int[index + 1];
        int[] arr2 = new int[arr.length - index - 1];
        for(int j = 0; j < arr.length ; j++) {
            if(j <= index) {
                arr1[j] = arr[j];
            }else {
                //用索引减去上一个数组的长度，后面就能创建新数组
                arr2[j - index - 1] = arr[j];
            }
        }
        for(int k : arr1){
			System.out.println(k);
	}
        for(int l : arr2){
			System.out.println("--" + l);
	}
    }
}
```



​	*5.寻找数组中最大值和最小值{1,2,4,9,3,5,8,7}*

```java
public class ArrayDemo {
    public static void main (String[] args){
        int[] arr = {1,2,3,9,11,4,5,7,8};
        int max = arr[0];
        int min = arr[0];
        for(int i = 1; i < arr.length; i++) {
            if(max < arr[i]){
                max = arr[i];
            }
            if(min > arr[i]){
                min = arr[i];
            }
        }
    }
}
```



​	*6.去掉数组中的0元素：a{1,2,3,0,0,4,5,0,6,0,7}*

```java
public class ArrayDemo {
    public static void main (String[] args) {
        int[] arr = {1,2,3,0,0,4,5,0,6,0,7};
        //注意要去掉0，去掉0后的长度是7
        int[] newArr = new int[7];
        int count = 0;
        for(int i = 0; i < arr.length ; i++) {
            if(arr[i] == 0) {
                count++;
                continue;
            }else {
                newArr[i - count] = arr[i];
            }
        }
        for(int j : newArr) {
            System.out.println(j);
        }
    }
}
```



​	*7.数组元素的排序（冒泡、快速、选择、希尔...）*

​	*8.用户的登录认证* 

