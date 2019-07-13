### cookie

1、cookie介绍

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
  //删除cookie
  function removeCookie(name){
      setCookie(name,1,-1);
  }
  ```

  

