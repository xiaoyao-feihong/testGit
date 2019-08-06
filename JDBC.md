### JDBC

<hr>

##### 1、JDBC

（1）数据库可以理解为数据库的本质就是通过I/O读写文件，数据是为了今后做逻辑准备的，给用户查看，我们处理好数据以后写回数据库中。

（2）JDBC全称：Java Database Connectivity，是Java平台提供的一种统一的执行规范/标准（接口）。

（3）JDBC连接图：

![](C:\Users\86180\Desktop\testGit\typoraImg\JDBC连接图.png)

（4）不同厂商实现了JDBC的规范，JDBC驱动

+ JDBC-ODBC每一个客户机都需要安装，很耗费空间，管理不方便
+ JDBC-Native类似第一种，每一个客户机安装，调用本地原生C/C++，具体到某一个数据
+ JDBC-Net使用了标准的Socket通信，不需要每一个客户机都安装，相对灵活
+ 纯JavaJDBC纯粹基于socket通信，不需要安装客户机上，每一个数据库的厂商自身提供的，可以下载（现在基本都是使用这种）

（5）下载MySQL数据的JDBC驱动包

地址：<https://dev.mysql.com/downloads/connector/j/>

根据版本下载，解压压缩包，找到mysql-connector-java-5.1.47.jar包

（6）JDBC六部曲：

> 1.导包（将jar包导入到工程里）
>
> 工程中新建lib文件夹，然后将jar包复制进去，做一个设置
>
> <font color="red">设置File/Project Structure/Libraries</font>,使用+号添加到工程中，选择jar包路径
>
> 2.加载驱动类（Driver）
>
> 3.获取连接（类似Socket）
>
> 4.创建状态参数（流）
>
> 5.执行数据库操作（DML增删改,DQL查）
>
> DML：`executeUpdate(sql)`-->insert，delete，update
>
> DQL：`executeQuery(sql)`-->select
>
> 6.关闭
>
> 7.JDBC5.x版本流程
>
> ```java
> public class TestJDBC {
>     public static void main (String[] args){
>         try{
>            //1.加载驱动类
>            Class.forName("com.mysql.cj.jdbc.Driver");
>            //2.获取连接
>            // url写法："jdbd:"+数据库名+"//:ip:port/数据库名"
>             String url = "jdbc:mysql://localhost:3306/mytest";
>             String user = "root";
>             String password = "root";
>             Connection con = DriverManager.getConnection(url,user,password);
>             //3.获取执行语句
>             Statement state = con.createStatement();
>             String sql = "insert into student values(12001,'chen','male');";
>             //4.执行语句
>             state.executeUpdate(sql);
>             System.out.println("执行完毕");
>             //5.关闭连接
>             state.close();
>             con.close();
>         }catch(Exception e){
>             e.printStackTrace();
>         }
>     }
> }
> ```
>
> **注意：驱动8.0版本与驱动5.6版本的不同**
>
> ```java
> import java.sql.Connection;
> import java.sql.DriverManager;
> import java.sql.Statement;
> import static java.sql.DriverManager.*;
> 
> public class TestJDBC {
>     public static void main (String[] args){
>         try{
>             //8.x版本写法，要加cj（connect Java）
>             //增加了time zone
>            Class driver = Class.forName("com.mysql.cj.jdbc.Driver");
>             //5.x版本 --> jdbc:mysql://localhost:3306/mytest
>             //8.x版本 --> jdbc:mysql://localhost:3306/mytest?serverTimezone=cst
>             String url = "jdbc:mysql://localhost:3306/mytest";
>             String user = "root";
>             String password = "root";
>             Connection con = DriverManager.getConnection(url,user,password);
>             //状态参数
>             Statement state = con.createStatement();
>             //1.DML操作语言
>             String sql = "insert into student values(12001,'chen','male');";
>             //返回值是数据库更新的行数
>             int count = state.executeUpdate(sql);
>             System.out.println("执行完毕");
>             state.close();
>             con.close();
>             
>             //2.DQL查询语言，通过Map集合存储
>             //**查询出来的一列信息是一个Map集合
>             //列名是key,单元格内的值是value --> Map<key,Object>
>             
>             //**查询出来的多行信息是Set集合
>             //Set<Map<key,Object>>
>             
>             //select ename,job,hiredate from emp where ename = xxx
>             //根据筛选条件找到对应列的位置，然后遍历其它关联列获得相应的其它属性
>             //封装成对象，放到一个自己做好的ResultSet集合里
>             //next()方法相当于Iterator it.hasNext();
>             String sql = "select * from emp";
>             ResultSet rs = state.excuteQuery(sql);
>             //rs有两个方法，判断是否有下一个元素rs.next() rs.get类型(xxx);
>             while(rs.next()){
>                 //getInt是方法重载，String列名，int index两类
>                 int empno = rs.getInt("empno");
>                 //getString可以接收任何类型，其它类型不一定可以
>                 String ename = rs.getString("ename");
>             }
>         }catch(Exception e){
>             e.printStackTrace();
>         }
>     }
> }
> //加载驱动问题
> //Class.forName(com.mysql.cj.jdbc.Driver);只做了一件事情，注册驱动
> /*Driver类下的源码：
> class Driver {
> 	public Driver() throws SQLException {
>     }
> 
>     static {
>         try {
>             DriverManager.registerDriver(new Driver());
>         } catch (SQLException var1) {
>             throw new RuntimeException("Can't register driver!");
>         }
>     }
>    }
> */
> ```
>
> 8、加载驱动方式
> （1）`Class.forName("com.mysql.cj.jdbc.Driver")`;
> （2）根据源码只需要注册分析，所以可以写为：
> 	`DriverManager.registerDriver(new Driver());`
> （3）因为静态块中也会注册这个操作，所以进一步简写:
> 	`new Driver()`;//注意是com.mysql.cj.jdbc.Driver包，不是接口Driver
> （4）System类中设置属性值来加载
> 	`System.setProperty("jdbc.driver","com.mysql.cj.jdbc.Driver");`
> （5）可以不写，但是DriverManager会自动将所有默认的驱动遍历一遍，性能会很慢
> 	**推荐使用1，4方法，比较灵活；2，3需要导包**
>
> 9、操作事物
>
> （1）JDBC默认的开启事物，默认的自动提交事物
>
> （2）手动设置手动提交事物
>
> ​	通过Connection类的setAutoCommit(false)；
>
>   `Connection c = DriverManager.getConnection();c.setAutoCommit(false)`
>
> （3）手动设置隔离级别
>
> ​	`c.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ)`
>
> ​	`c.commit()`手动提交事物
>
> （4）保存还原点和回滚
>
> ​	`SavePoint s = c.setSavePoint("x");c.rollback(s);`

##### 2、银行系统

###### （1）关闭MySQL的安全模式

​	`set sql_safe_updates = 0;`

###### （2）MVC分层思想

​	银行系统：domain包（存实体对象User）,lib包（加载Mysql的jar包），dao包（数据操作层），service包（业务逻辑层）

###### （3）SQL注入

通过SQL命令，拼接其它字符

产生原因：判断不严谨，SQL语句问题，允许拼接字符串，认为用户很不安全

Statement与PreparedStatement的区别

| Statement       | PreparedStatement                                   |
| --------------- | --------------------------------------------------- |
| 普通的状态参数  | 预先处理状态参数                                    |
| 创建时不需要SQL | 创建时就预先加载SQL语句                             |
| 此时没有执行    | 此时没有执行，底层预先处理SQL需要查询的结果，性能高 |

  PreparedStatement预处理状态参数好处：

+ 增强SQL可读性，并且提高了执行效率
+ 可以参数动态化
+ 防止SQL注入

```java
//字符串相关处理
public class Demo {
    public void login (String name,String password){
        String sql = "select * from bank_account where username = ? and password = ?;"
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/mytest?useSSL=true;characterEncoding=utf8&serverTimezone=CST";
            Connection con = DriverManager.getConnection(url,"root","root");
            PreparedStatement stat = con.prepareStatement(sql);
            //setString(问号的索引,值)索引从1开始
            //还有setDouble(),setInt,setFloat等
            stat.setString(1,name);
            stat.setString(2,password);
            ResultSet rs = stat.excuteQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
```



###### （4）模糊查询：

回顾MySQL --> like %（0个或多个） _（1个或两个）

查询多条记录：利用ArrayList存储对象，利于遍历

```java
public class Demo {
    //使用预处理参数，有动态的问号，但是设置的串包含百分号
    public ArrayList<Emp> selectLike (String letter){
        ArrayList<Emp> list = new ArrayList<Emp>();
        String sql = "select * from emp where ename like ?";
        try{
            //useSSL做加密处理
            String url = "jdbc:mysql://localhost:3306/mytest?useSSL=true&characterEncoding=utf8&serverTimezone=CST";
            Class.forName("com.mysql.cj.jdbd.Driver");
            Connection con = DriverManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            //一、利用"%"+letter+"%"进行模糊查询
            //二、改变SQL语句：select * from emp where ename like \"%\"?\"%\";因为"会和Java的字符串冲突，所以需要转义
            ps.setString(1,"%"+letter+"%");
            ResultSet rs = ps.excuteQuery();
            //预处理的执行机制：
            /**1.底层的状态参数
            2.根据调用的setString方法判断问号类型
            3.如果是String，拼接一个''
            */
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
```



###### （5）分页查询和多表联合查询

分页查询

```java
select * from emp order by salary desc limit 5,5;//从索引从0开始，此处从索引5开始，每次展示5条数据

public class Dao {
    //可以实现分页查询的方法
    public ArrayList<Emp> pagination (int index) {
        ArrayList<Emp> list = new ArrayList<Emp>();
        String sql = "select * from emp order by salary desc limit ?,5;";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            String url = "com.mysql.cj.jdbc.Driver";
            con = DriverManger.getConnection(url,"root","root");
            ps = con.prepareStatement(sql);
            ps.setInt(1,index);
            rs = ps.queryExecute();
            while(rs.next()){
                Emp emp = rs.getString("ename");
                ......
                list.add(emp);
            }
            con.close();
            rs.close();
            ps.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
}

//视图层
class Service {
    private dao = new Dao();
    ArrayList<Emp> getPage (int page){
        //每行展示5条
        return dao.pagination((page-1)*5);
    }
}
```



联合查询：

domain类-->一张表格

每一个对象-->一行记录

两张表-->两张表格，两个对象的类(Emp,Dept)

```java
public class Test  {
    public static void main (String[] args){
        ArrayList<HashMap<String,Object>> list = testLinkedListQuery();
        for(HashMap<String,Object> map:list){
            System.out.println("deptno:"+map.get("deptno")+"-->count:"+map.get("num"));
        }

    }
    private static ArrayList<HashMap<String,Object>> testLinkedListQuery() {
        ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select deptno,count(empno) as num from emp group by deptno;";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/mytest?useSSL=true&characterEncoding=utf8&serverTimezone=CST";
            con = DriverManager.getConnection(url,"root","root");
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                HashMap<String,Object> map = new HashMap<String,Object>();
                map.put("deptno",rs.getInt("deptno"));
                map.put("num",rs.getInt("num"));
                list.add(map);
            }
            rs.close();
            ps.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
```



小任务（利用JDBC处理连表查询的小任务）

```java
设计方法：
1.有无参数
2.有无返回值
3.存储集合的选择
//查询人口数在1000-2000的地区名字
public class AreaDao {
	public static void main (String[] args){
		AreaDao ad = new AreaDao();
		ArrayList<Map<String,Integer>> list = ad.selectAreaAndCitysize(1000,2000);
		for(Map<String,Integer> map:list){
		//非常需要空间，每一次都会使用一个Map集合
			System.out.println("area name:"+map.get("aname")+";city size:"+map.get("citysize"));
		}
	}

   public ArrayList<Map<String,Integer>> selectAreaAndCitysize (int min,int max) {
        String sql = "select aname from area a inner join city ci on a.cid = ci.cid where ci.citysize between ? and ? group by aname;"
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/mytest?useSSL=true&characterEncoding=utf8&serverTimezone=CST";
        con = DriverManager.getConnection(url,"root","root");
        ps = con.prepareStatement(sql);
        ps.setInt(1,min);
        ps.setInt(2,max);
        rs = ps.excuteQuery();
        while(rs.next()){
          Map<String,Integer> map = new Map<String,Integer>();
          map.put("aname",rs.getString("aname"));
          map.put("citysize",rs.getInt("citysize"));
          list.add(map);
        }
        rs.close();
        ps.close();
        con.close();
        ;
    }catch(Exception e){
        e.printStackTrace();
    }
       return list;
   }
}
```



 银行系统（Swing）

V：view 视图层（使用Swing）--> HTML，JSP

C：controller 控制层 --> Tomcat，servelet

M：model 模型层

+ 数据处理（Service）业务逻辑，比较，判断，计算
+ 数据读写Dao 读写数据，CURD，JDBC
+ 数据存储domain 存储数据，对象可读性较强



工具类

```java
public class MySpring {
    //目的是管理对象的产生，对象交给当前类来负责，IOC控制反转
    //声明周期托管方式获取任何一个类的对象，实现对对象的单例管理
    //设计一个方法，获取任何一个类的对象（类含有无参数构造方法）
    
    //1.属性，存储所有被管理的对象
    private static HashMap<String,Object> beanBox = new HashMap<>();
    public static <T>T getBean (String className){
        T obj = null;
        try{
            //2.查找对象是否存在，不存在就创建新的对象
           obj = (T)beanBox.get(className);
           if(obj == null){
               Class clazz = Class.forName(className);
               obj = (T)clazz.newInstance();
               beanBox.put(className,obj);
           }
        }catch(Exception e){
            e.printStackTrace();
        }
        return obj;
    }
}
```



##### 3、创建JDBCUtils工具类

###### （1）基本的JBDCUtils工具类

```java
public class JDBCUtils {
    //加载驱动
    public static void loadDriver () {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    //创建连接
    public static Connection getConnection() {
        Connection con = null;
        try{
            loadDriver();
            //localhost:3306可以省略不写
            String url = "jdbc:mysql:///mytest?useSSL=true&characterEncoding=utf8&serverTimeZone=CST";
            con = DriverManager.getConnection(url,"root","root");
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
    
    //释放资源,有结果集和无结果集
    public static void release (ResultSet rs,Statement stat,Connection con){
        if(rs!=null){
            try{
                rs.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        if(stat!=null){
            try{
                stat.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        if(con!=null){
            try{
                con.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
    
    public static void release (Statement stat,Connection con){
        if(stat!=null){
            try{
                stat.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        if(con!=null){
            try{
                con.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    } 
    //使用连接池的重写方法
    public static void release (ResultSet rs,Statement stat){
        if(rs!=null){
            try{
                rs.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        if(stat!=null){
            try{
                stat.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
    
    public static void release (Statement stat){
        if(rs!=null){
            try{
                rs.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        if(stat!=null){
            try{
                stat.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
}

public class JDBCDemo {
    public void test (){
        Connection con = null;
        PrepareStatement ps = null;
        ResultSet rs = null;
        try{
            con = JDBCUtils.getConnection();
            String sql = "select * from student;";
            ps = con.preparedStatement(sql);
            rs = ps.excuteQuery();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtils.release(rs,ps,con);
        }
    }
}
```



###### （2）通用版本JDBCUtils工具类

```java
public class JDBCUtils {
    private static String driverName;
    private static String url;
    private static String username;
    private static String password;
    
    static {
        Properties p = new Properties();
        p.load("src/JDBCUtils.properties");
        driverName = p.get("driverName");
        url = p.get("url"); 
        username = p.get("username");
        password = p.get("password");
    }
    
    //加载驱动
    public static void loadDriver () {
        try{
            Class.forName(driverName);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    //创建连接
    public static Connection getConnection() {
        Connection con = null;
        try{
            loadDriver();
            //localhost:3306可以省略不写
            con = DriverManager.getConnection(url,username,password);
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
    
    //释放资源,有结果集和无结果集
    public static void release (ResultSet rs,Statement stat,Connection con){
        if(rs!=null){
            try{
                rs.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        if(stat!=null){
            try{
                stat.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        if(con!=null){
            try{
                con.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
    public static void release (Statement stat,Connection con){
        if(stat!=null){
            try{
                stat.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        if(con!=null){
            try{
                con.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }  
}

.properties文件：
driverName=com.mysql.cj.jdbc.Drtiver
url=jdbc:mysql://localhost:3306/mytest?useSSL=true&characterEncoding=utf8&serverTimezone=CST
username=root
password=root
```



###### （3）使用连接池改造JDBC工具类

传统JDBC对链接对象的销毁不是很好，每次创建和销毁连接需要花费时间，可以使用连接池优化程序.



作用：程序开始的时候，可以创建几个连接，将连接放入到连接池，用户使用连接的时候，可以从，连接池中获取，用完之后，可以将连接归还连接池



+ 自定义连接池（为了更好的理解开源的连接池）

  Java提供的连接池接口：DataSource

```java
public class MyDataSource implements DataSource {
    private List<Connection> list = new ArrayList<>();
    //程序开始的时候，初始化几个连接，将连接存放到list中
    static {
        for(int i = 0; i < 3; i++){
            Connection con = JDBCUtils.getConnection();
            list.add(con);
        }
    }
    
    //从连接池中获取连接
    public Connection getConnection () throws SQLException {
        //如果连接数量不够了，就新增连接
        if(list.size() <= 0){
            for(int i = 0; i < 3; i++){
            Connection con = JDBCUtils.getConnection();
            list.add(con);
            }
        }
        Connection con = list.remove(0);
         return con;
        //使用装饰者模式后的代码
        /**
        **MyConnection mycon = new MyConnection(con,list);
        **return mycon;
        **/
       
    }
    
    //归还连接的方法
    public void addBack (Connection con){
        list.add(con);
    }
    
    //省略的方法。。。查看接口看需要多实现的方法
}

class TestDemo {
    //注意单元测试的方法不能有参数
    @Test
    public void demo () {
        Connection con = null;
        PrepareStatement ps = null;
        ResultSet rs = null;
        try{
            MyDataSource mds = new MyDataSource();
            con = mds.getConnection();
            //sname(varchar) sage(int) ssex(varchar)
            String sql = "select * form student";
            ps = con.preparedStatement(sql);
            rs = ps.excuteQuery();
            while(rs.next()){
                System.out.println("name:"+rs.getString("sname"));
                System.out.println("age:"+rs.getInt("sage"));
                System.out.println("name:"+rs.getString("snsex"));
                System.out.println("------------------------"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            //释放资源
            JDBCUtils.release(rs,ps);
            //归还连接
            mds.addBack(con);
            //使用装饰者模式后，不需要归还方法
            /**
            **直接JDBCUtils.release(rs,ps,con);
            **/
        }
    }
}
```



###### （4）解决自定义连接池的问题

自定义连接池的问题：1、需要创建对象		2、需要记个人写的API

解决：面向接口编程,不提供额外API方法解决上述问题（我们想重写Connection的close方法），需要增强close方法



增强类的方法的方式：

1、继承的方式，重写父类方法

使用条件：能够使用类的构造时，使用继承（Connection类的close方法在jar包下，不容易实现继承）

2、装饰者模式方式

在I/O操作使用最多，比如BufferedInputStream(InputStream is)就是使用了装饰者模式

使用条件：包装对象和被包装对象都要实现相同的接口，包装对象中需要得到被包装对象中的引用

局限：如果接口中方法比较多，增强其中的某个方法，其它的功能方法需要原有调用

3、动态代理方式（最灵活，但是写法也是最复杂）

被增强的对象实现接口就可以



开源连接池都是在close里就会归还连接



装饰者模式

```java
public interface Waiter {
    void server();
}

public class Waitress implements Waiter {
    public void server (){
        System.out.println("提供服务...");
    }
}

public class WaitressWrapper implements Waiter {
    private Waiter waiter;
    public WaitressWrapper (Waiter waiter){
        this.waiter = waiter;
    }
    public void server () {
        System.out.println("微笑...");
        this.waiter.server();
        ...//增强代码
    }
}

public class Test {
    public static void main (String[] args){
        Waiter w = new Waitress();
        Waiter w_wrapper = new WaitressWrapper(w);
    }
}
```



使用装饰者模式增强Connection：

```java
public class MyConnection implements Connection {
    private Connection con;
    public MyConnection (Connection con,List<Connection> list){
        this.con = con;
    }
    //重写close方法
    public void close () throws SQLException {
        list.add(con);
    }
    //以下是所有接口要求实现方法,注意测试时要实现PreparedStatement
    ...
}
```



使用开源数据连接池

DBCP（Apache），***c3p0***,Tomcat内置连接池（使用还是Apache的数据库连接池）



DBCP：DBCP(DataBase connection pool)数据库连接池。是Apache上的一个 java连接池项目，也是 tomcat使用的连接池组件。单独使用dbcp需要3个包：common-dbcp.jar,common-pool.jar,common-collections.jar由于建立数据库连接是一个非常耗时耗资源的行为，所以通过连接池预先同数据库建立一些连接，放在内存中，应用程序需要建立数据库连接时直接到连接池中申请一个就行，用完后再放回去。dbcp没有自动的去回收空闲连接的功能。 



***<font color="red">c3p0</font>***:C3P0是一个开源的JDBC连接池，它实现了数据源和JNDI绑定，支持JDBC3规范和JDBC2的标准扩展。c3p0是异步操作的，缓慢的JDBC操作通过帮助进程完成。扩展这些操作可以有效的提升性能。目前使用它的开源项目有Hibernate，Spring等。c3p0有自动回收空闲连接功能。(重点学习的连接池)



###### （5）DBCP连接池的使用

1）下载地址

+ pool下载地址：<http://commons.apache.org/proper/commons-pool/download_pool.cgi>

+ dbcp下载地址：<http://commons.apache.org/proper/commons-dbcp/download_dbcp.cgi>
+ logging下载地址：<http://commons.apache.org/proper/commons-logging/download_logging.cgi>
+ <font color="red">注意：</font>版本匹配问题

2）引入DBCP连接池的jar包（三个包，commons-dbcp-XX.XX.jar、commons-pool-XX.XX.jar，commons-pool2-XX.XX.jar）

3）两个连接池构造方法：

- [BasicDataSource](org/apache/commons/dbcp2/BasicDataSource.html)手动配置方式
- [BasicDataSourceFactory](org/apache/commons/dbcp2/BasicDataSourceFactory.html)利用配置文件配置方式



手动使用DBCP获得连接：

```java
package dbcp2demo;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBCPTest {
    public static void main (String[] args){
        DBCPTest d = new DBCPTest();
        d.testConnectionPool();
    }

    public void testConnectionPool () {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        BasicDataSource bs = new BasicDataSource();
        bs.setDriverClassName("com.mysql.cj.jdbc.Driver");
        bs.setUrl("jdbc:mysql:///mytest?useSSL=true&characterEncoding=utf8&serverTimezone=CST");
        bs.setUsername("root");
        bs.setPassword("root");
        try{
            con = bs.getConnection();
            String sql = "select * from student";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                System.out.println("number:"+rs.getInt("sid"));
                System.out.println("name:"+rs.getString("sname"));
                System.out.println("sex:"+rs.getString("ssex"));
                System.out.println("------------------------------------------");
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                if(rs!=null){
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(ps!=null){
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(con!=null){
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

```

配置文件方式设置DBCP：

```java
package dbcp2demo;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.dbcp2.BasicDataSourceFactory;

import javax.sql.DataSource;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DBCPTest {
    public static void main (String[] args){
        DBCPTest d = new DBCPTest();
        d.testConnectionPool();
    }

    public void testConnectionPool () {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        BasicDataSource bs = new BasicDataSource();
        bs.setDriverClassName("com.mysql.cj.jdbc.Driver");
        bs.setUrl("jdbc:mysql:///mytest?useSSL=true&characterEncoding=utf8&serverTimezone=CST");
        bs.setUsername("root");
        bs.setPassword("root");
        try{
            con = bs.getConnection();
            String sql = "select * from student";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                System.out.println("number:"+rs.getInt("sid"));
                System.out.println("name:"+rs.getString("sname"));
                System.out.println("sex:"+rs.getString("ssex"));
                System.out.println("------------------------------------------");
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                if(rs!=null){
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(ps!=null){
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(con!=null){
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void testConnectionPool2 () {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Properties p = new Properties();
        DataSource bs = null;
        try {
            p.load(new FileInputStream("src/dbcpconfig.properties"));
            bs = BasicDataSourceFactory.createDataSource(p);
        }catch(Exception e){
            e.printStackTrace();
        }
        try{
            con = bs.getConnection();
            String sql = "select * from student";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                System.out.println("number:"+rs.getInt("sid"));
                System.out.println("name:"+rs.getString("sname"));
                System.out.println("sex:"+rs.getString("ssex"));
                System.out.println("------------------------------------------");
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                if(rs!=null){
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(ps!=null){
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(con!=null){
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
```



###### （6）c3p0连接池的使用

（1）下载地址：<https://sourceforge.net/projects/c3p0/>

（2）使用方便文档，引入包更少

（3）**使用时需要导入c3p0-0.9.5.4，mchange-commons-java-0.2.15两个jar包**

（4）<font color="blue">注意：c3p0数据库连接池的辅助包，没有这个包系统启动的时候会报classnotfoundexception，这是c3p0-0.9.2版本后分离出来的包，0.9.1的时候是一个包就搞定的</font>

（5）c3p0-config.xml写在src目录下



设置参数代码：

```java
ComboPooledDataSource cpds = new ComboPooledDataSource();
cpds.setDriverClass("com.mysql.cj.jdbc.Driver");
cpds.setJdbcUrl(url);
cpds.setUser(username);
cpds.setPassword(password);
```

配置文件设置参数：

可以使用XML，properties文件配置

mysql5.7 c3p0的配置信息

```java
//写在src路径下的xml配置文件，文件名c3p0-config.xml
//注意XML下不能直接使用&符号，得使用&amp;表示&符
<c3p0-config>
  <default-config>
       <property name="driverClass">com.mysql.cj.jdbc.Driver</property>
       <property name="jdbcUrl">jdbc:mysql:///mytest?useSSL=true&amp;characterEncoding=utf8&amp;serverTimezone=CST</property>
        <property name="user">root</property>
        <property name="password">root</property>
        
    <property name="automaticTestTable">con_test</property>
    <property name="checkoutTimeout">30000</property>
    <property name="idleConnectionTestPeriod">30</property>
    <property name="initialPoolSize">10</property>
    <property name="maxIdleTime">30</property>
    <property name="maxPoolSize">100</property>
    <property name="minPoolSize">10</property>
    <property name="maxStatements">200</property>

    <user-overrides user="test-user">
      <property name="maxPoolSize">10</property>
      <property name="minPoolSize">1</property>
      <property name="maxStatements">0</property>
    </user-overrides>

  </default-config>

  <!-- This app is massive! -->
  <named-config name="intergalactoApp"> 
    <property name="acquireIncrement">50</property>
    <property name="initialPoolSize">100</property>
    <property name="minPoolSize">50</property>
    <property name="maxPoolSize">1000</property>

    <!-- intergalactoApp adopts a different approach to configuring statement caching -->
    <property name="maxStatements">0</property> 
    <property name="maxStatementsPerConnection">5</property>

    <!-- he's important, but there's only one of him -->
    <user-overrides user="master-of-the-universe"> 
      <property name="acquireIncrement">1</property>
      <property name="initialPoolSize">1</property>
      <property name="minPoolSize">1</property>
      <property name="maxPoolSize">5</property>
      <property name="maxStatementsPerConnection">50</property>
    </user-overrides>
  </named-config>
</c3p0-config>
```



手动抽取DBUtils的工具类

了解：JDBC的元数据（MetaData）

DatabaseMetaData数据库元数据

+ 获得参数元数据：Connection中的getMetaData()

ParameterMetaData获得SQL中的参数个数及类型

+ PrepareStatement中的getParameterMetaData()

ResultSetMetaData获得结果集中的列名及列的类型

+ Resultset的getMeta()

```java
public class DBUtils {
    public void testMeta (){
        Connection con = null;
        con = JDBCUtils.getConnection();
        try{
            DatabaseMetaData meta = con.getMetaData();
            System.out.println("获得驱动类名称："+meta.getDriverName());
            System.out.println("获得驱动URL："+meta.getDriverName());
            System.out.println("获得用户名："+meta.getUserName());
            //获取主键
            ResultSet rs = meta.getPrimaryKey(null,null,"student");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

声明中的元数据获得方式
PreparedStatement ps = con.getPrepareStatement();
int count = ps.getParameterMetaData();//获取参数元数据中？参数的个数
ResultSet rs = ps.excuteQuery();
ResultSetMetaData rsmd = rs.getMetaData();
int count = rsmd.getColumnCount();
String getColumnName();//获取列名
String getColumnTyoe();//获取列的类型
```



添加，修改，删除

通用增删改

```java
package dbutils;
import jdbcutils.JDBCUtils;
import java.sql.Connection;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;

public class DBUtils {
    //将增删改方法统一
    public static void update (String sql,Object... objects){
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = JDBCUtils.getConnection();
            ps = con.prepareStatement(sql);
            //获取参数元数据
            ParameterMetaData pm = ps.getParameterMetaData();
            //获取SQL语句中参数个数
            int count = pm.getParameterCount();
            for(int i = 1; i <= count ; i++){
                //利用setObject()方法设置参数的值
                ps.setObject(i,objects[i-1]);
            }
           int num =  ps.executeUpdate();
            System.out.println("操作成功");
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            JDBCUtils.release(ps,con);
        }
    }
}
```



