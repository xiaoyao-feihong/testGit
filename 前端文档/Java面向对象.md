# Java面向对象的编程思想

##### 1、面向对象与面向过程

面向过程：大象装冰箱，只能装大象，代码冗余，复用性差；

​	面向对象：

​		*1）*可以装任何符合要求的动物，复用性强，比如开门，关门操作都是一样的。引入开门、关门的代码，然后我们只需要写装狮子等其他动物的代码。

​		*2）*解决问题的时候按照现实生活中的规律来思考问题，考虑问题的过程中，有几个实体参与进来。

​		*3）*类：用来描述一类具有相同特征（属性）和行为（方法）的事物。

​		*4）*对象：具体的事物

​		*5）*计算机中利用面向对象思想来做事

​			先定义一个类（有属性），在描述的类中擦黄建一个具体的个体出来，个体来做事（方法/属性）。

```java
public class Demo {
    public static void main (String[] args) {
        //修饰符 数据类型 属性名字 值
        Person per = new Person();
        per.name = "zhumin";
        per.gender = "female";
        per.age = 18;
        System.out.println("My name is "+per.name+",I am "+per.age+" years old,I am a "+per.gender);
    }
    	Person pe2 = per;
    	per2.name = "bessi";
    	per2.age = 22;
    	per2.gender = "female or male?";
}

public class Person {
    String name;
    String gender;
    int age;
}
```

​	以上代码的流程图：

​	JVM根据项目中的类在方法区创建一个类模板，JVM会自己将主方法塞进执行栈，new的过程在堆内存中创建对象，对象的属性根据模板来画（刚开始默认值name:null,age:0,gender:null），通过方法完成我们想要的事情。

![](C:\Users\86180\Desktop\testGit\typoraImg\类创建对象原理图.png)

##### 2、**方法介绍**：

```java
public class Person {
    public String name;
    public int age;
    public String gender;
    //无参数无返回值的方法
    public void sleep () {
        System.out.println("睡觉~~~");
    }
    //无参数，有返回值
    public String sayName () {
        return this.name;
    }
    //有参数，无返回值
    public void eat (String food,int count) {
        System.out.println("吃了"+count+"碗"+food);
    }
    //有参数有返回值
    public int buyDrinks (String drinkName,int count) {
        int price = 0;
        if(drinkName.equals("GreanTea")){
            price = 5;
        }else if(drinkName.equals("RedTea")){
            price = 3;
        }else{
            System.out.println("drink type is not exist...");
        }
        return count*price;
    }
}

```

​	设计一个方法：画星星

```java
//画星星方法
public void drawStar (int line) {
    /*输入4，打出以下图形：
       *
      **
     ***
    ****
    */
    for(int i = 0; i < line; i++){
        for(int j = 0; j < line - 1 - i;j++){
            System.out.print(" ");
        }
        for(int k = 0; k <= i; k++){
            System.out.print("*");
        }
        System.out.println();
    }
}

//通用，int line控制行数，boolean dir控制方向
public void drawStar (int line,boolean dir) {
    //dir为true，左边开始画星星
    if(dir){
        //控制行数
        for(int i = 0; i < line; i++){
            //控制星星
            for(int j = 0; j <= i; j++){
                System.out.print("*");
            }
            System.out.println();
        }
    }else{
        for(int k = 0; k < line; k++){
            //控制空格
            for(int l = 0; l < line - 1 - i; l++){
                System.out.print(" ");
            }
            //控制星星
            for(int m = 0; m <= k; m++){
                System.out.print("*");
            }
            System.out.println();
        }
    }
}

//优化
public void drawStar (int line,boolean dir) {
    for(int i = 0; i < line; i++){
        if(!dir){
            for(int j = 0; j < line - 1 - i; j++){
                System.out.print(" ");
            }
        }
        for(int j = 0; j <= i; j++){
            System.out.print("*");
        }
        System.out.println();
    }
}
```

​	小任务：

​	*1.反向三角形（既可左，又可以偏右）*

​	*2、用来交换两个数组元素 a{1,2,3,4} b{5,6,7,8}*

```java
	//交换数组元素a{1,2,3,4} b{5,6,7,8}
    public void exchangeElem (int[] arr1, int[] arr2){
        for(int i = 0; i < arr1.length; i++){
            arr1[i] = arr1[i]^arr2[i];
            arr2[i] = arr1[i]^arr2[i];
            arr1[i] = arr1[i]^arr2[i];
        }
        for(int val : arr1){
            System.out.println("arr1:"+val);
        }
        for(int val : arr2){
            System.out.println("arr2:"+val);
        }
    }
//缺点：1.循环方式交换数组元素，性能比较慢
//2.交换的时候要保证两个数组元素长度一致
public void changeElem (int[] arr1,int[] arr2) {
    int[] temp = arr1;
    arr1 = arr2;
    arr2 = temp;
}
```



​	*3、用来交换一个数组（头尾互换）*

```java
public class Demo {
    //数组头尾元素互换
    public void reverseArray (int[] x) {
        for(int i = 0; i < x.length/2; i++){
            x[i] = x[i]^x[x.length - 1 -i];
            x[x.length - 1 -i] = x[i]^x[x.length - 1 -i];
            x[i] = x[i]^x[x.length - 1 -i];
        }
    }
}
```



​	*4、用来寻找给定元素是否在数组内存在*

```java
public boolean findElem (int[] arr,int elem) {
    boolean b = false;
    for(int i = 0; i < arr.length; i++) {
        if(arr[i] == elem){
            b = true;
            break;
        }
    }
    return b;
}
```



​	*5、合并两个数组*

​	*6、用来将一个数组按照最大值位置拆分*

​	*7、用来去掉数组中得0元素*

```java
 //删除数组中某特定元素,a{1,2,0,1,2,3,4,0,0}
    public int[] deleteItem (int[] arr,int elem) {
        int count = 0;
        for(int i = 0; i < arr.length; i++) {
            if(arr[i] != elem) {
                count++;
            }
        }
        int[] newArr = new int[count];
        int index = 0;
        for(int i = 0; i < arr.length; i++) {
            if(arr[i] != elem){
                newArr[index++] = arr[i];
        }
        }
        return newArr;
    }
```



​	*8、用来存储给定范围内的素数（begin, end）*

```java
public class Demo {
    //找到2-100之间不包括1，2，3的素数,并返回素数数组
    public int[] findPrimeNum (int begin,int end) {
        if(begin < 0 || end < 0){
            System.out.println("输入不合法.");
        }
        if(begin > end){
            System.out.println("初始值不能比结束值大.");
        }
        int[] newArr = new int[(end-begin)/2];
        int index = 0;
        if(begin == 1) begin = 2;
        for(int i = begin;i <= end;i++){
            boolean b = true;
            for(int j = 2; j <= Math.sqrt(i);j++){
                if(i%j == 0){
                    b = false;
                    break;
                }
            }
            if(b){
                //newArr[index++] = i
                //输入1，20时报错，索引越界
                newArr[index] = i;
                index++;
            }
        }
        int[] primeNumArr = new int[index];
        for(int i = 0; i < index; i++){
            primeNumArr[i] = newArr[i];
        }
        return primeNumArr;
    }
}
```



​	*9、用来给数组元素排序，既能升序，又能降序*

```java
//根据参数进行是否升序还是降序排列
    public int[] sortArr (int[] arr,boolean dir) {
        //dir为true时，升序排列
        for(int i = 0; i < arr.length - 1; i++){
            for(int j = arr.length - 1; j >= i + 1;j--){
                if((dir && arr[j] < arr[j-1]) || (!dir && arr[j] > arr[j-1])){
                   arr[j] = arr[j]^arr[j-1];
                   arr[j-1] = arr[j]^arr[j-1];
                   arr[j] = arr[j]^arr[j-1];
                }
            }
        }
    }
```



​	*10、实现用户登录认证*

​	*11、向数组中指定位置插入元素*

```java
public class Demo {
    public int[] insertElemToIndex (int[] arr,int elem,int index){
        int[] newArr = new int[arr.length+1];
        for(int i = 0;i < arr.length; i++){
            newArr[i] = arr[i];
        }
        //将指定索引后的元素位置后移
        for(int j = arr.length; j > index; j--){
            newArr[j] = newArr[j-1];
        }
       newArr[index] = elem;
       return newArr;
    }
} 
```



##### 3、类的阶段总结

> 类：抽象笼统的概念，用来描述一组具有相同的特征和行为的事物
>
> 属性：静态描述类的特征
>
> 属性的定义：权限修饰符 【特征修饰符】 属性类型 属性名字 【=值】
>
> 方法：动态描述类的行为
>
> 方法的定义：权限修饰符 【特征修饰符】 返回值类型 方法名字  (参数名字) 【抛出异常】【{方法执行体}】
>
> 方法的主要结构：方法的参数列表（行为发生的条件），方法的返回值类型（行为发生后得到的结果）
>
> 类的使用：类描述好后，不能直接用来执行，需要通过new的方式创建一个实例，然后才能调用类的方法（执行一次特定行为）和属性（存值和取值）
>

4、**<font color="pink">命名规范：</font>**

> 方法、属性、变量：小驼峰式命名规则[^（changeName()）]
>
> 类名：大驼峰式命名规则[^（class RandomDice）]
>
> 构造方法：构造方法与类名一致，以大写字母开头的方法
>
> 静态常量：全部字母大写 ，通过_做具体说明，比如BOOKSTORE_ADMIN
>
> 包名：全部字母小写，Java关键字也是小写，注意不冲突
>
> **<font color="red">注意：方法设计很重要</font>**

##### 5、方法执行的内存变化

```java
publc class Test {
    public int changeNum (int x) {
        x = 100;
        return x;
    }
    public static void main (String[] args) {
    //隐藏过程：加载类模板（此处为Test模板）的过程
    Test t = new Test();
    int a = 1;
    a = t.changeNum(a); //10  
    //堆内存中开辟空间,方法存在对象的内部空间中
    //方法执行时会压到栈内存中执行，并根据传参和内部定义的变量开辟临时空间
    //方法执行完毕后临时空间销毁
    }
}
```

​	

方法执行原理图：

![](C:\Users\86180\Desktop\testGit\typoraImg\方法执行内存原理.jpg)

​	**形参和实参：**

> ```java
> public class Test {
> public void changeArray (int[] x) {
> 	x[0] = 10;
> 	}
> 	public static void main (String[] args) {
>   //加载Test的类模板
> 	Test t = new Test();
>   //栈中开辟变量t，保存的是指向对象的地址
>   int[] arr = {1,2,3,4};
>   //方法放到栈中执行时，开辟临时内存空间
>   //将栈中的arr地址复制一份到x，指向同一个数组
>   //更改堆内存中第一个元素的值为10
>   t.changeArray(arr);
>   System.out.println("arr[0]:"+arr[0]);//arr[0]:10
> 	}
> }
> ```
>
> 形参：方法执行时的临时变量空间
>
> 实参：方法调用时会将实参的内容传递给形参（<font color="red">常量传递的是值，引用数据类型传递的是值</font>）

##### 6、方法重载(overload)

​	*概念：一个类中的一组方法，相同的方法名字，不同的参数列表，这样一组方法否成了方法的重载*

​	*作用：为了让使用者便于调用 只需要记录一个名字，执行不同的操作*

​	*设计方法重载：*

​	1）调用方法的时候，首先通过方法名字定位方法

​	2）如果方法名字一致，可以通过参数类型定位方法

​	3）如果没有与传递参数类型一致的方法，可以找一个参数类型可以转化的方法执行（可进行自动类型转化）

​	4）JDK1.5版本以后 出现新写法`test(int...x)]`

​		动态参数列表的方法不能与相同意义的数组类型方法构成方法重载 本质上时一样的比如：`test(int...x) test(int[] arr)`

​		动态参数列表的方法是可以不传参的，相当于0个

​		前面还可以规定必须传的类型`test(String a,int...x)`，但是后面时不能再继续传参的

​		动态参数列表在方法的参数中只能存在一份，且必须放置在方法参数的末尾

```java
//思考题
public class Demo {
    public void test (boolean b) {
        System.out.println("你的输入为："+b);
    }
    public static void main (String[] args) {
        Demo d = new Demo();
        d.test();//不传参不行，参数类型不符合也不行
        System.out.println();
        d.test();
        //这个函数不传参也可以，传参，参数不同类型也可以
        //其实底层System.out.println()有十多个方法
    }
    //方法名一致 可以直接通过参数列表定位方法 
    //方法重载
    //删掉char的方法后会默认找参数类型可以进行转化的方法执行
    public void test (int b) {
        System.out.println("你的输入为："+b);
    }
    public void test (String b) {
        System.out.println("你的输入为："+b);
    }
    public void test (char b) {
        System.out.println("你的输入为："+b);
    }
    public void test (int...x) {
        //x底层就是一个数组，x动态参数列表
        for(int val : x){
            System.out.println("动态参数列表："+val);
        }
    }
    public void test () {
        System.out.println("无参数");
    }
}
```

##### 7、类的成员：构造方法

​	*类的内部成员：属性，方法，构造方法*，程序块

​	*构造方法：*

​	1）作用：构建当前类的对象

​	2）写法：权限修饰符  返回值类型 方法名字 （参数列表）[抛出异常] {方法执行体 返回对象}

​	3）构造方法名：必须与类名一致

> ```java
> import java.util.Scanner;
> public class Test {
> public static void  main (String[] args) {
>    Functions f = new Functions();
>    Test t = new Test("Jackson",18,"male");
>    System.out.println("my name is "+t.name+",I am "+t.age+" years old");
> }
> public String name = "goudai";
> public int age = 20;
> public String gender = "male";
> //提供重载
> public Test () {}
> public Test (String name,int age,String gender) {
>    /*
>    结构上没有返回值类型，但是实际中会返回一个对象
>    特点：
>    1.每一个类都有构造方法，类中没有定义，系统会默认会调用默认构造方法
>    2.如果有构造方法定义，会对默认构造方法进行覆盖
>    3.存在构造方法重载
>    作用：
>    在创建对象的同时想要做一些其他任务，这个时候有我们可以自己定义构造方法，
>    也可以定义带参数的
>    this指代创造出的对象
>    this关键字的使用：
>    1.关键字，代替一个对象，this可以调用属性，方法
>    2.调用属性和方法可以在类中任何成员位置，没有顺序
>    3.this可以调用其他构造方法，必须在第一行
>    4.构造方法不能来回调用，编译就无法通过
>    5.方法之间可以通过this相互调用，但是容易报错
>     */
>    this();
>    this.name = name;
>    this.age = age;
>    this.gender = gender;
>    System.out.println(gender);
> }
> }
> ```

##### 8、类的成员：程序块

​	作用：和普通方法一样，完成特定行为的

​	写法：程序块是一个没有修饰符，参数，返回值，名字的特殊方法

​	用法：每一次我们调用构造方法的时候，系统会自动帮我们调用一次程序块，让它执行一遍，多个程序块会按照顺序执行

​	用途：想要创建对象之前执行一些操作，可以使用程序块

```java
public class Demo {
    {
        System.out.println("程序块");
    }
    public Demo () {}
}
```

##### 9、类的总结与设计

​	*类的四个成员：*属性、方法、构造方法、程序块

​	*类的加载及对象的创建*

​	*作业：*

​	（1）模拟一个计算器

​	知识补充：`Scanner`有阻塞的效果，`nextInt() next()nextDouble()`以回车符作为截止，不会读取回车符，`nextLine`会读取回车符

​	String转换为int类型：包装类`int-->Integer char-->Character byte-->Byte float-->Float `，`Integet.parseInt("123")-->int 123`，`123+""-->"123"`

​	`nextLine()`和`next()`：`next()`看到回车或空格都认为结束，`nextLine()`只认为回车结束

```java
import java.util.Scanner;
public class Demo () {
    public static void main (String[] args){
    //Scanner用法
    Scanner input = new Scanner(System.in);
    System.out.println("请输入密码：");
    int password = input.nextInt();//不读取回车
    //此处 解决办法1：input.nextLine()空执行一次，把回车符读掉
    System.out.println("请输入用户名：");
    //解决办法2：input.next()读取字符串，不读取回车符（留了两个回车在消息队列）
    //解决办法3：都用nextLine()读取，改变为String password
    String userName = input.nextLine();//读取回车
    System.out.println("结束.");
    /*
    输出结果：
    请输入密码
    123
    请输入用户名：
    结束.
    */
}
}
```

​	原理图：

![](C:\Users\86180\Desktop\testGit\typoraImg\计算机消息队列.jpg)

```java
import java.util.Scanner;
public class Calculator {
    public float sum;
    public void calculate () {
            Scanner input = new Scanner(System.in);
            System.out.println("请输入第一个数：");
            this.sum = Float.parseFloat(input.nextLine());
            float result;
            while(true) {
                System.out.println("请输入符号：");
                String symbol = input.nextLine();
                System.out.println("请输入第二个数：");
                float two = Float.parseFloat(input.nextLine());
                switch (symbol){
                    case "+":
                        this.sum = this.add(this.sum,two);
                        break;
                    case "-":
                        this.sum = this.subtract(this.sum,two);
                        break;
                    case "*":
                        this.sum = this.multiply(this.sum,two);
                        break;
                    case "/":
                        this.sum = this.devide(this.sum,two);
                        break;
                    default:
                        break;
                }
                System.out.println("结果为："+ this.sum);
            }
    }

        public float add (float a,float b) {
            return a + b;
        }
        public float subtract (float a,float b) {
            return a - b;
        }
        public float multiply (float a,float b) {
            return a * b;
        }
        public float devide (float a,float b) {
            return a / b;
        }
    }
```

​	（2）设计一个类，替代一个数组可以做的事情（增删改查）

​	**<font color="red">面向对象，每一个方法只干一个具体的事情</font>**

```java
public class ArrayBox {
    private int[] intArr;
    private int count = 0;
    private static final int DEFAUL_SIZE = 10;
    private int initialSize;

    //方法重载
    public ArrayBox () {
        this.intArr = new int[DEFAUL_SIZE];
    }

    public ArrayBox (int size) {
        this.initialSize = size;
        this.intArr = new int[size];
    }
    //检查空间是否足够
    private boolean checkSpace (int[] arr) {
        boolean flag = false;
        if(this.count + arr.length <= this.initialSize){
            flag = true;
        }
        return flag;
    }

    //此方法用来返回新空间的数组
    private int[] grow (int[] arr) {
        int[] newArr = new int[this.count + arr.length];
        return newArr;
    }

    //此方法用来添加元素
    public void add (int...x) {
        //检查初始化空间是否足够
        if(this.checkSpace(x)){
            for(int i = 0; i < x.length; i++) {
                intArr[this.count++] = x[i];
            }
        }else{
            //返回一个扩容后的新数组
            int[] newArr = this.grow(x);
            //添加元素
            for(int j = 0; j < newArr.length; j++){
                if(j < this.count) {
                    newArr[j] = this.intArr[j];
                }else{
                    newArr[j] = x[j - this.count];
                }
            }
            //保证Count始终为数组长度
            this.intArr = newArr;
            this.count = newArr.length;
            newArr = null;
        }
        System.out.println("添加成功~~~");
    }

    //删除指定索引元素
    public void deleteItemByIndex (int index) {
        this.checkIndex(index);
        int[] newArr = new int[this.count-1];
        //将指定索引元素移到数组的最后this.count - index - 1 + 1 - 1
        for(int i = index; i < this.count - 1; i++){
            int temp = this.intArr[i];
            this.intArr[i] = this.intArr[i+1];
            this.intArr[i+1] = temp;
        }
        for(int j = 0; j < this.count - 1; j++){
            newArr[j] = this.intArr[j];
        }
        this.intArr = null;
        this.intArr = newArr;
        this.count -= 1;
        System.out.println("删除成功~~~");
    }

    //查看数组
    public void checkAllElemInBox () {
        System.out.print("MyBox:");
        for(int val : this.intArr) {
            System.out.print(val + " ");
        }
        System.out.println();
    }

    //查找指定索引的元素
    public int get (int index) {
        this.checkIndex(index);
        System.out.println("获取的元素为："+this.intArr[index]);
        return this.intArr[index];
    }

    //检测索引是否越界
    private void checkIndex (int index) {
        if(index < 0 || index >= this.count){
            throw new BoxIndexOutOfBounds("Current BoxSize:"+this.count+",Enter Index:"+index);
        }
    }

    public int size () {
        return this.count;
    }
}
```

​	Exception异常（人为规定一种不正常现象,ArrayIndexOutOfBounds），Error（计算机根本处理不了，StackOverFlowError栈内存溢出，方法相互调用容易产生）

##### 10、类的关系

​	*类和类之间的关系：*

​	*`A is-a B`泛化（继承 实现）*

​	*`A has-a B`包含（组合 聚合 关联）*

​	`A use-a B`依赖（依赖 或者`need-a`）

###### （1）继承

​	*子类继承父类*

> 1、子类继承父类，通过关键字extends
>
> 2、子类对象可以调用父类中的（public protected）属性和方法，当作自己的来用
>
> 3、子类可以添加自己独有的属性和方法
>
> 4、子类从父类中继承的方法不满足需要，可以在子类中重写方法（覆盖父类方法），方法重写（override）
>
> 5、每一个类都有继承类，如果不写extends关键字，默认继承Object（任何一个引用类型的父类）
>
> ​	Object类非常重要，是任何一个引用类型的父类（直接或间接继承Object）
>
> 6、Java中继承是单个存在的（单继承），每一个类只能有一个继承类（在extends关键字后面只能写一个类），C++存在多继承，容易出现不知调用哪一个父类的方法
>
> 7、继承在内存中的存储形式
>
> 

```java
//父类
public class Animal () {
    public Animal () {
        System.out.println("我是Animal的构造方法");
    }
    public void eat () {
        System.out.println("我是Animal的eat方法");
    }
    public void sleep () {
        this.eat();
        System.out.println("我是Animal的sleep方法");
    }
}

//子类继承父类，通过extends关键字
public class Person extends Animal () {
    public void Person () {
        System.out.println("我是Person的构造方法");
    }
    public void study () {
        System.out.println("Good good study,day day up!");
    }
    public void eat () {
        System.out.println("我是Person的eat方法");
    }
}

public Test () {
    public static void main (String[] args) {
        Person p = new Person();
        p.sleep();//使用的Animal中的sleep方法，但是方法中this指向p
        /*输出：
        我是Animal的构造方法
        我是Person的构造方法
        我是Person的eat方法
        我是Animal的sleep方法
        */
    }
}
```

| 关键字 | 方法重写（override）                                         | 方法重载（overload）                             |
| ------ | ------------------------------------------------------------ | ------------------------------------------------ |
| 类     | 产生两个继承关系的类，子类重写父类的方法                     | 一个类中的一组方法                               |
| 权限   | 子类可以大于等于父类                                         | 没有要求                                         |
| 特征   | final static abstract<br />父类方法是final 子类不能重写<br />父类方法是static 子类不存在<br />父类方法是abstract 子类必须重写<br />（子类是具体必须重写，否则子类是抽象类，可以不重写） | 没有要求                                         |
| 返回值 | 父类可以小于等于父类                                         | 没有要求                                         |
| 名字   | 子类与父类一致                                               | 一个类中的好多方法名必须一致                     |
| 参数   | 子类与父类一致                                               | 每一个方法的参数必须一致<br />（个数 类型 顺序） |
| 异常   | 运行时，编译时<br />如果父类方法抛出运行时异常，子类可以不予理会<br />如果父类抛出编译时异常<br />子类抛出异常数小于等于父类<br />子类抛出的异常的类型小于等于父类 |                                                  |
| 方法体 | 子类的方法内容与父类不一致                                   | 每一个重载的方法 执行过程不一样                  |

###### （2）*权限修饰符*

​	`public`

​	`protected`

​	`默认`

​	`private`

###### （3）Object父类方法

> 1、toString() 打印输出时将对象变成String字符串
>
> ```java
> public String toString() {
> return this.getClass().getName()+"@"+Integet.toHexString(this.hashCode());
> //获取类的名字+@+16进制hashCode
> }
> ```
>
> 
>
> 2、hashCode() 将对象在内存中的地址经过计算得到一个int整数（十进制）
>
> 
>
> 3、getClass() 用来获取对象对应类的类映射（反射机制）
>
> 
>
> 4、equals()  用来比较两个对象的内容（Object默认效果是==）
>
> `==`可以比较基本类型（比较值），引用类型（比较地址）
>
> ```java
> public boolean equals (Object obj){
> return (this == obj);
> }
> ```
>
> 
>
> 5、wait()线程进入挂起等待状态（存在方法重载）
>
> 6、notify()	线程唤醒
>
> 7、notifyAll()	唤醒所有
>
> 8、finalize()	1.8版本以后被隐藏，权限修饰符是protected，在对象被GC回收时，默认调用执行的方法
>
> ` final特征修饰符 finally代码块 finalize方法`
>
> 9、clone()	克隆对象

