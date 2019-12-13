### CSS、H5学习

##### 1、CSS网页的美容师

​	解决HTML添加样式的臃肿

​	CSS：cascading style sheet层叠样式表

##### 2、引入样式分类

根据书写方式划分：

（1）行内样式表（内联样式）

缺点：没有实现结构样式相分离

```html
<h1 style="color: pink; font-size: 18px;"></h1>
//注意属性间和冒号后用空格分开
```

（2）内部样式表

```html
<style>
    h1 {
        color: red;
    }
    选择器 {
        属性: 属性值;
    }
</style>
```

（3）外部样式表

优点：样式共享（base.css写公共样式）

```html
<link rel="stylesheet" href="./style.css"/>
```



##### 3、CSS选择器

<hr>

（1）选择器作用

用来将我们需要设置样式的标签选择出来

（2）基础选择器

+ 标签选择器

+ 类选择器

+ ID选择器

  

##### 4、CSS特性

<hr>

+ 继承性：子标签会继承父标签的某些样式
  
- 可以继承元素的样式：text-,font-,line-,以及color属性
  
+ 权重计算公式

  - 优先级(无论怎么叠加都不会进位)

| 选择器            | 计算权重公式 |
| ----------------- | ------------ |
| 继承与*（通配符） | 0.0.0.0      |
| 标签选择器        | 0.0.0.1      |
| 类，伪类选择器    | 0.0.1.0      |
| ID选择器          | 0.1.0.0      |
| 行内样式          | 1.0.0.0      |
| !important        | infinity     |

```html
<style>
    div #box2 {
        color: red;
    }
    #box1 div {
        color: green;
    }
</style>

<div id = "box1">
    <div id="box2">
        最后是什么颜色
    </div>
    //绿色，权重相同，样式后面覆盖前面
</div>
```



1）伪元素选择器：

| 选择符   | 介绍                 |
| -------- | -------------------- |
| ::before | 在元素前面插入内容   |
| ::after  | 在元素的后面插入内容 |

注意：

+ before和after必须有content属性

+ before在内容前面，after在内容后面

+ before和after创建的元素，默认属于行内元素

+ <font color="red">伪元素和标签选择器一样，权重为1</font>

+ dom里看不见，所以称为伪元素

  

<font color="blue">用途：伪元素常用于字体图标</font>

字体图标引入与使用：

1）网址：<https://icomoon.io/>

2）选择需要的图标，下载

3）项目中引入fonts文件夹和style.css

4）在我们需要使用字体图标的标签伪元素

```html
<!--引入下载文件下的css样式-->
<link rel="stylesheet" href="./style.css">
<style>
    @font-face {
            font-family: 'icomoon';
        	/*注意：fonts文件夹的路径*/
            src: url('fonts/icomoon.eot?57yble');
            src: url('fonts/icomoon.eot?57yble#iefix') format('embedded-opentype'),
                url('fonts/icomoon.ttf?57yble') format('truetype'),
                url('fonts/icomoon.woff?57yble') format('woff'),
                url('fonts/icomoon.svg?57yble#icomoon') format('svg');
            font-weight: normal;
            font-style: normal;
        }
    
   .demo:before {
            content: "\e900";
            font-family: "icomoon";
            color: #f40;
        }

   .demo1:before {
            content: "\ea3c";
            font-family: "icomoon";
            color: #e92322;
        }

    .demo2:before {
            content: "\ea40";
            font-family: "icomoon";
            color: lightseagreen;
        }

     span[class^=demo] {
            padding-right: 20px;
            background-color: lawngreen;
        }
</style>
    <span class="demo"></span>
    <span class="demo1"></span>
    <span class="demo2"></span>
```





##### 5、CSS布局相关属性与常见问题

<hr>

（1）布局的本质：

+ 首先利用CSS设置好盒子的大小，然后设置盒子的位置
+ 把网页的元素比如文字图片等等，放入盒子里



（2）盒子模型（Box Model）：

+ margin外边距,border边框,padding内边距

+ border含有的属性：
  - border-width边框宽度
  - border-style(dotted点阵,dashed虚线,solid实线)
  - border-color
  - border-top(left,right,bottom):2px solid red;指定上边框样式
  - 简写--> border: 1px solid red;

+ 单元格边框合并：
  - table,th,td {border-collapse:collapse;}

+ 内边距（padding）
  - 会撑开内容区
  - 顺时针 --> padding: 10px 20px 30px 40px;



（3）新浪导航栏：

```html
<style>
    .navbar {
            height: 40px;
            background-color: rgba(231, 227, 227, 0.884);
            border-top: 3px solid yellow;
            border-bottom: 1px solid gray;
        }

    .navbar a {
            color: #424242;
            text-decoration: none;
            display: inline-block;
            padding-left: 15px;
            height: 40px;
            line-height: 40px;
            padding: 0 10px;
        }

    .navbar a:hover {
            background-color: green;
        }
</style>

<div>
    <a>设为首页</a>
    <a>手机新浪网</a>
    <a>移动客户端</a>
    <a>博客</a>
    <a>微博</a>
    <a>关注我</a>
</div>
```

盒子大小=width+padding+border（内边距会撑开盒子，内容宽度减去padding）

**特殊情况**：如果没有宽度，padding不会撑开盒子（小技巧）

<font color="blue">注意：实际开发中重要导航栏，我们使用ul+li+a语义更清晰，一看就是有条理的列表型内容，如果直接使用a标签，搜索引擎会认为有堆砌关键字嫌疑，有降权风险，从而影响网站排名。（SEO优化技巧）</font>



（4）块级盒子居中

```css
//必须又宽度
div {
    width: 600px;
    height: 400px;
    margin: 100px auto;
}
```



（5）文字居中

```css
div{
    width: 100px;
    height: 100px;
    text-align: center;
    line-height: 100px;
}
//text-align：center;可以使文本类标签剧中
```



（6）插入图片和背景图片的使用场景

+ 产品展示我们使用插入图片
+ 图标，超大背景我们使用背景图片



（7）清除所有标签的默认内外边距

​	`*{margin:0;padding:0;}`

​	<font color="blue">注意：行内元素尽量不要设置上下外边距（设置了无效），只设置左右外边距</font>



（8）<font color="red">外边距合并（margin塌陷）</font>

​	**上下两个块级元素**的margin会使用外边距较大的盒子的为最终的盒子间距离；**嵌套的两个块级元素**也会发现合并的问题

​	1）解决上下块级元素外边距合并办法

​	只给其中一个一个元素设置外边距

​	2）解决嵌套的块级元素外边距合并的问题

​	solution one：给父元素指定一个上边框

​	solution two：给元素指定一个上内边距

​	solution three：给父元素设置overflow:hidden;（触发BFC）

​	3）布局优先性：width > padding > margin

​	

##### 6、CSS布局的三种机制

<hr>

###### （1）**标准流**

+ 块级元素会独占一行，从上向下排序

  - 常见块级元素：div,hr,ul,li,ol,form,table等

+ 行内元素，按照从左到右排序，碰到父元素边缘自动换行

  - 常见行内元素：span,input,a,strong,i等
  - 行级块元素：有默认的缝隙，难计算，去除间隙的浏览器兼容性也不好
    - 给父元素添加font-size:0去除缝隙

  

###### （2）**浮动流**

​	1）什么是浮动：脱离标准流，移动到指定位置，实现盒子左右对齐等

​	特性：

+ 漂浮在标准流之上（脱标）

+ 添加浮动的元素相当于转化为inline-block（但是没有缝隙）

+ <font color="blue">注意：</font>
  - **如果父级元素宽度不够，浮动的子元素会换行**
  - **要用标准流的父级，防止破坏浮动破坏原本布局**

+ 浮动盒子与父盒子的关系：不会占有border和padding的位置

+ 浮动元素只会影响后面盒子的布局，不会影响前面的标准流盒子布局




###### （3）**定位**

​	通过边偏移移动位置（top,bottom,right,left）

​	1）`static`静态定位，元素默认的定位方式，没有边偏移，以标准流形式呈现

​	2）`relative`相对定位

​		one:相对于原来位置进行定位

​		two:保留原来的位置，继续占有原来位置

​		three:后面的盒子还是以标准流方式对待它

​	图片展示：

![](C:\Users\86180\Desktop\img\相对定位.jpg)

​	3）`absolute`，如果父级没有定位，向上找有定位的上级元素进行定位，都无定位则以文档元素（浏览器左上角）为父级进行定位；父亲有absolute，relative定位，以父级为准进行定位（子绝父相）。不保留位置，脱离标准流。

​	4）`fixed`固定定位，与父级没任何关系，相对于浏览器可视窗口进行定位的。完全脱标，不占位置。

​	5）定位的扩展

​	<font color="blue">绝对定位的盒子居中对齐：子绝父相，left,top设置50%，margin根据绝对定位盒子的宽高的一半设置为赋值</font>

```html
<style>
    .demo {
        height: 300px;
        width: 500px;
        margin: auto;
        position: relative;
        background-color: black;
    }
    .center {
        height: 50px;
        width: 50px;
        background-color: pink;
        position: absolute;
        left: 50%;
        margin-left: -25px;
        top: 50%;
        margin-top: -25px;
    }
</style>

<div class"demo">
	<div class="center"></div>
</div>
```



​	6）堆叠顺序：

​	绝对定位和固定定位的盒子通过`z-index`的值的大小决定堆叠顺序。



​	7）切换模式：

​	`display`显示模式

​	`inline-block`元素，不给width宽度为默认内容的宽度

​	`float`浮动默认转化为行内块

​	绝对定位、固定定位也和浮动类似，默认转换特性为行内块

​	<font color="blue">tip:一个行内的盒子，如果加了浮动、固定定位、绝对定位，不用转换，可以直接给宽高</font>

​	

​	8）解决外边距合并问题

​	margin塌陷只是针对于标准流的的父子级元素

​	**浮动元素，绝对定位，固定定位的元素都不会触发外边距合并的问题**

​	**`overflow:hidden;`**解决外边距合并问题



##### 7、**清除浮动** 

<hr/>

######   (1)为什么要清除浮动

  answer：实际开发中很多情况父级元素不适合给高度，让子盒子撑开父级比较合理。

  

######   (2)**<font color="red">清除浮动方式</font>**

  本质：父级没有高度，子级浮动，导致父级无法撑开

  **1）额外标签法**

  ```html
  <style>
      * {
          margin:0;
          padding:0;
      }
      .father{
          width: 400px;
          border: 1px soild red;
      }
      .son1,.son2{
          float:left;
          height: 200px;
          width: 100px;
      }
      .clear{
          clear: both;
      }
  </style>
  
  <div class="father">
      <div class="son1"></div>
      <div class="son2"></div>
      <div class="clear"></div>
  </div>
  ```

  **2）触发BFC**

  > 可以给父级添加：
  >
  > overflow:hidden|auto|scroll;
  >
  > 局限性，当文字太多或内容太多导致溢出部分隐藏

  **3）伪元素清除法**

  ```html
  <style>
      .clearfix:after{
          content: "";
          display: block;
          visibility: hidden;
          clear: both;
      }
      //解决IE6，7的清除浮动问题
      .clearfix {
          *zoom: 1;
      }
      .father{
          width: 400px;
          border: 1px soild red;
      }
      .son1,.son2{
          float:left;
          height: 200px;
          width: 100px;
      }
      .nextElem{
          height: 40px;
          width: 400px;
      }
  </style>
  
  <div class="father clearfix">
      <div class="son1"></div>
      <div class="son2"></div>
  </div>
  <div class="nextElem"></div>
  ```

  **4）双尾元素清除浮动**

  ```html
  <style>
      .clearfix:before,.clearfix:after{
          content: "";
          display: table;
      }
      .clearfix:after{
          clear:both;
      }
      //解决IE6，7的清除浮动问题
      .clearfix {
          *zoom: 1;
      }
      .father{
          width: 400px;
          border: 1px soild red;
      }
      .son1,.son2{
          float:left;
          height: 200px;
          width: 100px;
      }
      .nextElem{
          height: 40px;
          width: 400px;
      }
  </style>
  
  <div class="father clearfix">
      <div class="son1"></div>
      <div class="son2"></div>
  </div>
  <div class="nextElem"></div>
  ```

  

##### 8、H5新增语义化标签

（1）新增语义化标签：便于搜索引擎更清楚的知道语义

​	移动端为了更好的语义化，可以大量使用；PC端IE９无法识别，需要处理

+ `<header>`头部标签
+ `<nav>`导航栏标签
+ `<article>`内容标签
+ `<section>`模块标签
+ `<aside>`侧边栏标签
+ `<footer>`底部标签



IE9处理：

```html
<style>
	header,nav,section,article,section,aside,footer {
        height: 120px;
        display: block;
	}
</style>
```



（2）多媒体标签

​	1）`<audio>`音频标签

​	支持格式与浏览器支持情况：

| 浏览器/格式 | Ogg Vorbis | MP3  | Wav  |
| :---------: | :--------: | :--: | :--: |
|     IE9     |            | yes  |      |
| Firefox3.5  |    yes     |      | yes  |
|  Opera10.5  |    yes     |      | yes  |
|  Chrome3.0  |    yes     | yes  |      |
|  Safari3.0  |            | yes  | yes  |



​	音频标签属性和使用

+ `autoplay`值autoplay（谷歌禁用了自动播放功能）
+ `controls`值controls
+ `loop`值loop
+ `src`值为路径名

```html
<audio src="./demo.mp3" controls="controls"></audio>
```



​	不同浏览器支持的浏览器格式不同，所以要准备多个音频格式

```html
<audio>
	<source src="./snow.mp3"/ type="audio/mpeg">
    <source src="./snow.mp3"/ type="audio/ogg">
    您的浏览器版本太低，请尽快升级。
</audio>
```



​	2）`<video>`视频标签

​	HTML5支持Ogg,MPEG4,WebM格式,属性：

+ `autoplay`自动播放
+ `muted`自动静音播放
+ `loop`循环播放
+ `poster`加载等待的画面
+ `preload`是否预加载视频（如果有了autoplay就会忽略该属性）	

```html
<video src="./demo.mp4" controls autoplay> 
	<source src="./snow.mp4"/ type="video/mp4">
    <source src="./snow.ogg"/ type="video/ogg">	
</video>
```



​	3）新增表单，表单属性，移动端大量使用

+ `type=email`邮箱

+ `type=url`网址

+ `type=date`日期

+ `type=time`时间

+ `type=month`月份

+ `type=week`周

+ `type=number`数字

+ `type=tel`手机号

+ `type=search`搜索

+ `type=color`颜色

​	

​	新增表单属性：

  + `required`不能为空
  + `placeholder`占位文字
  + `autofocus`自动聚焦
  + `autocomplete`值`off/on`文字提示功能
  + `mupltiple`允许提交多个文件