### XML

<hr>



#### 1、XML

Extensible markup language可扩展标记语言



HTML：hyper text markup language

超级文本标记语言，出现语言的目的是，展示服务器发给浏览器的信息

浏览器根据这个规则解析语言，进行内容展示



##### 1、写法

文件后缀`.xml`，第一行写头信息

```xml
<?xml version="1.0" encoding="UTF-8">
```





##### 2、规则

+ 结构良好的：有规则，标签对应
+ 结构有效的：在良好结构基础上遵循很多规则（允许出现的标签和属性，标签名）



描述XML文件规则的两种格式：

.tld：tag definition library用来描述标签的

.dtd：document type definition文档类型描述

.xsd：xml schema definition描述XML文档内容

.xml：用来存储数据的文档



##### 3、基本写法

xml文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<school>
	<class>
    	<teacher></teacher>
        <student></student>
    </class>
</school>
```



###### （1）自定义DTD

（1）写在当前XML文件中

（2）写在外部文件中



```xml
<?xml version="1.0" encoding="UTF-8"?>
<!--根标记描述:描述根标记中的其它标记-->
<!Doctype school [
	<!--EMPTY表示空标签-->
	<!ELEMENT school (class*)>
	<!ELEMENT class (teacher,student*)>
	<!ELEMENT teacehr (age*,sex*)>
	<!ELEMENT student (age*,sex*)>
	<!--PCDATA可以被解析的字符数据，支持实体-->
	<!ELEMENT sex (#PCDATA)>
]>
<school>
	<class>
    	<teacher></teacher>
        <student></student>
        <student></student>
        <student></student>
    </class>
    <class>
    	<teacher></teacher>
        <student>
        	<sex></sex>
        </student>
        <student></student>
        <student></student>
    </class>
</school>
```



定义根标签：

```xml
<!Doctype school [
	定义根标签、子标签的内容和属性
]>
```



定义标签中的子标签：

```xml
<!--表示空标签-->
<!ELEMENT school (EMPTY)>

<!--表示子元素为class-->
<!ELEMENT school (class)>

<!--表示子元素为class、building都要有-->
<!ELEMENT school (class,building)>

<!--表示子元素为class（0个或以上）、building(1个或以上)都要有-->
<!ELEMENT school (class*,building+)>

<!--
	表示元素为sex，元素内没有标签，为可解析字符数据
	&gt;大于	&amp;与符号	&quot;双引号	
-->
<!ELEMENT sex (#PCDATA)>
```

`*`：0个或多个

`？`：0个或一个

`+`：1个或多个

`,`：都要有

`|`：多个标签中的其中一个



定义属性：

```xml
<!ATTLIST 标签名 属性名 类型 值>
<!ATTLIST school 
	必须有属性
	id CDATA #REQUIRED
	非必须属性
	name CDATA #IMPLIED
	默认值
	number CDATA "First Middle School"
>
```



描述实体：

```xml
<!ENTITY 实体名字 实体值>
<!ENTITY spring "this is spring">
<div>&spring;</div>
```



引入规则：

```xml
引入本地规则
<!Doctype school SYSTEM "myxml.dtd">
直接定义规则
<!Doctype school [
	<!ELEMENT school (class*)>
]>
引入网络上写好的规则
<!Doctype school PUBLIC "http://java.sun.com/dtd/web-app_2_3.dtd">
```



###### （2）解析XML文件内容

（1）DOM解析

Document Object Model树结构处理方式

优点：编程容易

缺点：必须将整个文档全部处理完毕



（2）SAX解析

Simple API For XML类似流媒体方式，基于事件方式的模式，根据事件触发一系列事件，不需要将所有文档处理

优点：解析快

缺点：编写麻烦，复用性不强



（3）JDOM

都需要导入外部jar包

Java-based Document Object Model 基于DOM方式，提升了性能

DOM4J（Document Object Model for Java） 基于JDOM方式，底层提升了性能

框架读取配置文件采用JDOM



XML文件

```xml
<!DOCTYPE school [
    <!ELEMENT school (class+) >
    <!ELEMENT class (teacher|student)*>
    <!ELEMENT teacher (name,age,sex)>
    <!ELEMENT student (name,age,sex)>
    <!ELEMENT name (#PCDATA)>
    <!ELEMENT age (#PCDATA)>
    <!ELEMENT sex (#PCDATA)>
        <!ATTLIST school
                id  CDATA #IMPLIED
                name CDATA #IMPLIED
        >
        <!ATTLIST class
                id  CDATA #IMPLIED
                name CDATA #IMPLIED
                >
        <!ATTLIST teacher
                id  CDATA #IMPLIED
                name CDATA #IMPLIED
                >
        <!ATTLIST student
                id  CDATA #IMPLIED
                name CDATA #IMPLIED
                >
 ] >

<school id="school" name="firstHighSchool">
    <class id="squad8" name="eight">
        <teacher>
            <name>朱庆元</name>
            <age>60</age>
            <sex>男</sex>
        </teacher>
        <student id="chenxiang">
            <name>陈祥</name>
            <age>27</age>
            <sex>男</sex>
        </student>
    </class>
    <class id="squad7" name="seven">
        <teacher>
            <name>朱敏敏</name>
            <age>18</age>
            <sex>女</sex>
        </teacher>
        <student id="chenxiang">
            <name>陈欢</name>
            <age>27</age>
            <sex>男</sex>
        </student>
    </class>
</school>
```



###### （3）采用DOM方式解析

```java
public class Dom {
    public static void main (String[] args){
        //需要一个工厂
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        //利用工厂创建工人
        DocumentBuilder builder = factory.newDocumentBuilder();
        //工人创建一个document对象
        Document doc = builder.parse("src/school.xml");
        //解析xml文件的3中方式
        Element school = doc.getDocumentElement();
        Element school = doc.getElementById("school");
        NodeList rootList = doc.getElementsByTagName("school");
        rootList.item(0);
        
        //获取属性
        String schoolId = school.getAttribute("id");
        String schoolName = school.getAttribute("name");
        
        //写入
        Element newClassElem = document.createElement("class");
        newClassElem.setAttribute("id","class6");
        school.append(newElement);
    }
}
```







###### （4）JDOM解析

jar包下载地址：http://www.jdom.org/downloads/index.html

```java
public class JDOM {
    public static void main (String[] args){
        SAXBuilder builder = new SAXBuilder();
        File file = new File("src/school.xml");
        //注意导包是jdom2下的Document
        Document document = builder.build(file);
        Element school = document.getRootElement();
        String id = school.getAttributeValue("id");
        String name = school.getAttributeValue("name");
        //获取子元素
        List<Element> list = school.getChildren("class");
        for(Elment elem : list){
            //获取子元素属性
            String className = elem.getAttributeValue("name");
            String classID = elem.getAttributeValue("id");
            //getChildText()获取子节点文本
        }
    }
}
```



###### （5）DOM4J解析

jar包下载地址：https://dom4j.github.io

```java
public class DOM4J {
    public static void main (String[] args){
        //创建一个解析对象
        SAXReader reader = new SAXReader();
        //提供一个文件
        File file = new File("src/myxml.xml");
        //注意是DOM4J下的Document类
        Document document = reader.read(file);
        Element school = document.getRootElement();
        String schoolId = school.attributeValue("id");
        String schoolName = school.attributeValue("name");
        //elementText()获取子节点文本
    }
}
```



详细学习上W3Cschool查找教程



#### 2、Session

##### （1）域对象特点

request	每次都new一个请求对象，没有引用被GC回收

*session	一次会话，周期是在浏览器和服务器没有断开连接过程中一直存在，每个用户都拥有一个

application	全局上下文，Java中的单例管理方式或者类中的static元素



##### （2）session的管理机制

（1）session对象是由Tomcat创建的

（2）session对象有多个，使用集合存储多个session对象

`Map<标识,HttpSession>`标识是一个唯一的由服务器分配的String字符串

标识存储在浏览器端，服务器需要将标识传递给浏览器

第一次请求没有标识，服务器解析请求，根据请求找资源，将响应信息返回给浏览器

响应信息：html内容+标识，浏览器解析响应信息，会将标识存起来，以后每次请求都会携带（标识保存在cookie上，返回时不在窗口显示，这个标识保存在cookie中，key：JSESSIONID）

（3）HttpSession中可以存取值的集合



#### 3、Cookie

##### （1）Cookie发展

+ 刚开始建立互联网的时候，不需要很多人浏览，没有互联网
+ 随着Internet发展，连接很多网络端的服务器
+ 访问者需要频繁与互联网中服务器进行交互
+ 这时候产生Cookie对象，用来保存用户的信息状态



##### （2）Cookie介绍

（1）Cookie在浏览器端存储，在浏览器关闭的时候会永久存储到本地

本地位置：`C:\Users\86180\AppData\Local\Google\Chrome\User Data\Default\Cookies`文件

（2）Cookies文件进行了加密，防止黑客获取电脑的Cookies文件，获取用户的信息

（3）Cookie在用户第一次访问服务器，服务器第一次响应时携带着Cookie信息返回给浏览器的

（4）可以通过控制台查看Cookie，可以设置Cookie是否永久保存到文件中

```java
JSESSIONID通过UUID.randomUUID()获取，并去掉了"-"的32位随机字符串
```



##### （3）服务器端Cookie使用

```java
public TestCookie extends HttpServlet {
    public void doGet (req,res) {
        //添加cookie
        Cookie cookie = new Cookie("test","helloworld");
        
        //默认设置是-1，会话结束就会消失，单位是秒
        cookie.setMaxAge(24*60*60);
        
        //获取cookie的域名
        cookie.getDomain();
        
        //种cookie
        cookie.setDomain("/");
        
        res.addCookie(cookie);
        
        //获取cookie
        Cookie[] cookies = req.getCookies();
        for(Cookie cookie : cookies){
            String cookieName = cookie.getName();
            String cookieValue = cookie.getValue();
			System.out.println(cookieName+":"+cookieValue);
		}
    }
}
```

注意：

Cookie中不能存在符号，否则都会报异常： `空格 [ ] ( ) = , " / ? @ : ;`



##### （4）浏览器端cookie使用

JavaScript只能看到我们设置的cookie的值，无法看到服务器默认设置的JSSIONID



##### （5）cookie使用demo

使用cookie做一个七天免登录小功能

（1）将username、password保存在cookie中，下次登录获取cookie的值直接进行登录

