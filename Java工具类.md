### Java工具类

<hr>

##### 1、枚举

引用数据类型：数组，类，抽象类`abstract class`，接口`interface`，枚举，注解`@interface`



枚举类：一个类中的对象，认为个数是有限且固定的，可以将一个对象都列举出来

Enum类型：

两个属性，name()获取name的属性，ordinal()获取序号，类似index

常用方法：`valueOf`()获取对应的枚举对象、`values()`获取所有的枚举对象、`compareTo()`、`toString()`

```java
//JDk1.5版本以后增加的枚举类
public class Demo {
    private Demo (){}
    public static final Day monday = new Day();
    ...
    public static final Day sunday = new Day();
}

public class Test {
    public static void main (){
        Day d = Day.monday;
        ...
    }
}

//枚举类使用
//每一个enum类型的类，会默认继承Enum,枚举类型不能继承其他类
public enum Demo {
    //系统内部做了private staic final
    monday,tuesday,wendesday,thursday,friday,saturday,sunday
}

public class Test {
    public static void main (String[] args){
        Demo d = Demo.monday;
        //下面由很多方法
    }
}
```

输入一个日期的英文单词，输出中文：

```java
import java.util.Scanner;
public enum Day {
    monday("星期一",1),tuesday,wednesday,
    thursday,friday,saturday,sunday
    private Day (String name,int index){
        this.name = name;
        this.index = index;
    }
    public String getName (){
        return this.name;
    }
}
public class Test {
    public static void main (String[] args){
        Scanner input = new Scanner(System.in);
        String key = input.nextLine();
        Day day = Day.valueOf(key);
        switch (day) {
            case monday:
                System.out.println("星期一");
             ...
            default:
                System.out.println("输入单词有误.")
        }
    }
}
```

##### 2、内存机制问题

通过new的指令创建的对象在堆内存中存储，通过Garbage Collection回收

GC是一个线程，用来回收堆内存中的垃圾

```java
public class Person {
    //重写Object的finalize方法，用来回收
    public void finalize () {
        System.out.println("开始回收垃圾");
    }
}
public class Test {
    public static void main (String[] args){
        Person p = new Person();
        p = null;
        System.gc();
    }
}
```



Runtime类：

`maxMemory()`堆的总内存

`totalMemory()`堆开辟的可使用的内存

`freeMemory()`堆开辟的内存中空闲的内存

Runtime图解：

![](C:\Users\86180\Desktop\testGit\typoraImg\堆内存的开辟.png)

```java
Runtime r = Runtime.getRunTime();
//返回值为long类型
long max = r.maxMemory();
long total = r.totalMemory();
long free = r.freeMemory();
```

堆内存溢出：`OutOfMemoryError`堆内存溢出错误



##### 3、包装类

​	包装类也可以称为封装类，Java开发者写好的类

​	八个包装类都在`java.lang`包下，不需要import导包

​	文档下载：

​	https://docs.oracle.com/javase/8/docs/api下载`javaAPIs`

​	包装类：`byte--Byte`,`char--Character`,`short--Short`,`int--Integer`,`long--Long`,`boolean--Boolean`,`float--Float`,`double--Double`

​	拆包：`intValue()`,`floatValue()`等等

```java
public class Test {
    public static void main (String[] args){
        //1.Integer.parseInt()
        int a = Integer.parseInt("123");
        int i = new Integer("abc");
        //NumberFormatException数字格式化异常
        //JDK1.5以前需要拆装
        Integer i1 = new Integer(10);
        int value = i1.intValue();
        //常见面试题
        Integer i1 = 10;
        Integer i2 = 10;
        Integer i3 = new Integer(10);
        Integer i4 = new Integer(10);
        System.out.println(i1 == i2);//true
        System.out.println(i1 == i3);//false
        System.out.println(i3 == i4);//false
        System.out.println(i1.equals(i2));//true
        System.out.println(i1.equals(i3));//true
        System.out.println(i3.equals(i4));//true
        //==比较地址，equals比较值的大小
        //这个equals是Integer重写的方法，不是Object的方法
        //如果i1改为1000，发现i1==i2为false
        //-128~127比较的是默认初始化到缓存中的地址，超过这个值的声明会重新创建一个新对象
    }
}
```



###### （1） 数学相关

​	在java.lang包下，Math构造方法是私有的，不能直接调用创建对象

​	常用Math的方法：

> 1.`Math.abs()`返回值为`double`类型
>
> 2.`Math.floor()`返回值为`double`类型
>
> 3.`Math.ceil()`返回值为`double`类型
>
> 4.`Math.rint()`返回值为`double`类型，如果两边距离一样则返回偶数
>
> 5.`Math.round()`返回值是`int`或者`long`类型，`float`就是`int`类型，`double`就是`long`类型
>
> 6.Math.pow(a,b)参数是double类型，返回值也是double类型
>
> 7.Math.max(),Math.min()找两个值中小的一个
>
> 8.Math.sqrt()参数是double类型
>
> 9.Math.random()返回值是double类型

```java
0-9的随机整数
(int)(Math.random()*10);

5.0-10.9的随机数
Math.random()*6+5;
//Math.random()在小数上可能存在一些问题比如0.0~5.4999

使用Random()包，使用如下：
1.位置java.util.Random;
2.没有任何继承关系，默认继承Object类
3.查找构造方法-->如何创建对象
import java.util.Random;
Random r = new Random();
int val = r.nextInt();//范围是整型数据的范围-2147483648-2147483647
int val2 = r.nextInt(10);//[0-10),[0,bound)bound必须是正数
//bound为负数：IllegalArgumentException
float f = r.nextFloat();//[0.0,1.0)

UUID类：没有任何继承关系
import java.util.UUID;
UUID uuid = UUID.randomUUID();
uuid.toString();
//随机产生一个32位的16进制数,用来做数据库表格主键

BigInteger类
//大整数 java.math包 需要Import导入 都是数组实现的 继承自Number
BigDecimal
BigInteger bi1 = new BigInteger("13412");
BigInteger bi2 = new BigInteger("13412342");
//类中常用的方法，做四则运算
bi1.add(bi2);
bi1.subtract(bi2);
bi1.multiply(bi2);
bi1.divide(bi2);

//保留两位小数，向下取
BigDecimal bd = new BigDecimal("3.4562");
bd.setScale(2,BigDecimal.ROUND_DOWN);

//java.text包
DecimalFormat df = new DecimalFormat("000.###");//数字表示不够位数补数字，#表示不够不补，多了只保留三位
String value = df.format(123.456789);//123.457四舍五入

```

System类在`java.lang`包下，`out`输出、`in`输入、`err`、`currentTimeMillis`获取当前毫秒数，`gc()`通知垃圾回收

> ```java
> long time = System.currentTimeMillis();
> ```



###### （2）日期相关

Date()被废弃了，没有考虑时区，被calender类取代

```java
Date d = new Date(1558860322483L);
Date d2 = new Date();//废弃的意思，不推荐使用
System.out.println(d);
System.out.println(d.before(d2));//d是否在d2前，返回一个布尔值
d.setTime(1558860323000L);//设置时间
d.getTime();//获取时间（毫秒）
d.compareTo(d2);//按照创建的顺序比较，1后创建，-1之前创建
//DateFormat是一个抽象类，在java.text包下，SimpleDateFomat是重写了的具体类
DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//多态
System.out.println(sdf.format(new Date()));//2019-05-26 04:59:25
//Calender类，在java.util包下
Calendar c = Calendar.getInstance();
//常用方法：
//1.after()
//2.before()
//3.getTimeZone()时区相关信息
//4.set()设置某一个
//5.get()获取某一个
Calendar c = Calendar.getInstance();
System.out.println(c);//c是JSON格式
int year = c.get(Calendar.YEAR);
int month = c.get(Calendar.MONTH);//月份从0开始计算的
int day = c.get(Calendar.DAY_OF_MONTH);
c.set(Calendar.YEAR,2015);//将年份设置位2015年
System.out.println(year + ":" + month + ":" + day);//2019:4:26
TimeZone tz = c.getTimeZone();//TimeZone.getDefault()
System.out.println(tz.getID());//Asia/Shanghai
tz.getDisplayName();//中国标准时间
```

**<font color="red" size="4">以下类很重要:</font>**

###### （3）字符串

所属包在`java.lang`包下，不需要引入，和其他语言都是用字符串传递的，所以很重要



String比较的原理图：

![](C:\Users\86180\Desktop\testGit\typoraImg\String的比较.png)

String的特性：

1）常见的String的笔试题：==与equals的区别，String的不可变特性，String与StringBuffer区别，StringBuffer与StringBuilder的区别

2）实现了Serializable，CharSequence，Comparable三个接口

3）如何构建对象：

> 1、创建方法
>
> String str = "abc"; `直接赋值（在字符串常量池）
>
> `String  str = new String("abc");`利用构造方法创建String对象
>
> `String str = new String(byte[] c);`利用byte数组创建字符串，将数组中的每一个数字转化成对应的char，组合成String
>
> `String str = new String(char[] c);`利用char数组创建字符串
>
> 2、常用的方法
>
> （1）`equals()`比较字面值是否相等（重写了Object的equals方法）
>
> （2）`hashCode()`重写了Object的`hashCode`方法（31*h 的和）
>
> 3、String的不可变性
>
> 体现在长度和内容上
>
> ​	长度：final修饰的数组，数组长度本身不变，final修饰数组的地址也不变
>
> ​	内容：private修饰的属性，不能再类的外部访问
>
> ```java
> //String类中的定义
> private final char[] value;
> //但是每一个字符是可以改变的
> 
> 
> ```
>
> **字符串的内容是存储在方法区的常量池里面的，是为了方便字符串的重复使用**
>
> 4、String类的判断功能
>
> ```java
> equals(Object obj);
> equalsIgnoreCase(String str);//忽略大小写进行判断
> startsWith(String str);//判断字符串对象是否以str开头，用来判断文件开头
> endsWith(String str);//判断字符串对象是否以st结尾，用来判断文件后缀名
> 
> 
> ```
>
> 5、模拟用户登录
>
> ```java
> package logindemo;
> import java.util.Scanner;
> public class Login {
> private String[][] arr = {{"zs","111"},{"ls","222"},{"zhuminmin","666"},{"admin","admin123"}};
> private int count = DEFAULT_COUNT;
> private static int DEFAULT_COUNT = 3;
> public Login () {}
> public Login (int inputCount ){
> this.count = inputCount;
> }
> public void start() {
> //控制输入的次数
> boolean a = false;
> for(int i = 0; i < this.count;i++){
> Scanner input = new Scanner(System.in);
> System.out.println("请输入用户名：");
> String userName = input.nextLine();
> System.out.println("请输入密码：");
> String password = input.nextLine();
> for(int j = 0; j < arr.length; j++){
>     if(arr[j][0].equals(userName)&&arr[j][1].equals(password)){
>         System.out.println("登录成功");
>         a = true;
>         break;
>     }
> }
> if(a){
>     break;
> }else{
>     if(this.count - i - 1 == 0){
>         System.out.println("登录失败，请与管理员联系");
>     }else{
>         System.out.println("用户名或密码错误，你还有"+(this.count-i-1)+"次机会");
>     }
> }
> }
> }
> //主方法
> public static void main (String[] args){
> Login  l = new Login();
> l.start();
> }
> }
> 
> 
> ```
>
> 6、字符串的获取功能
>
> ```java
> int length()//获取字符串的长度
> char charAt(int index)//获取指定索引的字符
> int indexOf(String str)//获取str在字符串对象中第一次出现的索引
> String substring(int start)//从start位置截取字符串
> String substring(int start,int end)//从start处截取字符串到end结束，不包含最后一位
> 
> int compareTo(String str);
> //按照两个字符串长度较短的那个作为循环的次数，挨个比较
> //循环内有结果，返回结果，否则比较长度
> //实现自Comparable接口
> 
> String toString();//重写了toString方法
> //public String toString() {return this;}
> 
> String concat();//将给定字符串拼接在当前字符串后面
> //因为原数组地址不能改变，长度固定，多以返回的是一个新的String对象
> //concat方法的性能比拼接的方法性能快很多
> //concat方法：不会在常量池中拼接产生一个新的对象
> //StringBuffer拼接效率非常高，没有用final修饰，可以不断扩容，频繁拼接使用StringBuffer
> 
> boolean contains(CharSequence);//判断是否包含一个字符串，返回一个布尔值
> 
> byte[] getBytes();//将字符串拆成一个byte数组
> 
> char[] toCharArray();//将字符串拆成一个char数组
> 
> int indexOf(str,fromIndex);//找寻字符在字符串中第一次出现的位置索引，第二个参数是从指定索引开始找
> 
> int lastIndexOf();//从数组末尾开始找
> 
> String replace();//所有出现该串的地方全换
> String replaceAll();//全换
> String replaceFirst();//只换第一次出现的字串
> 
> String[] split(String regex,int limit);//拆分字符串
> String toUpperCase();//转换成大写
> String toLowerCase();//全部转成小写
> String trim();//去掉字符串前后多余空格
> 
> String.valueOf(char c);//将字符变字符串
> 
> 
> ```

4）String的作业

> 字符串作业：
>
> 1.设计方法将字符串反转
>
> ```java
> public String reverse (String str){
> char[] charArr = str.toCharArray();
> for(int i = 0; i < charArr.length/2; i++){
>   char temp = charArr[i];
>   charArr[i] = charArr[charArr.length-i-1];
>   charArr[charArr.length-i-1] = temp;
> }
> return new String(charArr);
> }
> 
> 
> ```
>
> 
>
> 2.将指定字符串的正序和反序进行连接 ok->okko
>
> ```java
> public String reverseAndConcat (String str){
> return str.concat(this.reverse(str));
> }
> //return str.concat(this.reverse(str));
> 
> 
> ```
>
> 
>
> 3.判断给定字符串是否回文 abccba abcba
>
> ```java
> public boolean isPalindrome (String str) {
> if(this.reverse(str).equals(str)){
>   return true;
> }
> return false;
> }
> 
> 
> ```
>
> 
>
> 4.将给定字符串右移x位置 helloworld -> ldhellowor
>
> ```java
> public String moveToRight (String str,int count){
> //截取
> if(count > str.length()){count %= str.length();}
> String begin = str.substring(0,str.length()-count);
> String end = str.substring(str.length());
> return end.concat(begin);
> }
> 
> 
> ```
>
> 
>
> 5.寻找若干字符串中最长的那个
>
> ```java
> public String findMax (String...strArr){
> String result = strArr[0];
> int maxLength = strArr[0].length();
> for(int i = 0; i < strArr.length; i++){
>   if(strArr[i].length() > maxLength){
>       maxLength = strArr[i].length();
>       result = strArr[i];
>   }
> }
> return result;
> }
> 
> 
> ```
>
> 
>
> 6.统计给定字母在字符串中出现的次数
>
> ```java
> //方法1：
> public int letterExistCount (String str,char c){
> int count = 0;
> for(int i = 0; i < str.length(); i++){
>   if(str.charAt(i) == c) count++;
> }
> return count;
> }
> 
> //方法2
> return str.length() - str.replace(""+c).length();
> 
> 
> ```
>
> 
>
> 7.将给定的字符串每一个首字母大写
>
> ```java
> public String letterFirstToUpperCase (String str){
> String[] strArr = str.split(" ");
> String result = "";
> for(int i = 0; i < strArr.length; i++){
>   String value = strArr[i];
>   result = result.cancat(value.substring(0,1).toUperCase().concat(str.substring(1)));
> }
> return result;
> }
> 
> 
> ```
>
> 
>
> 8.获取给定字符串中的全部数字（返回`int`类型）
>
> ```java
> public int getAllNumerInString (String str){
> String result = "";
> for(int i = 0; i < str.length(); i++){
>   int value = str.substring(i,i+1).codePointAt();
>   if(value > 47 && value < 58){
>       result = result.concat(String.valueOf((char)value));
>   }
> }
> return  Integet.parseInt(result);
> }
> 
> 
> ```

**<font color="pink">5)</font>**	StringBuffer与StringBuilder的区别

> （1）String与StringBuffer与StringBuilder的区别
>
> String：Serializable，CharSequence，Comparable
>
> StringBuilder和StringBuffer：Serializable，CharSequence，Appendable
>
> String是不可变字符串，StringBuilder是可变字符串
>
> String具有不可变性，频繁修改内容时性能不太好
>
> （2）StringBuffer/StringBuilder没有compareTo方法，新增了append方法
>
> （3）StringBuilder/StringBuffer的常用方法：
>
> ```java
> StringBuilder builder = new StringBuilder();
> //最主要的方法，append方法，用来做字符串拼接速度非常快
> int capacity();//返回扩容的后的数组长度
> int length();//返回字符串的长度
> char charAt();//返回指定索引的字符
> StringBuilder setCharAt(int index,char c);//改掉某一索引的字符
> int codePointAt();//返回字符的编码
> //StringBuilder中独有的方法
> StringBuilder delete(int start,int end);//删除元素,不用接收返回值
> StringBuilder deleteCharAt(int index);//删除指定索引位置的字符
> StringBuilder insert(int index,String str);//插入方法
> StringBuilder replace(int start,int end,String str);//替换
> StringBuilder setLength();//手动设置字符串长度，不安全
> String toString();//将StringBuilder对象构建成一个String对象返回
> StringBuilder trimToSize();//将数组中无用的容量清除，去除的时多开辟的内存容量
> 
> 
> ```
>
> （4）符串频繁拼接的时候，我们使用StringBuilder
>
> （5）StringBuilder与StringBuffer区别：
>
> StringBuilder（JDK1.5）是StringBuffer（JDK1.0）出的更新版本，使用方法几乎一致
>
> 早期版本都是线程安全的，所以StringBuffer是线程安全的，方法都带修饰符synchronized(同步)
>
> StringBuilder效率更高，可以支持异步访问

6）正则表达式

> 1、正则表达式：一个带有一定规律的表达式，匹配字符串格式的
>
> 2、正则的作用
>
> ​	（1）字符串的格式校验	String中方法matches("regexp")
>
> ​	（2）字符串的拆分及替换	String中方法replace和split
>
> ​	（3）字符串的查找	Pattern模式	Matcher适配器
>
> 3、正则的使用
>
> ```java
> 描述字符信息：
> \d:表示0-9的数字，digit
> \s:表示space，留白（空格，回车，换行都是）
> ".":表示任意字符
> \w:表示一个数字或字母[0-9A-z]
> 
> 描述字符出现的次数：
> ？：0-1次
> *：0次以上
> +：1次以上
> {n,m}:出现n-m次
> 
> 查找：
> String str = "432143abcr1rewabcrer858713*420117";
> //创建模式对象
> Pattern pattern = Pattern.compile("\\d{6}");
> //创建一个匹配器
> Matcher matcher = pattern.matcher(str);
> //找寻
> while(matcher.find()){
> System.out.println(matcher.group());
> }
> 
> 
> ```



###### **<font color="pink">（4）集合相关</font>**

集合：集合是指具有某种特性的具体或抽象的对象汇总而成的集体。

集合是一个容器，用来存储一组元素，集合的长度存储之后还能改变

集合的两个分支：collection接口（存储的都是value对象），Map接口（存储的是以key-value形式存在）

collection的子分支：List和Set

**1）List**

有序可重复，ArrayList（1.2）、Vector（1.1线程安全）、LinkedList

特点：适合遍历和轮询，不适合插入和删除，底层为数组

```java
ArrayList list = new ArrayList(int initialCapacity);
//我们设置初始值性能会更好，不断扩容会消耗性能
//默认长度10个
list.add("a");
list.add("b");
//由于ArrayList底层是一个Object[]，什么类型都可以传，取出来还需要造型，太麻烦
//JDK1.5出了泛型解决问题
ArrayList<String> list = new ArrayList<String>();

1.添加元素add
list.add("a");list.add("b");list.add("c");

2.遍历
for(int i = 0; i < list.size(); i++){
    System.out.println(list.get(i));
}
System.out.println(list);//[a,b,c]

3.删除元素remove
for(int i = 0; i < list.size(); i++){
    list.remove(i);//list.remove(0)都删除不干净
}
解决办法：
int size = list.size();
for(int i = 0; i < size; i++){
    list.remove(i);
}

4.插入
list.add(int index,Collection c);//将一个子类插到指定索引位置去
lsit.addAll(int index,Collection c);

5.清除
list.clear();//清除集合中所有元素
list.remove(int index);
list.remove(Object o);
//传入数字的时候，不会包装，默认删除指定索引元素

lsit.removeAll(Collection c);//差集，删除list中出现在c中的元素
list.retainAll(list2);//交集，共有的元素
list.addAll(list2);//并集

6.查找
list.contains(Object o);
E list.get();

7.迭代器
boolean list.iterator();

8.转化成数组
Integer x = new Integer[list.size()];
<A> list.toArray(x);

9.消除多余空间
list.trimToSize();//消除多余空间

10.截取
List list.subList(int fromIndex,int toIndex);//截取不包含最后一个元素


```



泛型：

1、泛型类：类定义的时候描述某种数据类型，集合的使用就是这样

2、泛型接口：与泛型类使用基本一致，子类实现接口时必须加泛型

```java
public abstract class ArrayList<E> extends AbstractList {}
public class ArrayList<E> extends AbstractList {}


```

3、泛型方法：方法调用时传参数，方法的泛型与类无关，带有泛型的方法可以不放在泛型类里

4、泛型不能使用基本类型，如果想使用基本类型，需要使用其对应的基本类型

```java
ArrayList<Integet> list1 = new ArrayList<Integer>();
ArrayList<Integet> list2 = new ArrayList<Integer>();
list1.addAll(list2);
//源码：list1.addAll(Collection<? extends E> list2)
//同类型，或者是该类型子类，即可添加，否则不能添加


```



Vector：（线程同步，早期的版本）ArrayList（线程不安全，后期版本的Vector）

默认扩容2倍，多了个修饰符`synchronized`



数据结构图：

![](C:\Users\86180\Desktop\testGit\typoraImg\数据结构.png)



Stack类（栈）

- 在java.util包下
- 继承Vector，可以使用Vector的方法
- 构造方法只有一个参数
- Stack的独有方法：
  - `push()`	将某个元素存进栈
  - `pop() `    将某个元素剪切出来
  - `peek() `   查看栈顶的一个元素
  - `search(<E> o) ` 查找给定元素在栈中的位置
- 使用场景：
  - 撤销功能
  - 中国象棋的悔棋功能



Queue类（队列）

- 接口：实现了Collection接口，并且有LinkedList子类，ArrayDeque
- 通常无参数构造方法创建
- Stack的方法都有，独有方法：
  - `offer()`添加元素，可以返回异常
  - `poll()`删除元素，从最后一个删除
  - `peek()`查看底部的元素
- 使用场景：
  - 火车站排队买票功能



LinkedList类

- 在java.util包下

- 使用双向链表的数据结构形式来存储，不适合遍历和轮询

  ```java
  //ArrayList和LinkedList可以通过构造方法转化，但是参数的类型必须比目标的泛型小
  ArrayList<String> arr = new ArrayList<>();
  arr.add("chen");
  arr.add("xiang");
  arr.add("handsome");
  LinkedList<Object> link = new LinkedList<Object>(arr);
  System.out.println(link);
  
  
  ```

- 插入删除速度特别快，遍历比较慢，因为地址无序，找地址浪费性能



2）Set

- 无序无重复，具体实现类：
  - hashSet：结构式hashMap（数组加链表，散列表）
    - 在java.util包下，无序：
- 基本使用
  - 无序无重复作用的方法：`equals`、`hashCode`

> **<font color="red">无重复原则：先用hashCode进行地址的比较，然后用euqals进行比较，都相同拒绝存入，不是覆盖</font>**
>
> 1.boolean add(value);
> 2.boolean remove(value);
> 3.可以使用增强for循环遍历
> 4.toArray();将集合转化为数组
> 5.iterator();获取一个迭代器对象（增强for就是迭代器实现的）
> 6.size();获取有效元素个数

```java
public class Test {
    public static void main (String[] args){
        HashSet<Person> p_set = new HashSet<Person>();
        p_set.add(new Person("chenxiang"));
        p_set.add(new Person("chenxiang"));
        p_set.add(new Person("chenxiang"));
        //不重写输出3，比较的是变量空间，因为Person中重写了equals方法，hashCode方法
        //System.out.println(p_set.size());3
        //System.out.println(p_set);
        //无重复原则：利用equals方法进行比较
        //让Person对象的name一致，认为是同一个对
        //set集合拒绝重复的元素,所以取出来的就是第一个
        HashSet<String> iset = new HashSet<String>();
        iset.add("a");
        iset.add("a");
        iset.add("a");
        System.out.println(iset.size());//1
    }
}

public class Person {
    private String name;
    public Person (String name,int age){
        this.name = name;
        this.age = age;
    }
    public String getName (){
        return this.name;
    }
    //重写equals方法，但是还是没有改变size，因为还得重写hashCode
    public boolean equals (Object o){
        if(this==o){
            return true;
        }
        if(o instanceof Person){
            Person p = (Person)o;
            //使用字符串的equals方法
            if(this.name.equals(p.name)&&this.age == o.age){
                return true;
            }
        }
        return false;
    }
    public int hashCode (){
        //两个对象的name一致，需要让hashCode的返回值一致
        //使用字符串重写的hashCode方法，字符*31+h
        return this.name.hashCode();
    }
    //方便我们输出，不适用对象的toString方法，因为看不懂
    public String toString () {
        //使用StringBuilder提高拼接性能
        StringBuilder sb = new StringBuilder();
        sb.append("{");
        sb.append(this.name);
        sb.append("}");
        return sb.toString();
    }
    
    //使用treeSet必须重写compareTo方法,implements Comparable<Person>
    @Override
    public int compareTo (Person o){
        //compareTo比较的是长度和字母，treeSet根据返回值确定顺序
        //我们自定义规则名字相同且
       int value = this.name.compareTo(o.name);
       if(value != 0){
            return value;
        }
        return this.age - o.age;
    }
}


```



- - treeSet
    - 二叉树，利用Node（left，item，right，parent）
    - java.util包
    - treeSet本身有顺序，使用的是compareTo，按照字母的自然顺序排布
    - 不能随意存储，让自己的类实现Comparable接口，根据`compareTo()`的返回值进行排序

- 特点：适合插入和删除，不适合遍历和轮询，底层为链表

- 基本使用：与Set中代码相同，增加了compareTo方法，利用它的返回值确定顺序

  ```java
  TreeMap<Test> map = new TreeMap<Test>();
  
  public class Test {
      public String name;
      public int age;
      public Test (String name,int age){
          this.name = name;
          this.age = age;
      }
  	public compareTo (Test obj) {
          int value = this.name.compareTo(obj.name);
          if(value!=0){
              return value;
          }
          return this.age - obj.age;
      }
  }
  
  ```



**3）Map<K,M>**

key无需无重复，value无需可重复

- 映射：通过某一个key定位到一个value
- Map的基本使用（包名java.util）：
  - hashMap：key的存储顺序与取的顺序不同，不同键名可以存相同的值，key相同值会进行覆盖，而不是像set拒绝存入
  - map集合使用场景：长度不确定，用集合，可以通过键名快速定位元素；Hash性能更高,Tree希望存进去的元素自动排序
  - List：有序，存储有序使用List；ArrayList遍历轮询；linkedList适合插入删除,Stack先进后出，Queue先进先出
  - Set：无重复，存储元素希望去掉重复元素；Hash性能更高,Tree希望存进去的元素自动去重复且自动排序
  - HashSet重复元素拒绝存入，HashMap重复元素进行覆盖

```java
value add(key,value);//第二次添加相同键值会覆盖

E remove(key);//删除
boolean remove(key,value);

replace(key,value);//改，和put方法一样
E get(key);//获取元素

int size();//返回存储元素的个数

boolean contains(key);//是否包含键名
boolean contians(value);//是否包含键值

Set keySet();//获取全部的key，entrySet();获取全部的entry(Node)对象

E getOrDefault(key,defaultValue);
putIfAbsent();//key不存在就存入，存在就放弃

遍历：
HashMap<Integer,String> map = new HashMap();map.add(1,"a");
map.add(1,"b");map.add(1,"c");map.add(1,"d");
//将键名转成set
Set<Integer> keys = map.keySet();
//通过迭代器遍历keys
Iterator<Integer> it = keys.iterator();
while(it.hasNext()){
    int key = (Integer)it.next();
    String value = map.get(key);
    System.out.println("key:"+key+";value:"+value);
}



```

- TreeMap：以二叉树形式存储，自然有序，按照unicode编码排序
  - 底层数据结构的存储：JDK1.8版本红黑二叉树（层级多于两层，顶节点会改变，使结构稳定，左旋右旋）
  - 使用与hashMap一致

```java
TreeMap<Integet,String> map = new TreeMap<Integer,String>();

map.put(1,"a");


```

考试系统：

```java
/*
 1.考试的题目如何存储？
 2.类与类之间的关系
 题目：属性title，answer
 考试机：属性题库，存储好多个Question对象
*/
public class Question {
    private String title;
    private String answer;
    public Question (String title,String answer){
        this.title = title;
        this.answer = answer;
    }
    public String getTitle (){
        return this.title;
    }
    //重写比较方法，根据题目开头判断题目的问题是否重复
    public boolean equals (Object obj){
       if(this.title == obj)return true;
       if(obj instanceof String){
           String[] titleArr = this.title.split("?");
           String anotherStr = (String)obj;
           String[] anotherStrArr = anotherStr.split("?");
           return titleArr[0].equals(anotherStrArr[0]);
       }
       return false;
    }
    //返回题目问题的hashCode
    public int hashCode (){
        String[] titleArr = this.title.split("?");
        return this.titleArr[0].hashCode();
    }
}
//使用Set存储，重写equals和hashCode方法
public class Machine {
    private HashSet<Question> questionSet;
    {添加题目}
    public ArrayList<Question> getPaper () {
        HashSet<Question> paper = new HashSet<Question>();
        ArrayList<Question> questionSet = new ArrayList<Question>(this.questionSet);
    }
    while(paper.size()!=5){
    int index = new Random().nextInt(this.questionSet.size());
    paper.add(questionSet.get(index));
    }
    return new ArrayList<Question>(paper);
}

public class Student {
    private String name;
    public student (String name){
        this.name = name;
    }
    public String[] exam (ArrayList<Question> paper){
        String[] answer = new String[paper.size];
        for(int i = 0; i < paper.size(); i++){
            Question question = paper.get(i);
            System.out.println(question);
            System.out.println("请输入你的答案：");
            answer[i]  = input.nextLine();
        }
    }
}


```





###### （5）异常相关

​	1）错误/异常：程序运行过程中，可能发生一些不被期望的效果，肯定会阻止我们的程序按照指令去执行

​	2）规定的接口：`Throwable`，再java.lang包下

​	3）实现Throwable接口的重要子类

- `Error`：错误，通常是物理性的，JVM虚拟机本身出现问题。程序指令处理不了
- `Exception`：异常，人为规定不正常的现象，通常是给定的程序指令产生不符合规范的事情
- 运行时异常：运行时异常（非检查异常），`RuntimeException`
  - `Error`和`RuntimeException`都算是运行时异常
  - 整数除0产生数学异常，小数除0产生无穷
- 编译时异常（检查异常）
  - `InterruptException`，eg:`Thread.sleep(5000)`
  - 处理异常的手段：解决运行时异常，让后续代码可以继续执行

```java
package bank;

public class Test {
    public static void main (String[] args){
        Test t = new Test();//抛出异常，没人解决
        try{
            String des = t.testException();
        }catch(Exception e){
            
        }
    }
    public Test () throws Exception {
        String str = "abc";
        str.charAt(10);
    }
    public String testException () {
        try {
            System.out.println("代码执行开始");
            String str = null;
            str.length();//此处发生异常，下面不会执行
            System.out.println("try执行完");
        }catch(Exception e){
            System.out.println("捕获异常");
        }finally {
            System.out.println("我总会执行");
            return "haha";
        }
    }
}


```

`throws`：主方法抛异常没有意义，抛给虚拟机，没有方法处理异常

1）异常只能在方法上抛出，属性是不能处理异常的

2）可以抛出多个异常，交给调用方法的对象处理异常

3）抛出的异常与catch类似

```java
//自定义异常，描述我们封装的代码正确使用方式
public class MyException extends Exception{
   public MyException (String msg){
       super(msg);//继承的是Exception，Exception继承了Throwable类（以前是接口，实现了Serialble接口）
   }
}
public class Test {
    public static void main (String[] args){
        MyException me = new MyException();
        try{
            me.testException();
        }catch(Exception e){
            
        }
        do something...
    }
    public testExeception () throws Exception {
        String msg = "自定义异常";
       throw new MyException (msg);
    }
}


```



###### （6）输入输出相关（I/O相关）

- 流：数据流，在java.io包下
- 流的分类：文件流，字符流，数据流，对象流，网络流等
- 文件：一种电脑的存储形式，`txt,jpg,doc,ppt,mp4,rar,xls,mp3`
- 文件夹：目录（路径），File-->与电脑上的文件或文件夹产生对应的映射关系
- File类：File是在内存中的一个对象，与硬盘上的文件和文件夹有映射关系

```java
import java.io;
public class Test {
    public static void main(String[] args){
        //file是文件的映射,是堆内存中创建出来的一个对象空间
        File file = new File(pathname);
        //路径是看创建对象，是否能与硬盘上文件创建映射关系
        //通过文件流去读取文件的内容
        //硬盘上文件名字不区分大小写，内存中File对象，变量名区分大小写
        //文件的一些属性：
        boolean r = file.canRead();//是否可读
        boolean w = file.canWrite();//是否可写
        boolean h = file.isHidden();//文件是否隐藏
        boolean f = file.isFile();//判断是否是一个文件
        boolean d = file.isDirectory();//判断是否是一个文件夹
        boolean e = file.isExcute();//是否可执行
        long size = file.length();//查看文件大小，返回字节数
        Date modifiedDate = file.lastModified();//文件最后修改时间
        Date date = file.setLastModified(time);//修改文件时间
        //以下方法常用
        String a_path = file.getAbsolutePath();//获取文件的绝对路径
        String name = file.getName();//获取文件的名字
        String r_path = //相对路径，没有盘符的写法，去当前工程所在文件夹中寻找，在src文件夹中寻找
        boolean file.crateNewFile();//创建新的文件
        boolean file.mkdir();//创建文件夹
        boolean file.mkdirs();//创建文件夹，外层没有会创建新的文件夹
        String getParent();//获取当前file的父亲file的名字
        File getParentFile();//获取当前的file的父亲的file对象
        String[] list();//获取当前file的所有儿子的名字
        File[] listFiles();//获取所有儿子对象
    }
}


```

- 使用示例：

```java
File file = new File("pathname");
boolean bool = file.mkdir();//前提是外层（父元素）真是存在
try {
    boolean value = file.createNewFile();
}catch(IOException e){
    e.printStackTrace();
}
//如果file.list()不为空，说明file是个文件夹，为空说明file是个文件


```

- 文件夹的删除：

```java
public class Test {
    public static void main (String[] args){
        Test t = new Test();
        File f = new File("D://myFolder");
        t.deleteFiles(t);
    }
    //使用递归方式删除所有文件
    public void deleteFiles (File file){
        File[] files = file.listFiles();
        //如果files是个文件则为空，为空文件夹length为0
        if(files != null && files.length != 0){
            for(File f:files){
                deleteFiles(f);
            }
        }
        //删除文件
        file.delete();
    }
}


```

- 字节型文件流：

  为什么将数据存储在文件中：变量，数组，对象都是存储在内存中，程序执行完毕后，空间会回收

  文件存储在硬盘上是永久性保存的，文件不在内存中，需要通过IO进行更改

  字节型文件输入流：

```java
//字节型文件流（1字节）FileInputStream/FileOutputStream
//字符型文件流（2字节）FileReader/FileWriter
//JDBC：java database connection
//字节型文件输入流，java.io包 继承InputStream类
//构造方法传参：String，File
try {
      File file = new File("D://myFolder/yyy/1.txt");
      FileInputStream files = new FileInputStream(file);
      int i = files.read();//读取一个字节,读不到返回值-1
      //一次读取一个
      while(i!=-1){
          System.out.print((char)i);
          i = files.read();
         }
      }catch(IOException e){
            System.out.println("catch an error.");
            e.printStackTrace();
      }catch(Exception e){
            e.printStackTrace();
}}
//改进让读取更快
/*txt文件：
hello world,(默认有\t制表符)
nihao
China
*/
//健壮性的写法
FileInputStream files = null;
try {
    File file = new File("D://myFolders/yyy/1.txt");
    //文件不允许不存在
    files = new FileInputStream(file);
    byte[] b = new byte[5];
    int i = files.read(b);
    while(i!=-1){
        System.out.print(new String(b,0,i));
        i = files.read(b);
        /*输出：
        hello world, 
        nihao
        ChinaChin
        原因：
        1:hello
        2:\sworl
        3:d,\n\tn
        4:ihao\n
        5:\tChin
        6:aChin
        */
    }catch(Exception e){
        e.printStackTrace();
    }finally {
        try{
            if(files!=null){
            files.close();
            }
        }catch(Exception e){
            e.printStackTrace();
            }
        }
    }


```

> `FileInputStream`的方法：
>
> 1、`int available();`
>
> 2、`int code = read();`每次从流管道中读取一个字节，返回字节的code码
>
> 3、`int count = read(byte[] b);`每次从管道中读取个字节存入数组，返回有效元素的个数
>
> 4、`long skip(long n);`跳过n个字节往下读；使用场景，多线程，线程1读取1-2000，线程2读取2001-4000，...然后最后将文件拼接成完整文件
>
> 5、`close()`必须执行，无参数无返回值，关闭流管道，建议将关闭操作放在finally里
>
> 我们打开的文件，对文件进行删除操作时允许的，必须关闭流管道后才能删除

文件流的原理图：

![](C:\Users\86180\Desktop\testGit\typoraImg\文件流.jpg)



**字节型文件输出流：**

- `FileOutputStream`：讲数据写入文件中
- `java.io`包下，父类是`OutputStream`

```java
public class Test {
    public static void main (String[] args){
        try{
           File file = new File("D://myFolder/yyy/1.txt");
            //不管文件是否存在，输出流会创建一个文件
           FileOutputStream ofile = new FileOutputStream(file,true);//布尔值表示是否追加，否则每次创建文件覆盖
           ofile.write(97);//写入字符
           ofile.flush();//将管道中字符推到文件中去
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            try{
                if(ofile!=null){
                    ofile.close();
                }
            }catch(IOException e){
                e.printStackTrace();
            }
        }
    }
}


```

| InputStream                          | OutputStream                        |
| ------------------------------------ | ----------------------------------- |
| new FileInputStream(file)            | new FileOutputStream(file,true)     |
| new FileInputStream("path")          | new FileOutputStream("path",true)   |
| int read()                           | write(int code)                     |
| int read(byte[])                     | write(byte[],0,count)               |
| close()                              | close()                             |
| available()查看管道中有多少字节缓存  | flush()将管道中字节型文件流推入文件 |
| skip(long count)跳过多少字节进行读取 |                                     |

实现文件复制代码：

```java
public class OperateFile {
    public void copy(File file,String path){
        try {
           //获取要拷贝的对象
           FileInputStream ifile = new FileInputStream(file);
           byte[] b = new byte[1024];//1kb-8kb比较好
           int count = ifile.read(b);
           //写入的文件
           File tfile = new File(path+"/"+file.getName());
           FileOutputStream ofile = new FileOutputStream(tfile);
           while(count!=null){
               ofile.write(b,0,count);
               ofile.flush();
               count = ifile.read(b);
           }
        }catch (IOException e){
           e.printStackTrace();
        }finally{
            //两个文件分别单独判断然后关闭
            //分开判断是为了防止意外前面的报错，后面的管道也无法关闭
        }
    }
}

```

文件夹的复制：

```java
public void copyFile (File file,String path){
    //判断file是文件还是文件夹
    File files = file.listFiles();
    String oldPath = file.getAbsolutePath();
    String newPath = path.concat(oldPath.split(":")[1]);
    File newFile = new File(newPath);
    if(files != null){
        //创建新的file对象
        newFile.mkdir();
        if(files.length!=0){
            for(File f:files){
                //此时的新路径就是要拷贝的路径
                copyFile(f,newPath);
            }
        }
    }else{
        //对文件流的操作
        FileInputStream inFile = null;
        FileOutputStream outFile = null;
        try{
            inFile = new FileInputStream(oldPath);
            outFile = new FileOutputStream(newPath);
            byte[] b = new byte[1024];
        	int count = inFile.read(b);
            while(count!=-1){
                outFile.write(b,0,count);
                outFile.flush();
                count = inFile.read(b);
            }
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            try{
                if(inFile!=null){
                inFile.close();
            }catch(IOException e){
                 e.printStackTrace();
              }
            try{
                if(outFile!=null){
                inFile.close();
               }
            }catch(IOException e){
                 e.printStackTrace();
              }
            }
        }
    }

```

剪切操作：

```java
public void cut (File file,String path){
    this.copy(file,path);
    this.delete(file);
}

```



**字符型文件流**

字节流的好处在于可以处理任意格式文件，但是处理中文的时候可能出现字符拼接问题

原因：因为中文由两个字节组成，拼接的时候容易与其它字节拼错，出现乱码

![](C:\Users\86180\Desktop\testGit\typoraImg\字节型输出流乱码.png)

字符型文件输出流的类：`FileReader()`,`FileWriter()`

1）在java.io包下，构造方法可以传文件路径或者传文件

2）特点：继承OutputStreamWriter可以读取`char[]`数组

3）使用：只针对与能用记事本打开的纯文本文件`.txt .properties`

```java
public class Test {
    public static void main (String[] args){
        try{
            File file = new File("D:\\myFolder\\yyy\\y2.txt");
            FileReader fd = new FileReader(file);
            char[] c = new char[20];
            int count = fd.read(c);
            while(count!=-1){
                //一般编码使用GBK
                System.out.print(new String(c,0,count));
                count = fd.read(c);
            }
        }catch(IOException e){
            e.printStackTrace();
        }
    }
}

FileWriter:
与FilerReader基本一样，不同的是write方法：
write(int);
write(char[]);
wraite(String str);//可以写字符串，较为方便
//注意使用close方法关闭

```



**编码字符集的问题：**

eclipse默认是GBK的编码字符集

IDEA默认是UTF-8字符集，将记事本的格式改为`utf-8`就可以

字符：文字和符号的总称；不同国家的数字、符号、字母是一样的

字符编码：将字符进行拆分和组合的规则

编码集：

1）ASCII（American Standard Code for Information Interchange）只支持英文

2）ISO-8859-1不支持中文

3）GB2312 GB18030 GBK BIG5，Windows平台默认字符集GBK，Linux和Mac OS默认字符集是`utf-8`

4）Unicode

5）UTF-8

6）UTF-16



**缓冲流**

在流管道中增加缓存的数据，让我们使用流读取的文字更加顺畅，高级流，通过低级流创建，性能更高。

类：`BufferedInputStream/BufferedOutputStream/BufferedReader/Bufferedwriter`

`BufferedInputStream/BufferedOutputStream`:

```java
public class Test {
    public static void main (String[] args){
        try{
            File file = new File("D://myFolder/xxx/x1.txt");
            FileInputStream inFile = new FileInputStream(file);
       		BufferedInputStream bis = new BufferedInputStream(inFile);
            //使用方法与低级流相似
            bis.read(int/byte);
            bis.isAvailable();//查看缓存中字符数
            bis.skip(long);
            bis.close();
        }catch(IOException e){
            e.printStackTrace();
        }
    }
}

```

`BufferedReader/BufferedWriter`:

```java
//创建字符输入流
File file = new File(path);
FileReader fr = new FileReader(file);
BufferedFileReader bfr = new BufferedFileReader(fr);
int code = bfr.read();
//使用方式与其他流差不多，但是有一个比较方便的方法
String bfr.readLine();//读取文件中一行的信息
String value = bfr.readLine();
while(value!=null){
    System.out.println(value);
    value = bfe.readLien();
}

```

文件流

低级流：字节型（`FileInputStream,FileOutputStream`），字符型（`FileReader,FileWriter`）

高级流：字节型（`BufferedInputStream,BufferedOutputStream`），字符型（`BufferedReader,BufferedWriter`）

对象流：`ObjectInputStream`、`ObjectOuputStream`序列化



对象流

*1）对象的序列化和反序列化*

序列化：将一个完整的对象拆分成字节碎片记录在文件中（需要实现Serializable序列化接口）

反序列化：将文件记录的对象反过来组合成一个完整的对象（需要提供版本号），目的是JDK版本不同读出的对象不一致，高级版本可以读低级版本的对象，但是低级版本读高级版本的序列化对象是不允许的

*2）文件的作用*：

将文件永久性保存，使数据持久化

*3）按照以行为单位读取/写入信息的优缺点*：

好处是每一行记录的信息都是相关的，信息直接读取出来，直接了解文件；缺点是不安全，性能差，采用分布式将一个文件拆分成碎片，只能记录String信息，不能记录一些动作和行为

*4）*对象流可以直接将一个对象的属性和行为写进一个对象

```java
public class Person implements Serializable{
    private String name;
    private int age;
    //IDEA 由快捷键生成这个ID
    private long final serialVersionID = 437194743254L;
    public Person (String name,int age){
        this.name = name;
        this.age = age;
    }
   public void talk (){
       System.out.println("hello,I am"+this.name);
   }
}
//EOFException：说明没有对象可以写了，通常会将所有记录的对象存在一个集合里
public class Test {
    public static void main (String[] args){
        try{
        Person p = new Person("chen",20);
        //高级流，需要低级流
        //对象的序列化，必须是先Serializable接口（示意性接口，没有需要重写的方法）
        FileOutputStream file = new FileOutputStream("D://1.txt");
        ObjectOutputStream os = new ObjectOutputStream(file);
        os.writeObject(p);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(os!=null){
                    os.close();
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
}
```

使用`inteliJ IDEA`如何设置自动生成`serialVersionID`:

`File/Settings/Inspections`搜索`serialVersion`勾选下面两个选项：

+ `Serializable class without  "serialVersionUID"`
+ `SerialVersionUID field not declared "private static final"`

示意图：

![](C:\Users\86180\Desktop\testGit\typoraImg\java提供序列化ID.png)



*字符串流*

`StringReader`，`StringWriter`



数据流

`DataInputStream`,`DataOutputStream`



转换流

网络相关介绍



打印流

`InputStreamReader`,`PrintWriter`



小任务：

1.实现一个银行业务系统

2.要求有如下业务功能：登录、查询余额，存款，取款，转账，开户，销户

3.记录银行的用户信息：账号，密码，余额

> <https://www.jianshu.com/p/cc3bf9bbd1a2>

MVC分层架构思想：

![](C:\Users\86180\Desktop\testGit\typoraImg\Java的MVC开发.png)





###### （7）线程相关

线程例子：看视频时，边看视频边调节声音大小

程序：可以理解为一组静态的代码（下载的程序的文件夹里的所有文件）

进程：正在运行的程序，静态的代码执行起来了（点击exe打开软件，放到内存中执行）

线程：进程内的小单元（进程中的最小单元，很多线程同时执行）



主线程：系统线程（JVM虚拟机，必须先执行起来，其它代码才能执行起来）

用户线程：main

守护线程（精灵）：GC



线程：操作系统级别CPU



如何在Java中创建线程，让线程执行，多线程

线程的状态图：

![](C:\Users\86180\Desktop\testGit\typoraImg\线程的状态.png)

如何在Java中实现一个线程：

1.自己描述一个类

2.继承一个父类（Thread）

3.重写run方法

4.new一个线程对象，调用start方法，让线程进入就绪状态，等待cpu分配时间碎片

实现一个跑步的小例子：

```java
public class TestThread {
    //第一种创建线程方法
    Runner r1 = new Runner("jieke");
    Runner r2 = new Runner("fake");
    Runner r3 = new Runner("quene");
    r1.start();
    r2.start();
    r3.start();
    //第二种创建线程的方法:构建成线程对象，然后使用run方法
    Thread a1 = new Thread(r1);
    a1.start();
    Thread a2 = new Thread(r1);
    a2.start();
}

//实现线程的第一个方式
public class Runner extends Thread {
    private String name;
    public Runner (String name){
        this.name = name;
    }
    public run () {
        for(int i = 0;i < 100;i++){
            System.out.println(this.name+" run "+"meters");
        }
    }
}

//实现的第二个方式
public class Runner implements Runnable {
    private String name;
    public Runner (String name){
        this.name = name;
    }
    public run () {
        for(int i = 0;i < 100;i++){
            System.out.println(this.name+" run "+(i+1)+" meters");
        }
    }
}
```



多线程使用：模拟多个用户同时访问

可能产生问题：

![](C:\Users\86180\Desktop\testGit\typoraImg\多线程可能产生问题.png)





生产消费者模型

特征修饰符：`synchronized`放在方法的结构上，锁定的是调用方法时的对象

访问对象的线程锁定了它，所以也叫线程锁

将`synchronized`放在方法，构造方法，块的内部

```java
1.第一种;
public synchronized void get (){}
2.第二种：提高性能的;
public void get (){
    //可以并发执行的代码;
    synchronized(对象){
        //不允许线程同步的代码
    }
    //可以并发执行的代码
}
//线程之间状态的切换
this.wait();//是访问当前对象的线程wait

//设置优先级别1-10
production.setPriority(1);
production.getPriority();//获取线程优先级别

IllegalMonitorStateException:告知一个线程等待，结果告知的是另一个线程，会出这个异常
```

不加锁利用线程等待可能导致的异常：`IllegalMonitorStateException`

![](C:\Users\86180\Desktop\testGit\typoraImg\不加锁等待异常.jpg)



小任务：

微信抢红包例子：5元钱，10个红包，保证每个人至少有0.01

```java

```



join方法：

Thread类中的方法，可以让并行的线程变成单线程

```java
public class Thread1 extends Thread {
    public void run () {
        System.out.println("Thread one starts");
        Thread2 t2 = new Thread2();
        t2.start();
        try{
            t2.join(2000);//表示让线程先执行2000ms
        }catch(InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("Thread one ends");
    }
}

public class Thread2 extends Thread {
    public void run () {
        System.out.println("Thread two starts");
        try{
            Thread.sleep(3000);
        }catch(InterruptedException e){
            e.printStackTrace();
        }
        System.out.println("Thread two ends");
    }
}

public class Test {
    public static void main (String[] args){
        Thread1 t1 = new Thread1();
        t1.start();
        /*执行结果：
        Thread one starts  
        Thread two starts
        Therad one ends
        Thread two ends
        */
    }
}
```



死锁

![](C:\Users\86180\Desktop\testGit\typoraImg\死锁示意图.jpg)



哲学家就餐问题：一个方桌四个人，四个筷子，每个人先拿左手边筷子，在拿右手边筷子

程序中可能出现死锁问题

```java
public class Chopstick {
    private int num;
    public Chopstick (int num){
        this.num = num;
    }
    public int getNum (){
        return this.num;
    }
}
public class Person extends Thread{
    public String name;
    public Chopstick left;
    public Chopstick right;
    public Person (String name,Chopstick left,Chopstick right){
        this.name=name;
        this.left=left;
        this.right=right;
    }
    public void run (){
        System.out.println(this.name+"开始吃饭");
        synchronized (left){
            System.out.println(this.name+"拿起了"+left.getNum()+"号筷子");
            synchronized (right){
                System.out.println(this.name+"拿起了"+right.getNum()+"号筷子");
                System.out.println(this.name+"开始吃饭");
            }
        }
    }
}
```

死锁的解决方法：时间差，不要产生公用对象的问题

计时器/定时器：

```java
public void test (){
    Timer timer = new Timer();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date firstTime = sdf.parse("2019-6-11 15:15:00");
    timer.schedule(new TimerTask(){
        public void run (){
            System.out.println("给XXX发送信息：");
        }
    },firstTime,3000);
}
```



###### （8）反射注解

String的内容不是真的不让变，可以通过反射尝试修改value的值

反射：reflect，用来描述所有的类，所有的类也具有相同的特征

反射原理图：

![](C:\Users\86180\Desktop\testGit\typoraImg\反射.png)



类是用来描述一组对象的，反射机制认为是用来描述一组类的

Class：用来描述类本身

Field：用来描述类的属性

Method：用来描述类中的方法

Constructor：用来描述类中的构造方法

Annotation：用来描述类中的注解

获取类的方式：

```java
Class x = Class.forName("包名.类名");
Class y = 类名.class;
对象.getClass();//Object中的方法
常用方法：
1.int getModifiers();//每一个修饰符用一个整数来表示
//0：默认不写 1：public 2：private   4：protected 8：static
//16：final   32：synchronized 64:volatile 128:transsient 256：native
//512：interface 1024：abstract
2.String name = getName();//获取全名，包括包名
3.String simpleName = getSimpleName();//只获取类的名字
4.Package p = getPackage();//然后使用p.getName()获取包的名字
5.Class father = getSuperClass();//获取父类
6.Class[] classes = getInterfaces();//获取类中所有的接口

//获取所有父类的全名
public class Test {
    public static void main (String[] args) {
        ArrayList<String> list = new ArrayList<>();
        Class superClass = ArrayList.class;
        while(superClass.getSuperclass()!=null){
            try{
            System.out.println(superClass.getName()+"的父类是"+superClass.getSuperclass().getName());
            superClass = superClass.getSuperclass();
            }catch(Exception e){
                System.out.println("没有了");
            }
        }
   }
}

//获取多有的接口
public class Test {
	public static void main(String[] args){
		ArrayList<String> list = new ArrayList<>();
        Class superClass = ArrayList.class;
		try {
            //获取class的所有父亲接口
            Class[] classes = superClass.getInterfaces();
            while(classes!=null){
                for(Class c:classes){
                    System.out.println(c);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
	}
}
7.Object newInstance();//或取无参构造方法的实例
Class clazz = Class.forName("testInterface.Person");
Person p = (Person)clazz.newInstance();//相当于调用person类中的默认无参构造方法
8. Field = getField("属性名");//获取属性，属性必须是公有的
Field[] fields = getFields();//获取类的所有属性
Field getDeclaredField("属性");
Field[] getDeclaredFields("属性");
int getModifiers();
Class getType();//获取属性类型对应的那个class
String getName();
set(Object,"value");//给属性赋值得方法
nameField.get(Object)
 
10. Class[] getClasses();//获取类中的内部类
```

体会反射的强大：

```java
public class Test {
    public static void main (String[] args) {
        try{
            Class car = Class.forName("velometer.Car");
            Car car1 = (Car)car.newInstance();
            Field speed = car.getDeclaredField("speed");
            //让私有属性可以修改
            speed.setAccessible(true);
            //将具体的对象中的属性进行设置
            speed.set(car1,1000);
            //输出证明私有属性也被我们更改了
            System.out.println(car1.getSpeed());//1000
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
//虽然是私有的静态属性，只能在本类中设计方法更改，但是反射可以做到，不能修改final修饰的属性
public class Car {
    private static int speed = 50;
    private static String name = "Landroover";
    public Car () {}
    public int getSpeed () {
        return this.speed;
    }
}
```

通过反射来让字符串能改变：

```java
String str = new String("abc");
Class clazz = str.getClass();
//根据知道的final修饰的value获取到属性
Field field = clazz.getDeclaredField("value");
//将属性变为可修改类型
field.setAccessible(true);
//获取到数组，然后对内容进行修改
char[] temp = (char[])field.get(str);
```





观察者设计模式（Observer）：也可以称之为发布订阅模式

```java
//实现目标的抽象类
public abstract class Subject {
    //设置一个存储观察者的集合
    private ArrayList<Observer> oSet = new ArrayList<>();
    
    //设置一个敏感方法，用来触发所有观察者的状态更新
    public abstract dosomething ();
    
    //唤醒所有观察者
    public abstract notifyObservers();
    
    //添加观察者
    public void attach (Observer o){
        this.oSet.add(o);
    }
    
    //删除观察者    
    public void detach (int index){
        this.oSet.remove(index);
    }
}

//实现观察者的接口
public interface Observer {
    void doself ();
}
```



反射的方法使用：

```java
public class Test {
    public static void main (String[] args){
        Class p = Class.forName("packa.Person");
        //通过方法名定位方法，通过方法参数类型对应的Class来找寻
        try{
            //第二个参数是参数类型的类,可以获取类和父类的方法
            Method m = p.getMethod("eat",String.class);
            int mm = m.getModifiers();//获取权限和特征修饰符
            Class mrt = m.getReturnType();//获取返回值数据类型
            String mn = m.getName();//获取方法的名字
            Class[] mpts =  m.getParameterTypes();//获取方法参数列表的类型
            Class[] mets = m.getExceptionTypes();//获取异常类型
            String str = (String)m.invoke(p,"测试参数");
            Method[] ms = m.getMethods();
            //使用私有方法
            m.setAccessible("true");
            m.invoke(p,参数列表的类);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
public class Person {
    public String name;
    public void eat (){
        System.out.println("hello");
    }
    public void eat (String food){
        System.out.println("hello");
    }
}
```

构造方法：

```java
public class Test {
    public static void main (String[] args){
        try{
            Class clazz = Person.class;
            //获取有参数的构造方法
            Constructor con = clazz.getConstructor(String.class);
            //执行构造方法
            Person p = (Person)con.newInstance("haha");
            System.out.println(p);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
//除了没有返回值，其它方法与一般方法相同
public class Person {
    private String name;
    public Person (){}
    public Person(String name){this.name=name;}
}
```



反射的使用：

做底层的封装，根据一个字符串创建出一个真实的对象

设计一个小工具，替代我们创建对象的过程，

//Spring开源框架思想：IOV（inverse of control控制反转），AOP（面向切面编程）

```java
public class Test {
    public static void main (String[] args){
       
    }
}
public class Person {
    //设计一个方法，帮我们控制对象的创建 
    public Object getBean(String className){
        Object obj = null;
        Scanner input = new Scanner(System.in);
        try{
            Class clazz = Class.forName(className);
            obj = clazz.newInstance();
            int index = clazz.toString().lastIndexOf(".");
            String classType = clazz.toString().substring(index+1);
            if(classType.equals("Character")){
                    System.out.println("我也不知道要干什么，反射不熟练");
            }else{
                    Field[] fields = clazz.getDeclaredFields();
                    for(Field f:fields){
                        //要得到方法名，最后变为set+Demo类型
                        System.out.println("请给属性"+f.getName()+"赋值：");
                        //要进行的赋值操作
                        String value = input.nextLine();
                        f.setAccessible(true);
                        //获取的属性名变为set形式
                        String attrName = f.getName();
                        String firstUpperLetter = attrName.substring(0,1).toUpperCase();
                        String otherLetter = attrName.substring(1);
                        StringBuilder sb = new StringBuilder("set");
                        sb.append(firstUpperLetter);
                        sb.append(otherLetter);
                        //获取field对应的属性所属的类
                        Class fieldClass = f.getType();
                        //通过处理好的set方法名,找寻set方法
                        //获取参数的类型,获取属性的包装类
                        //假设为Integer，则con为Integer的构造方法
                        //包装类中Character没有String类型的构造方法
                        //判断是否为Chacracter类型
                        Constructor con = fieldClass.getConstructor(String.class);
                        //调用传入String的构造方法
                        Method fieldMethod = clazz.getMethod(sb.toString(),fieldClass);
                        //执行，假如obj为Person类，相当于
                        //con.newInstance(value)相当于new Integer(value);
                        //相当于, o.setName(new Integer(value))
                        fieldMethod.invoke(obj,con.newInstance(value));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return obj;
}
}
```



注解（Annotation）

注释：为了让人们更容易读懂代码，文档注释/** */

注解的写法：`@xxx[一些信息]`

注解的用法：1.类的上面  2.属性上面  3.方法上面  4.构造方法上面  5.参数前面

注解的作用：1.仅用来当作注释  2.检测作用  3.可以携带一些信息

```java
public class Test{
    public static void main (String[] args){
        Date date = new Date();
        date.getYear();//会发现getYear有删除线
        /*@deprecated
        public long getYear(){}
        **/
    }
    
    //提示
    @Override
    public void eat (){}
    //注释
    @Deprecated
    public void fuck (){}
    //携带信息，文件.propertied .xml 注解
    @SuppressWarnings(String[] {"unused","",""})//尽量不用
    unused 未被使用
    serial 未序列化
    rawtypes 集合没有过定义泛型
    deprecation 使用废弃的方法
    unchecked 出现了泛型问题可以不检测
}
```

Properties的使用：

```java
//可以认为是一个高级流
Properties pro = new Properties();
//读取后缀名为properties中的文件,文件中内容以key=value形式存储
pro.load(new FileReader("src/teststream/Test.properties"));
pro.get(key1);
Enumeration en = pro.propertyNames();
	try{
        Properties pro = new Properties();
        //通过低级流读取文件信息，注意必须是properties格式的文件
        pro.load(new FileReader("src/Test.properties"));
        //get方法获取键名对应的值
        System.out.println((String)pro.get("chenxiang"));
        //迭代器
		//en有两个方法：hasMoreElements nextElement，使用与Iterator极其相似
        Enumeration en = pro.propertyNames();
        while(en.hasMoreElements()){
           String key = (String)en.nextElement();
           String value = (String)pro.getProperty(key);
           System.out.println("{"+key+":"+value+"}");
         }
        }catch(Exception e){
            e.printStackTrace();
        }
```







##### 4、GUI	Swing开发



##### 5、多线程面试题

性能好：

1.提前创建好线程，省去了创建线程的时间

2.线程用完后，不会直接销毁，而是复用

提交新的任务：

- 没达到corePoolSize，无论是是否有空闲线程，创建新的线程
- 达到了corePoolSize，使用当前空闲的线程
- 达到corePoolSize
  - 有空闲的线程，就使用
  - 没有空闲的线程，进入等待队列
    - 队列没满，进入等待队列
    - 队列满了，开启maxPoolExcutorSize，没达到maxExcutorPoolSize，创建新的线程，线程减少，根据空闲时间keepAliveTime判断来适当关闭线程，单位是unit；达到maxExcutorPoolSize，handler执行拒绝操作
    - threadFactory用来创建线程，一般不会动

![](C:\Users\86180\Desktop\testGit\typoraImg\线程池原理.jpg)

Java中的4大线程池：底层用的是某一个线程池（ThreadPoolExecutor），所以大公司会重写线程池，省略了创建线程的过程，执行效率高

ThreadPoolExecutor(corePoolSize,maxExcutorPoolSize,keepAliveTime,unit,workQueue,threadFactory,handler)

corePoolSize:表示线程池至少有这么多个，当线程池初始化的时候，此时线程数为0，线程数没有达到corePoolSize时候，无论有没有空闲的线程，都会创建新的线程

- Executors.newCacheThreadExecutor();//核心线程数0，等待时间60秒
- Executors.newFixedThreadPool();//线程数固定，无穷队列
- Executors.newSingleThreadPool();//只有一个线程，排队无穷大
- Executors.newScheduledThreadPool();//开n个窗口，人多就开，人少就关多余的

```java
1.多线程的创建方式
Thread thread = new Thread();
Runable runable = new Runable();

线程池，先把线程创建好
//ThreadPoolExecutor()
ThreadPoolExecutor pool = new ThreadPoolExecutor();

public class MyThread implements Runable{
    @override
    private String name;
	private int age;
    public MyThread (String name,int age){
        this.name = name;
        this.age = age;
    }
    public void run () {
        
    }
}
```

##### 6、Java学习路径

大公司缺人：超过95%的人不符合大公司需求，需要的是知道框架底层与原理的人。

Java：企业后台服务支持



学习知识体系：

1）基础部分（JavaSE）

面向对象的编程思想

集合

I/O流 MVC 缓存 文件---数据库 事物

反射注解 IOC



LEVEL ONE

数据库：本质是文件，基本使用，性能，索引，引擎，锁，事物

JDBC：本质就是I/O，手动设计一个ORM---原理   MyBaits

web：本质就是Socket，IO，String解析，手动设计服务器

Tomcat：Servlet，JSP（本质上是Servelet，增加了解析）-->手动设计一个web框架

Filter：本质也是一个Servelet，AJAX



LEVEL TWO

SSM：Spring，SpringMVC，MyBaits

SSH：Spring，Struts，Hibernate

Linux，Maven，Git，SVN

分布式，大数据



2）数据库和web部分

3）框架部分

