### 线程、Ajax和JSON

<hr>



#### 1、ThreadLocal

（1）将所有的资源部署在服务器上（war包）

（2）启动Tomcat，带着这些资源一起运行

（3）浏览器发送请求，Tomcat解析请求，参考配置文件寻找资源



#### 2、ThreadLocal应用

```java
//一般各个层次没有顶层对象用来传值，只有视图层有三个域用来传值给jsp，目的是隔着层次获取值
public void login(String username,String password) {
    
}
```

> ThreadLocal是Java提供的一个类
>
> 提供的方法：
>
> （1）`void set(Object value)`将我们的值保存到当前线程中
>
> ```java
> public void set(T value){
>     //获取当前线程
>     Thread t = Thread.currentThread();
>     //Java会给每个线程分配一个Map，key就是当前线程地址
>     //是ThreadLocal的内部类
>     ThreadLocalMap map = getMap(t);
>     if(map != null){
>         //将值保存到当前线程中
>         map.set(this,value);
>     }else
>         createMap(t,value);
> }
> ```
>
> （2）`Object get()`获取我们在当前线程中传的值
>
> 类比session：
>
> 1、通过JSESSIONID找到一个session对象
>
> 2、通过session对象的setAttribute方法将信息存储起来
>
> 3、在通过session对象getAttribute方法取值
>
> Tomcat底层：
>
> ```java
> SessionManager {
>     //用户第一次访问回直接分配一个JSESSIONID，延迟加载方式实现
>     private Map<JSESSIONID,HttpSession> sessionMap;
>     public HttpSession getSession (String JSESSIONID){
>         return sessionMap.get(JSESSIONID);
>     }
> }
> 
> HttpSession {
>     private Map<String,Object> attributeMap;
>     public Object getAttribute (String key) {
>         return attributeMap.get(key);
>     }
>     public void setAttribute (String key,String value) {
>         attributeMap.put(key,value);
>     }
> }
> ```
>
> 



手写一个ThreadLocal的管理类，展示具体使用

```java
public class ThreadLocalManager {
    private static Map<String,Object> managerMap = new HashMap<>();
    
    public static Object getThreadLocal (String username){
        ThreadLocal local = managerMap.get(username);
        if(local == null){
            local = new ThreadLocal();
            managerMap.put(username,local);
        }
        return local;
    } 
}

public boolean LoginService {
    public String Login (String username,String password) {
        User user = dao.selectOne(username);
        if(user != null && user.getPassword() == password){
            ThrealLocal local = ThreadLocalManager.getThreadLocal(user.getUsername();
            local.set(user);
            return "登录成功";  
        }
        return "登录失败";
    }
}

public class LoginServlet extends HttpServlet {
    private LoginService service = new LoginService();
    public void doGet (...request,...response){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(service.login(username,password)){
           ThreadLocal local = ThreadLocalManager.getThreadLocal(username);
           User user = (User)local.get();
               request.getRequestDispathcer("welcome.jsp").forward(request,response);
        }else{
             request.getRequestDispathcer("login.jsp").forward(request,response);
        }
    }
}                                                                 
```



#### 3、WEB3.0注解

web容器给我们提供了很多组件



web框架发展：

（1）web.xml文件的配置过于多，不同的开发者对应的配置太多

（2）于是出现了web框架，SpringMVC（web框架），SpringBoot（框架集合），用于减少配置文件的

（3）服务容器于是更新版本，提供这些功能，WEB3.0，注解为了替代web.xml的配置



使用注解的方式配置servlet类

```java
//类的配置信息
@WebServlet(
    //描述类的信息,相当于注释
    description = "",
    //配置请求
    urlPatterns={"/test","/login"},
    //支持ajax异步操作，默认支持
    asyncSupported = true,
    //配置有限加载
    loadOnStartUp=0,
    //配置初始化参数
    initParams={
        @WebInitParam(name="minmin",value=18),
    	@WebInitParam(name="lisi",value=28)
    }
)
//Filter的配置信息

public class TestController {
    public void doGet(res,req){
        System.out.println("excution successfully.");
    }
}
```



使用注解方式配置Filter类

使用与servlet的配置基本一样

```java
@WebFilter(
	urlPatterns={"/test","/login"},
    initParams={
        @WebInitParam={name="key",value="value"}
    }
)
public class RequestFilter extends HttpFilter {
    public void doFilter(req,res,FilterChain chain){
        chain.doFilter(req,res);
    }
}
```



使用注解方式配置Listenner类

```java
@WebListener
public class RequestFilter implements ServletReqeustListener {
    public void requestDestroyed(ServletRequestEvent sre){
        System.out.println("request对象创建了");
    }
    
    public void requestInitialized(ServletRequestEvent sre){
        System.out.println("request对象销毁了");
    }
}
```



#### 4、Ajax

ajax: asychronous javascript and xml



##### （1）Ajax联动





#### 5、JSON

JSP拼接性能太差，需要编译生成demo_jsp.java文件，这是性能很慢的，所以出现了JSON格式

JSON：JavaScript Object Notation JavaScript对象引用



利用JSON格式传输信息

导入fastjson的jar包

```java
public class SelectAreaById extends HttpServlet {
    public void doGet (req,res){
        //省略根据城市id获取一个Area对象的集合
        Integer cityId = Integer.parseInt(req.getParameter("cid"));
        ArrayList<Area> areaList = new Dao().selectAllArea(cityId);
        JSONObject jsonObj = new JSONObject();
        //交给fastjson处理集合
        jsonObj.put("areaList",areaList);
        //设置返回信息的UTF-8字节数组
        res.setCharacterEncoding("UTF-8");
        //通过toJSONString方法将集合变为字符串
        res.getWriter().write(jsonObject.toJSONString());
        /*格式
        */
    }
}
```



注意Map的处理

```js
//对象，数组，集合可以直接使用，返回字符串中有Map要单独处理
var jsonObject = JSON.parse(this.responseText);
var map = jsonObject.xxx;//获取Map
var keys = Object.keys(map);
var values = Object.values(map);
for(let i = 0; i < keys.length; i++){
    var key = keys[i];
    var values = values[i];
    //Object.entries()
}
```

