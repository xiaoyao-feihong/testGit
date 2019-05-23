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
> 6、Java中继承是单个存在的（单继承），每一个类只能有一个继承类（在extends关键字后面只能写一个类），C++存在多继承，容易出现不知调用哪一个父类的方法，不安全
>
> 7、继承在内存中的存储形式
>
> ![](C:\Users\86180\Desktop\testGit\typoraImg\继承的内存变化图.png)
>
> 
>
> **<font color="red">8、关于this和super（重要）</font>**
>
> ​	1）this和super都是指代词，代替的是对象
>
> ​	2）this代替的是当前执行方法时的那个对象，不一定是当前类的
>
> ​	3）super代替的是当前执行方法时的对象的父类对象，空间内部的那个
>
> ​	4）this和super都能调用一般属性和一般方法，可以放在类成员的任意位置（属性，方法，程序块，构造方法）
>
> ​	<font color="red">注意：</font>一般方法可以互相调用，会产生StackOverflowError问题，构造方法不能互相调用，就无法编译（因为默认的super和this都会抢第一行）

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
        //隐藏了一行代码：super();创建父类的过程
        System.out.println("我是Person的构造方法");
    }
    public void Person (int a) {
        this();
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
| 特征   | final static abstract<br />父类方法是final 子类不能重写<br />父类方法是static 子类不存在<br />父类方法是abstract 子类必须重写<br />（子类是具体必须重写，否则子类也得是抽象类，可以不重写） | 没有要求                                         |
| 返回值 | 父类可以小于等于父类                                         | 没有要求                                         |
| 名字   | 子类与父类一致                                               | 一个类中的好多方法名必须一致                     |
| 参数   | 子类参数必须与父类一致                                       | 每一个方法的参数必须一致<br />（个数 类型 顺序） |
| 异常   | 运行时，编译时<br />如果父类方法抛出运行时异常，子类可以不予理会<br />如果父类抛出编译时异常<br />子类抛出异常数小于等于父类<br />子类抛出的异常的类型小于等于父类 | 没有要求                                         |
| 方法体 | 子类的方法内容与父类不一致                                   | 每一个重载的方法 执行过程不一样                  |

*权限修饰符*

​	`public`

​	`protected`

​	`默认`

​	`private`

*Object父类方法*

> 1、`toString()` 打印输出时将对象变成String字符串
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
> 2、`hashCode() `将对象在内存中的地址经过计算得到一个`int`整数（十进制）
>
> ​	底层是由c++编写的
>
> 
>
> 3、`getClass() `用来获取对象对应类的类映射（反射机制）
>
> 
>
> 4、`equals() ` 用来比较两个对象的内容（Object默认效果是==）
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
> 5、`wait()`线程进入挂起等待状态（存在方法重载）
>
> 
>
> 6、`notify()`	线程唤醒
>
> 
>
> 7、`notifyAll()`	唤醒所有
>
> 
>
> 8、`finalize()`	1.8版本以后被隐藏，权限修饰符是protected，在对象被GC回收时，默认调用执行的方法
>
> ` 	final特征修饰符 finally代码块 finalize方法`
>
> 
>
> 9、`clone()`	克隆对象，权限修饰符是`proctected`
>
> ​	看到`native`修饰符就是无法看到源码的，底层是由c++写的



###### （2）包含关系

包：类的个数变多以后，需要管理类-->包（可以理解为是一个文件夹）

​	类的第一行会出现`package package-name;`package要出现在`import  className;`前面

包含关系：`has-a`

​	1）组合（人和大脑的关系，必须同时出现，同时消亡）

​	2）聚合（汽车和车轮子的关系，整体和部分的关系，可以分割，电脑和主板的关系）

​	3）关联（人有汽车，电脑的关系，后来形成的关系）



###### （3）依赖关系

依赖关系：`use-a(need-a)`

屠夫与猪的关系，后期因为某一件事情临时组合在一起，事情结束，关系不再存在

设计类关系的遵循的原则：高内聚，低耦合

耦合度：紧密程度	<font color="pink">继承 > 包含 > 依赖</font>

```java
//屠夫与猪 屠夫的行为：杀猪 猪：被杀了会叫
public class Butcher {
    public void judgeTimeToKillPig (int month) {
        Pig pig = new Pig("PigOne");
        pig.growWeight(month);
        pig.bekilled();
    }
}

public class Pig {
    private String name;
    private int weight = 10;
    boolean flag;

    public Pig (String name) {
        this.name = name;
    }

    //每一个月体重长到1.5倍
    public void growWeight (int month) {
        for(int i = 0; i < month; i++){
            this.weight += this.weight >> 1;
        }
        this.flag = (this.weight)>150?true:false;
    }

    public void bekilled () {
        if(this.flag){
            System.out.println(this.name+"被杀了，好惨！");
        }else {
            System.out.println(this.name+"还小,还不能被杀");
        }
    }
    
    //获取猪的体重
    public int getWeight () {
        return this.weight;
    }
    
    //获取猪的名字
    public String getName () {
        return this.name;
    } 
}

public class Test () {
    public static void main (String[] args) {
        Butcher butcher = new Butcher();
        butcher.judgeTimeToKillPig(12);
    }
}
```

**小任务**

*1、模拟学生在机房使用电脑：有5台电脑，有开关机状态，电脑被打开 被使用中 被关闭；有5个学生，使用电脑，让学生进入机房使用电脑；让学生陆续进入机房选择一台关闭的电脑使用*

```java
public class Student {
    //学生有姓名，品德值，和使用电脑的方法
    private String name;
    private int morality = (int)(Math.random()*10);

    public Student () {}

    public Student (String name){
        this.name = name;
    }

    public void useComputer (Computer computer) {
        System.out.println(this.name+"正在使用"+computer.getNumber()+"号电脑。");
        //System.out.println(this.morality);
        computer.open();
        if(this.morality > 4){
            computer.close();
        }else {
            System.out.println(this.name+"离开，居然不关闭电脑。");
        }
    }

    public String getName () {
        return this.name;
    }
}

public class ComputerRoom {
    //学生进入机房，使用电脑
    public Computer[] computers = new Computer[5];

    {
        for(int i = 0; i < this.computers.length; i++){
            this.computers[i] = new Computer(i+1);
        }
    }

    public void enterRoom (Student student) {
        System.out.println("欢迎"+student.getName());
        for(int i = 0; i < this.computers.length; i++){
            if(!this.computers[i].getStatus()){
                student.useComputer(this.computers[i]);
                break;
            }
        }
    }

}

public class Computer {
    //电脑有打开和关闭的方法，有自己的编号，状态
    private boolean status = false;
    private int number;
    public Computer (int number) {
        this.number = number;
    }

    //打开电脑
    public void open () {
        System.out.println(this.number+"号电脑被打开。");
        this.status = true;
    }

    //关闭电脑
    public void close () {
        System.out.println(this.number+"号电脑被关闭。");
        this.status = false;
    }

    //获取电脑编号
    public int getNumber () {
        return this.number;
    }

    //获取电脑状态
    public boolean getStatus () {
        return this.status;
    }

}

```



*2、模拟警车小汽车与测速器之间的关系：测速器测量小汽车之间的速度，标准20米每秒；如果小汽车超速，警车追击，如果警车追击成功，输出追击时间，如果警车追不上，输出追不上啦*

```java
public class Car {
    private int speed = 50;
    public Car () {}
    public Car (int speed){
        this.speed = speed;
    }
    public int getSpeed () {
        return this.speed;
    }
}

public class Velometer {
    private int stanardTime = 2;
    public Velometer () {}
    public void measureSpeed (Car car) {
        if(100/car.getSpeed() < this.standardTime){
            //超速，警车追击
            PoliceCar pCar = new PoliceCar();
            pCar.chaseCar(car);
        }else{
            System.out.println("速度正常，请保持。");
        }
    }
}

public class PoliceCar {
    //后期使用观察者设计模式
    private int speed = 60;
    public PoliceCar () {}
    public PoliceCar (int speed) {
        this.speed = speed;
    }
    public chaseCar (Car car) {
        if(car.getSpeed() < this.speed){
            int time = 100/(this.speed - car.getSpeed());
            System.out.println("将在"+time+"秒后追上小汽车。");
        }else{
            System.out.println("追不上小汽车");
        }
    }
}
```

##### 11、修饰符

​	*（1）权限修饰符*

​		权限修饰符类型：

​	`public` 	公共的，本类，同包，子类，任意类的位置只要有对象都可以访问

​	`protected`	受保护的，本类，同包，子类（通过子类对象在子类范围内部访问）

```java
package pack_a;
import pack_b.Functions;
public class Test extends Functions {
    public static void main (String[] args) {
        Functions f = new Functions();
        f.testProtected();//报错，方法是受保护的
        f.test();//正常执行
        Test t = new Test();
        t.testProtected();//子类可以正常调用父类受保护的方法
    }
}

public class Functions {
    protected void testProtected () {}
    public void test () {}
}
```



​	默认不写 	默认的，同包

​	`private`		私有的，本类



​		权限修饰符：

​			权限修饰符可以用来修饰类和类中的成员（除程序块）

​			权限修饰符用来修饰类的时候只有两个可以用（public 默认不写）



​	Java面向对象的四个特征

​		继承	封装	多态	（抽象）

​		1)封装：将一些数据或执行过程，进行一个包装

​		目的：保护这些数据或执行过程的安全

​		方法本身就是封装，封装了执行的过程，保护过程的安全，隐藏了执行细节，增强了代码的复用性

​		对属性本身的封装：私有属性（封装在类中），提供操作属性的方式（共有的方法，属性不要公有，非常不安全）

```java
package packb;

import packa.TestA;

public class Test {
    public static void main (String,args) {
        TestSymbol ts = new TestSymbol();
        ts.testPublic();//本类和同包
        ts.testProtected();//本类和同包
        ts.testDefault();//本类和同包
        ts.testPrivate();//私有的 本类
    } 
}

public class TestSymbol extends TestA {
    public void testPublic () {}
    protected void testProtected () {}
    void testDefault () {}
    private void testPrivate () {}
}
```



<hr>

​	*（2）*特征修饰符

​	`final`		最终的，不可更改的

​	可以修饰变量，属性，方法，类

```java
final int a = 10;//不赋值会报错，赋值以后也不可以更改值
a = 20;//报错

final int[] x = {1,2,3};
x[0] = 10;//final锁的是栈中的x的内存地址
x = new int[5];//报错，x的hashCode值不能更改

public class Test {
    private final String name = "";//要求属性必须赋初始值，否则报错
    public final int test () {}
    //final修饰的方法不允许子类重写
}

public final class Demo {}
//类是最终的类（太监类），此类不可以被其他类继承，通常是一些定义好的工具类
//比如Math,Scanner,Integer,String
```



​	

​	程序的设计问题:

​	1）可读性，名字，缩进，注释 	2）健壮性，判断严谨		3）优化：结构，性能，内存	4）复用性，方法，类	5）扩展性，抽象，接口，面向配置文件



​	`static`		静态的

​	可以修饰属性，方法，块，内，内部类

​	特点：

​	1）静态元素存储在静态元素区，在类加载时就初始化了

​	2）每一个类有自己的一个区域，与别的类不冲突，静态元素只加载一次（只有一份），全部类对象及类的本身共享

​	3）由于静态元素区加载的时候可能没有创建对象，可以通过类名直接访问

​	4）静态元素不属于任何一个对象，属于类

​	5）静态元素区，Garbage Collection无法管理，可以粗暴的认为常驻内存（可能产生数据冲突）

​	6）非静态成员中可以访问静态成员（对象.属性/方法）

​	7）静态成员可以访问静态成员，不能访问非静态成员（类名.属性/方法）

​	8）静态元素中不可以出现this或super关键字

```java
//static final的应用
public class BookStore {
    private static final int BOOKSTORE_ADMIN = 0;
    private static final int BOOKSTORE_VIP = 0;
    private static final int BOOKSTORE_NORMAL = 0;
    public void buyBooks (float price,int identity){
        switch(identity){
            case BOOKSTORE_ADMIN:
                price*=0.5;
                break;
            case BOOKSTORE_VIP:
                price*=0.8;
                break;
            case BOOKSTORE_NORMAL:
                price*=1;
            default:
                ...
        }
    }
}
```



​	`abstract`		抽象的，修饰类，修饰方法

```java
//抽象方法
public class Animal {
    //子类都用不上
    public abstract void eat ();
    public abstract void sleep ();
}

public class Person {
    //都进行重写
    public void eat(String food) {}
    public void sleep(String bed) {}
}

public class Pig {
    //都进行重写
    public void eat(String siliao) {}
    public void sleep(String zhujuan) {}
}

//抽象类中不是必须有抽象方法
//抽象方法必须放在抽象类中（或接口中）
/*抽象类的特点：
	可以含有一般属性，也可以有private static final等等
	可以含有一般方法，也可以含有private static final等等
	抽象类中允许含有抽象方法，一般类中不能有抽象方法（没有方法体）
	可以含有方法块和静态块，也可以重载
	抽象类含有构造方法，但是我们不能用调用构造方法直接创建对象
	抽象类只能通过子类继承来做事
*/
//抽象类可以单继承抽象类
//抽象类可以单继承具体类（用法上不会出现）
//具体类可以继承抽象类，但是必须将父类的抽象方法重写，如果子类也不想继承抽象类中的抽象方法，子类也可以设置为抽象类
//使用：子类不同的实现抽象的方法，让功能很灵活，还可以使用父类的方法
//抽象类没有具体成员，全部都是抽象方法-->接口（抽象类抽象到极致，还是类的结构，将abstract改用interface修饰）
public abstract class Animal2 {}
```





​	`native`		本地的（后续代码为c++进行指针操作，内存操作，我们无法再看到源码）

​	`transient`		瞬时的，短暂的

​	`sychronized`		同步的

​	`volatile`			不稳定的



##### 12、单例设计模式（Singleton） 

​	**设计模式：**设计模式是一种设计经验的总结，用来解决某些场景下的某一类问题的通用解决方案，让代码更容易让人理解，确保了代码的复用性，可扩展性，可靠性。

​	**设计模式分类**：（常用23种）



​		1）<font color="pink">*创建型模式*</font>（5种）：用于解决对象创建的过程

​				单例模式、工厂方法模式、抽象工厂模式、建造者模式、原型模式



​		2）<font color="pink">*结构型模式*（7种）</font>：把类或对象通过某种形式结合在一起，构成某种复杂或合理的结构

​				适配器模式，装饰者模式，代理模式，外观模式，桥接模式，组合模式，享元模式



​		3）<font color="pink">*行为型模式*</font>（11种）：用来解决类和对象之间的交互 更合理的优化类或对象之间的关系

​			观察者模式，策略模式，模板模式，责任链模式，解析器模式，迭代子模式，命令模式，状态模式，备忘录模式，访问者模式，中介者模式



​	**单例模式设计场景：**

​	设计思想：一个类只能创建一个对象，有效减少内存占用空间

​	设计模式的实现：1）饿汉式（立即加载）	2）懒汉式（延迟加载）	3）生命周期托管（单例对象别人帮我们处理 ）

​	设计一个百度搜索引擎：

```java
//饿汉式
public class Singleton {
    //创建一个单例对象
    //通过设计，让这个类只能创建一个对象
    //1.让构造方法私有：保证外面不能随意创建对象
    private Singleton () {}
    //2.只存在一份且不允许更改
    private static Singleton singleton = new Singleton();
    //3.提供一个获取单个对象的方法

    public static Singleton getSingleton () {
        return singleton;
    }
}

//懒汉式
public class Singleton {
    private Singleton (){}
    private static Singleton single;
    public static Singleton getSingle () {
        if(single == null){
            single = new Singleton();
        }
        return single;
    }
}

public class Test {
    public static void main (String[] args){
        Singleton s = Singleton.getSingleton();
    }
}
```



##### 13、类的加载问题

类的加载顺序：

>1、加载父类模板
>
>2、父类会产生自己的静态空间
>
>​	先加载静态属性，再加载静态方法，然后加载静态块，最后执行静态块
>
>3、加载子类模板
>
>4、子类产生自己的静态空间
>
>​	先加载属性，方法，块，执行静态块
>
>5、开辟对象空间
>
>6、加载父类的非静态成员（属性，方法，块，构造方法），执行父类非静态块
>
>7、执行父类的构造方法
>
>8、加载子类的非静态成员（属性，方法，块，构造方法），执行子类非静态块
>
>9、执行子类构造方法
>
>10、将对象空间引用交给变量保存

存在继承机制的类的加载顺序图示：

![](C:\Users\86180\Desktop\testGit\typoraImg\类的加载顺序.jpg)



**接口**

接口也是一个类的结构，不让有具体的

接口成员：

1）属性：不能含有一般属性，只能含有公有的静态的常量（public static final）

2）方法：不能含有一般方法，只能含有公有的抽象方法

3）块：不能含有，一般块和静态块都不行

4）构造方法：不能含有构造方法

5）与别的类结构之间的关系

​	接口不能继承别的类，最抽象

​	抽象类---多实现---接口

​	具体类不可以与接口直接多实现，可以继承，直接将所有抽象方法重写

​	接口---多继承---接口

图解：

![](C:\Users\86180\Desktop\testGit\typoraImg\接口抽象类与类的关系.png)

```java
public interface TestInterface {
    public static final String name = "test";
    //public static final 默认不写，也只能写这个
    //1.8版本以后可以使用default修饰方法
}

//抽象类可以直接多实现接口
public abstract A implements B,C {}
```

*封装一个LinkedBox 解决Array不适合插入和删除的问题*

解决插入、删除效率低的问题（不适合遍历）：

单向链表

双向链表

圆环链表

<font color="red"><strong>数组和链表的使用场景：使用数组，需要不断插入，删除操作，使用链表</strong></font>

**链表图：**

![](C:\Users\86180\Desktop\testGit\typoraImg\链表删除元素.png)

```java
//双向链表
package arrbox;

public class LinkedBox implements Box {
    //链表，链式
    private Node first;
    private Node last;
    private int size = 0;

    //添加元素
    public void add(int element){
        this.linkLast(element);
    }

    //根据索引找寻对象
    public int getElemByIndex(int index){
        //检查越界
        this.rangeCheck(index);
        return this.lookForNode(index).item;
    }

    //删除元素
    public int removeElemByIndex(int index){
        this.rangeCheck(index);
        Node targetNode = this.lookForNode(index);
        this.removeNode(targetNode);
        return targetNode.item;
    }

    //删除节点，使当前节点无关联，被GC回收
    private void removeNode (Node targetNode) {
        Node prev = targetNode.prev;
        Node next = targetNode.next;
        //判断节点如果为第一个节点
        if(prev == null){
            first = next;
        }else{
            prev.next = next;
        }
        //判断节点为最后一个节点
        if(next == null){
            last = prev;
        }else{
            next.prev = prev;
        }
        this.size--;
    }

    //获取box长度
    public int getBoxLength (){
        return this.size;
    }

    //寻找节点
    private Node lookForNode (int index) {
        Node targetNode;
        if(index < (size>>1)){
            targetNode = first;
            for(int i = 0;i < index - 1;i++){
                targetNode = first.next;
            }
        }else{
            targetNode = last;
            //执行次数要判断清楚
            for(int j = this.size - 1; j > index;j--){
                targetNode = last.prev;
            }
        }
        return targetNode;
    }

    private void linkLast (int element) {
        //用l保存上一个节点
        Node l = last;
        //创建新节点
        Node newNode = new Node(l,element,null);
        //最后节点改为新节点
        last  = newNode;
        //如果最后一个节点，为空，新节点就是最后一个节点
        if(l == null) {
            first = newNode;
        }else{
            //将上一次最后节点链接上新的最后节点
            l.next = newNode;
        }
        this.size++;
    }

    private void rangeCheck (int index) {
        if(index < 0 || index >= this.size) {
            throw new BoxIndexOutOfBoundsException("index越界.");
        }
    }
}
```



##### 14、缺省适配器模式和多态

+ ###### 适配器

**（1）使用接口的弊端**：如果规则改变了，所有子类的方法都要重写或做更改，如果继承的子类多了，成本较高

**（2）设计模式**：<font color="red">Adapter</font>，适配器模式，类适配器，对象适配器，缺省适配器模式

**（3）缺省适配器模式**：如220V，110V都可以用的充电头

```java
public class ArrBox implements Box {
    //必须都重写
}
public interface Box {
    void add();
    void get();
    void remove();
    void size();
}
public abstract class AbstractBox implements Box {
    public void add();
    public void get();
    public void remove(){
        //抛出自定义异常，让子类要么不用，要么重写
    }
    public void size(){
        //抛出自定义异常
    }
}
public class ABox {
    //只需要重写add和get
    public void add(){}
    public void get(){}
}
```

+ ###### 多态

*（1）Java中为什么要设计多态：*

c++一个子类可以多继承很多父类，并使用父类中的所有方法，但是父类重名的方法，子类就无法知道调用的是哪一个父类的方法



多态：同一个对象，体现出来多种不同的形态，将一种行为表现出不同的效果

​	1）实现多态效果，先要有继承关系

​	2）父类类型的引用指向子类对象，只能调用父类的方法

​	3）属性重名，使用的是父类的属性，如果有重写的方法，调用子类重写的方法

​	4）需要调用子类的独有方法，需要向下转型（造型）

​	5）若需要转换的类型与真实的类型不匹配，会产生`ClassCastException`造型异常（向下转型）

​	6）可以使用`instanceof`运算符判断是否能造型

​	7）方法的返回值可以小于等于父类

```java
public class Person {
    public void eat (){}
    public void sleep (){}
    public void talk (){}
}
public class Teacher extends Person {
    //重写了eat方法
    public void eat (){}
    public void teach (){}
}
public class Test {
    public static void main (String[] args){
        
        //创建人
        Person p = new Teacher();
        
        //父类类型的引用指向子类对象
        //向上转型
        Person p2 = new Teacher();
         //p2只能调用Person的方法
        
        //使用的是teacher重写的eat方法
        p2.eat();
       
        //需要使用子类的独有方法，需要做向下转型
        Teacher t = (Teacher)p2;
        //可以使用子类独有的方法和属性
    }
}
```

*（2）常见异常：*

`ClassCastException`造型异常（同级之间造型）

`NumberFormateException`数字格式化异常（`Integer.parseInt("abc")`）

`InputMismatchException`输入不匹配（Scanner的`nextInt`输入字符串）

`NegativeArraySizeException`数组长度负数（`int[] arr = new int[-2];`）

`NullPointerException`空指针异常（`Person p = null;p.eat();`）

`ArithmeticException`算数异常（100/0）

*错误：*

`StackOverflowError`栈内存溢出错误（方法互相调用等）



*（3）多态的使用：*

使用场景，一个流程中的对象行为一样，但是处理方式不同，我们写一个父类实现都一样的行为，具体细节抽象由子类自己实现，最后以父类型为参数



银行办理业务流程：

设计一个方法：等待用户来办理业务

流程：叫号码（排队），去窗口办理，办理完毕后（离开）

人的类型：老人，年轻人，土豪



策略模式（行为型）：Strategy，执行流程不一样，中间某些点存在不同，用来解决执行流程固定，执行的结果由于提供了不同的策略而不同

```java
//银行
public class Bank { 
    public void doBusiness (Client p) {
        //业务流程
        System.out.println("欢迎客户办理业务.");
        p.callNumber();
        p.transact();
        p.leave();
    }
}
//所有的客户
public abstract class Client {
    private String name;
    public Client (){}
    public Client (String name){
        this.name = name;
    }
    public void setName (String name) {
        this.name = name;
    }
    public String getName () {
        return this.name;
    }
    public abstract void callNumber ();
    public abstract void transact ();
    public abstract void leave ();
}

public class Youngmen extends Client {
    public Youngmen (){}
    public Youngmen (String name){
        super(name);
    }
    public void callNumber () {
        System.out.println("年轻人刷身份证取号");
    }
    public void transact () {
        System.out.println("年轻人正在办理业务");
    }
    public void leave () {
        System.out.println("年轻人很快处理完业务后离开");
    }
}

public class Oldmen extends Client {
    public Oldmen (){}
    public Oldmen (String name){
        super(name);
    }
    public void callNumber () {
        System.out.println("年纪很大，不知道在哪叫号");
    }

    public void transact () {
        System.out.println("叫来大堂经理，取到号码，掏出存折，办理业务");
    }
    public void leave () {
        System.out.println("老人办完业务后离开");
    }
}

public class Toff extends Client {
   public Toff () {}
   public Toff (String name){
       super(name);
   }
    public void callNumber (){
        System.out.println("土豪直接进入VIP室办理业务");
    }

    public void transact (){
        System.out.println("土豪拿出一袋现金要求存款");
    }

    public void leave () {
        System.out.println("土豪办理完业务，离开");
    }
}

public class Test {
    public static void main (String[] args){
        Client old = new Oldmen("oldmen");
        Client young = new Youngmen("Justin");
        Client toff = new Toff("boss");
        Bank bank = new  Bank();
        bank.doBusiness(old);
        bank.doBusiness(young);
        bank.doBusiness(toff);
    }
}
/*输出结果：
欢迎客户办理业务.
年纪很大，不知道在哪叫号
叫来大堂经理，取到号码，掏出存折，办理业务
老人办完业务后离开
欢迎客户办理业务.
年轻人刷身份证取号
年轻人正在办理业务
年轻人很快处理完业务后离开
欢迎客户办理业务.
土豪直接进入VIP室办理业务
土豪拿出一袋现金要求存款
土豪办理完业务，离开
*/
```

