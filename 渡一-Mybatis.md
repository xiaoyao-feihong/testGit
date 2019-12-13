### Mybatis学习

<hr>



#### 1、Mybatis发展历程

V：view视图层（HTML、JSP、JSON、JS）

C：controller控制层（Servlet）

M：Model模型层（Service、Dao）

DB：数据库（文件）



##### 1.1 maven下的mybatis使用

流程：

> 1、创建maven下的web工程
>
> 2、结构：
>
> （1）main文件夹下：
>
> java-------源代码
>
> resource-------mybatis配置文件，`mapper.xml`文件
>
> webapp-------**WEB-INF**下`web.xml`
>
> （2）test文件夹下
>
> resources文件夹下：`jetty-context.xml`
>
> 3、maven配置文件`pom.xml`
>
> 依赖：
>
> fastjson：字符串拼接
>
> lombok：使用注解创建getter、setter、toString、constructor等（必须在IDEA下载lombok插件）
>
> mysql的Java驱动包：连接数据库
>
> javax.servlet：web依赖包
>
> fileupload和commons-io：联合使用，用来实现文件上传功能
>
> mybatis：mybatis框架依赖包
>
> framework-spring：
>
> ```xml
> <dependency>
>             <groupId>org.springframework</groupId>
>             <artifactId>spring-webmvc</artifactId>
>             <version>5.2.0.RELEASE</version>
>         </dependency>
> ```
>
> 插件：
>
> （1）jetty
>
> （2）maven插件
>
> 4、添加maven配置（add configuration +号添加，使用`jetty:run`启动服务器）





发展历程：

Mybatis框架，ibatis转化而来，Clinton Begin发起一个开源项目Ibatis1.0

2005年，iBatis2.0，2010年iBatis3.0，之前都是由Apache组织管理

2010年6月，iBatis项目交由谷歌公司管理，改名MyBatis

2013年11月，整个项目迁移至GitHub

2019年10月，MyBatis3.5.3

MyBatis是一个半自动ORM（Object Relation Mapping）框架，做Dao层与数据库交互，持久层框架

半自动，需要用户写sql



#### 2、Mybatis基础

##### 2.1 下载

https://github.com/mybatis/mybatis-3/releases



##### 2.2 基本配置和增删改查

核心配置文件：configuration.xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <!--可以连接多个数据库-->
    <environments default="development">
        <!--id可以随意-->
        <environment id="testMybatis">
            <transactionManager type="JDBC"></transactionManager>
            <!--MyBatis默认10个连接-->
            <dataSource type="POOLED">
                <property name="driver" value="com.mysql.cj.jdbc.Driver"></property>
                <property name="url" value="jdbc:mysql://mytest?serverTimezone=CST"></property>
                <property name="username" value="root"></property>
                <property name="password" value="root"></property>
            </dataSource>
            <!--找到当前配置文件路径下mappers文件下的StudentMapper.xml文件-->
        </environment>
    </environments>
    <mappers>
        <mapper resource="mappers/studentMapper.xml"></mapper>
    </mappers>
</configuration>
```



新增的Java代码：

```java
public class Student {
    private Integer id;
    private String name;
    private Integer sex;
    private Integer birth;
    private Date ctime;
}

class StudentDao {
    //插入方法
    public void insert (){
        //工人构建工厂需要图纸
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        //图纸就是流
        InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("configuration.xml");
        SqlSessionFactory factory = builder.build(is); 
        //通过工程创建出来的sql管理对象
        //openSession如果传参true，表示自动提交，否则默认手动提交
        SqlSession sqlSession = factory.openSession();
        //执行数据库操作
        sqlSession.insert("insert");
        //MyBatis默认手动提交
        sqlSession.commit();
    }
} 
```



sql语句编写的位置StudentMapper.xml

```xml
<?xml version="1.0" encoding="UTF-8">
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<!--dtd规则，跟标签configuration-->
<!--mapper标记中有一个属性-->
<mapper namespace="dao.StudentDao">
	<!--建议id名方法名一致-->
	<!--可以有select、update、delete、selectOne、selectList等标签-->
    <insert id="insert">
		insert into student values(9,"zzt",1,1993,"2019-11-16");
	</insert>
	
	<!--查询单个-->
 	<select id="selectOne" resultType="domain.Student">
		select * from student where id = 1;
	</select>
	<!--查询多条-->
	<select id="selectAll" resultType="domain.Student">
		select * from student;
	</select>
	<!--查询数量-->
	<select id="selectCount" resultType="int">
		select count(*) as stuCount from student;
	</select>
	<!--查询属性分组的数量-->
	<select id="selectCountBySex" resultType="hashmap">
		select sex,count(*) as ct from student group by sex;
	</select>
</mapper>
```



查询单条记录的方法

```java
public Student selectOne () {
    SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
    //Resource.getResourceAsStream()是MyBatis提供的获取输入流方法
    //框架提供的依赖度较高，框架提供的方法异常必须处理
    InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("configuration.xml");
    SqlSessionFactory factory = builder.build(is);
    SqlSession session = factory.openSession();
    session.commit();
    Student student = session.selectOne("selectOne");
    return student;
}
```



查询所有记录的方法

```java
public List<Student> selectAll () {
    SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
    InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("configuration.xml");
    SqlSessionFactory factory = builder.build(is);
    SqlSession session = factory.openSession();
    return session.selectList("selectAll");
}
```



查询表格中记录个数

```java
public int selectCount (){
    SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder(); n
    InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("configuration.xml");
    SqlSessionFactory factory = builder.build(is);
    SqlSession session = factory.openSession();
    return session.selectOne("selectCount");
}
```



分组查询

会将列名作为key，值作为value保存到集合中 

```java
public List<HashMap<String,Object>> selectCountBySex () {
    SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder(); n
    InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("configuration.xml");
    SqlSessionFactory factory = builder.build(is);
    SqlSession session = factory.openSession();
    return session.selectList("selectCountBySex");
}
```



MyBatis对表格的查询操作

调用sqlSession对象中的两个方法，selectOne、selectList

方法中通常传递两个信息（mapper中sql语句的id，sql携带的信息）

方法有返回值：

selectOne--->一个对象，一个map，一个变量，一个数组

selectList--->一个List，List里面的泛型使用上述对象，map，变量，数组

泛型类型是在Mapper中文件规定的，resultType属性



##### 2.3 动态sql处理

设计一个方法，根据给定的学生id，修改学生的性别

分析：是否需要参数，学生id，学生性别

sql语句：`update student set ssex = ? where sid = ?`

mapper.xml

```xml
<update id="update">
	update student set ssex = #{ssex} where #{sid}
</update>
```



代码：

可以传递对象

```java
public void update (Student student) {
    SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
    InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("mybatis-config.xml");
    SqlSessionFacroty factory = builder.build(is);
    SqlSession session = factory.openSession();
    session.update("update",student);
} 
```



底层原理：

（1）加载驱动，参考核心配置文件driver

（2）获取连接，参考核心url、username、password

（3）创建状态参数

（4）将SQL和问号动态信息拼接完整

会将对象的属性反射，和#{}中的属性进行匹配，然后执行sql操作

（5）如果还是查询，分析resultType属性，底层通过反射创建一个对象，结果集中的信息存入对象

（6）sql语句只有一个#{}，key可以随便写；两个及以上参数，需要key和传递参数值名字对映上

> 原理：
>
> （1）传递对象，Mybatis会通过反射分析对象所有属性来与#{}中属性进行匹配
>
> （2）可以传递HashMap，Mybatis会分析Map的key属性，然后对应上
>
> （3）对映不上就报错



设计一个方法，查询所有学生，根据id进行排序（升序、降序不一定）

mapper.xml

```xml
<select id="selectAllByOrder">
	select * from student order by ${flag}
</select>
```



代码：

```java
public List<Student> selectAllByOrder (String flag) {
    return session.selectList("selectAllByOrder",flag);
}
```



##### 2.4 #{}和${}区别

#{}用来表示类型和值，通常用来作为条件（框架会判断类型，字符串会添加单引号）

${}表示就是普通的字符串，通常表示表名，列名，关键字（不添加单引号，直接双引号拼接到sql语句上）



学生管理小系统

```java
//管理对象
public class MySpring {
    private static Map<String,Object> beanMap = new HashMap<>();
    
    public static synchronized <T>T getBean (String className){
        T obj = (T)beanMap.get(className);
        if(obj == null){
            try{
                obj = (T)Class.forName(className).newInstance();
                beanMap.put(className,obj);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
}

//获取session得工具类
public class SqlSessionUtil {
    private static SqlSessionFactory factory;
    
    static {
        SqlSessionFacrotyBuilder builder = new SqlSessionFacrotyBuilder();
        InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("mybatis-config.xml");
        factory = builder.build(is);
    }
    
    public static SqlSession getSqlSession(){
        return factory.openSession();
    }
    
    public static SqlSession getSqlSession(boolean flag){
        return factory.openSession(flag);
    }
}
```



##### <font color="red">2.5 联合查询</font>

###### 2.5.1 一对一

设计一对一的表格的关系

```mysql
# 创建身份证表格
create table idcard (
	cardid varchar(18) primary key not null;
    address varchar(20);
)character set utf8;

# 人的表格
create table person (
	pid int(15) primary key not null,
    pname varchar(30),
    cardid varchar(18) unique key not null
)character set utf8;

# 内连接
select * from person p inner join idcard i on p.pid = i.cardid;
```



代码设计

```java
public class Person {
    private Integer pid;
    private String pname;
    private IDCard idcard; 
}
class IDCard {
    private Integer cardid;
    private String address;
    private Person person;
}
class PersonDao {
    private session = SqlSessionUtil.getSqlSession();
    //发现cardid没法赋值，框架没法识别cardid给对象
    public Person selectOne () {
        return session.selectOne("selectOne");
    }
}
```



配置文件（方式一：resultMap自定义规则）

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="dao.PersonDao">
    
	<!--根据resultMap的id值找对应resultMap-->
    <select id="selectOnePerson" resultMap="selectCardIDForPerson">
        select pid,pname,cardid from person where pid = 1
    </select>
	
    <!--根据返回结果的列名与Perosn类的属性一一对应-->
    <resultMap id="selectCardIDForPerson" type="domain.Person">
        <!--主键属性-->
        <id property="pid" column="pid"></id>
        <!--other属性-->
        <result property="pname" column="pname"></result>
        <!--列名对应要给的内联对象属性，通过select值找select中id对应的-->
        <association property="idcard" column="cardid" javaType="domain.IDCard" select="selectCardID"></association>
    </resultMap>

    <!--根据Person列名cardid进行的查询-->
    <select id="selectCardID" resultType="domain.IDCard">
        <!--cardid就是关联中column的值-->
        select * from idcard where cardid = #{cardid}
    </select>
</mapper>
```



产生问题：

采用两次查询的配置方案：查询的时候产生`N+1`问题

原因：

如果查询数据只有主表的数据，从表暂时没用到，如果做延迟的加载机制，可以提升性能。

解决：

通过配置文件

```xml
<!--注意settings在configuration下，要在environments标签上-->
<!--配置LOG4J日志文件和懒加载-->
    <settings>
        <!--打印日志到slf4j-->
        <setting name="logImpl" value="SLF4J"></setting>
        <!--配置懒加载机制-->
        <setting name="lazyLoadingEnabled" value="true"/>
        <setting name="aggressiveLazyLoading" value="false"/>
    </settings>
```

作用：配置后，属性在用上的时候才做关联查询，如果person的`idcard`的`cardid`属性没用上，就不会做联合查询，在使用的时候操作查询



查询的时候我们想要看到框架给我们生成的sql语句

log4j.jar：log4j需要配置文件，log4j.properties

```
log4j.rootLogger=debug,stdout
log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.layout=org.apache.log4j.SimpleLayout
log4j.logger.com.ibatis=DEBUG
log4j.logger.com.ibatis.common.jdbc.SimpleDataSource=DEBUG
log4j.logger.com.ibatis.common.jdbc.ScriptRunner=DEBUG
log4j.logger.com.ibatis.sqlmap.engine.impl.SqlMapClientDelegate=DEBUG
log4j.logger.java.sql.Connection=DEBUG
log4j.logger.java.sql.Statement=DEBUG
log4j.logger.java.sql.PrepareStatement=DEBUG
```

maven下pom.xml配置：

```xml
<dependency>
       <groupId>org.slf4j</groupId>
       <artifactId>slf4j-log4j12</artifactId>
       <version>1.7.25</version>
</dependency>
<dependency>
       <groupId>org.apache.logging.log4j</groupId>
       <artifactId>log4j-core</artifactId>
       <version>2.12.1</version>
</dependency>
<dependency>
       <groupId>org.bgee.log4jdbc-log4j2</groupId>
       <artifactId>log4jdbc-log4j2-jdbc4.1</artifactId>
       <version>1.16</version>
</dependency>
```

mybatis-config.xml配置

```xml
<settings>
     <!--打印日志到slf4j-->
     <setting name="logImpl" value="SLF4J"></setting
</settings>
```

多条记录查询，全部人员信息+身份证信息

```java
public List<Person> selectAllPerson () {
    return session.selectList("selectAllPerson");
}

/*
# personMapper.xml配置
<select id="selectAllPerson" resultMap="selectCardIDForPerson" resultType="domain.Person">
        select pid,pname,cardid from person
</select>
*/
```



配置文件（方式二：collection）

等值连接、内连接、外连接

personMapper.xml

```xml
<select id="selectOnePerson" resultMap="selectPerson">
	select p.pid,p.pname,i.cardid,i.address from person p innner join idcard i on p.cardid = i.cardid where p.pid = #{id}
</select>

<select id="selectAllPerson" resultMap="selectPerson">
	select p.pid,p.pname,i.cardid,i.address from person p inner join idcard i on p.cardid = i.cardid
</select>

<resultMap id="selectPerson">
	<id property="pid" column="pid"></id>
    <result property="pname" column="pname"></result>
    <association property="idcard" column="cardid" javaType="domain.IDCard">
    	<id property="cardid" column="cardid"></id>
        <result property="address" column="address"></result>
    </association>
</resultMap>
```



###### 2.5.2  一对多

一对多表格关系设计

```mysql
#设计部门表格
create table dept (
	deptno int(10) primary key not null auto_increment,
    dname varchar(20),
    loc varchar(20)
)character set utf8; 
insert into dept values
(10,"accounting","new york"),
(20,"research","dallas"),
(30,"sales","chicago");

#设计员工信息表格
create table emp (
	empno int(4) primary key not null auto_increment,
    ename varchar(20),
    sal float(10,2),
    deptno int(10)
)character set utf8;
insert into emp values
(7369,"smith",800,20),
(7499,"allen",1600,30),
(7521,"ward",1250,30),
(7566,"jones",2975,20),
(7782,"clark",2450,10),
(7839,"king",5000,10),
(7788,"scott",3000,20);
```



java代码

实现通过部门编号查询下面所有的员工（一对多）

```java
public class Dept {
    private Integer deptno;
    private String dname;
    private String loc;
    private List<emp> empList;
}
class emp {
    private Integer empno;
    private String ename;
    private Float sal;
    private Integer deptno;
}
```


deptMapper.xml文件：
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="dao.DeptDao">
	<select id="selectOneDept" resultMap="deptMap">
    	select d.deptno,d.dname,d.loc,e.* from deptno d left join emp e on d.deptno = e.deptno where d.deptno = #{deptno}
    </select>
    
    <resultMap id="deptMap" type="domain.Dept">
    	<id property="deptno" column="deptno"></id>
        <result property="dname" column="dname"></result>
        <result property="loc" column="loc"></result>
        <!--ofType表示集合中的泛型-->
        <collection property="empList" javaType="list" ofType="domaim.Emp" column="deptno">
        	<id property="empno" column="empno"></id>
            <result property="ename" column="ename"></result>
            <result property="sal" column="sal"></result>
        </collection> 
    </resultMap>
</mapper>
```

<font color="red">注意：</font>一个对象其实也可以使用collection（不会出错，但是会开辟比较大的空间，不建议使用）



内外连接区别：

外连接

- 基本语法：`select * from A left/right [outer] join B on 条件`
- left/right：选择左右那张表为基准，作为基准的表格数据必须全部显示出来
- 非基准的表格按照on条件与之连接，若找到条件，正常显示，若找不到满足的条件则为null
- 先出现的表格显示在左边，后面的表格显示在右边

内连接（自连接）

`select * from emp inner join dept on 条件`

- 查询出的结果与等值连接一致
- 内连接不分左右，不能省略inner关键字
- 表格可以是同一张表格，但必须取别名
- 表格需要一定的设计
- 性能比等值更高



###### 2.5.3 多对多

老师表格和学生表格，一个老师的课可以对应多个学生，一个学生也会听多个老师的课，形成多对多关系

数据库设计

```mysql
# 老师表格
create table teacher (
	tid int(10) primary key not null auto_increment,
    tname varchar(20),
    tsex varchar(4),
    tage int(3)
)character set utf8;
insert into teacher values
(1,"zzt","male",18),
(2,"panda","male",58),
(3,"edward","male",38),
(4,"arvil","female",16);

# 学生表格
create table student (
	sid int(10) primary key not null auto_increment,
    sname varchar(20),
    ssex varchar(4),
    sage int(3)
)character set utf8; 
insert into student values
(1,"凯安其拉","male",18),
(2,"安其拉","female",17),
(3,"李白","male",18),
(4,"蔡文姬","female",16),
(5,"刘备","male",19),
(6,"公孙离","female",20),
(7,"曜","male",18),
(8,"张飞","male",15);

#映射表格
create table teacher_student (
	tid int(10),
    sid int(10)
)character set utf8; 
insert into teacher_student values
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,1),
(2,4),
(2,7),
(2,8),
(4,2),
(4,5),
(4,6),
(4,8);

# 多表联查
select t.*,s.* from teacher t,student s,teacher_student ts where t.tid = ts.tid and ts.sid = s.sid;
```

teacherMapper.xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="dao.TeacherDao">
    <select id="selectOneTeacher" resultMap="teacherMap" resultType="domain.Teacher">
        select t.*,s.* from teacher t,student s,teacher_student ts where t.tid = #{tid} and t.tid = ts.tid and ts.sid = s.sid
    </select>

    <select id="selectAllTeacher" resultMap="teacherMap" resultType="list">
        select t.*,s.* from teacher t,student s,teacher_student ts where t.tid = ts.tid and ts.sid = s.sid
    </select>

    <resultMap id="teacherMap" type="domain.Teacher">
        <id property="tid" column="tid"></id>
        <result property="tname" column="tname"></result>
        <result property="tsex" column="tsex"></result>
        <result property="tage" column="tage"></result>
        <collection property="studentList" javaType="list" ofType="domain.Student">
            <id property="sid" column="sid"></id>
            <result property="sname" column="sname"></result>
            <result property="ssex" column="sage"></result>
        </collection>
    </resultMap>
</mapper>
```

java类代码

```java
class Teacher {
    private Integer tid,
    private String tname,
    private String tsex,
    private Integer tage,
    private List<Student> studentList;
}
class Student {
    private Integer sid;
    private String sname;
    private String ssex;
    private Integer tage;
    private List<Teacher> teacherList;
}
```



小任务：

购物系统

（1）需要用户登录（有账号登录，没有账号注册）---- User表格

（2）选择商品种类（查询所用商品 ） ---- Kind表格

（3）展示种类，根据选中的某一个种类，展示商品  ---- Item表格

结构：V + C + M + DB

用户可以上传图像



#### 3、MyBatis配置

mybatis-config.xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <!--可以连接多个数据库-->
    <environments default="MybatisOfMaven">
        <!--id可以随意-->
        <environment id="MybatisOfMaven">
            <transactionManager type="JDBC"></transactionManager>
            <!--默认10个连接的mybatis默认连接池-->
            <dataSource type="POOLED">
                <property name="driver" value="com.mysql.cj.jdbc.Driver"></property>
                <!--注意xml中&符号要用&amp;-->
                <property name="url"
                          value="jdbc:mysql:///mytest?characterEncoding=UTF-8&amp;serverTimezone=CST"></property>
                <property name="username" value="root"></property>
                <property name="password" value="root"></property>
            </dataSource>
            <!--找到当前配置文件路径下mappers文件下的StudentMapper.xml文件-->
        </environment>
    </environments>
    <mappers>
        <mapper resource="mapper/studentMapper.xml"></mapper>
    </mappers>
</configuration>
```



##### 3.1 配置相关标签

> 1、properties标签为了引入外部文件的配置信息
>
> 好处：是可以隐藏数据库真实信息
>
> ```xml
> <!--引入数据库配置文件-->
> <properties resource="config/database.properties"></properties>
> <environments default="develop">
> 	<environment id="develop">
>     	<transactionManager type="JDBC"></transactionManager>
>         <dataSource type="POOLED">
>             <!--通过${}赋值-->
>         	<property name="driver" value="${driver}"></property>
>             <property name="driver" value="${url}"></property>
>             ......
>         </dataSource>
>     </environment>
>     <mappers>
>     	<mapper resource="studentMapper.xml"></mapper>
>     </mappers>
> </environments>
> ```
>
> 2、typeAlias标签
>
> ```xml
> <!--mybatis-config.xml-->
> <typeAliases>
>     <!--取别名，这样mapper的返回值类型就能用alias设置的属性简写-->
> 	<typeAliase type="domain.student" alias="student"></typeAliase>
> </typeAliases>
> ```
>
> 3、settings标签
>
> ```xml
> <setting name="aggressiveLazyLoading" value="false"/>
> ```
>
> lazyLoadingEnabled：懒加载
>
> 4、typeHandlers设置返回值相关
>
> 5、environments
>
> 两个不同的数据库
>
> ```xml
> <environments default="develop1">
> 	<environment id="develop1"></environment>
>     <environment id="develop2"></environment>
> </environments>
> ```
>
> 如何使用环境2的数据库
>
> ```java
> public Student seleceOneStudent (int sid) {
>     SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
>     InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("mybatis-config.xml");
>     SqlSessionFactory factory = builder.build(is,"develop2");
>     SqlSession session = factory.openSession();
>     session.selectOne("selectOneStudent");
> }
> ```
>
> java工具方法：
>
> ```java
> private static SqlSessionFactory factory;
>     private static SqlSessionFactoryBuilder builder;
> 
>     static {
>         builder = new SqlSessionFactoryBuilder();
>     }
> 
>     //获取其它环境下的数据库
>     //获取environment配置的其它数据库
>     public static SqlSession getSqlSessionInOtherEnvironment (String env,boolean flag) {
>         InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("mybatis-config.xml");
>         SqlSessionFactory factory = builder.build(is,env);
>         return factory.openSession(flag);
>     }
> 
>     //不自动提交
>     public static SqlSession getSqlSessionInOtherEnvironment (String env) {
>         return getSqlSessionInOtherEnvironment(env,false);
>     }
> ```
>
> 6、transactionManager设置数据库的管理者
>
> type：
>
> + "JDBC"
> + "MANAGED"：什么也不干，与其他框架集成
>
> 7、dataSource设置数据源相关信息
>
> type：
>
> + "UNPOOLED"需要连接的时候就创建，用完的时候就关闭
>
> + "POOLED"数据源管理方式实现了连接池（可以property中设置连接池属性）
> + "JNDI"：java naming and directory interface java命名和目录接口
>   + c3p0：性能较差
>   + DBCP：Apache开源项目
>   + Druid：阿里开源项目，性能更好
>
> 8、mappers 标签
>
> + resource：映射文件路径
> + class：一个类名，方法上面有注解
>
> mapper文件中的namespace属性，要与dao类全名一致，为了以后变成接口让代理对象干活



##### 3.2 Mybatis联合Druid

配置文件mybatis-config.xml

```xml
<!--将数据源变为Druid连接池-->
<dataSource type="com.alibaba.druid.pool.DruidDataSource"></dataSource>
```

pom.xml中导入连接池jar包

```xml
<dependency>
	<groupId>org.mybatis.spring.boot</groupId>    
	<artifactId>mybatis-spring-boot-starter</artifactId>  
	<version>1.3.1</version>
</dependency>
```



#### 4、MyBatis动态sql

动态SQL：在查询的时候，条件不止一个，组合方式非常多，这样我们就需要写很多方法和配置类一一对应，比较麻烦，使用动态sql查询就能一个方法完成多个数据库操作。



##### （1）情景

```mysql
# emp表格
# 通查
select * from emp;
# 根据job筛选
select * from emp where job = ?;
# 根据deptno筛选
select * from emp where deptno = ?;
# 技巧：恒等式通查，用and拼接条件
select * from emp where 1=1 and job = ?
select * from emp where 1=1 and job = ? and deptno = ? 
```



之前我们一个以上参数的查询，使用`selectList`是没法传多个参数的，所以我们将查询条件都放在一个Map里（这难道不麻烦吗）。



##### （2）动态sql

```xml
<select id="selectEmpByValue" resultType="domain.Dept">
	select * from emp
    <where>
        <!--if标签中判断满足就拼接-->
    	<if test="deptno != null and deptno != ''">
    		and deptno = #{deptno}
    	</if>
    	<if test="job != null and job != ''">
        	and job = #{job}
        </if>
    </where>
    order by salary
    
    <!--choose标签用于拼接条件-->
    <choose>
        <!--注意是==表示相等-->
    	<when test="order == 'DESC'">
        	desc
        </when>
        <otherwise>
        	asc
        </otherwise>
    </choose>
</select>
```



##### （3）批量修改、删除

```java
public void testForEach () {
    List<Integer> list = new ArrayList<>();
    list.add(1);
    list.add(4);
    list.add(3);
    list.add(2);
    SqlSessionUtil.getSqlSession(true).update("testForEach",list);
}
```

deptMapper.xml

```xml
<update id="testForEach">
    update test_relationship set money = 2048.0 where id in
    <!--
		collection:集合类型
		item：指定拼接的变量
		open：开始插入的符号
		close：结束插入的符号
		separator：分隔符
	-->
    <foreach collection="list" item="id" open="(" close=")" separator=",">
        #{id}
    </foreach>
</update>
```



#### 5、基于Mapper的执行

dao层只剩一下一行代码，能不能去掉这一行呢？



##### （1）Mapper使用

基于MyBatis基于Mapper（代理）的执行方式

Service层（负责处理逻辑、判断、比较）

Dao层（负责读写数据库，需要SqlSession对象）

保留Dao这个层次，让代理对象（Mapper）去干活（代理对象找寻SqlSession）



```java
public interface StudentDao {
    Student selectStudentById(Integer id);
    void insertOneStudent(Student student);
    void updateStudent(Student student);
}

class StudentService {
    //通过SqlSession对象获取实现接口的子类
    private StudentDao dao = SqlSessionUtil.getSqlSession(true).getMapper(StudentDao.class);
    
    public Student selectStudentById(Integer id){
        dao.selectStudentById(id);
    }
    public void insertOneStudent(Student student){
        dao.insertOneStudent(student);
    }
    public void updateStudent(Student student){
        dao.updateStudent(student);
    }  
}
```



子类是如何找到对应id的sql语句的？

**注意：方法名-----id映射，类全名-----具体实体的Dao**

映射文件名字的规则，我们通常方法名与id一致，就是为了使用映射

namespace：与dao的类全名一致

标签中的id：dao的方法名字一致



Dao接口+注解（sql）

原因：因为我们写好的sql语句是不经常修改的，所以使用xml反而显得没有必要



##### （2）注解配合Mapper

##### （1）静态代理

+ 连接池回顾：

1）我们希望connectionPool.getConnection()获取的是自己重写close的MyConnection，但是不能让使用者发现不一样

2）层次Connection接口

JDBC4Connection   MyConnection都实现Connection接口，然后MyConnection中引入JDBC4Connection来干活

+ 思想

1）顶级接口，子类实现，有两个实现的子类，真实类做事情，代理类不做事情

2）代理类重写一些方法

<font color="blue">静态代理，代理知道真实干活的子类是谁</font>



底层原理：

> （1）根据类名找到对应的MapperProxyFactory
>
> （2）根据方法名找到MapperMethod
>
> （3）通过SqlSession对象执行方法



##### （2）动态代理

动态代理：代理的是接口/功能

```java
public interface PersonDao {
    Student selectStudentById(int id);
}

public class ProxyUtil {
    public <T>T getMapper (Class<T> clazz) {
        //创建代理对象
        ClassLoader loader = clazz.getClassLoader();
        Class[] classes = new Class[]{clazz};
        InvocationHandler = new InvocationHandler() {
            public Object invoke (Object proxy,Method method,Object[] args) {
         	   String methodName = method.getName();
                System.out.println("proxy:" + proxy.getClass().getName());
                System.out.println(methodName + " is excuting."); 
                return null;
            }
        }
        Object obj = Proxy.newProxyInstance();
        return (T)obj;
    } 
}
```



大厂为什么总喜欢考算法？

（1）通用问题的思考能力

（2）转业能力

（3）人品和三观



数据结构

+ 线性结构
  - 线性表（ArrayList、LinkedList）、栈（Stack）、队列（Queue、Deque）
  - 顺序存储ArrayList和链式存储LinkedList

+ 非线性数据结构
  - 树和图

链表：是一种链式的存储结构，便于增加和删除，不便于查询



面试常考题

（1）ArrayList与LinkedList的区别什么？

答：数据结构上有不同，内存空间占用上也有不同，ArrayList有一定预留空间的浪费，LinkedList有指针空间的浪费。

（2）LinkedList的新增元素如何操作的？



（3）当通过下标获取Node时，是如何查询的？



（4）LinkedList的删除操作是如何进行的？



（5）支持批量add吗？如果支持，试怎么实现的？





LinkedList：jdk1.6以前是环形链表，1.6以后是双向链表

Deque：双向队列



```java
//实现了抽象连续List，List，克隆，双向队列，序列化接口
public class LinkedList implements Serializable,Deque,Clonable,List,AbstractSequentialList{
    
}
```

