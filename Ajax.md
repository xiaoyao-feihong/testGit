### 传智-Ajax

<hr>

##### 1、Ajax介绍

Ajax：asynchronous javascript and xml异步js和xml

同步和异步的区别：

同步：如果请求数据量太大，会出现空白页

异步：体验不中断，只会让页面局部刷新



Ajax发展：

+ 早期的时候JS技术不受重视，后来发现JS中XMLHttpRequest对象可以向服务器异步发送请求，所有实现功能不在需要都在服务器上（胖服务器）
+ 有了Ajax以后可以将部分代码代码写到写到客户端浏览器，还有flex（flash）技术也比较火，但是因为不支持手机端浏览器，后被淘汰
+ 最初使用XML作为数据传递的格式，后来出现更为小巧的数据格式JSON



XMLHttpRequest

属性：

+ readyState：XMLHttpRequest的状态

+ onreadystatechange：XMLHttpRequest状态改变的时候触发的一个函数
+ status：获得响应的状态码
+ responseText：获得响应的文本数据
+ responseXML：获得响应的XML数据

方法：

+ open：异步向服务器发送请求
+ send：发送请求
+ setRequestHeader：设置请求头



Ajax入门：

GET方式提交请求：

```html

<div id="div" style="width:300px;height:300px;border:1px solid skyblue;"></div>
<button id="btn"></button>
<script>
    var btn = document.getElementById("btn");
    btn.onclick = function () {
        var xhr = XMLHttpRequest();
        xhr.open("GET","",true);
        xhr.send(null);
        xhr.onreadystatechange = function () {
            if(this.readyState == 4 && this.status == 200){
               div.innerHTML = this.responseText;
            }
        }
    }
</script>

```

post提交方式：

```js
var xhr = new XMLHttpRequest();
xhr.open("post","/web/login");
//必须设置请求头，否则服务器端无法解析携带参数
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
xhr.onreadystatechange = function () {
    if(xhr.readyState === 4 && xhr.status === 200){
        console.log(xhr.responseText or response.responseXML)
    }
}
//携带参数的传送方法
xhr.send("name=chen&age=18");
```



Ajax入门的Servlet：

```java
public class DemoServlet extends HttpServlet {
    public void doGet (... request,... response){
        response.getWriter().println("请求发生成功");
    }
}
```



如何让Tomcat显示资源路径：

conf/web.xml修改属性`listings`的`<param-value>true</param-value>`



