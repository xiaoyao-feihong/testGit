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

