### 会话技术

<hr>

##### 1、会话技术

主要是Cookie和Session

私有信息和购物信息保存在会话技术中



1）Cookie技术的使用

向浏览器保存数据

> 1、创建Cookie
>
> `new Cookie(String name,String value)`
>
> 2、添加Cookie（response对象的方法）
>
> `void addCookie(Cookie cookie)`



获得从浏览器带过来的Cookie

> 1、获取Cookie（request对象的方法）
>
> `Cookie[] request.getCookies()`



使用cookie实现欢迎用户登录，并记录上次访问时间

<font color="blue">Cookie默认生命周期是一次会话</font>

Cookie的常用方法：

> 1、获取Cookie的名称
>
> `String getName()`
>
> 2、获取Cookie的值
>
> `String getValue()`
>
> 3、设置Cookie的有效域名
>
> 网站特别大使用，比如www.baidu.com和`music.baidu.com`
>
> `setDomain()`
>
> 4、设置Cookie的有效路径
>
> 设置是为了方便删除
>
> `setPath(String path)`
>
> 5、设置Cookie的有效时间
>
> `setMaxAge(long time)`

Cookie分类：

+ 会话级别Cookie：默认Cookie，关闭浏览器就会销毁
+ 持久级别Cookie：可以设置Cookie的有效时间，关闭浏览器还会存在，需要手动删除（`Cookie setMaxAge(0)`）



```java
public class CountServlet extends HttpServlet {
    public void doGet (... request,... response){
        /*
        *获取浏览器中带过来的所有Cookie信息，从数组中查找有没有指定的Cookie
        *判断用户是否第一次访问：（是否有指定的cookie）
        *如果没有：欢迎登录，将登录时间存入到Cookie中
        *如果有：欢迎登录，将上次登录时间显示出来，并将当前时间保存
        */
        Cookie[] cookies = request.getCookies();
        Cookie cookie = CookieUtils.finCookie(cookies,"lastVisit");
        if(cookie == null){
            Cookie newCookie = new Cookie("lastVisit",""+System.currentTimeMillis());
            response.addCookie(newCookie);
        }else{
            Long l = Long.parseLong(cookie.getValue());
            Date d = new Date(l);
        }
    }
}

class CookieUtils {
    public static Cookie findCookie (Cookie cookies,String name){
        if(cookies != null){
            for(Cookie cookie : cookies){
                if(name.equals(cookie.getName())){
                    return cookie;
                }
            }
        }else{
            return null;
        }
    }
}
```



##### 2、如何利用Java发送邮件

导入mail-1.4.4.jar包

```java
public class Demo {
    {
        //创建对象
        Properties props = "";
        props.put("mail.transport.protocol","stmp");//发送邮件协议
        props.put("mail.smtp.host","stmp.qq.com");//发送邮件主机名
        props.put("mail.smtp.port","465");//端口
        //以下可以不设置
        props.put("mail.smtp.auth","true");//是否需要用户认证
        props.put("mail.smtp.ssl.enable","true");//设置密钥
        props.put("mail.debug","true");//设置调试
        
        Session session = Session.getInstance(props);
        MimeMessage message = new MimeMessage(session);
        
        //发送消息
        InternetAddress address = new InternetAddress("qqMail"); 
        message.setFrom(address);
        //MimeMessage.RecipientType.BCC密送 CC抄送 TO发送
        message.setRecipients(CC,new InternetAddress("minminQQMail"));
        //设置发送时间
        message.setSubject("我的主题：敏敏");
        message.setSentDate(new Date());
        
        //发送正文(字节型)
        message.setText("I love you,minmin");
        
        //发送附件，MimeMultipart 
        MimeBodyPart attach = new MimeBodyPart();
        DataHandler dh = new DataHandler(new FileDataSource("path"));
        attach.setDataHandler(dh);
        attach.setFileName(MimeUtility.encodeText(dh.getName()));
        //拼接容器
        MimeMultipart mp = new MimeMultipart();
        mp.addBodyPart();
        //保存设置
        message.saveChanges();
        
        //创建一个对象，负责发送
        Transport transport = session.getTransport();
        //创建连接，产生一个邮件的连接,需要一个认证,password是认证码
        transport.connect("QQMailAddress",password);
        tansport.senMessage(message,message.getAllRecipients());
        //关闭流
        transport.close();
    }
}
```

