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



### atguigu-JVM学习



#### 1、JUC

JUC：java.util.concurrent

进程：如`xxx.exe`

线程：如360，提供很多的功能窗口，都是`360.exe`下的线程

+ 选修课必逃，必修课选逃



并发：多个线程抢一个资源

并行：同时做不同的事情



##### 1.1 JUC介绍

3个包

+ java.util.concurrent
+ java.util.concurrent.atomic
+ java.util.concurrent.locks



##### 1.2 JUC的demo

题目：3个售票员，卖30张票

编写企业级的多线程代码：

<font color="red">高内聚，低耦合的前提下，使用线程操作资源类</font>



java多线程的几种状态：

通过Thread.State可以查看源码，并看到介绍

NEW：虚拟机创建线程对象

RUNNABLE：线程在虚拟机中处于运行状态，等待操作系统（比如处理器）分配资源执行

BLOCKED：线程中断状态，等待进入一个同步代码块或方法

WAITING：等待状态，等待其它线程执行完指定操作后，通过唤醒后执行

TIMED_WAITING：指定线程等待时间，等待完成继续执行

TERMINATED：线程完成执行



线程操作资源类

```java
public class Tickets {
    private volatile int total = 30;
    private Lock lock = new ReentrantLock();

    public void sale() {
        lock.lock();
        try {
            if (total > 0)
                System.out.println(Thread.currentThread().getName() + "卖出" +
                        total-- + "张票，还剩" + total + "张票");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            lock.unlock();
        }
    }

    public static void main(String[] args) {
        Tickets ticket = new Tickets();
        new Thread(() -> {
            for (int i = 0; i < 30; i++) {
                ticket.sale();
            }
        }, "Clerk A").start();
        new Thread(() -> {
            for (int i = 0; i < 30; i++) {
                ticket.sale();
            }
        }, "Clerk B").start();
        new Thread(() -> {
            for (int i = 0; i < 30; i++) {
                ticket.sale();
            }
        }, "Clerk C").start();
    }
}
```



鸭子浮水脚下滑，看不到的才是真本事

ReentrantLock：可重复锁



##### 1.3 函数式编程

Lambda表达式就是解决匿名内部类大量冗余代码而出现的

```java
@FunctionalInterface
interface Foo {
    //函数式接口只能定义一个方法
    //如果不写这个注解，也会隐式加上@FunctionalInterface
    void say();
}

public class Lambda {
    public static void main (String[] args){
        Foo foo = () -> System.out.println("hello");
    }
}
```



java8允许函数式接口部分实现方法（2014，2015出的 java8）

```java
@FunctionalInterface
interface Add {
    int add(int x, int y);
	
    //实现默认方法
    default int multiply(int x, int y) {
        return x * y;
    }

    default int subtract(int x, int y) {
        return x - y;
    }
	
    //实现静态方法
    static int divide(int x, int y) {
        return x / y;
    }
    
    static int sqr (int x){
        return (int)Math.sqrt(x);
    }
}
```



java8 ：

+ ArrayList默认初始值10，1.5倍扩容，使用`Arrays.copyOf`进行扩容（源码的`grow()`方法原长度右移一位并加原长度）
+ HashMap初始值16，1倍扩容（源码的`resize()`方法中左移一位）



##### 1.4 并发读写异常

`ConcurrentModificationException`并发读写异常

如何证明ArrayList是线程不安全的

```java
public class TestList {
    public static void main (String[] args){
        List<String> list = new ArrayList<>();   
        //solution：new Vector<>();
        //solution1: Collections.synchronizedList(new ArrayList<>());
        //solution2：new CopyOnWriteList();写实复制,底层就是
        //可能出现并发读写异常
        for(int i = 0; i < 3; i++){
            new Thread(() -> {
                list.add(UUID.randomUUID().substring(0,8));
                System.out.println(list);
            },String.valueOf(i)
            ).start();
        }
    }
}
```



写实复制源码

```java
public boolean add(E e) {
    final ReentrantLock lock = this.lock;
    //当前线程添加元素时，其它线程自旋
    lock.lock();
    try {
        //获取数组
        Object[] elements = getArray();
        int len = elements.length;
        //生成一个长度+1的新数组，并写在最后一个元素上
        Object[] newElements = Arrays.copyOf(elements, len + 1);
        newElements[len] = e;
        //设置新数组为存放元素数组
        setArray(newElements);
        //释放资源，告知其它线程可以操作数据了
        return true;
     } finally {
         lock.unlock();
     }
}
```



HashSet底层就是HashMap，value时常量preset，一个对象

解决并发读写异常：

+ `ArrayList` -> `CopyOnWriteArrayList`
+ `HashSe` -> `CopyOnWriteHArraySet`
+ `HashMap` -> `ConcurrentHashMap`



##### 1.5 锁

8锁问题

+ synchronized：对象锁，多个线程操作同一个资源类，synchronized修饰的方法，锁的是资源类



```java
public class TestLock {
    public static void main(String[] args) throws Exception {
        Phone phone1 = new Phone();
        Phone phone2 = new Phone();

        //1.标准访问
        new Thread(() -> {
            try {
                //TimeUnit.SECONDS.sleep(2);
                phone1.sendEmail();
            } catch (Exception e) {
                e.printStackTrace();
            }
        },"thread A").start();
        //排队等候
        Thread.sleep(10);
        new Thread(() -> {
            phone1.sendSMS();
            //phone2.sendSMS();
        },"thread B").start();
    }
}

class Phone {
    public synchronized void sendEmail () {
        //与Thread.sleep()的工具类
        System.out.println("send email");
    }
    
    public synchronized void sendSMS () {
        System.out.println("send SMS");
    }
    
    public void sayHello () {
        System.out.println("hello");
    }
}
```

（1）标准访问

两个synchronized方法，两个线程（A在B前），同一个资源类

`synchronized`：**<font color="blue">对象锁</font>**，多个线程操作同一个资源类，synchronized修饰的方法，锁的是资源类

输出：

"send email"

"send SMS"



（2）暂停4妙

两个synchronized方法，两个线程，主线程休眠10毫秒后才创建B线程（A线程代码先休眠4妙），同一个资源类

输出：

"send SMS"

"send email"



（3）暂停4妙，与普通方法

输出：

"hello"

"send email"



（4）静态同步锁

`static synchonized`：**<font color="blue">全局锁，类锁</font>**，此时不管有多少实例，锁的是类



##### 1.6 多线程通信

（1）高内聚，低耦合，线程操作资源类

（2）判断/干活/通知

（3）防止虚假唤醒



生产者和消费者模型

（1）使用if导致的虚假唤醒

```java
class AirCondition {
    private int number = 0;
    
    public synchronized void increment () {
        //1.判断
        if(number != 0){
            this.wait();
        }
        //2.干活
        number++;
        System.out.println();
        //3.通知
        this.notifyAll();
    }
    
    public synchronized void decrement () {
        //1.判断
        if(number == 0){
            this.wait();
        }
        //2.干活
        number--;
        System.out.println();
        //3.通知
        this.notifyAll();
    }
    
    public static void main (String[] args){
        Production prod = new Production();
        new Thread(() -> {
            for (int i = 0; i < 10; i++)
                prod.increment();
        }, "A").start();
        new Thread(() -> {
            for (int i = 0; i < 10; i++)
                prod.decrement();
        }, "B").start();
        new Thread(() -> {
            for (int i = 0; i < 10; i++)
                prod.increment();
        }, "C").start();
        new Thread(() -> {
            for (int i = 0; i < 10; i++)
                prod.decrement();
        }, "D").start();
    }
}
```



（2）使用while防止虚假唤醒

````java
class Production {
    private int num = 0;
    private int count = 0;

    public synchronized void increment() {
        while (num != 0) {
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        num++;
        count++;
        System.out.println("thread " + Thread.currentThread().getName() + ": " + num + ";count: " + count);
        this.notifyAll();
    }

    public synchronized void decrement() {
        while (num == 0) {
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        num--;
        count++;
        System.out.println("thread " + Thread.currentThread().getName() + ": " + num + ";count: " + count);
        this.notifyAll();
    }
}
````



（3）新版本写法

```java
class AirCondition {
    private int number = 0;
    private Lock lock = new ReentrantLock();
    
    public void increment () {
       lock.lock();
        try{
            while(num != 0);
            number++;
            System.out.println();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            lock.unlock();
        }
    }
    
    public void decrement () {
       lock.lock();
        try{
            while(num == 0);
            number--;
            System.out.println(num);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            lock.unlock();
        }
    }
    
    public static void main (String[] args){
        Production prod = new Production();
        new Thread(() -> {
            for (int i = 0; i < 10; i++)
                prod.increment();
        }, "A").start();
        new Thread(() -> {
            for (int i = 0; i < 10; i++)
                prod.decrement();
        }, "B").start();
        new Thread(() -> {
            for (int i = 0; i < 10; i++)
                prod.increment();
        }, "C").start();
        new Thread(() -> {
            for (int i = 0; i < 10; i++)
                prod.decrement();
        }, "D").start();
    }
}
```



ReentrantLock

wait()   ----->   condition.await()

notify() ----->    conditon.signalAll()



```java
class AirCondition {
    private int number = 0;
    private Lock lock = new ReentrantLock();
    private Condition condition = lock.newCondition();
    
    public void decrement () {
       lock.lock();
        try{
            while(num == 0){
                condition.await();
            };
            number--;
            System.out.println(num);
            condition.signalAll();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            lock.unlock();
        }
    }
}
```



精准打印demo

三个线程A，B，C，实现精准调用，A线程打印5次，B打印10次，C打印15次

（1）线程操作资源类

（2）判断/干活/通知

为什么使用ReentrantLock，实现高内聚，低耦合，精确执行线程

```java
class ShareData {
    private int number = 1;
    private Lock lock = new ReentrantLock();
    private Condition condition1 = lock.newCondition();
    private Condition condition2 = lock.newCondition();
    private Condition condition3 = lock.newCondition();
    
    public void print5 () {
        lock.lock();
        try{
            //1.判断
            while(num != 1){
                condition1.await();
            };
            //2.干活
            number--;
            System.out.println(num);
            //3.通知
            condition.signal();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            lock.unlock();
        }
    }
}

public class ConditionDemo {
    public static void main (String[] args){
        
    }
}
```

