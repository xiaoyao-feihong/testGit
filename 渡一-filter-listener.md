### FIlter

<hr>



#### 1、FIlter（过滤器）

（1）Tomcat提供的一个组件，类似Servlet机制

（2）是一个特殊的Servlet

（3）过滤的本质，使用场景



##### 1、filter基本使用

> HttpFilter是Tomcat9提供的，9之前版本直接实现Filter接口
>
> 重要方法：doFilter、init、destroy
>
> 异常：ServletException、IOException
>
> 配置：
>
> ```xml
> <filter>
> 	<filter-name>loginFilter</filter-name>
>     <filter-class>filter.LoginFilter</filter-class>
> </filter>
> <filter-mapping>
> 	<filter-name>loginFilter</filter-name>
>     <url-pattern>/login</url-pattern>
> </filter-mapping>
> ```

java代码：

```java
public class LoginFilter extends HttpFilter {
    public void doFilter(request,response,chain){
        System.out.println("catch the request");
        chain.doFilter(request,response);
    }
}
```



应用场景：

每一个Servlet是具体解决某一件事

一个Filter可以很多请求经过，可以在经过Servlet之前和之后继续执行一些相同的操作。

基本使用：用户认证、事务处理、字符集处理



管理机制：

（1）filter对象是一个单例的

（2）filter对象是一个立即加载的方式，不能通过配置load-on-startup来进行修改，因为不是像Servlet一样默认延时加载

（3）多个过滤器对象都处理相同请求，根据配置文件顺序执行，会在真实资源执行之前或之后做事情



##### 2、责任链模式

从浏览器发送的请求都会经过Filter

从服务器转发forward，默认是不经过filter的`request.getRequestDispatcher("index.jsp").forward(request,response)`



从服务器重定向的请求会被Filter拦截

原因：

```xml
<filter>
	<filter-name>loginFilter</filter-name>
    <filter-class>filter.LoginFilter</filter-class>
</filter>
<filter-mapping>
	<filter-name>loginFilter</filter-name>
    <url-pattern>/*</url-pattern>
    <!--如果不设置，默认只拦截request，转发不拦截-->
    <dispatcher>REQUEST</dispatcher>
    <!--如果设置了forward，只拦截forward，请求不拦截-->
    <!--都要拦截的话，两个都要配置，否则forward会覆盖默认的request-->
    <dispatcher>FORWARD</dispatcher>
</filter-mapping>
```



filter链：使用责任链设计模式（Chain Of Responsibility Pattern）



责任链设计模式

```java
//负责控制filter的执行
public class ApplicationFilterChain implements FilterChain {
    //存储具体Filter的容器
    private ArrayList<HttpFilter> filterList = new ArrayList<>();
    private int size = 0;

    //添加filter
    public void addFilter (HttpFilter filter){
        filterList.add(filter);
    }

    //将所有集合中元素的doFilter方法执行
    public void doFilter () {
        if(size < filterList.size()){
           HttpFilter filter = filterList.get(size++);
           filter.doFilter(this);
        }else{
            System.out.println("所有的链方法执行完毕，接下来是controller的方法执行");
        }
    }
	
    //主方法测试
    public static void main(String[] args) {
        FilterChain filterChain = new ApplicationFilterChain();
        for(int i = 1; i < 10; i++){
            filterChain.addFilter(new DoFilter(i));
        }
        filterChain.doFilter();
    }
}

//具体干活的过滤器
public class DoFilter extends HttpFilter {
    private int index;

    public DoFilter (int index){
        this.index = index;
    }

    @Override
    public void doFilter(FilterChain chain) {
        System.out.println(index + "号Filter正在执行");
        chain.doFilter();
    }
}

//抽象类制定规则
public abstract class HttpFilter {
    public abstract void doFilter(FilterChain chain);
}

//制定具体类实现链式干活的规则
public interface FilterChain {
    void doFilter();
    void addFilter(HttpFilter filter);
}
```



剖析Tomcat的Filter原理：

> 1、浏览器发出请求，Tomcat接收请求
>
> 2、Tomcat根据web.xml配置文件加载所有的Filter并通过反射获得对象
>
> 3、通过静态块将对象放进集合里，通过责任链模式，调用方法
>
> 4、调用Filter方法时，会遍历集合，所有包含该请求的Filter都会执行
>
> 5、所有doFilter方法执行完后，放行后交给具体的Servlet实现类执行
>
> 6、递归调用所有Filter的放行后代码

当Filter太多的时候会占用栈内存过多，所以Spring使用AOP，效率更好







#### 2、监听器

Listener监听器：

（1）监听域对象的产生和销毁

（2）监听域对象存值、修改、删除

（3）监听的域对象：request、session、application

（4）与对象监听器：`ServletRequestListener`,`HttpSessionListener`,`ServeltContextListener`

（5）监听属性监听器：

包含存值，取值，更改的方法

`ServletRequestAttibuteListener`、`HttpSessionAttributeListener`、`ServletContextAttributeListener`



监听器配置文件

```xml
<listener>
	<listener-class>listener.Demo</listener-class>
</listener>
```



作用

在域对象产生和销毁，存值取值时做事

