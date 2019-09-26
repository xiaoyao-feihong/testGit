### 过滤器和监听器

<hr>

##### 1、监听器（listener）

监听器：就是一个Java类，监听其它Java类的一些状态的变化

用途：主要应用在图形化的界面中，比如GUI、Android



监听器的术语

- 事件源：被监听的对象
- 监听器：监听的对象
- 事件源与监听器的绑定：将监听器设置到事件源上
- 事件：监听变化的方法触发



###### （1）Web中的监听器

Web中的Listener和Filter属于Servlet规范中的高级技术

Web中的监听器（监听3个域对象）：

- 事件源：ServletContext,HttpSession,ServletRequest
- 监听器：自定义实现8个接口
- 事件源和监听器的绑定：配置



###### （2）监听器分类

> 1、监听3个域对象
>
> ServletContextListener
>
> HttpSessionListener
>
> ServletRequestListener
>
> 2、属性变更的监听器
>
> ServletContextAttributeListener
>
> ServletSesssionAttibuteListener
>
> ServletRequestAttributeListener
>
> 3、监听HttpSession中JavaBean的状态改变
>
> HttpSessionBindingListener
>
> HttpSessionActivationListener



###### （3）第一类监听器

1）Session的监听器使用

```java
class MyContextListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("context is created");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("context is destroyed");
    }
}
```

web.xml配置：

```xml
<listener>
	<listener-class>service.MyContextListener</listener-class>
</listener>
```





2）ServletContext的监听器应用：

1、加载框架的配置文件（Spring）

2、定时的任务调度：Timer，TimerTask

3、腾讯每年给用户发送生日快乐贺卡就是这个操作



ServletContext的生命周期：服务器启动的时候就会创建，服务器关闭或者项目移除时被销毁



某网站每5秒更新一次数据，我们每间隔5秒到指定网站获取我们需要的数据：

```java
package service;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

public class TestMyListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("TestMyListener is created.");
        //获取calendar对象
        Calendar calendar = Calendar.getInstance();
        //设置calendar对象的时间
        calendar.set(2019,7,12,13,18);
        //设置一个定时器
        Timer timer = new Timer();
        //设置一个定时任务，参数：执行任务线程，任务开始时间，执行间隔
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                System.out.println("get data needed");
            }
        },calendar.getTime(),5000);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        //ServletContext被销毁时执行（服务器关闭或工程移除的时候触发）
        System.out.println("I am destroyed.");
    }
}

```



3）session监听器的使用

HttpSession的生命周期

创建：服务器第一次调用getSession

销毁：

- 非正常关闭服务器（正常关闭session会序列化）
- session过期（默认事件30分钟）
- 手动调用`session.invalidate()`

HttpSession的问题

- 访问Servlet会不会创建session：不会，必须手动调用getSession()方法
- 访问JSP会不会创建session：会，因为session是JSP的内置对象
- 访问html会不会创建session：不会

应用：

```java
public class MySessionListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("session object is created");
        //会输出两次，第一次是在index_jsp.java中调用request.getHttpSession()的时候执行，第二次是我们访问的时候
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("session object is destroyed");
    }
}
```

配置：

```xml
<session-config>
    <!--设置session的过期时间1分钟-->
	<session-timeout>1</session-timeout>
</session-config>
```



4）request的监听器使用

HttpRequest的生命周期：

- 创建：用户发送请求，服务器就会创建request对象
- 销毁：服务器做出响应后就会销毁request对象

问题：

访问一个Servlet会不会创建一个request对象：会

访问一个JSP会不会创建request对象：会

访问一个html会不会创建一个request对象：会

只要发送请求，就会创建request和response对象(图片也是一次请求响应)



使用：

```java
public class MyReuqestListener implements ServletRequestListener {
    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        System.out.println("request is destroyed");
    }

    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        System.out.println("request is created");
    }
}
```



###### （4）第二类监听器

用来监听三个域对象的属性变化的

```java
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class MySesssionAttributeListener implements HttpSessionAttributeListener {
    @Override
    public void attributeAdded(HttpSessionBindingEvent se) {
        System.out.println("add new attribute");
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent se) {
        System.out.println("remove a new attribute");
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent se) {
        System.out.println("cover a existed attibute");
    }
}

```

jsp文件：

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <%
    session.setAttribute("name","zhuminmin");
    session.setAttribute("name","minmin");
    session.removeAttribute("name");
  %>
  </body>
</html>
```

访问JSP就会执行三个输出



###### （5）第三类监听器

监听HttpSession中的JavaBean对象得到的状态改变的监听器

1）HttpSessionBindingListener：监听HttpSession中的JavaBean对象的绑定和解除绑定的

这个监听器不用配置

```java
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class JavaBean implements HttpSessionBindingListener {
    private String name;
    private Integer age;
    
    public JavaBeanDemo (String name,Integer age){
        this.name = name;
        this.age = age;
    }
    
    @Override
    public void valueBound(HttpSessionBindingEvent event) {
        System.out.println("绑定了");
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {
		System.out.println("解除绑定了");
    }
    
    public void setName (String name){
        this.name = name;
    }
    
    public String getName () {
        return this.name;
    }
    
    public void setAge (Integer age){
        this.age = age;
    }
    
    public Integet getAge (){
        return this.age;
    }
}
```

JSP:

```jsp
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
	<body>
        <%
        	//事件绑定了
        	request.setAttribute("bean",new JavaBean("chen",28);
            //解除绑定了
            request.removeAttribute("bean");
        %>
    </body>
</html>
```



活化和钝化：

- sessionDidActivate：活化（反序列化）
- sessionWillPassive：钝化（将对象序列化到硬盘）

首先让对象实现序列化接口

```java
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionEvent;
import java.io.Serializable;

public class JavaBean implements HttpSessionActivationListener, Serializable {
    private String name;
    private Integer age;

    public JavaBean (String name,Integer age) {
        this.name = name;
        this.age = age;
    }
    
    @Override
    public void sessionWillPassivate(HttpSessionEvent se) {
        System.out.println("对象被活化了");
    }

    @Override
    public void sessionDidActivate(HttpSessionEvent se) {
		System.out.println("对象被钝化");
    }
}

```

服务器或工程移除的时候，会将保存到session中的对象序列化到work文件夹中，当服务器和项目重新启动的时候对象会被反序列化回来。



优化session（不能每次序列化session都要关闭服务器或者移除工程呀）

通过配置Context标签配置定时序列化

配置位置：

- 在Tomcat下tomcat/conf/context.xml：Tomcat所有虚拟主机都会按照这个配置执行
- tomcat/conf/Catalina/localhost/context.xml：localhost虚拟主机会按照这个配置执行
- 工程下的META-INF下/context.xml配置\<Context\>：当前工程中按照这个配置执行（eclipse）

context.xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<Context>
    <!--
		1、maxIdleSwap：1分钟不使用将session序列化到硬盘
		2、directory：序列化后存放的位置（C:\Users\86180\.IntelliJIdea2019.1\system\tomcat\Tomcat9_HttpSessionListener\work\usersession）
	-->
	<Manager className="org.apache.catalina.session.PersistentManager"  maxIdleSwap="1">
    	<Store className="org.apache.catalina.session.FileStore" directory="usersession"></Store>
    </Manager>
</Context>
```



##### 2、过滤器

（1）自动登录案例

技术分析：

- Cookie技术，利用Cookie记录用户名和密码
- 过滤器：可以过滤客户端向服务器发送的请求

过滤器使用场景：

- IP过滤，脏话过滤，自动登录，统一编码字符集，响应压缩...



FIlter接口的方法

>1、`init(FilterConfig filterConfig)`
>
>2、`doFilter(ServletReuqest request,ServletResponse response)`
>
>3、`destroy()`



拦截某个jsp文件

Filter包下的类：

```java
package filter;


import javax.servlet.*;
import java.io.IOException;

public class JSPFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("拦截成功。。。");
    }
}

```

web.xml配置：

`<url-pattern>`配置

+ 完全路径匹配：`/demo/demo.jsp`

+ 目录匹配：`/*  /demo/*`
+ 扩展名匹配：`*.jsp  *.action`不能以/开头

+ 拦截Servlet：`<serlvet-name>类名</servletname>`，也可以通过`url-pattern`拦截
+ <font color="blue">重要：拦截JSP的跳转</font>`<dispatcher></dispatcher>`



```xml
<filter>
	<filter-name>aaa</filter-name>
    <filter-class>filter.JSPFilter</filter-class>
</filter>
<filter-mapping>
	<filter-name>aaa</filter-name>
    <!--注意默认是工程名下的，所以不要写工程名-->
    <url-pattern>/demo1.jsp</url-pattern>
</filter-mapping>
```



dispatcher的设置：

可以配多个

```jsp
<!--拦截请求-->
<dispatcher>
	REQUEST
</dispatcher>
<!--拦截转发-->
<dispatcher>
	FORWARD
</dispatcher>
<!--拦截全局的错误页面-->
<dispatcher>
	ERROR
</dispatcher>
<!--拦截包含-->
<dispatcher>
	INCLUDE
</dispatcher>
```



filter的生命周期：

+ 创建：服务器启动的时候
+ 销毁：服务器关闭的时候



`filterConfig`对象的方法：

> 1、`getFilterName()`
>
> 2、`getInitParameter()`
>
> 3、`getInitParameterNames()`
>
> 4、`getServletContext()`



`filterChain`（过滤器链）对象：

多个过滤器可能拦截相同的资源：根据顺序，如果发现还有过滤器，就交给下面的过滤器，但是如果有一个过滤器不放行，资源就不会传递，如果没有下一个过滤器，就交给服务器

执行顺序：过滤器执行顺序与`<filter-mapping>`的顺序有关，靠前的先执行



filter只有一个方法：

> 1、`doFilter(request,response)`方法，放行到下一个过滤器，如果没有下一个过滤器，就到服务器



（2）通用的字符集编码的过滤器

