### Java8新特性

<hr>


#### 1、Java8基本了解

速度更快

代码更少

强大的Stream API

便于并行

最大化减少空指针异常（Optional类）



HashMap：

+ jdk1.7：hashcode获得的索引相同，放进对应索引的链表中，并比较是否和里面的元素相等，元素是否相同的检测，我们称之为**碰撞**

  碰撞情况我们要尽可能避免，因为碰撞次数过多会使效率很低，碰撞无法避免，我们只能尽量减少碰撞，加载因子，数组大小的3/4就会扩容（尽量避免）

+ jdk1.8：某一个链表元素长度超过8，就变为红黑树
  
  - ConcurrentHashMap：使用CAS算法，无锁算法，效率提升



jdk1.7虚拟机：

Oracle-Sun：Hotspot

Oracle：JRocket

IBM：J9 JVM

阿里：Taobao JVM

Hotspot，open jdk，我们使用的，有永久区（在堆空间中），其它虚拟机没有永久区

jdk1.8：去掉了永久区（方法区），Metaspace元空间，直接使用物理内存，电脑内存有多大，元空间就有多大，垃圾回收频率就会减少（空间变大了），JVM调优中永久区参数没有了（PremGenSize、MaxPremGenSize没有了，改为MetaspaceSize，MaxMetaspaceSize）





#### 2、Lambda表达式

Lambda是一个匿名函数，可以理解为可以传递的代码，可以写出更简洁灵活的代码



##### 2.1 Lambda优化demo1

```java
public class TestLambda {
    //匿名内部类比较大小
    @Test
    public void test01 () {
        Comparator<Integer> com = new Comparator<>{
            public int compare (Object o1,Object o2){
                //有用的只是这一句
                return Integer.compare(o1,o2);
            }
        };
        TreeSet<Integer> ts = new TreeSet<>(com);
    }
    
    //解决匿名内部类问题
    @Test
    public void test02 () {
        Comparator<Integer> com = (x,y) -> Integer.compare(x,y);
        TreeSet<Integer> ts = new TreeSet<>(com);
    }
}
```



##### 2.2 Lambda优化demo2

```java
public class FilterEmp {
    List<Emp> employees = Arrays.asList(
    	new Emp("A",28,16000),
        new Emp("B",46,46000),
        new Emp("C",37,36000),
        new Emp("D",23,12000)
    );
    
    //需求：获取当前公司中年龄大于35的员工信息
    public List<Emp> filterEmp (List<Emp> list) {
        List<Emp> emps = new ArrayList<Emp>();
        for(Emp emp : list){
            if(emp.getAge() > 35){
                emps.add(emp);
            }
        }
        return emps;
    }
    
    //需求：获取当前公司中薪资大于20000的员工信息
    public List<Emp> filterEmp2 (List<Emp> list) {
        List<Emp> emps = new ArrayList<Emp>();
        for(Emp emp : list){
            if(emp.getSalary() > 20000){
                emps.add(emp);
            }
        }
        return emps;
    }
    
    ////需求：获取当前公司中薪资低于20000的员工信息
    ..........
}
```

发现：两段代码只是条件不一样

优化办法：

（1）策略设计模式

```java
public interface EmpFilter<T> {
    boolean condition (T t);
}

class Test {
    //只需要传接口，不用写多个方法了
    public static List<Emp> filterEmpByConditon (List<Emp> list,EmpFilter<Emp> ef){
        List<Emp> emps = new ArrayList<>();
        for(Emp emp : list){
            if(ef.condition(emp)){
                emps.add(emp);
            }
        }
        return emps;
    }
    
     private static List<Emp> employees = Arrays.asList(
    	new Emp("A",28,16000),
        new Emp("B",46,46000),
        new Emp("C",37,36000),
        new Emp("D",23,12000)
    );
    
    public static void main (String[] args){
        //使用策略模式过滤
        List<Emp> emps = filterEmpByConditon(employees,new EmpFilter<Emp>(){
            public boolean condition (Emp emp) {
                return emp.getAge() > 35;
            };
        });
    }
}
```



（2）Lambda表达式

```java
//Lambda1
public static void main (String[] args){
    //Lambda表达式
    List<Emp> emps = EmpFilter(employees,(emp) -> emp.getSalary() <= 5000);
    //打印
    emps.forEach(System.out::println);
}

//Lambda2
public static void main (String[] args){
    //Lambda的Stream API
    employees.stream()
        .filter((e) -> e.getSalary() >= 5000)
        .forEach(System.out::println);
    
    employees.stream()
        .map(Emp::getName)
        .forEaach(System.out::println);
}
```



##### 2.3 Lambda介绍

接口只有一个抽象方法的我们称之为**函数式接口**，我们可以使用`@FucntionalInterface`修饰，只能定义一个抽象方法

```java
public class TestLambda {
    @Test
    public void test1 () {
        //jdk1.7 使用方法内部变量，必须final修饰
        //使用匿名内部类
        final int num = 0;
        Runnable r = new Runnable (){
            public void run () {
                System.out.println(num);
            }
        };
        
        //jdk1.8使用Lambda表达式
        //注意lambda本质只是语法糖，final可以不写，但是num2本质还是final修饰的，不可更改，num2++操作都会编译错误
        int num2 = 2;
        Runnable r2 = () -> System.out.println(num2);
    }
}
```



###### 2.3.1 无参数，无返回值

```java
Runnable runnable = () -> System.out.println("hello");
```



###### 2.3.2  一个参数，无返回值

可以省略括号

```java
Consumer<String> con = (str) -> System.out.println(str);
```



###### 2.3.3 多个参数，有返回值

Lambda体中有多条表达式

```java
Comparator<Integer> com = (x,y) -> {
    System.out.println(x + y);
    return x + y;
};
```



Lambda表达式参数类型可以不写，因为JVM可以通过上下文推断出数据类型

```java
//类型推断,数组中类型就是根据变量前的声明推断的
String[] strs = {"abc","hello","haha"};

// <>中可以不写类型，也是通过List的泛型推断出来的
List<Integer> list = new ArrayList<>();

```



<font color="blue">Lambda表达式需要函数式接口的支持</font>



###### 2.3.4 java提供的函数式接口

```java
//Predicate<T> 断言型接口  boolean test(T t);

//Function<T,R> 函数型接口  R apply(T t);

//Consumer<T> 消费型接口 void accept(T t);

//Supplier<T> 供应型接口 T get();
```

java8提供的还有这些接口的很多子接口



###### 2.3.5 Lambda方法引用

主要格式：

对象::实例方法名（方法与接口定义的参数列表和返回值相同）

类::静态方法名

类::实例方法名（第一个参数是实例方法的调用者，参数二是实例方法的参数时）

```java
@Test
public void test () {
    PrintStream ps = System.out;
    Consumer<String> con = x -> ps.printn(x);
    //接口方法与我们引用方法参数列表和返回值类型相同
    Consumer<String> con1 = x -> ps::printn(x);
    
    //实例::实例方法 
    //getAge方法参数列表和返回值类型与Supplier接口一致
    //可以直接作为接口方法的实现
    Emp emp = new Emp("fh",28,12000);
    Supplier<Integer> sup = () -> emp.getAge();
    Supplier<Integer> sup2 = emp::getAge;
    
    //类名::实例方法名
    BiPredicate<String,String> bipre = (x,y) -> x.equals(y);
    BiPredicate<String,String> bipre2 = String::equals;
}
```



Lambda构造器引用

```java
public void test () {
    Function<Integer,Emp> f = (x) -> new Emp(x);
    //构造器引用方式,前提是对象有一个参数类型匹配的构造器
    Function<Integer,Emp>f2 = Emp::new;
    Emp emp = sup2.accept();
}
```



##### 2.4 Stream API

数据操作相关，在数据操作过程中，可以做一系列流水线式中间操作，注意产生的新的数据流，不影响数据源



Stream操作步骤

（1）创建Stream

（2）中间操作

（3）终止操作

```java
public class StreamAPI {
    @Test
    public void test () {
        List<String> list = new ArrayList<>();
        
        //1.使用集合提供的stream()和parallelStream()方法创建流
        Stream<String> stream1 = list.stream();
        
        //2.通过Arrays中的静态方法stream()方法获取数组流
        Stream<String> stream2 = Arrays.stream();
        
        //3.通过Stream的静态方法of
        Stream<String> stream3 = Stream.of("aa","bb","cc");
        
        //4.创建无限流
        Stream<Integer> stream4 = Stream.iterator(0, (x) -> x + 2);
        stream4.limit(10).forEach(System.out::prinln);
        
        //生成
        Stream.gennerate(() -> Math.random())
            .limit(5)
            .forEach(System.out::println);
            ;
    }
}
```

