1、classLoader

程序的起点：

（1）jvm就是一个运行在操作系统上的程序

A.java --> A.class --> 机器指令

`javac *.java`路径下的Java文件都会编译

Bootstrap Class Loader加载器之王(JRE在执行Java程序得时候，JVM会分配一个扩展路径，用来加载系统自带类得，比如java.lang包)

Extension Class Loader扩展加载器（jre/lib/ext）

App Class Loader也叫SystemClassLoader，我们写得程序都是这个加载器加载的

包文件下的Java不允许单独编译

```java
public class Main {
    public static void main (String[] args){
       
    }
}
```

（2）如何把一个类加载到内存中？(Hello类)

+ Class.forName("Hello");加载之后进行初始化
+ ClassLoader.getSystemClassLoader().loadClass("Hello");加载之后不进行初始化





2、注解


```java
@Target(ElementTYPE.METHOD)
//运行时保存注解信息
@Retention(RetentionPolicy.RUNTIME)
public @interface SQL {
    String sql();
}

@Target(ElementTYPE.PARAMETER)
//运行时保存注解信息
@Retention(RetentionPolicy.RUNTIME)
public @interface SQL {
    int id;
}
```

动态代理

```java
public class DaoProxy {
    //dao类对象的助理
    //设计一个方法，获取代理对象
    public Object getClassInstance (Class clazz) {
        //提供一个代理对象newProxyInstance() 
        Proxy.newProxyInstance(clazz.getClassLoader(),new Class[]{clazz},new MethodProxy());
    }
    
    private class MethodProxy implements InvocationHandler {
        public Object invoke (Object proxy,Method method,Object[] args){
            return null;
        }
    }
}
```



泛型：类泛型，方法泛型

```java
public class Animal {
    
}
class Dog extends Animal {
    
}
class Cat extends Animal {
    
}
//类泛型
//限制必须继承了Animal的类型才能
//上边界通配符
class Zoo<T extends Animal> {
    List<T> list;
    public void add
}

class Test {
    public static void main (String[] args){
        Zoo zoo = new Zoo<Dog>();
        //下边界，传没问题，但是取得时候只能用Object取
        List<? super Dog> list = new List<>();
        list.add(new Dog());
        Object obj = list.get(0);
    }
}
```



线程安全

```java
public class Test {
    private static int money = 0;
    public static void mian (String[] args){
        Thread thread1 = new Thread(new Runbable(){
            public void run () {
                for(int i = 0; i < 100000; i++){
             //锁的是thread1这个实例，指run方法执行时，其它方法不能执行
             //但是thread2没锁
                    synchronized(this){
                        money += 1;
                    }
                }
            }
        });
        Thread thread2 = new Thread(new Runbable(){
            public void run () {
                for(int i = 0; i < 100000; i++){
                    //锁住类
                    synchronized(Test.class){
                        money -= 1;
                    }
                }
            }
        });
        thread1.start();
        thread2.start();
    }
}
//lock乐观锁，synchronized悲观锁（所有想用我锁的对象的都不让用）
class Test2 {
    private static int num = 0;
    public static void main (String[] args){
        Lock myLock = new ReentrantLock();
        Thread thread1 = new Thread(new Runbable(){
            public void run () {
                for(int i = 0; i < 100000; i++){
                    myLock.lock();
                    money += 1;
                    myLock.unlock();
                }
            }
        });
        Thread thread2 = new Thread(new Runbable(){
            public void run () {
                for(int i = 0; i < 100000; i++){
                    //自旋，如果变量被使用，执行一会死循环
                    myLock.lock();
                    money -= 1;
                    myLock.unlock();
                }
            }
        });
        thread1.start();
        thread2.start();
    }
}

//lock()
//unlock()
//tryLock()
//tryLock(long time,TimeUnit unit)过段时间再试试
```

原子类：

```java
public class Test3 {
    private static AtomicInteger money = 0;
    public static void mian (String[] args){
        Thread thread1 = new Thread(new Runbable(){
            public void run () {
                for(int i = 0; i < 100000; i++){
                    //自增
                    money.addAndGet(1);
                }
            }
        });
        Thread thread2 = new Thread(new Runbable(){
            public void run () {
                for(int i = 0; i < 100000; i++){
                    //自减
                    money.decrementAndGet();
                    //money.addAndGet(-1);
                }
            }
        });
        thread1.start();
        thread2.start();
    }
}
//CAS锁（compare and swap）原子锁
//Java本身无法实现原子锁，因为调用了操作系统的接口
//底层都是乐观锁
//HashMap死循环，resize扩容时死循环
//ConCurrentHashMap不推荐使用，还是使用的悲观锁
//公司中规范要求，HashMap必须传初始化参数new HashMap<>(3000);
//线程不安全性能 > 乐观锁性能 > 悲观锁性能
//最好的解决办法：用Lock
//ThreadLocal tl = new ThreadLocal();
//将变量保存到当前线程保护起来，让其它线程不能访问
```

CPU内存一致性协议



```java
public class Test4 {
    //volatile强制禁止指令重排序
    private static volatile Test4 instance = new Test4();
    private Test4 () {}
    public static getInstance () {
        if(instance == null){
            synchronized (Test4.class) {
                if(instance == null){
                    instance = new Test4();
                }
            }
        }
        return instance;
    }
}
```

