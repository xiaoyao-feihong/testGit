### Spring

<hr>



#### 1、Spring框架

SSH：Strusts2（出现安全问题）、Spring、Hibernate（性能差）

SSM：SpringMVC、Spring、Mybatis



##### 1.1 Spring介绍

###### 1.1.1 Spring特点

+ 轻量级非侵入式

+ 依赖注入：DI

+ 控制反转：IOC

+ 切片编程：AOP

+ 一站式框架

帮助我们创建对象，管理对象。

ORM框架-----帮助我们节省JDBC的开发（MyBatis）

WEB框架------能帮助我们节省servlet的开发（SpringMVC）

Spring-----帮助我们管理可以复用的对象



###### 1.1.2 Spring解决问题

+ 解决对象的依赖问题，帮助我们创建对象，管理可复用的对象

创建对象分为两类：可以复用，不可以复用，我们将可以复用的对象交给Spring来创建和管理。



###### 1.1.3 maven下引入Spring

三个基本jar包：

+ spring core：Spring核心包
+ spring context：上下文
+ spring beans：管理beans

pom.xml文件

```xml
<dependency>
   <groupId>org.springframework</groupId>
   <artifactId>spring-core</artifactId>
   <version>5.2.0.RELEASE</version>
</dependency>

<dependency>
   <groupId>org.springframework</groupId>
   <artifactId>spring-context</artifactId>
   <version>5.2.0.RELEASE</version>
</dependency>

<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-beans</artifactId>
    <version>5.2.0.RELEASE</version>
</dependency>
```

Spring中设置对象

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
    <!--创建完对象，自动将属性和值依赖注入-->
    <bean id="panda" class="testSpring.person">
    	<property name="age" value="18"></property>
    </bean>
</beans>
```

java代码

```java
public class Test {
    public static ApplicationContext ctx;
    static {
        //spring初始化，读取配置文件，创建对象
        ctx = new ClassPathXmlApplicationContext("spring-config.xml");
    }
    public static void main (String[] args){
       Person person = (Person)ctx.getBean("panda");
    }
}
```



为什么要将创建的对象交给Spring管理，因为大对象的创建很耗费时间，用Spring来创建能节省很多时间。



###### 1.1.4 Spring路径概念

+ `new ClassPathXmlApplicationContext()`默认class为根路径
+ `new FileSystemXmlApplicationContext()`默认项目为根路径



系统路径：操作系统的路径

项目路径：以项目路径作为基础路径（没打包编译之前，以项目为基础路径）

ClassPath：以类路径作为基础的，类文件下的路径（打包编译之后，最根层所在的路径，就是基础路径）

默认使用classpath的路径

```java
public class Test {
    public static ApplicationContext ctx;
    static {
        //spring初始化，读取配置文件
        //配置文件在项目里的两种加载方式
        ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        ctx = new FileSystemXmlApplicationContext("classpath:spring-config.xml");
        ctx = new FileSystemXmlApplicationContext("src/main/resources/spring-config.xml");
        
        //配置文件在系统的任意位置，假设桌面
        //classpath:编译之后最外层包下寻找
        //file:从系统路径下寻找
        //默认classpath
      ctx = new FileSystemXmlApplicationContext("file:\\C:\\Users\\86180\\Desktop\\spring-config.xml");
}	
```





###### 1.1.5 xml基本配置

spring-config.xml默认调用我们需要管理对象的的无参构造方法

有参bean的注册

```xml
<!--指定有参构造方法-->
<bean id="person" class="testSpring.Person">
    <!--基础数据类型不给type也可以，spring可以识别，最好加上type属性-->
	<constructor-arg type="int" value="18">
        <!--也可以将值设置在value标签中-->
        <!--<value>18</value>-->
    </constructor-arg>
    
    <!--ref引用另一个bean-->
    <constructor-arg type="testSpring.Car" ref="car"></constructor-arg>
    
    <property name="age" value="18"></property>
    <!--会报错-->
    <property name="name" value="<abcd~!>"></property>
    
    <!--正确写法-->
    <property name="name">
        <!--特殊character数据设置-->
    	<value><![CDATA[<abc>]]></value>
    </property>   
</bean>

<bean id="car" class="java.lang.String">
	<property name="name" type="string" value="volvo"></property>
    <property name="speed" type="int" value="90"></property>
</bean>
```

顺序：先构造，然后设置值，可能覆盖



内部bean

特点：外部无法通过id访问

```xml
<bean id="person" class="testSpring.Person">
	<property name="name" type="string" value="volvo"></property>
    <property name="age" type="int" value="18"></property>
    <property name="car">
        <!--内部bean-->
    	<bean class="testSpring.Car" >
        	<property name="name" type="string" value="volvo"></property>
    		<property name="speed" type="int" value="90"></property>
        </bean>
    </property>
</bean>
```

传null，使用`<null />`空标签表示，<font color="red">一定要写type</font>



级联属性设置

```xml
<bean id="person" class="testSpring.Person">
    <constructor-arg type="int"><value>18</value></constructor-arg>
    <constructor-arg type="string"><value>![CDATA[<abc>]]</value></constructor-arg>
    <constructor-arg type="testSpring.Car"><value>18</value></constructor-arg>
        <property name="car" ref="car2"></property>
         <property name="car.price" value="200"></property>
</bean>
<bean id="car2">
    <constructor-arg type="string" value="volvo"></constructor-arg>
    </bean>
```



list、map的配置

```xml
<!--list-->
<bean id="testSpring.person">
    <property name="carList">
    	<list>
            <!--也可以使用内部bean-->
        	<ref bean="car"></ref>
            <ref bean="car2"></ref>
        </list>
    </property>
</bean>

<!--hashmap-->
<bean id="testSpring.person">
    <property name="carMap">
    	<map>
            <!--内部bean-->
        	<entry key="car1">
            	<bean class="testSpring.Car">
                	<constructor-arg value="volvo"></constructor-arg>
                </bean>
            </entry>
            <!--外部bean-->
            <entry key="car2">
                <!--value-ref连接外部bean-->
            	<bean class="testSpring.Car" value-ref="car2"></bean>
            </entry>
        </map>
    </property>
</bean>
<bean id="car2" class="testSpring.Car">
	<constructor-arg value="BMW"></constructor-arg>
</bean>
```



properties对象的配置

很多框架会使用到

```xml
<property name="conf">
    <!--properties本质是一个Map,key-value的结构-->
    <props>
    	<prop key="a" value="1"></prop>
        <prop key="b" value="2"></prop>
        <prop key="c" value="3"></prop>
    </props>
</property>
```



list复用

```xml
<!--可以根据id被共享的list-->
<util:list id="carList">
    <ref bean="car1"></ref>
    <ref bean="car2"></ref>
</util:list>
```



命名空间

c命名空间，p命名空间（使用较少，不够清晰）

```xml
<!--c:就表示constructor，后面名字就是属性-->
<bean id="person2" class="testSpring.Person" c:age="21" c:str="abc">
</bean>
<!--p:表示property-->
<bean id="person2" class="testSpring.Person" p:age="21" p:str="chen" p:carList-ref="carList">
</bean>
```



spring自动配置注入

service和controller等不变的对象交给Spring管理

原理：反射获取controller对象中所有属性，然后根据属性名，寻找配置文件中对应的bean，找到后自动装配。

```xml
<bean id="userService" class="testSpring.UserService"></bean>
<bean id="userService2" class="testSpring.UserService"></bean>
<bean id="costService" class="testSpring.CostService"></bean>
<bean id="lifeService" class="testSpring.LifeService"></bean>

<!--一个一个属性装配还是麻烦，使用auto-wire智能装配，byName就是用属性名id去寻找bean-->
<bean id="allController" class="testSpring.AllController" auto-wire="byName"></bean>
```

byName：根据属性名作为id寻找bean

byType：用变量类型去寻找类型相同的的bean，如果有则注入

使用byType的风险：如果配置文件有两个类型相同的，就会报错，不知道往哪个bean注入，所以使用byType必须保证这个类型的bean只有一个。



bean对象创建时机

加载配置文件所有bean就会被加载，并且是单例的。类型相同，bean的id不同是不同的对象。

取消单例配置

```xml
<!--scope属性：singleton单例，prototype读取配置文件的时候不进行创建对象，使用的时候才开始创建-->
<bean id="test" class="testSpting.Test" scope="singleton"></bean>
```



bean模板

不允许使用自动注入的时候，多个contoller里使用到相同的service

原理：Spring的抽象与继承

```xml
<bean id="userService" class="testSpring.UserService"></bean>
<bean id="userService2" class="testSpring.UserService"></bean>
<bean id="costService" class="testSpring.CostService"></bean>
<bean id="lifeService" class="testSpring.LifeService"></bean>

<bean abstract="true" id="serviceTemplate" 
      p:userService-ref="userService"
      p:costService-ref="costService"
      p:lifeService-ref="lifeService"
      ></bean>

<bean id="aController" class="testSpring.AController" parent="serviceTemplate"></bean>
<bean id="bController" class="testSpring.BController" parent="serviceTemplate"></bean>
<bean id="cController" class="testSpring.CController" parent="serviceTemplate"></bean>
```



Spring引入外部配置文件

Spring可以将所有配置文件的key和value放入一个Map中，可以通过`${key}`方式取值

数据库db.properties文件

```properties
url="com.mysql.cj.jdbc.Driver"
username="root"
password="root"
```

spring-config.xml

```xml
<context:property-placehoolder location="classpath:db.properties"></context:property-placehoolder>
<bean id="JDBC" class="testSpring.JDBC">
	<property name="userName" value="${username}"></property>
    <property name="password" value="${password}"></property>
    <property name="url" value="${url}"></property>
</bean>
```



###### 1.1.6 EL表达式

支持基本的运算符，可以支持一些方法的调用

```xml
<bean id="car" class="testSpring.Car">
	<property name="name" value="#{'volvo'}"></property>
    <property name="price" value="#{100}"></property>
    <property name="nowPrice" value="#{99.8}"></property>
    <!--1 == 1-->
    <!--gt >,lt <,eq ==,le <=,ge >=,or ||,and &&,not !-->
    <property name="onSale" value="#{true}"></property>
    <property name="logo" value="#{benz}"></property>
    <property name="logoName" value="#{benz.logoName}"></property>
    <!--使用String的方法-->
    <property name="logoName" value="#{benz.logoName.toString().toUpperCase()}"></property>
    <!--使用java的类，T()表示要使用Java中的类-->
    <property name="circumference" value="#{2*T(java.lang.Math).PI*10}"></property>
</bean>

<bean id="benz" class="testSpring.Logo">
	<constructor-arg type="string" value="name"></constructor-arg>
</bean>
```

注意：`^`在Java中表示异或运算，在Spring中表示幂运算



###### 1.1.7 Spring的工厂



静态工厂

```java
public class StaticFactory {
    private static Map<String,Car> carMap = new HashMap<>();
    
    static {
        carMap.put("benchi",new Car("奔驰"));
        carMap.put("baoma",new Car("宝马"));
    }
    
    public static Car getCar (String name){
        return carMap.get(name);
    }
}
```

spring-config.xml配置

```xml
<bean id="staticFactory" class="testSpring.StaticFactory" factory-method="getCar">
    <construct-arg value="benchi"></construct-arg>
</bean>
```



动态工厂

```java
public class DynamicFactory {
    private Map<String,Car> carMap = new HashMap<>();
    
    public DynamicFactory () {
        carMap = new HashMap<>();
        carMap.put("benchi",new Car("奔驰"));
        carMap.put("baoma",new Car("宝马"));
    }
    
    public Car getCar (String name){
        return carMap.get(name);
    }
}
```

spring-config.xml配置

```xml
<bean id="dynamidFactory" class="testSpring.DynamicFactory"></bean>
<bean id="dynamicCar" factory-bean="dynamicFactory"></bean>
```



FactoryBean

Spring的规范约束（就是一个工厂的约束接口）

```java
@Getter
@Setter
public class CarFactoryBean implements FactoryBean<Car> {
    private String brand;
    
    //通过getBean方法获取bean的时候，Spring会自动调用getObject方法获得汽车
    @Override
    public Car getObject () throw Exception {
        return new Car(brand);
    }
    
    @Override
    public Class<?> getObjectType () {
        retun Car.class;
    }
    
    @Override
    public boolean isSingleton () {
        return false;
    }
}
```

spring-config.xml

```xml
<bean id="beanCar" class="testSpring.CarFactoryBean">
	<property name="brand" value="奥迪"></property>
</bean>
```

依赖注入：通过配置文件给对象注入值

控制反转：A本来依赖于B，现在A、B都依赖于Spring，A不再依赖B，控制都交给了Spring，称为控制反转



#### 2、注解配置Spring



spring-config.xml

```xml
<!--包扫描，扫描Spring注解-->
<context:coponent-scan base-package="controller,service"></context>
```



java代码

```java
@Component
public class Test {
    public void test () {
        System.out.prinln("hello world.");
    }
}

@Controller
public class TestController {
    //自动注入，前提是这个类的包会扫描，并且有Spring的注解
    @Autowired
    TestService service;
    
    public void test () {
        System.out.prinln("hello controller");
    }
}

@Service
public class TestService {
    
}

```

Spring中@Service、@Controller、@Component注解的作用是一样的，主要是给程序员分清层次的