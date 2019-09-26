### Ajax基础

<hr>

##### 1、传统网站存在的问题

+ 网速慢的情况下，页面加载时间长，用户只能等待
+ 表单提交后，如果一项内容不合格，需要重写所有表单内容
+ 页面跳转，重新加载页面，造成资源浪费，增加用户等待时间



##### 2、Ajax概述

（1）Ajax描述：它是浏览器提供的一套方法，可以实现页面无刷新更新数据，提高用户浏览网站应用的体验。



（2）Ajax应用场景：

+ 页面上拉加载更多数据
+ 列表数据无刷新分页
+ 表单离开焦点数据验证
+ 搜索框提示文字下拉列表



（3）Ajax运行环境

​	Ajax技术需要运行在网站环境中才能生效



（4）Ajax运行原理

​	Ajax相当于浏览器发送请求与接收响应的代理人，以实现在不影响用户浏览页面的情况下，局部更新页面数据，从而提高用户体验。

​	原理图：

![](C:\Users\86180\Desktop\testGit\typoraImg\Ajax交互示意图.png)



（5）Ajax的实现步骤

客户端:

```js
//1.创建Ajax对象
var xhr = new XMLHttpRequest();
//2.告诉Ajax请求地址以继请求方式
xhr.open("get","https://www.baidu.com");
//3.发送请求
xhr.send();
//4.获取服务器端给客户端的响应数据
xhr.onload = function () {
    console.log(xhr.responseText);
}
```

服务器端：

```js
const express = require("express");
const path = require("path");
const app = express();
//将public文件夹作为静态资源
app.use(express.static(path.join(__dirname,'public')));
//处理请求
app.get("/first",(req,res) => {
    res.send("hello world");
})

app.listen(3000);
console.log("server is running at http://localhost:3000");
```



##### 3、同源策略

<font color="blue">1）目的：保证用户信息安全，防止恶意网站窃取数据。（如果没有同源策略，用户登录A网站后，继续访问B网站，这时B网站可以获取到A网站的cookie等存储信息，可以冒充A用户，获取A的相关数据）</font>



2）原理：浏览器为了确保安全，只允许Ajax向当前访问的服务器发送请求。Ajax可以向非同源的服务器发送请求，但是浏览器会拒绝接收响应数据。



3）同源：域名、协议、端口相同，即为同源



4）学习文档：<http://www.ruanyifeng.com/blog/2016/04/same-origin-policy.html>



5）跨域请求资源:

+ JSONP：利用`<script>`标签不受同源策略政策的限制

+ WebSocket：通信协议，以`ws://`和`wss://`作为协议前缀。该协议不实行同源政策，只要服务器支持，就可以 通过它来进行跨源通信。

+ CORS：跨域资源共享



​	CORS需要浏览器和服务器同时支持。目前，所有浏览器都支持该功能，IE浏览器不能低于IE10。

​	整个CORS通信过程，都是浏览器自动完成，不需要用户参与。对于开发者来说，CORS通信与同源的AJAX通信没有差别，代码完全一样。浏览器一旦发现AJAX请求跨源，就会自动添加一些附加的头信息，有时还会多出一次附加的请求，但用户不会有感觉。

​	因此，实现CORS通信的关键是服务器。只要服务器实现了CORS接口，就可以跨源通信。（本质是服务器之间的通信，获取目标服务器数据返回给用户）



6）RESTful风格的API

RESTful API：一套设置请求地址的规范

传统请求地址：

> GET http://www.example.com/getUsers //获取用户列表
>
> GET http://www.example.com/getUser/id=1 //获取id为1的用户
>
> GET http://www.example.com/modifyUser //修改用户信息
>
> GET http://www.example.com/deleteUser?id=8 //删除id为8的用户

缺点：语义不明

请求类型：

+ GET 获取数据
+ POST　添加数据
+ PUT　更新数据
+ DELETE　删除数据



RESTful API 实现

demo:

```js
//Restful 风格路由设计
const app = express();
app.get("/users/:id",(req,res) => {
    const id = req.params.id;
    do something;
});
app.delete("/users/:id",(req,res) => {
    do something;
});
app.put("/users/:id",(req,res) => {
    do something;
});
```



7）XML了解

客户端：

```js
var xhr = new XMLHttpRequest();
xhr.open("get","localhost:3000/xml");
xhr.send();
xhr.onload = function () {
    var xmlDocument = xhr.responseXML;
    var name = xmlDocument.getElementsByTagName("name")[0];
    console.log(name.innerHTML);
}
```

服务器端：

```js
const app = express();
app.get("/xml",(req,res) => {
    res.header("content-type","text/xml");
    String xmlStr = `<student>
			<name>chen</name>
			<age>28</age>
			<sex>male</sex>
			</student>`;
    res.send(xmlStr);
});
```

