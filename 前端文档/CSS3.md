### CSS3

##### 1、2D转换

​	（1）transform

​	`translate(x,y)`位移

​	translateX(),translateY(),translateZ()三个坐标方向的位移

​	单位可以百分比，以盒子的宽度进行计算

​	垂直居中：

```css
.father{
    height: 300px;
    width: 500px;
    margin: auto;
    position: relative;
}

.son {
    position: absolute;
    height: 50px;
    width: 50px;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
}
```



​	

​	（2）`rotate`旋转 

​	旋转中心点：`transform-origin: x y;`

​	默认旋转中心点为50%,50%（left,right,bottom,top,center）



​	（3）`transfrom:scale(x,y);`缩放

​	参数x,y不加单位为倍数；只写一个参数宽高同时缩放；小于1表示缩小；优势:不影响其它盒子，默认以中心点缩放。

​	也可以设置缩放中心点，以中心点进行延伸

​	流行的缩放功能制作：

```html
<style>
    div {
        height: 300px;
        width: 300px;
        overflow: hidden;
    }
    
    div img {
        transition: all 0.4s;
    }
    
    div img:hover {
		transform: scale(1.1);
    }
</style>

<div>
    <a href="#"><img src="./bg.jpg"></a>
</div>
```



​	（4）2D转换综合写法

​	`ransform: translate() rotate() scale...;`综合写法

​	<font color="red">注意：</font>

​	1、顺序会影响转换的效果

​	2、同时又位移和旋转操作的时候，注意位移在前面（旋转操作会先旋转坐标，然后进行位移操作）



##### 2、