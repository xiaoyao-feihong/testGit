### Cookie和存储

##### 1、cookie介绍

+ 作用：用来保存信息，比如自动登录，记住用户名
+ 特性：
  - 同一个网站中所有的页面共享一套cookie
  - 数量大小有限
  - 过期时间

+ JavaScript中使用cookie
  
- document.cookie
  
+ cookie就是document的一个属性，在cookie上=号是添加

  ```js
  document.cookie = "name=chen";
  document.cookie = "age=18";
  var oDate = new Date();
  oDate.setDate(oDate.getDate()+365);
  //设置过期时间
  document.cookie = "user=blue;expires=" + oDate;
  //封装设置cookie的函数
  function setCookie (name,value,iDay){
      var oDate = new Date();
      oDate.setDate(oDate.getDate()+iDay);
      document.cookie = name + '=' + value + ';expires=' + oDate;
  }
  //获取cookie
  function gerCookie (name) {
      var arr = document.cookie.split(";");
      var newArr = arr.filter(item => item.split("=")[1]==name);
      if(newArr.length!=0)return newArr[0].split("=")[1];
  	return null; 
  }
  //删除cookie,设置负数
  function removeCookie(name){
      setCookie(name,1,-1);
  }
  ```

  
  
##### 2、sessionStorage

  sessionStorage用于本地存储一个会话（session）中的数据，这些数据只有在同一个会话中的页面才能访问

  并且当会话结束后数据也随之销毁。因此sessionStorage不是一种持久化的本地存储，仅仅是会话级别的存储。

  只允许同一窗口访问。

  

3、sessionStorage

localStorage用于持久化的本地存储，除非主动删除数据，否则数据是永远不会过期的。同源可以读取并修改localStorage数据。

```html
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<script>
    //setItem存储value
    localStorage.setItem("name", "徐同保");
    localStorage.setItem("job", "web前端");

    //getItem获取value
    var name = localStorage.getItem('name');
    var job = localStorage.getItem('job');
    console.log('姓名：' + name);
    console.log('职业：' + job);

    //removeItem删除key
    localStorage.removeItem('name');
    var name = localStorage.getItem('name');
    var job = localStorage.getItem('job');
    console.log('姓名：' + name);
    console.log('职业：' + job);

    //clear清除所有的key/value
    localStorage.clear();
    
    //删除特定的键
    localStorage.removeItem('name');
    
    var name = localStorage.getItem('name');
    var job = localStorage.getItem('job');
    console.log('姓名：' + name);
    console.log('职业：' + job);
</script>
</body>
</html>
```



4、查看浏览器编码方式

```js
//Edge
document.characterSet;//默认utf-8
document.charset;

//chrome
document.characterSet;//默认UTF-8
document.charset;
```

