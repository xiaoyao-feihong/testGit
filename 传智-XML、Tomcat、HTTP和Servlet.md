# XML、Tomcat、HTTP和Servlet

#### 一、XML

##### 1、使用XML作为配置文件的方式完成模拟Tomcat

> 需求：现在有一套页面，这套页面想被其他人访问到，端口号可以进行修改的（不修改源码基础）

什么是XML：

+ 可扩展标记语言（允许用户自定义标签）

+ 是一种标记语言，类似HTML

+ 设计目的是用来传输数据

+ XML标签没有预定义，需要自行定义标签

+ 具有自我描述性

+ XML是W3C推荐标准

  

##### 2、XML作用

（1）传输数据，存取数据（数据量比较大）（2）软件的配置文件（结构更加清晰）



##### 3、XML语法

（1）XML的文档说明

​	写法：`<?xml 属性名="属性值" 属性名="属性值 ?>"`必须第一行第一列

​	属性：

​		version：必须有，通常使用1.0（2.0不向下兼容）

​		encoding：字符集，使用浏览器打开的时候默认的编码字符集

​		standalone：描述XML文档是否需要依赖其他文件（值为yes或no）



（2）XML的注释

​	注释写法：`<!-- 文档注释 -->`

​	

（3）XML的元素

​	语法比HTML更严格，必须有关闭标签，大小写敏感，必须正确嵌套，必须有根节点

​	元素的命名规则：

​	名称不能包含空格，名称不能以字符XML，xml、Xml等开始，不能以数字和标点符号开头



（4）XML的属性

```xml
<?xml version="1.0"?>
<persons>
	<person id="12001">
    	<name>chen</name>
        <age>28</age>
        <sex>male</sex>
    </person>
</persons>
```





（5）XML的特殊字符及CDATA区

​	特殊字符：`&lt;--< &gt;--> &amp;--& &apos;--' &quot--";`

​	CDATA区：

```xml
<code>
    <!--为了让代码区不用过多转义，全部作为字符串处理-00000-0-0-=0-=0o9i8u765432134567890-->
    <![CDATA[
		if(a<b){
			a = 100;
		}
	]]>
</code>
```



（6）XML的解析

​	XML解析方式：

​		DOM解析：document object model

​		SAX解析：simple api for XML

​	DOM与SAX区别：

![](C:\Users\86180\Desktop\testGit\typoraImg\DOM和SAX区别.png)	

​	两种解析的方式不同的公司提供了不同的API实现：

​	JAXP：SUN公司的提供的一套XML解析方式

​	JDOM：开源组织提供的一套XML解析的API-jdom

​	<font color="red">DOM4J：开源组织提供的一套XML解析的API-jdom</font>

​	<font color="red">pull：主要应用在安卓手机端解析XML</font>



##### 4、利用DOM4J解析XML的demo

DOM4J的jar包下载地址：<https://www.softpedia.com/get/Programming/Components-Libraries/dom4j.shtml#download>

jaxen的jar包下载地址：

<https://sourceforge.net/projects/jaxen/>

1）**导入jar包：dom4j-x.x.x.jar，jaxen-dom4j.jar，saxpath.jar三个包**

2）创建解析器

3）解析文档获得document对象

4）获取根节点

5）从根节点下查找其它节点

```java
<!--DOM4j的SAX也可以增删改-->
public class DOM4JDemo {
	public void demo {
		//创建解析器,SUN公司提供的XML解析方式
        SAXReader reader = new SAXReader();
        //解析XML文档
        Document doc = reader.read("xml/demo.xml");
        //获得根节点
        Element root = doc.getRootElement();
        System.out.println(root.getName());
        //查找根节点下子节点 element() elements();
        Element personElem = root.element("person");
        Element nameElem = personElem.element("name");
        Element ageElem = personElem.element("age");
        Element sexElem = personElem.element("sex");
        System.out.println(nameElem.getText());//chen
        System.out.println(ageElem.getText());//28
        System.out.println(sexElem.getText());//male
        //root.elements("person").get(1);获得的是第二个person元素
	}
}
```

xpath教程（DOM4J支持）：

```java
/AAA 选择根元素AAA
/AAA/CCC 查找AAA下的CCC元素
//BBB 查找所有的BBB元素
//DDD/BBB 查找父级必须是DDD元素的BBB元素
//* 所有元素
/AAA/BBB[1] AAA下的第一个BBB元素
/AAA/BBB[last()] AAA下的最后一个BBB元素
//@id 选择所有有id属性的元素
//BBB[@id] 查找所有有id属性的BBB元素
//BBB[@name]查找所有具有name属性的BBB元素
//BBB[not(@*)]查找所有没有属性的BBB元素
//BBB[@id="12001"]查找id为12001的BBB元素

DOM4J的XPath支持的API
List document.selectNodes(String xPath);
Node document,selectSingleNode(String xPath);

```

XPath使用：

```java
package dom4j;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

import java.util.List;

public class DOM4JDemo {
    public static void main (String[] args){
        DOM4JDemo dom = new DOM4JDemo();
        try {
            dom.test();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   
    public void test () throws Exception  {
        //加载解析器
        SAXReader reader = new SAXReader();
        //获取文档对象
        Document doc = reader.read("src/demo.xml");
        //获取节点
        List<Node> list = doc.selectNodes("//name");
        for(Node n:list){
            Element elem = (Element)n;
            System.out.println(elem.getText());
        }
    }
}
```



##### 5、XML的约束（DTD，Schema）

+ 用来约束XML的文档可以出现的标签，不能出现的标签，标签顺序，出现次数等
+ XML约束的区别：
  - DTP自成一体；Schema语法就是XML的语法
  - Schema的语法就是XML的语法所以更容易被解析器解析
  - Schema有比DTD更加强大的语义和语法约束



DTD约束demo

```xml
<?xml version="1.0" encoding="utf8" ?>

<!ELEMENT persons (person?)>		//根标签是persons,里面允许出现标签是person
<!ELEMENT person (name,age,sex)>	//,表示按顺序出现 |表示只能出现选择中的一个
<!ELEMENT name (#PCDATA)>		//#PCDATA parsed character data可解析编码数据
<!ELEMENT age (#PCDATA)>
<!ELEMENT sex (#PCDATA)>
<!ELEMENT person (name|age|sex)*>	//name age sex中使用一个并可以多次出现

?:0 or 1
+: >=1
*: >=0

<!ATTLIST person id ID CDATA #REQUIRED>
REQUIRED:标签出现必须有这个属性
ID：不能重复
IMPLIED：可选的

```

被DTD约束后的文档：

```xml
<?xml version="1.0" ?>
<!DOCTYPE persons SYSTEM "demo.dtd">
<persons>
    <person>
        <name>chen</name>
        <age>18</age>
        <sex>male</sex>
    </person>
    <person>
        <name>zhu</name>
        <age>28</age>
        <sex>female</sex>
    </person>
</persons>
```



### 二、Tomcat

##### 1、Tomcat使用

（1）下载Tomcat：<https://tomcat.apache.org/download-70.cgi>

（2）安装：解压即可

+ 下载zip版，tar.gz是Linux版

+ 路径不要有中文，国外软件很容易出问题

+ 启动startup.bat

+ 可能遇到问题：
  - 黑窗口一闪而过：没有正确配置JAVA_HOME这个环境变量
    - 解决添加一个JAVA_HOME环境变量，并将变量用到JDK带bin的文件夹下
    - 原因：Tomcat是按照JAVA_HOME变量寻找JDK的
    
  - 打开两个窗口报错：因为打开的都是默认的一个端口
  
    - 解决1：找到占用端口的进程，关掉
      - 输入netstat -ano查看所有端口信息
      - 找到PID(进程编号)，在任务管理器将这个编号的进程干掉
    
    - 解决2：修改自身的端口号（不推荐使用）
      - tomcat的conf/server.xml中的`<Connector port="设置的默认端口号"/>`
      - 注意该目录下的Connector标签里的端口号都要改
      - 一般将端口号设置为80，80端口号是HTTP的默认端口可以不用写（抢80端口的有php,nginx等）
    

 + 解决tomcat控制台中文乱码问题

   ```java
   set rr="HKCU\Console\Tomcat"
   reg add %rr% /v "CodePage" /t REG_DWORD /d 0x0000fde9 /f>nul
   ```

   



##### 2、了解Tomcat目录

+ bin：tomcat的执行文件（启动，关闭等功能）
+ conf：tomcat的配置文件（重点server.xml，改不好Tomcat无法启动）
+ lib：tomcat需要的jar包
+ logs：tomcat运行的日志文件（Windows可以使用小黑框查看错误信息，Linux只能查看日志文件）
+ temp：tomcat产生的临时文件
+ webapps：tomcat发布的web项目的路径
+ work：tomcat运行JSP的，JSP翻译成Servlet的代码存放的路径



##### 3、发布web项目

 三种方式：

1）直接将工程复制到tomcat/webapps文件夹下

2）配置tomcat虚拟路径

方式一：

例子：将我们的工程保存在D://website，配置虚拟路径/feihong来代替它，然后将文件夹粘贴到Tomcat的webapps文件夹下，<font color="red">在浏览器中输入localhost/feihong会默认寻找文件夹下的index.html</font>，就能访问我们的工程。

配置虚拟路径：Context下的docBase和path属性(conf/server.xml)

```xml
<!--在Host标签下创建Context标签，并配置docBase和path属性-->
<Host>
    <!--浏览器中输入的"/feihong"就等同于"D://website"-->
	<Context path="/feihong" docBase="D:/website"></Context>
</Host>
```

问题：操作server.xml如果写错，Tomcat会无法启动



方式二：

**官方推荐方式**：不用操作Tomcat的核心配置文件，操作更安全

使用：7.0版本以后，直接在conf\Catalina\localhost新建一个XML文件，文件名就是虚拟路径(feihong.xml)，浏览器输入localhost/feihong就等同于D://website/index.html

```xml
<?xml version="1.0" encoding="utf-8" ?>
<Context docBase="D://website"></Context>
```



IDEA下Tomcat配置：

1）server设置：

![](C:\Users\86180\Desktop\testGit\typoraImg\Server配置.jpg)

2）Deployment设置

![](C:\Users\86180\Desktop\testGit\typoraImg\部署设置.png)



3）虚拟路径设置

conf/Catalina/localhost/feihong.xml

作用：访问feihong就相当于访问D://website

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<Context docBase="D://website"></Context>
```



4）设置默认打开页面

web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
    <!--此标签用来设置默认访问部署下的什么格式文件-->
    <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.jsp</welcome-file>
    </welcome-file-list>
</web-app>
```





##### 4、使用IDEA创建一个web工程：

> <https://www.cnblogs.com/lihanxiang/p/8447893.html>详见此博客



### 三、http协议

1、协议概述

协议：用来规定双方需要遵守的规则

http协议：用来规定浏览器与服务器之间需要遵守的规则

http协议作用：规定浏览器与服务器之间传递数据的格式

http协议的特点：基于请求/响应的模型；请求和响应必须成对出现；默认端口号80；

http版本：http1.0每次响应后就关闭连接	http1.1超过一定时间后才会断开连接



2、查看协议

下载httpwatch（支持IE浏览器的抓包工具）

其它浏览器开发者工具network中查看



提交方式区别：

GET/POST区别：

+ GET的提交的参数会显示到地址栏上，而POST不显示
+ GET往往是有大小限制的，而POST没有大小限制
+ GET没有请求体，而POST有请求体



请求头

键值对形式显示，一个key可以对应多个value

需要重点掌握的请求头：

+ User-Agent：代表浏览器的类型（下载中文文件，IE使用URLEncoding，而Firefox使用base64编码）
+ Referer：表示网页的来源，可以防盗链
+ If-Modified-Since：通常与响应头中的`Last-Modified`一起使用，查找本地缓存



响应头：

```js
HTTP/1.1 200 OK		//响应行：协议版本，状态码，状态码描述
Server: Apache-Coyote/1.1	
Accept-Ranges: bytes
Etag: V/"145-1461807615933"
Last-Modified: Thu,28 Apr 2016 01:40:15 GMT //配合If-Modified-Since使用
Content-Type: text/html
Content-Length: 145
Content-Disposition: //文件下载使用的头信息
Location: //重定向的跳转路径
Refresh: //定时刷新/跳转
Date: Thu, 28 Apr 2016 01:43:52 GMT
		//空行
<!DOCTYPE html>...		//响应体
```

重要：`Last-Modified`,`Content-Disposition`,`Location`,`Refresh`





常见状态码：

200：响应成功

302：重定向

304：查找本地缓存

404：访问资源不存在

500：服务器内部错误



### 四、Servlet

1、介绍

servlet：servlet是运行在web服务器上的小型Java程序，就是SUN公司提供的动态网页开发请求。

作用：用来处理从客户端浏览器发送的请求，并且可以对请求做出响应

使用servlet流程：

1）编写一个类实现servlet接口

2）将编写的类配置到服务器上

```java
package servletpackage;
public class ServaaletDemo implements Servlet {
    public void service (ServletRequest req,ServletResponse res) throws Exception {
        
    }
}
```

web.xml配置：

```xml
<web-app>
    <!--servlet的配置-->
	<servlet>
          <!--名字可以随意取，但是和映射名也要一样-->
		<servlet-name>feihong</servlet-name>
         <!--要运行的类的全路径-->
    	<servlet-class>servletpackage.ServletDemo</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>feihong</servlet-name>
         <!--访问这个路径就会执行设置的类-->
    	<url-pattern>/aaa</url-pattern>
	</servlet-mapping>
</web-app>
```

java类：

```java
package com.testservlet;
import javax.servlet.*;
import java.io.IOException;

public class ServletDemo implements Servlet {
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {}

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        System.out.println("登录成功");
        res.getWriter().println("login successfully...");
    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {}
}
```



ServletRequest对象：

对象用于接收此参数

```java
String getParameter(String name);//获取链接中的参数
Map getParameterMap();//返回参数的map集合
String[] getParameterValues(String name);//返回一个参数携带的所有值
Enumeration getParameterNames();//获取所有的键名
```



Servlet执行流程：

![](C:\Users\86180\Desktop\testGit\typoraImg\servlet流程.png)



每次重写Servlet接口麻烦：

GenericServlet：通用的Servlet，与协议无关，实现了servlet接口。

HttpServlet：基于http协议的Servlet，继承了GenericServlet接口（重写doGet,doPost方法即可）。



Servlet生命周期：

生命周期：对象从创建到销毁的过程；

Servlet生命周期：客户第一次访问Servlet时被创建（单例），刷新后都是执行的service方法，项目从服务器中移除的时候或服务器关闭的时候被销毁；

完整描述：<font color="blue">用户每一次访问servlet的时候，服务器都会创建一个Servlet实例，每次创建一个Servlet实例，服务器都会开启一个线程访问servlet中的service方法，项目从服务器中移除的时候或服务器关闭的时候被销毁；</font>        

 

Servlet相关配置：

（1）服务器启动时就创建Servlet

web.xml:

Tomcat有一个为`load-on-startup`为1的默认启动servlet

```xml
<servlet>
	<servlet-name>test</servlet-name>
    <servlet-class>testservlet.ServletDemo</servlet-class>
    <!--整数越小被创建的优先级越高-->
    <load-on-startup>2</load-on-startup>
</servlet>
```



（2）url-pattern配置方式有三种

+ 完全路径匹配：以/开始	eg:/ServletDemo,/aaa/ServletDemo
+ 目录匹配：以/开始，以*结束 eg:/\*,/aaa/\*
+ 扩展名匹配：不能以/开始，以\*开始 eg:\*.do,*.jsp,\*.action开始.

优先级别：完全路径>扩展名>目录



登录5s后跳转其它页面

分析：设置头信息refresh

```java
//针对一个key对应多个value的响应头
addHeader(String name,String value);
addDateHeader(String name,String value);
addIntHeader(String name,String value);

//针对一个key对应一个value的响应头
setHeader(String name,String value);
setDateHeader(String name,String value);
setIntHeader(String name,String value);

demo:Header	xxx:aaa
//追加头信息
addHeader(xxx,bbb); --> xxx:aaa,bbb
//覆盖头信息
setHeader(xxx,bbb); --> xxx:bbb

//5s后刷新
res.setHeader("Refresh","5;url=/test/servletDemo-refresh/index.html");

//前端页面实现倒计时
res.setStatus(302);
res.setHeader("Location","/test/servletDemo/success.html");

//记录网站登陆成功的人数
ServletContext类，可以存取数据，记录多个页面传递的信息;
void setAttribute(String name,Object obj);//用来存取数据
Object getAttribute(String name);//用来获取属性
void removeAttribute(String name);//用来移除属性
```



***ServletContext类：域对象***

作用范围：整个web工程，服务器启动时就会创建这个对象，一个web项目只有一个ServletContext对象。

作用：

+ 获取全局的初始化参数；
+ 获取文件的MIME类型（上传，下载）；
+ <font color="blue">作为域对象存取数据；</font>
+ <font color="blue">用来读取web项目下的文件。</font>

> （1）获取ServletContext对象：在继承Servlet的子类下
> ServletContext this.getServletContext();
>
> （2）获取全局初始化参数
>
> 初始化参数：
>
> ```xml
> <context-param>
> 	<param-name>username</param-name>
>  <param-value>root</param-value>
> </context-param>
> <context-param>
> 	<param-name>password</param-name>
>  <param-value>root</param-value>
> </context-param>
> ```
>
> 读取初始化参数：
>
> ```java
> //获取初始化参数的值，传入username，获取root
> String getInitParameter(String name);
> //获取所有初始化参数的名字:username,password...
> Enumeration getInitParameterNames();
> 
> //利用键值对
> public class Demo extends HttpServlet {
>  private HashMap<String,String> map;
>  public void getInitParams () {
>      ServletContext context = this.getServletContext();
>      Enumeration en = context.getParameterNames();
>      while(en.hasMoreElements()){
>          String name = (String)en.nextElement();
>          String value = context.getInitParameter(name);
>          map.put(name,value);
>      }
>  }
> }
> ```
>
> （3）获取文件的MIME()类型
>
> ```java
> public class Demo extends HttpServlet () {
>  public void getFileType () {
>      String type = this.getServletContext().getMimeType();
>      System.out.println(type);
>  }
> }
> ```
>
> **<font color="red">（4）作为域对象存取数据</font>**
>
> 范围：web项目全局
>
> 创建：服务器启动的时候服务器为每一个web项目创建一个单独的ServletContext对象
>
> 销毁：服务器关闭的时候
>
> ```java
> //通过继承HttpServlet的类
> int count = 0;
> //设置属性
> this.getServletContext.setAttribute("count",count);
> 
> //获取属性
> int count = this.getServletContext.getAttribute("count");
> count++;
> this.setAttribute("count",count);
> ```
>
> （5）读取web工程下的文件
>
> ServletContext的方法：
>
> `String getRealPath("WBE-INF/classes/XXX.XXX");`
>
> `InputStream getResourceAsStream();`
>
> ```java
> class Demo extends HttpServlet {
>     public void test () {
>         ServletContext context = this.getServletContext();
>         //获取绝对路径
>         String realPath = context.getRealPath("WEB-INF/classes/dbco-config.properties");
>     }
>     
>     public void getStream (String path) throws Exception {
>         InputStream is = new FileInputStream(path);
>         String oStr = "";
>         //高级缓冲流Reader里要传实现Reader的流
>         BufferedReader br = new BufferedReader(new FileReader(is));
>         String str = br.readLine();
>         while(str!=null){
>             oStr += str;
>             str = br.readLine();
>         }
>         System.out.println(oStr);
>     }
> }
> ```
>
> 



ServletConfig：用来获取Servlet的配置信息

```java
getSerletConfig();//获取配置的方法
//ServletConfig的方法
String getInitParameter(String name);//获取初始化配置的具体参数值
Enumeration getInitParameterNames();//获取枚举类型的参数对象
ServletContext getServletContext();//获取ServletConfig对象
String getServletName();//获取servlet的名字

//初始化参数的XML
<servlet>
	<init-param>
		<param-name>username</param-name>
		<param-value>chenxiang</param-value>
	</init-param>
</servlet>
```



使用类加载器读取文件（<font color="red">读取文件最好的方法</font>）

没有继承HttpServlet的类获取Src文件夹下（**在WEB-INF/classes文件夹下**）的文件

作用：类的加载器用来加载class文件，将class文件加载到内存

```java
public class Demo extends HttpServlet {
    public void readFile () throws Exception {
        //加载就是class文件存放的路径
        InputStream is = Demo.class.getClassLoader().getResourceAsStream("db.properties");
        //InputStreamReader可以将继承InputStream的类转化为Reader
        BufferedReader br = new BufferedReader(new InputStreamReader(is));
        String str = br.readLine();
        while(str!=null){
            System.out.println(str);
            str = br.readLine();
        }
    }
}
```



### 五、Request和Response

##### 1、需求

​	页面登录成功后，页面跳转到下载的列表页面，点击列表的某些链接，下载文件



##### 2、需求分析

（1）Response对象

​	代表响应对象，从服务器向浏览器输出的内容

> 1、响应行：
>
> `void setStatus(int src);`设置响应行的状态码
>
> 2、响应头：
>
> `void addDataHeader(String name,long date);`根据给定的名字和日期值设置响应头
>
> `void addHeader(String name,String value);`根据给定的键值**添加**响应头（不是覆盖，是增加）
>
> `void addIntHeader(String name,int value);`添加给定名称和int类型的键值
>
> 针对一个key对应多个value的头信息：
>
> `void setDateHeader(String name,long date);`设置时间类型的响应头
>
> `void setHeader(String name,String value);`设置字符串型的响应头
>
> `void setIntHeader(String name,int value);`设置整型类型的响应头
>
> 3、响应体
>
> 利用ServletResponse对象的常用方法
>
> `ServletOutputStream getOutputStream();`获取输出流
>
> `PrintWriter getWriter();`返回一个读取流

（2）文件下载的方式

​	1）超链接下载

​	**直接将文件的路径写到超链接的href中（前提：文件类型，浏览器不支持，如果支持浏览器会直接打开文件，不支持，比如zip格式的文件，直接下载）**

​	2）手动编写代码的方式完成文件的下载

​	设置两个头和一个流：

​	Content-Type：文件的MIME类型

​	Content-Disposition：以下载形式打开文件

​	InputStream：文件的输入流



（3）Request对象

​	1）代表用户的请求对象`ServletRequest`

​	2）对象里包含的方法

> 1、获取请求方式
>
> `String getMethod();`获得请求对象的请求方式，get,post,put等
>
> 2、获取请求的路径
>
> `String getRequestURI();`获取请求对象的URL（/web/...）
>
> `String getRequestURL();`获取请求对象的（http://...）
>
> 3、获得客户机相关的
>
> `String getRemoteAddr();`获取IP地址（比如拦截不允许访问的IP，记录某个IP的访问次数）
>
> `String getContextPath();`获取工程名
>
> 4、获取页面中提交的数据
>
> `String getParameter(String name);`获取某个具体的参数值
>
> `Map getParameterMap();`获取所有请求键值对构成的Map对象
>
> `Enumeration getPatameterNames();`获取所有的参数名
>
> `String[] getParameterValues();`
>
> 5、作为域对象存储数据
>
> `void removeAttributes(String name);`删除请求中的一个属性
>
> `void setAttribute(String name,Object o);`设置请求中的属性
>
> `Object getAttribute(String name);`获取某个属性，没有返回null





##### 3、代码实现

```java
public class Download extends HttpServlet {
    public void doGet (...) throws Exception {
        //中文的解决
        //1.获取文件名
        
        //解决参数中的中文乱码
        String filename = new String(request.getPatameter("filename")).getBytes("ISO-8859-1","UTF-8");
        
        //2.完成文件下载的三步：
        //2.1 设置Content-Type为文件的MIME类型
        String type = this.getServletContext().getMimeType();
        response.setHeader("Content-Type",type);
        
        //2.2 设置Content-Disposition
        response.setHeader("Content-Disposition","attachment;filename="+filename);
        
        //2.3 获取输入流，输出流完成下载
        String realPath = this.getServletContext().getRealPath("/download/"+filename);
        InputStream is = new FileInputStream(realPath);
        
        //根据浏览器的类型选择编码方式
        String agent = request.getHeader("User-Agent");
        if(agent.contains("Firefox")){
            filename = base64EncodeFileName(filename);
        }else{
            filename = URLEncoder.encode(filename,"UTF-8");
        }
        
        OutputStream os = response.getOutputStream();
        byte[] b = new byte[1024];
        int count = is.read(b);
        while(count!=-1){
            os.write(b,0,count);
            count = is.read(b);
        }
        
        //关闭管道
        is.close();
        os.close();
    }
    public static String base64EncodeFileName(String filename){
        BASE64Encoder base64Encoder = new BASE64Encoder();
        try{
            return "?UTF-8?B?"+ new String(base64Encoder.encode(filename.getBytes("UTF-8"))) + "?=";
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    public voud doPost () {}
}
```

html:

```html
<h1>下载页面</h1>
<div>
    <p>a链接下载:</p>
    <a>1.txt</a><br>
	<a>1.jpg</a><br>
	<a>1.zip</a><br>
</div>

<div>
    <p>a手动下载:</p>
    <a href="/dowload?filename=1.txt">1.txt</a><br>
	<a href="/dowload?filename=1.jpg">1.jpg</a><br>
	<a href="/dowload?filename=爱情.zip">1.zip</a><br>
</div>
```

查看浏览器编码格式：

```js
//Edge
document.characterSet;//默认utf-8
document.charset;

//chrome
document.characterSet;//默认UTF-8
document.charset;
```



<font color="blue">response的字符缓冲区的默认编码是ISO-8859-1,编码根本不支持中文</font>

<font color="blue">所以使用字符流中文一定会乱码</font>

解决办法：

设置浏览器默认打开文件的编码

设置字符流缓冲区的编码

```java
public class Demo extends HttpServlet {
    protected void doGet () {
        //设置response字符缓冲区的编码方式
        response.setCharacterEncoding("UTF-8");
        //设置浏览器默认打开的编码方式
        response.setHeader("Content-Type","text/html;charset=utf-8");
        response.getWriter().println("中文");
        
        //第二种:编码简化写法
        resposne.setContentType("text/html;charset=utf-8");
        
        /***同理：
        *response.setStatus(302);
        *response.setHeader("Location","/web/success.html");
        *相当于:
        *response.sendRedirect("/web/success.html");
        **/
        
        response.getWriter().println("中文");
	}
}
```

