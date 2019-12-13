### Tomcat、Servlet

<hr>



##### 1、为何B/S模式越来越流行

C/S模式（Client/Server）：

（1）使用：下载QQ安装包，装到本机，网络收发消息

（2）优点：效果比较酷炫，响应速度比较快，两端分离，系统比较稳定

（3）缺点：装在电脑上的程序不安全，版本升级，维护较难，开发周期比较长，两端分离，服务端和客户端一端更新两端都要更新

B/S模式（Browser/Server）：

（1）使用：浏览器打开网页

（2）优点：**便于维护，便于维护，开发周期较快**

（3）缺点：效果差于本机程序，系统不稳定



##### 2、Socket模拟B/S

浏览器：

```java
public class Browser {
    private Scanner input = new Scanner(System.in);
    //输入url,解析url
    public void parseUrl () {
        System.out.print("URL:");
        //127.0.0.1:8080/index?id=1&sex=male
        String url = input.nextLine();
        int colonIndex = url.indexOf(":");
        int slashIndex = url.indexOf("/");
        int port = url.substring(colonIndex,slashIndex);
        String ip = url.split(":")[0];
        String content = url.split("/")[1];
        this.sendRequest(ip,port,content);
    }
    //创建Socket，将内容发出去
    public void sendRequest (String ip,int port,String content) {
        try{
            //根据ip和port创建一个连接
            Socket socket = new Socket(ip,port);
            //将内容content发出去
            //printWriter可以将一行信息发出去
            PrintWriter out = new PrintWriter(socket.getOutputStream());
            out.println(content);
            out.flush();
            //浏览器等待响应消息
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    private void receive () {
        try{
            InputStreamReader isr = new InputStreamReader(socket.getInputStream());
            BufferedReader br = new BufferedReader(isr); 
            String responseMsg = br.readLine();
            while(responseMsg!=null){
                System.out.println(responseMsg);
                responseMsg = br.readLine();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
```

服务器：

```java
public class Server {
    //接收服务器端消息
    public void startServer () {
        try{
           ServerSocket server = new ServerSocket(8080);
            //需要一个线程，处理多个浏览器的请求
            while(true){
                Socket socket = server.accept();
                ServerHandler sh = new ServerHandler(socket);
                Thread thread = new Thread(sh);
                thread.start();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

public class ServerHandler implements Runnable {
    private Socket socket;
    public Server (Socket socket){
        this.socket = socket;
    }
    public void run () {
        //读取消息
        this.receiveRequest();
        //解析
        //根据解析内容判断
        //响应，返回需要资源
    }
    //读取消息
    private void receiveRequest () {
        String url = "";
        try{
            //流的包装
            InputStream is = socket.getInputStream();
            //字节流转化为字符流,再包装为高级流
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            url = br.readLine();
            parseUrl(url);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    //解析 web/source?id=3&sex=male
    private void parseUrl (String url) {
        if(url==null)return;
        //如果url没有参数，如/web
        String content = null;
        HashMap<String,String> map = null;
        int questionIndex = url.indexOf("?");
        if(questionIndex != -1){
            //资源路径
            content = url.substring(0,questionIndex);
            //参数集合
            map = splitAndSave(url.substring(questionIndex));
        }else{
            content = url;
        }
        //找控制层干活，可能传的参数很多
        HttpRequest request = new HttpRequest(content,map);
        HttpResponse response = new HttpResponse();
        //让ServletController找到对应的控制类执行
        ServletController.findServlet(request,response);
        //返回响应
        this.responseToBrowser(response);
    }
    
    //拆分url存到集合里
    private HashMap<String,String> splitAndSave (String params) {
        //如果携带参数，存到Map里
        HashMap<String,String> map = new HashMap<>();
        if(params.indexOf("&")!=-1){
            String[] paramArrr = params.split("&");
            for(String val : paramArr){
                String[] value = val.split("=");
                map.put(value[0],value[1]);
            }
        }else{
            String[] strArr = params.split("=");
            map.put(strArr[0],strArr[1]);
        }
        return map;
    }
    
    //将最后找到的信息返回出去
    private void responseToBrowser (Response response) {
        try{
            PrintWriter pw = new PrintWriter(socket.getOutputStream());
            pw.println(response.getContent());
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
```

真实处理响应的类：

```java
//index文件夹下的
public class ServletController{
    private static HashMap<String,String> controllerNameMap = new HashMap<>();
    //延时加载模式，如果一开始就根据配置文件将所有工程下的类都加载到集合里，当工程太大会加载半天，浪费性能
    private static HashMap<String,HttpServlet> controllerObjMap = new HashMap<>();
    
    static {
        try{
            //提高性能，不用每次服务器拿到一个请求时都读取文件
            Properties prop = new Properties();
            prop.load("src/web.properties");
            Enumeration en = prop.propertyNames();
            while(en.hasMoreElements()){
                String name = (String)en.nextElement();
                String value = prop.getProperty(name);
                controllerNameMap.put(name,value);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    //找到对应的类干活
   public static void findServlet (HttpRequest request,HttpResponse response) {
        //根据content的内容，查找文件
       String content = request.getContent();
       if(content == null)return;
        try{
            HttpServlet controller = controllerObjMap.get(content);
            if(controller==null){
                //使用反射找到对应的处理类
            	String realControllerName = controllerNameMap.get(content);
            	if(realControllerName!=null){
               		Class clazz = Class.forName(realControllerName);
                	controller = clazz.newInstance();
                    controllerObjMap.put(content,controller);
            	}
            }
            //有对象后
            Class clazz = controller.getClass();
            Method m = clazz.getMethod("service",HttpRequest.class,Response.class);
            m.invoke(controller,request,response);
        }catch(ClassNotFoundException e){
            response.write("requested source is not exist.");
        }catch(NoSuchMethodException e){
            response.write("method is not exist.Please check the spelling.");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
```

定义规则的抽象类：

```java
//以后的所有controller都要重写service方法
public abstract class HttpServlet {
    //public abstract void doGet(HttpRequest request,HttpResponse response);
    //public abstract void doPost(HttpRequest request,HttpResponse response);
    public abstract void service(HttpRequest request,HttpResponse response);
}
```

创建HttpRequest对象：

```java
//请求对象
public class HttpRequest {
    private String content;
    private HashMap<String,String> map;
    public HttpRequest (){}
    public HttpRequest (String content,HashMap<String,String> map) {
        this.content = content;
        this.map = map;
    }
    public String getContent () {
        return this.content;
    }
    public String setContent (String newContent){
        this.content = newContent;
    }
    public Map getMap () {
        return this.map;
    }
    public void setMap (HashMap<String,String> newMap){
        this.map = newMap;
    }
}

//响应对象
class HttpResponse {
    private StringBuilder content = new StringBuilder();
    public void write (String msg){
        //这里不要使用+，底层使用的是concat性能太差(两次循环)
        content.append(msg);
        //让信息换行
        content.append("\n");
    }
    public String getContent (){
        return this.content.toString();
    }
    public void sendRedirect (String path){
        try{
            File file = new File("src/file/" + path);
            BufferedReader br = new BufferedReader(new FileReader(file));
            String str = br.readLine();
            while(str!=null){
                this.content.append(str);
                str = br.readLine();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
```

处理请求的类：

```java
package index;
public class IndexController extends HttpServlet {
    public void service (HttpRequest request,HttpResponse response){
        response.write("hello world...");
    }
}
```

映射关系文件：

> //web.properties文件
>
> index=index.IndexContrller
>
> video=video.Controller
>
> audio=audio.Controller
>
> book=book.Controller

请求与响应流程：

> 1、浏览器发送url字符串
>
> 2、浏览器对字符串进行解析，获取域名和端口
>
> 3、查看浏览器缓存，如果有域名对应IP的映射，直接使用，通过5层协议包裹，将信息发送给服务器，否则找上一级路由器或上一级DNS服务器，直到找到对应域名映射的IP地址，并缓存
>
> 4、服务器（server）会根据配置文件设置一个端口号，开启一个线程负责接收浏览器的请求
>
> 5、服务器接收到请求后将请求交给服务器处理类（ServerHandler）
>
> 6、ServerHandler会将请求的资源名和携带参数进行缓存
>
> 7、ServerHandler创建HttpServletRequest,HttpServletResposne对象，将携带参数用HttpServletRequest保存
>
> 8、ServerHandler根据资源名，让ServerController(只负责根据资源名找到处理的映射类，调用类的处理方法)
>
> 9、类的处理方法（IndexController），会将响应信息写到response对象中
>
> 10、ServerHandler会将写好的信息返回给浏览器
>
> 11、浏览器根据响应的字符串进行解析，展示到窗口

流程图：

![](C:\Users\86180\Desktop\testGit\typoraImg\请求响应流程.jpg)



##### 3、Tomcat容器

web容器（软件）---服务器（硬件）

​	容器放在服务器上的软件，为用户提供服务



开发中常用的web容器：**Tomcat**、**Jetty**、Resin、JBoss、WebLogic、WebSphere



（1）Tomcat是Apache组织的开源免费Web容器

​	用来管理Web项目：Servlet、JSP、HTML+CSS+JavaScript



（2）Tomcat历史及各种版本

+ Tomcat3 JDK1.1 Servlet2.x JSP1.x EL
+ Tomcat5 JDK1.5 Servlet2.x JSP2.x
+ Tomcat6 JDK5 Servlet2.x JSP2.x EL2.x
+ Tomcat7 JDK6 Servlet3.x JSP2.x EL2.x
+ Tomcat8 JDK7
+ Tomcat9 JDK8 Servlet4.0 JSP2.3 EL3.0



（3）了解Tomcat容器的文件夹结构

+ bin：服务器启动相关的配置

+ conf：存储的都是配置文件（web.properties,server.properties,web.xml,server.xml）
  - server.xml：**端口号**，**编码**等信息
  - web.xml：请求与处理类的映射关系等
  
+ lib：jar形式的包

+ log：日志信息

+ temp：临时文件

+ <font color="blue">webapps</font>：用来存放部署在容器中的项目资源的（IDEA认为这个过程很麻烦，所以放进去的是引用路径，减少往服务器写资源的时间）

+ <font color="blue">work</font>：用来存放解析JSP（包含Java代码和HTML）后形成的Java文件

  真实编译在IDEA的工程下：

  C:\Users\86180\.IntelliJIdea2019.1\system\tomcat\Tomcat9_JSPDemo\work\Catalina\localhost\JSPDemo\org\apache\jsp\demo_jsp.java



（4）将Tomcat和IDEA集成在一起，

> 1）Run --> Edit Configrations
>
> 2）左上角+号，添加Tomcat Server，如果没有，证明缺少相关插件（File --> Settings --> Plugins --> Tomcat and TomcatEE integration）
>
> 3）搭建启动环境
>
> ​	1、Run/Debug Configurations/server右边config按钮
>
> ​	2、选择Tomcat的路径，VM Options添加`-Dfile-encoding=UTF-8`
>
> ​	3、在web文件夹下新建lib文件夹，将需要依赖的包导入进去（导入Tomcat下的jsp-api.jar和servlet-api.jar包
>
> ​			在File/Project Structure/libraries点击+号添加web文件夹下的lib文件夹作为库文件）
>
> ​	4、Deployment点击+号添加映射，修改工程名
>
> ​	5、Startup/Connection添加`JAVA_OPTS`和`JAVA_TOOL_OPTIONS`值均为`-Dfile-encoding=UTF-8`
>
> ​	6、根据网上教程添加这两个全局变量
>
> 4）控制台乱码：
>
> ​	1、可能是IDEA配置文件的问题
>
> ​	idea.exe.vmoptions,idea.exe.vmoptions64添加`-Dfile.encoding=UTF-8`
>
> ​	idea.ex.vmoptions,idea.exe.vmoptions64添加`-Dconsole.encoding=UTF-8`
>
> ​	2、IDEA中的`VM options:-Dfile.encoding=UTF-8`
>
> ​	3、IDEA中的`Start up/Connections`下勾选`Pass environment variables`，在`Java_OPTS`添加`-Dfile.encoding=UTF-8`;在`JAVA_TOOL_OPTIONS`添加`-Dfile.encoding=UTF-8`;
>
> 5）创建工程
>
> Deployment中的默认设置的路径就是IDEA的映射路径，可以改为工程名
>
> /webDemo_war_exploded --> /webDemo（相当于是web文件夹下文件资源）



（5）如何在Tomcat中自己编写一个Java类（控制层servlet）

> 1、自己定义一个类
>
> 2、继承Tomcat提供的一个规则HttpServlet
>
> 3、重写一个方法service，有参数，没有返回值
>
> 4、方法内部有两个参数HttpServletReuqest，HttpServletResponse
>
> 5、方法抛出两个异常：ServletException，IOException
>
> 6、<font color="blue">填写XML配置文件(是为了写一个请求的关系与真实类名对应的关系)</font>
>
> ```xml
> <servlet>
> 	<servlet-name>IndexContoller</servlet-name>
> 	<servlet-class>controller.IndexController</servlet-class>
> </servlet>
> <servlet-mapping>
>     <servlet-name>IndexContoller</servlet-name>
>     <!--这个路径是直接拼接在工程下的
> 	比如当前工程名为Demo.
> 	/Demo请求的是web目录下的资源（默认给index开头的文件）
> 	我们配置的/index会拼接在项目名后
> 	它是用来找controller.IndexController类的
> -->
>     <url-pattern>/index</url-pattern>
> </servlet-mapping>
> ```



（6）URL请求的含义

+ /index.html请求资源

+ /index调用映射类操作资源

流程图：

![](C:\Users\86180\Desktop\testGit\typoraImg\Tomcat请求响应流程.jpg)

Tomcat将流写到了Resposne对象中



##### 4、Servlet

###### （1）Servlet类对象

​	里面的方法执行完毕最终的结果，结果是String，可根据不同参数，执行的逻辑不一样，动态信息

###### （2）如何访问一个Servlet对象

> 1、自己写一个类Controller（Servlet、Action）
>
> 2、继承一个父类HttpServlet
>
> 3、重写Service方法（doGet、doPost）
>
> 4、方法里有两个参数（`HttpServletRequest`、`HttpServletResponse`），两个异常（`ServletException`、`IOException`）
>
> 5、需要告知Tomcat有一个自己定义的类需要管理（配置web.xml，形成映射关系）

小知识点：

**发送请求的时候，如果只写工程名，不写资源名？**

**答：**Tomcat需要参考web.xml的文件，有两个web.xml文件（WEB-INF和Tomcat下的conf文件夹），先根据WEB-INF下的web.xml，然后找不到根据默认的Tomcat下的conf文件夹中的web.xml。



###### （3）IDEA和Tomcat目录结构的映射关系

> 1、在IDEA中创建的web项目，执行需要Tomcat帮我们管理，需要将项目部署在Tomcat内（webapps文件夹下），部署的过程中读写会耗费很多时间，IDEA认为耗费时间，默认做了一个映射关系
>
> 2、修改项目部署路径到Tomcat容器以后，我们发现src文件夹没有了，因为Tomcat认为.java的文件没有用，所以将Java文件都编译为classes文件然后统一保存到了WEB-INF文件夹下的classes文件夹下
>
> 3、所以我们使用外部jar包，放在web文件夹以外是找不到的，所以需要将项目依赖部署到web文件夹下
>
> 4、在WEB-INF下创建lib文件夹，然后将mysql的jar包导入，并在项目中添加



银行管理系统

工具类获取对象

```java
public class MySpring {
    private static HashMap<String,Object> beanMap = new HashMap<>();
    public static <T>T getBean (String className) {
        T obj = beanMap.get(className);
        if(obj==null){
            try{
                Class clazz = Class.forName(className);
                obj = (T)clazz.newInstance();
                beanMap.put(className,obj);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return obj;
    }
}
```



###### （4）两种不同请求的区别：

get：get只有协议头，没有协议体，只能将参数拼接在url里面

post：协议头请求资源，协议体携带信息

get请求的处理的方式：

Tomcat的默认处理字符集配置在web.xml中，如果版本较老，要更改字符集为UTF-8

```xml
<filter>
        <filter-name>setCharacterEncodingFilter</filter-name>
        <filter-class>org.apache.catalina.filters.SetCharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <!--这就是Tomcat的默认对请求的编码字符集-->
            <param-value>UTF-8</param-value>
        </init-param>
        <async-supported>true</async-supported>
    </filter>
```







<font color="blue">post请求的处理方式：</font>

发送请求的时候，请求名字在协议头中，请求的参数信息在协议体中（协议体中只能传字节），控制层接收的时候，request对象是按照平台的默认字符集组成String的（电脑的默认字符集，Windows是GBK）

```java
//告诉request用我们指定的字符集进行组合
//Tomcat8之后版本可以不处理
request.setCharacterEncoding("UTF-8");

//Tomcat7及之前版本
String username = request.getParameter("username");
byte[] b = username.getBytes("ISO-8859-1");
String name = new String(b,"UTF-8");
```



Tomcat银行系统完整流程图

![](C:\Users\86180\Desktop\testGit\typoraImg\请求响应的流程--很重要.jpg)



###### （5）Servlet本质管理机制

```java
public class Demo extends HttpServlet {
    private int count = 1;
    public void service (... req,... res) throws ... {
        PrintWriter pw = res.getWriter();
        pw.write("count:"+count++);
        //发现每次访问都会自增，说明属性唯一，类的对象是单例的
    }
}
```

1）Servlet类的对象是单例模式的（对象是唯一的）

单例模式：饿汉式，懒汉式

生命周期托管方式实现：利用一个请求资源名与对象的映射关系，如果服务器关闭，才会消亡。



Tomcat到底是立即加载控制层类对象，还是延迟加载类对象？

​	1）Tomcat启动的时候，web.xml文件写错了，服务器会报错，说明启动的时候就会读取web.xml文件

​	2）Tomcat为了更好的管理对象的产生和销毁提供了三个方法init(),service(),destroy()

```java
public class Demo extends HttpServlet {
    public void init () {
        System.out.println("对象创建了");
    }
    public void service () {
        System.out.println("对象方法执行了");
    }
    public void destroy () {
        System.out.println("对象销毁了");
    }
    //启动Tomcat的时候我们发现init方法没有执行，说明是延时加载的
}
```

​	3）Tomcat什么时候销毁对象

​	7以前版本xml文件修改的时候就销毁了；7以后版本，重新部署项目以后销毁



​	4）将Tomcat加载对象方式改为立即加载

```xml
<servlet>
	<servlet-name>test</servlet-name>
    <servlet-class>test.TestController</servlet-class>
    
    <!--初始化参数-->
    <init-param>
    	<param-name>key1</param-name>
        <param-value>value1</param-value>
    </init-param>
    <!--写一个整数，越小越先加载，通常用来加载一些重要信息-->
    <load-on-startup>0</load-on-startup>
</servlet>

<servlet-mapping>
	<servlet-name>test</servlet-name>
    <url-pattern>/test</url-pattern>
</servlet-mapping>
```



Servlet的方法：

```java
public class Demo extends HttpServelt {
    public void init () {}
    public void init (ServletConfig config){
        String value = config.getInitParameter("key1");//value1
        Enumeration en = config.getInitParameterNames();
        while(en.hasMoreElements()){
            String key = (String)en.nextElement();
            String value = config.getInitParameter(key);
            System.out.println(key+"--"+value);
        }
    }
} 

//ServletConfig的常用的方法
String getInitParameter(String key);//获取初始化参数的值
Enumeration getInitParameterNames();//获取初始化参数值的枚举
String getServletName();//获取当前Servlet类的名字
ServletContext getServletContext();//获取全局上下文对象，用来获取其它Servlet的信息
```



Servlet类的继承关系：

​	1）我们的Servlet类继承了HttpServlet抽象类

​	2）HttpServlet继承了GenericServlet抽象类

​	3）GenericServlet又实现了三个接口（缺省适配器模式）：Servlet,ServletConfig,Serializable（只是允许生成序列化文件）

```java
public interface Servlet {
    void init(ServletConfig var1) throws ServletException;

    ServletConfig getServletConfig();

    void service(ServletRequest var1, ServletResponse var2) throws ServletException, IOException;
	
    String getServletInfo();

    void destroy();
}

public interface ServletConfig {
    String getServletName();

    ServletContext getServletContext();

    String getInitParameter(String var1);

    Enumeration<String> getInitParameterNames();
}
```



HttpServlet抽象类的作用：

具体化，与协议有关的属性，都与协议有关

添加了很多具体请求的方法：doGet,doPost,doDelete...

添加了自己独有的方法：getLastModifier...

保留了service方法，将这个方法具体实现了，方法内部将ServletRequest，ServletResponse强制转换为HTTP协议的请求和响应

添加一个独有的service方法（protected修饰），最终真正执行的那个



总结：

Servlet对象管理机制

Servlet对象是单例的，延迟加载的，用生命周期托管的方式实现单例模式

有3个方法可以看出生命周期：init()对象创建的时候执行,service()对象每次使用时执行,destroy()服务器关闭时销毁对象



##### 5、JSP了解

没有JSP之前接收请求信息，找寻对应业务层处理逻辑，负责拼接响应的信息的过程太麻烦，所以我们使用JSP用来拼串（将Java代码和String一起拼接起来）

JSP：Java Server Page Java服务器页面



JSP与JS区别：

+ JS：基于对象和事件驱动的页面脚本语言

+ JSP：融合了HTML，Javascript，CSS，Java --> JSP，并有自己标签



JSP使用

1）浏览器只能识别HTML代码，虚拟机只能识别Java代码，JSP让Tomcat编译，最后还是浏览器展示

2）如何创建使用JSP文件	

```jsp
<!--头标签，通常包含Content-Type和language-->
<% @page Content-Type="text/html;charset=UTF-8" language="Java" pageEncoding="UTF-8"%>
<!--
	1、Content-Type：用来说明当前JSP里面拼接好的响应信息浏览器该如何解析
	2、language：用来说明当前JSP中可以包含的语言
	3、pageEncoding="UTF-8"：告知Tomcat以这种字符集进行编译jsp文件，不写会根据Content-Type中的字符集进行编译
	4、Content-Type必须写，另外的可以不用写，因为JSP只能包含Java语言，默认字符集也会根据Content-Type中的字符集编译
-->

<html>
    <body>
        <%
        String str = "chen";
        %>
    </body>
</html>
```



JSP实际上是一个操作资源（JSP本质是Servlet）

```jsp
<% Content-Type="text/html" language="java"%>
<html>
    <body>
        <% String username = request.getParameter("username");%>
        <h1>
            ******************************
            欢迎<%= username%>登录飞鸿系统
            ******************************
        </h1>
    </body>
</html>
```

Controller中：

```java
public class IndexController extends HttpServlet {
    public void doPost (.. req,.. res) {
       String msg = new AtmService().login(req.getParameter("name"),req.getParameter("password"));
        if(msg.equals("success")){
            RquestDispatcher rd = req.getRequestDispatcher("welcome.jsp");
            rd.forward(request,response);
        }else{          
            req.getRequestDispatcher("failure.html").forward(req,res);
        }
    }
}
```



##### 6、JSP编译原理

> 1、浏览器发送/login请求
>
> 2、Tomcat的Handler将请求进行解析并创建req和res对象
>
> 3、将解析后的参数保存在request对象中，以及操作资源的方法写在response中，并将资源名（login）交给ServletController
>
> 4、ServletController根据web.xml文件找到对应的处理类
>
> 5、LoginController执行业务逻辑，根据请求给与响应（比如返回的是jsp资源，先告知要找的jsp文件，Tomcat找到jsp文件）
>
> 6、找到的JSP文件会通过JspServlet类进行处理，编译成为了Java文件，交给JVM编译成class文件，最后计算机执行指令，完成操作资源
>
> 文件路径：C:\Users\86180\\.IntelliJIdea2019.1\system\tomcat\Unnamed_webServletDemo\work\Catalina\localhost\web\org\apache\jsp



编译原理图：

![](C:\Users\86180\Desktop\testGit\typoraImg\请求过程和JSP编译原理.jpg)



JSP本质上就是Servlet，从请求的配置文件和真正生成的类XXX_jsp.java中可以看出，JSP因为操作读写,字符串拼接太多，所以较慢



JSP含有的标签作用：

```jsp
<%@ %> 说明性的标记，通常会放在文件的顶部（最后不放在最后的html里，而是获取键值对，设置ContentType等属性）
<%! %> 包含普通的Java代码 _jspService方法外部（可以定义属性和方法，但是无法使用Request和Response对象）
<% %>  包含普通的Java代码，_jspService方法内部
<%= %> 可以包含Java代码，_jspService方法内部 通常用来赋值
```

使用demo：

```jsp
<%@page contentType="text/html;charset=UTF-8"%>
<%!
    private String name = "chen";
	public void test () {
        System.out.println("hello jsp");
    }
%>
<!--会将这些属性和方法定义到_jspService方法外部，无法使用request和response对象-->
```



##### 7、JSP的9大内置对象

**1）HttpServletRequest	request**

​	常用方法：

> 1、用来获取请求携带的参数信息
>
> `String req.getPatameter("key") `
>
> 2、用来设置接收请求参数的编码字符集
>
> `req.setCharacterEncoding("UTF-8")`
>
> 3、用来存储一个值，从另外一个地方中获取一个值
>
> `req.setAttribute("key",Object)`
>
> 4、从另外一个地方获取之前设置的值
>
> `Object req.getAttribute("key")`
>
> 5、获取设置转发的资源位置
>
> `RequestDispatcher req.getRequestDispatcher("filename") `
>
> 6、真正转发的方法
>
> `rd.forward(req,res)`
>
> 7、获取所有的键名
>
> `Enumeration req.getParameterNames()`
>
> 8、获取同一个键名的所有值，通常用作复选框
>
> ```jsp
> <input type="checkbox" name="hobby" value="smoke">smoke
> <input type="checkbox" name="hobby" value="drink">drink
> <input type="checkbox" name="hobby" value="barber">barber
> 
> <%
> 	String[] values = req.getParameterValues("hobby");
> %>
> ```
>
> 9、获取URL（uniform resource locator统一资源定位器），获取的是全路径
>
> 导包在`<%@page import="java.lang,java.util"%>`
>
> `StringBuffer url = req.getRequestURL()`
>
> 结果：`http://ip:port/web/index.html`
>
> 10、获取URI（uniform resource identifier统一资源标识符）
>
> `String uri =  req.getRequestURI()` 
>
> 结果：`/web/index.html`
>
> 11、获取协议头的信息
>
> `String req.getHeader("Host")`
>
> 12、获取请求头的所有信息
>
> `Enumeration req.getHeaderNames()`
>
> 13、获取session对象
>
> `HttpSession req.getSession()`
>
> 14、获取Cookie
>
> `Cookie[] req.getCookies()`



实现切换国际化版本（Internationalization）

```jsp
<%@page contentType="text/html;charset=UTF-8"%>
<html>
    <body>
    <%
      //获取语言  
      String[] langs = req.getHeader("Accept-Language").split(",");
      String[] lang = langs[0].split(";");
     //第一种获取文件的方式:java和web工程都支持
     InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("font("+ lang[0] +").properties");
      InputStreamReader isr = new InputStreamReader(is);
      Properties pro = new Properties();
      pro.load(isr);
      String account = pro.getProperty("account");
      String password = pro.getProperty("password");
      
        
     //第二种获取文件的方式:仅在web工程使用
  this.getClass().getResourceAsStream("font.properties");
   %>
        <form>
           <%= account %>:<input type="text">
           <%= password %>:<input type="text">
        </form>
    </body>
</html>
```

font.properties（放置在src文件夹下）

```java
font(zh-CN).properties:
account=账号
password=密码

font(en).properties:
account=account
password=password
```



**2）HttpServletResponse	response**

>1、获取流
>
>`PrintWriter res.getWriter();`
>
>2、获取状态码
>
>`int res.getStatus();`
>
>3、设置状态码
>
>`res.setStatus();`
>
>4、添加cookie
>
>Cookie是在客户端存储的一个记录，session是存在服务器端的一个记录
>
>创建Cookie：`new Cookie("key","value");`
>
>`res.addCookie();`
>
>5、请求重定向
>
>`res.sendRedirect("path");`



浏览器常见状态码（由服务器发送的）：

404：没有找到资源

405：没有找到可执行的方法

500：服务器异常



请求重定向和转发的区别：

```java
public class Demo extends HttpServlet {
    public void doGet (... req,... res) {
        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req,res);
        res.sendRedirect("path");
    }
}
```



转发jsp操作资源过程：

一次请求

浏览器发送请求/index，服务器解析请求，生成request,resposne对象，根据xml配置文件找到处理的类IndexConctroller，IndexController利用request的RequestDispatcher对象告知服务器请求的demo.jsp资源，服务器找到对应的demo.jsp资源，通过forward方法将reqeust,response对象给到JSPServlet,JSPServlet将jsp文件解析成demo_jsp.java，最后将响应信息写回到浏览器



重定向过程：

两次请求

浏览器发送请求/index，服务器解析请求，找到IndexController，IndexController发送重定向的资源名(demo.jsp)给浏览器，浏览器重新发送请求/index/index.jsp的请求，获得文件，所以重定向是没有原来request，response对象的



<font color="blue">转发和重定向的区别：</font>

+ 转发是一次请求，重定向是两次请求，第二次请求的request和response发生改变；

+ 转发的URL不会改变，重定向浏览器的URL会发生改变；

+ 转发是request对象的方法，重定向是response对象的方法
+ 转发只能在当前服务器工程的内部；重定向可以发给新服务器或新的工程



**3）HttpSession	session**

多次请求，一次会话，session会话

session的常用方法：

> 1、设置属性
>
> `session.setAttribute("key",Object)`
>
> 2、获取属性
>
> `Object session.getAttribute("key")`
>
> 3、获取所有属性名
>
> `Enumeration session.getAttributeNames()`
>
> 4、删除属性
>
> `session.removeAttribute("key")`
>
> 5、获取session
>
> `HttpSession request.getSession()`
>
> 6、设置session的最大活跃时间（单位秒）
>
> `session.setMaxInactiveInterval(int second)`
>
> 7、设置session对象失效（消除session）
>
> `session.invalidate()`
>
> 8、获取session的ID
>
> `String session.getId()`



demo:

```jsp
<!--index.jsp-->
<%
	request.setCharacterEncoding("UTF-8");
	String test = request.getParameter("test");
	request.setAttribute("test",test);
	session.setAttribute("test",test);
%>

<!--index2.jsp-->
<%
	String test = (String)request.getAttibute("test");
	String test2 = (String)session.getAttribute("test");
%>

<!--无法显示-->
<%= test%>
<!--可以显示-->
<%= test2%>
```



<font color="blue">注意：session针对每一个用户都是不一样的，因为是不同的线程产生的session，当多次请求都需要使用的属性存进去</font>

session不安全，要设置失效时间和sessionID

session最大的不活跃时间，默认1800秒（30分钟），一般配合filter设置为3分钟，3分钟不活跃要求用户重新登录



**4）ServletContext	application**

全局上下文对象，所有的用户都可以访问，很不安全，用来保存公有的属性

ServletContext的方法：

> 1、获取ServletContext
>
> `ServletContext context = req.getServletContext()`
>
> 2、设置属性
>
> `context.setAttribute("key",Object);`
>
> 3、获取属性
>
> `Object context.getAttribute("key")`
>
> 4、删除属性
>
> `context.removeAttribute()`
>
> 5、获取所有键名
>
> `Enumeration context.getAttributeNames()`
>
> 6、获取初始化参数
>
> `context.getInitParameter("name")`
>
> Tomcat启动的时候就会获取产生全局对象
>
> ```xml
> <context-param>
> 	<param-name>name</param-name>
>     <param-value>chenxiang</param-value>
> </context-param>
> ```
>
> 也可以使用`context.getRequestDispatcher().forward()`
>
> 7、获取文件部署的路径
>
> `String realPath = context.getRealPath("/")`



5）ServletConfig	config

作用是加载一些我们需要初始化的参数

方法：

> 1、获取初始化参数值
>
> `String value = config.getInitParameter("key");`
>
> 2、获取所有初始化参数键名
>
> `Enumeration en = config.getInitParameterNames();`
>
> 3、获取类名
>
> `String name = config.getServletName();`
>
> 4、获取全局上下文对象
>
> `ServletContext application = config.getServletContext();`



6）PageContext	pageContext

7）JSPWriter	out

8）Object	page

9）Exception

```jsp
error.jsp
<!--设置isErrorPage="true"才会胜场异常-->
<%page contentType="text/html;charset=UTF-8" isErroPage="true"%>
<html>
    <body>
        哎呀，出异常啦啦啦啦啦。。。
    </body>
</html>

otehr.jsp
在其他页面头部添加
<%page erroPage="error.jsp" contentType="text/html;charset=UTF-8"%>

<!--web.xml-->
<error-page>
        <error-code>500</error-code>
        <location>/error.jsp</location>
</error-page>
```



获取请求头的玩法：

```java
public class Demo {
    public static void main (String[] args){
        try{
            ServerSocket server = new ServerSocket(9992);
            Socket socket = server.accept();
            InputStreamReader isr = new InputStreamReader(socket.getInputStream());
            BufferedReader br = new BufferedReader(isr);
            String value = br.readLine();
            while(value != null && "" != value){
                System.out.println(value);
                value = br.readLine();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
/**
输出：
GET / HTTP/1.1
Host: localhost:9992
Connection: keep-alive
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.87 Safari/537.36
Sec-Fetch-Mode: navigate
Sec-Fetch-User: ?1
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3
Sec-Fetch-Site: none
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN,zh;q=0.9,en;q=0.8
Cookie: Idea-e2a89403=9a09c65a-b1e9-46b0-8c9c-c35970848d9c
**/
```



##### 8、JSP的标签

JSP组成：Java服务页面、HTML、Java



（1）JSP指令标签（放在文件顶部）：

```jsp
<%@ xxx %>放在JSP头部，做说明性质的描述

<%@ page%> 包含请求头信息等
1、contentType 告知浏览器对字节流的解析规则(UTF-8)
2、pageEncoding 告知JSPServlet遵循字符规则（Tomcat9默认以UTF-8解析）
3、import 导包
4、isErrorPage 设置当前jsp作为异常页（只有设置了才会创建Java时内置Exception对象）
5、Tomcat先按照pageEncoding,没有设置找contentType，也没有，找Tomcat下的server.xml中设置的默认字符集解析，8，9，8是默认UTF-8，老版本是ISO-8859-1

<%@ taglib%> JSTL(JSP standard tag library)
uri="http://java.sun.com/jsp/jstl/core"	
prefix="c"

<%@ include file="demo.html"%> 在JSP引入已经写好的资源(资源类型：.jsp .html)
引入一个jsp资源，没有任何问题
引入html资源会出现中文乱码的问题
原因：因为html是直接导入的，Tomcat不会编译，会按照英文的默认字符集编译
解决：在web.xml中配置
<jsp-config>
	<jsp-property-group>
        <description>HTMLConfig</description>
        <display-name>HTMLConfig</display-name>
        <url-pattern>*.html</url-pattern>
        <el-ignored>false</el-ignored>
        <page-encoding>UTF-8</page-encoding>
        <!--使脚本无效，一般不会设置失效-->
        <scripting-invalid>false</scripting-invalid>
    </jsp-property-group>   
</jsp-config>
```



（2）JSP代码标签：

```jsp
<%!		%> xxx_jsp.java的service方法外部
<%		%> xxx_jsp.java的service方法内部
<%=		%> 输出值
```



（3）JSP动作标签：

用来替代JSP中Java创建对象和对象赋值、取值、转发

技术发展：

1、ModelOne：只有Servlet（拼接相应信息太麻烦）	VC+M

2、技术革新ModelTwo模式：JSP+Servlet	V+C

3、JSP2.0技术出现以后，替代对象的创建、赋值、请求转发（运行性能不好）

4、新的模板语言诞生

不常用的模板语言：

```jsp
<jsp:useBean id="atm" class="domain.Atm" scope="request"></jsp:useBean>
<!--等价于-->
<% 
	Atm atm = (Atm)request.getAttribute("atm");
	if(atm == null){
		Class clazz = Class.forName("domain.Atm");
        Atm atm = (Atm)clazz.newInstance();
        request.setAttribute("atm",atm);
	}
%>

<!--设置属性-->
	<jsp:setProperty name="atm" property="username" param="username"></jsp:setProperty>
	<jsp:setProperty name="password" property="password" param="password"></jsp:setProperty>
	<jsp:setProperty name="balance" property="balance" param="balance"></jsp:setProperty>
    <jsp:forward page="doRegister">
    	<jsp:param name="fname" value="chen"></jsp:param>
        <jsp:param name="lname" value="xiang"></jsp:param>
    </jsp:forward>
```



总结：

JSP三个指令标签：`<%@page%>`,`<%taglib>`,`<%@include%>`

JSP六个动作标签：`<jsp:>`,`useBean,setProperty,getProperty,forward,param,include`

JSP四个作用域：`pageContext,request,session,apllication`

JSP九个内置对象：`request,response,session,application,out,page,pageContext,config,exception`



购物小系统

功能分析：

> 1、需要用户登录、注册
>
> 2、欢迎页，欢迎用户登录购物系统
>
> 3、用户选择购买商品种类
>
> 4、继续购物-->再次看到商品种类的选择
>
> 5、结算（列出购买商品的清单，实现可以展示个数的功能，并列出商品的总价格）

需求分析：

> 1、用户表格：账号，密码，账户余额
>
> 2、商品种类：种类编号，种类名字
>
> 3、商品表格：商品编号，名字，价钱，种类编号（外键）



1）创建数据库

```mysq
create database shopping_mall;
user shopping_mall;
#设置用户表格
create table user (
	username varchar(40),
	password varchar(20),
	balance double
)character set utf8;
alter table user add primary key(username);
insert int user values("minmin","1994"),("chen","123");

#设置商品种类表格
create table category (
	c_id int(4),
	c_name varchar(80)
)character set utf8;
#设置主键约束
alter table category primary key(c_id);
insert into category values(1,"food"),(2,"book"),(3,"clothes");

#创建商品表格
create table good (
	g_id int(4),
	g_name varchar(20),
	g_price double(10,2),
	g_categoey int(4)
)character set utf8;
#添加主键约束
alter table good add primary key(g_id);
#添加外键约束
alter table good add constraint fk_category_good foreign key(g_category) references category(c_id);
#添加商品数据
insert into good values(1,"热干面",4.00,1),(2,"豆皮",3.00,1),(3,"花甲粉",12.00,1),(4,"汤粉",3.00,1);
insert into good values(5,"javaWeb",32.50,2),(6,"javascript",23,2),
(7,"python",50.0,2),(8,"c",92.00,2);
insert into good values(9,"T-shirt",45,3),(10,"coat",120,3),
(11,"jackiet",2000,3),(12,"sockets",20,3);
```



2）创建web工程



##### 9、EL表达式语言

expression language：表达式语言EL

+ EL就是为了解决JSP的问题，两种语言风格不统一，颜色不一致

+ EL的功能，代替Java取值的过程
+ 能处理一些简单的计算（算数、逻辑、比较）
+ 调用方法（不长用）



语法结构：

```jsp
${name}获取域对象的值,四个作用域挨个遍历性能不高
${pageScope.name}
${requestScope.name}
${sessionScope.name}
${applicationScope}

${pageScope.user.getName()}
${pageScope.user.name}注意属性必须有getter和setter
```



EL的作用域对象

> 1、`${param.xxx}`获取请求键名的参数
>
> 2、`${paramValues.xxx}`获取请求的值的数组
>
> 3、`${requestScope.xxx}`获取request对象中存的值，使用的是getAttribute()方法
>
> 4、`${sessionScope.xxx}`获取session对象中存的值
>
> 5、`${applicationScope.xxx}`获取ServletContext中存的值
>
> 6、`${pageScope.xxx}`获取pageContext中存的值
>
> 7、获取初始化参数
>
> `${initParam}`获取初始化参数
>
> `${header[accept-language]}`获取协议头
>
> `${cookie}`获取cookie
>
> 8、简单运算
>
> `${requestScope.price + 100}`
>
> `${requestScope.price >= 100}`
>
> `>=ge >gt <lt <=le ==eq !=ne`  



原理：

底层通过反射技术，获取对应的getXXX方法执行，获得属性，所以没有get方法会报错





JSTL功能（标准标签库）

+ 控制流程

+ 处理字符串

+ 格式化

  JavaServerPage Standard Tag Library	JSP标准标签库

  jstl1.2



需要引入两个外部的jar包：jstl.jar	standard.jar

大体上提供3个包：核心（流程控制）、函数（处理String）、SQL



JSTL标签：

```jsp
<%page contentType="text/html;charset=UTF-8"%>
<%taglib uri="http://java.sun..com/jsp/jstl/core" prefix="c">
<!--导入JSTL包，告诉JSP标签可用-->
<html>
	<body>
		<!--输出-->
        <c:out value="hello world"></c:out>
        
        <!--满足条件就显示-->
        <c:if test="${requestScope.value > 1}"></c:if>
        
        <!--分支语句-->
        <c:choose>
        	<c:when test="${requestScope.value < 4}">one</c:when>
        	<c:when test="requestScope.value < 8">two</c:when>
        	<c:when test="requestScope.value < 12">three</c:when>
        	<c:otherwise>default</c:otherwise>
        </c:choose>
        
        <!--循环语句，注意varStatus是个对象（方法内部类），end是可以取到的-->
        <c:forEach begin="0" end="5" step="1" varStatus="i">${i.index}</c:forEach>
        
        <!--增强for循环-->
        <c:forEach var="user" items="${requestScope.userList}">
        	${user.username}:${user.password}
        </c:forEach>
        
        <!--字符串拆分-->
        <c:forTokens items="a-b-c" delims="-" var="value">${value}</c:forTokens>
        
        <!--函数和格式化标签：String类常用的方法-->
        <@ taglib uri="http://java.sun..com/jsp/jstl/functions" prefix="fn" >
        ${fn:字符串方法（字符串...）}
		${fn:length(requestScope.strValue)}

		<!--格式化标签-->
        <%@ taglib uri="http://java.sun..com/jsp/jstl/fmt" prefix="fmt"%>
		<fmt:formatDate value="${requestScope.date}" pattern="yy-MM-dd hh:mm:ss">
    </body>
</html>
```



