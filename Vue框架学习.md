## Vue框架学习

### 一、准备工作

#### 1、下载vue-devtools

​	1）使用`git clone https://github.com/vuejs/vue-devtools`下载到桌面

​		下载完成后在当前文件夹下：`cnpm install`

​		在vue-devtools/shells/chrome下找到mainfest.json文件打开，并将persistent的值改为true

​		运行指令： `npm run build`否则chrome会报无法加载背景脚本“build/background.js”错误

​		将chrome文件夹拖入浏览器扩展程序中就可以

​		作用：在谷歌浏览器中添加扩展程序后，会提示网站是否基于Vue构建，并且控制台有Vue调试工具

​		在用户设置中添加配置代码，使VS code可以将vue文件转化为html格式文件

```json
"emmet.syntaxProfiles": {
        "vue-html": "html",
        "vue": "html"
    },
"emmet.includeLanguages": {
        "vue-html": "html",
        "vue": "html"
    }
```

​	2）VS code中下载扩展：

​		auto close tag：自动闭合标签

​		auto complete tag：自动补全标签

​		auto rename tag：自动更改标签变化（头部变化，尾部自动变化）

​		live server：Ctrl + Shift + P键点击open with live server 后，文件保存后，浏览器会自动更新文件变化

​		Vetur：语法高亮等调试工具

### 二、Vue学习

#### （一）为什么学习Vue

​	1、传统web开发模式：前端根据设计图写出设计页面，后端一边写页面一边根据url拼接页面，导致前后端工作分配不均

​	2、库和框架

​		1）库：方法的集合

​		2）框架：框架是针对某类业务提供整套的解决方案，并定义了一套规范，开发者必须遵照规范去使用

​		3）MVVM（Vue是基于该设计模式的，但不完全遵循）的框架：view(视图模型)、viewModel（监听）、model（对象）

​		4）解决传统操作DOM的弊端

​			Google：Angular

​			Facebook：React

​			尤雨溪：Vue

#### （二）vue基本用法

##### 	1、vue+tab键补全方式：

​		Ctrl + Shift + P 键输入snip后选择用户代码片段，然后输入html + 回车键，将一下代码复制粘贴到html.json文件中，就能使用vue快速补全，会自动引入库文件，并创建vue实例

```json
{
/*
	// Place your snippets for HTML here. Each snippet is defined under a snippet name and has a prefix, body and 
	// description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
	// $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the 
	// same ids are connected.
	// Example:
	"Print to console": {
		"prefix": "log",
		"body": [
			"console.log('$1');",
			"$2"
		],
		"description": "Log output to console"
	}
*/
"Vue": {
        "prefix": "vue",
        "body": [
            "<!DOCTYPE html>",
            "<html lang=\"en\">",
            "\t<head>",
            "\t\t<title>$1</title>",
            "\t\t<meta charset=\"UTF-8\">",
            "\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">",
            "\t\t<script src=\"./vue2.js\"></script>",
            "\t</head>",
						"\t<body>",
						"\t\t<div id=\"app\"></div>",
						"\t\t<script>",
						"\t\t\tvar vm = new Vue({",
						"\t\t\t\tel: '#app',",
						"\t\t\t\tdata: {",
						"",
						"\t\t\t\t}",
						"\t\t\t})",
						"\t\t</script>",
						"\t</body>",
            "</html>"
        ],
        "description": "vue - Defines a template for a vue & html5 document"
    }
}
```

​		vue + tab生成的页面：

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="./vue2.js"></script>
    </head>
    <body>
        <div id="app"></div>
        <script>
            var vm = new Vue({
                el: '#app',
                data: {
                    
                }
            })
        </script>
    </body>
</html>
```

##### 	2、插值表达式渲染(用于标签innerHTML区)

```html
<div id="app">
   <!-- 插值表达式 -->
   <!-- 字符串拼接 -->
   <p>{{'姓名:' + name}}</p>
   <!-- 数学运算 -->
   <p>{{age + 1}}</p>
    <p>{{name.split('').reverse().join('')}}</p>
   <!-- 可以使用三元运算符，但是不能用if...else... -->
   <p>{{age > 18 ? 'adult' : 'teen'}}</p>
</div>
<script>
   var vm = new Vue({
             el: '#app',
             data: {
             name: 'jack',
             age: 20
                }
            })
</script>
```

##### 	3、<font color="red">**基本指令**</font>

​		使用指令渲染（用于标签内部属性区）

​		**`v-`**开头表示指令

​		1）**`v-text`**:用来渲染文本，指令功能就是增强html标签的功能，在标签属性位置上写v-text='属性名'，会将属性值转义渲染

​		2）**`v-html`**：会将属性值不转义渲染，标签可以渲染出来，缺点见下面文档。

```html
<div id="app">
    <div v-text="name">
        <!-- 会将name值渲染在这里，不会渲染带标签的文本，v-html则可以识别标签 -->
        <!-- 网站上动态渲染任意html内容是非常危险的，因为容易导致XSS攻击。只在可信内容上使用v-html，不要用在用户提交的内容上 -->
        <!-- 输出<p>jack</p> -->+
    </div>
    <div v-html="name">
        <!-- 输出jack -->
    </div>
</div>
<script>
    var vm = new Vue({
        el: '#app',
        data: {
            name: '<p>jack</p>'
        }
    })
</script>
```

​	3）**`v-bind`**：可以用来动态绑定属性，v-bind:属性名="data里的属性"，简写方:src="data里的属性"，可以绑定任意属性

```html
<div id="app">
    <img v-bind:src="avatar"></img>
		<!-- 下面为推荐写法 -->
	<img :src="avatar"></img>
	<a :href="'del.php?id='+id"></a>
	<p :class="{'类名':布尔值}"></p>
	<p :class="{'red-font': age > 18}"></p>
</div>
<script>
    var vm = new Vue({
        el: '#app',
        data: {
            name: '<p>jack</p>',
            avatar: './avatar.jpg',
            id: 11,
            age: 20
        }
    })
</script>
```

​	4）**`v-for`**：渲染数组和对象

```html
<div id="app">
    <!-- 数组只获取值写法 -->
   <ul>
       <li v-for="item in user">
       		{{item.name}}:{{item.age}}
       </li>
    </ul>
    <!-- 数组获取值和索引的写法 -->
    <ul>
       <li v-for="(item,index) in user">
  			{{index}}-->{{item.name}}:{{item.age}}
       </li>
    </ul>
    <!-- 获取对象属性的写法 -->
    <p v-for="(val,key,index) in obj">
        {{key}}:{{val.name}}-->{{index}}
        <!-- 输出：ali:jack ma 0... -->
    </p>
</div>
<script>
    var vm = new Vue({
        el: '#app',
        data: {
            user: [
                {name:'jack',age:12},
                {name:'rose',age:20},
                {name:'jim',age:30}}
            ],
            obj: {
                "ali":{name: 'jack ma'},"baidu":{name:'bruce li'},'tencent':{name:'jason ma'}           	
            }
        }
    })
</script>
```

​		*注意*：

​		1）使用数组的length属性不会触发视图更新

​		2）使用数组的下标方式去改变数组不会出发视图更新

​		3）使用v-for必须结合key属性来使用，它会唯一标识数组中的每一项，当每一项更新的时候，只更新每一项内容，而不会整个视图更新

​		4）ESlint不写key会报错

```html
<p v-for="(item,index) in user":key="index"></p>
```

​		*解决*：

​		1)使用Vue.set(vm.user,0,{name:'haha',age:23})	

​		2）vm.user.splice(0,1)

​	5）**`v-model`**：用来双向数据绑定，model和view的值同步变化，只能在input,textarea,select标签中使用，用在其他标签会报错

```html
<input v-model="name">
```

​	6）**`v-on`**：事件绑定

```html
<div id="app">
            <h1>{{name}}</h1>
            <button v-on:click="showName"></button>
            <!-- v-on简写形式 -->
            <button @click="showName"></button>
            <!-- 传参 -->
            <button @click="showNameByArg('heima')"></button>
            <!-- 通过$event传事件对象 -->
            <button @click="getEventObj($event)"></button>
            <!-- 
				通过$event传进时间源对象
                事件修饰符:
                1、@click.stop 阻止冒泡事件
                2、@click.prevent 阻止默认事件 
                按键相关的事件添加按键修饰符:
                1、@keyup.13="submit"
             -->
</div>
        <script>
            var vm = new Vue({
                el: '#app',
                data: {
                    name: 'jack'
                },
                metods: {
                    showName(){
                        // this标识vue实例
                        this.name = 'feihong'
                    },
                    showNameByArg(arg){
                        this.name = arg
                    },
                    getEventObj(e){
                        e.preventDefault()
                    }
                }
            })
        </script>
```

​	7）**`v-if`**和**`v-show`**：控制页面内的元素的显示与隐藏，v-if=“布尔值”，v-show=“布尔值”,区别v-if通过控制DOM来控制显示隐藏，v-show通过样式控制显示与隐藏

​	使用场景：

​	1、设计到大量DOM操作的时候，我们使用v-show

​	2、涉及到异步数据渲染的时候用v-if

​	3、`v-if`补充：可以和`v-else`、`v-else-if`配合使用

```html
<div id="app">
   <div v-if="type === 'A'"> A </div>
   <div v-else-if="type === 'B'"> B </div>
   <div v-else="type === 'C'"> C </div>
</div>
<script>
    var vm = new Vue({
        el: "#app",
        data: {
            type: 'C'
        }
    })
</script>
```

​	8）**`v-cloak`**：因为vue的js文件比较大，所以页面加载的时候可能出现闪烁，加上v-cloak可以避免闪烁，vue实例加载结束后会自动删除v-cloak

```html
<style>
    /* first */
    [v-cloak]{
        display: none;
    }
</style>
	<!-- second -->
<div id="app" v-cloak>
    {{message}}
</div>
<script>
    var vm = new Vue({
        el:"#app",
        data: {
            message: "hello world"
        }
    })
</script>
```

​	9）`mounted`：钩子函数，表示一加载进来就执行函数里面的内容(和window.onload类似)，不能写在methods里面

```javascript
//自动聚焦的功能
<input type="text" ref="refId">
var vm = new Vue({
    mounted () {
        //Vue通过this.$refs获取DOM元素
        console.log(this.$refs.refId)
        refId.focus()
    }
})
```

​	10）通过自定义指令自动获取焦点

```html
//自定义指令通过Vue.directive()创建，包含两个参数，一个是自定义指令的名称，可以随便取，但是全部小写；另一个是一个对象，表示自定义指令的配置项。
<input type="text" v-myfocus>
<input type="text" v-mycolor="color">
 <script>
	Vue.directive('myfocus',{
    //inserted钩子函数，检测到自定义指令插入的标签就会执行inserted中的钩子函数
    //inserted钩子函数有两个参数(el,binding),el表示使用指令的元素，binding表示自定义指令的信息
    //可以多个标签使用
    inserted(el,binding){
        console.log(el)
        console.log(binding)
        el.focus()
    } 
})
     Vue.directive('mycolor',{
         inserted(el,binding){
             el.style.color = binding.value
         }
     })
     var vm = new Vue({
         el: '#app',
         data: {
             color: 'red'
         }
     })
</script>

```

​	11）过滤功能Vue.filter(过滤器名，函数)

​	字符串的**padStart(指定字符串长度，不够在字符串前面填充的字符)**方法：

​	用法：`var month = (new Date().getMonth() + 1).toString().padStart(2,'0')`

```html
<ul>
    <li v-for="item in list">
    	<span>{{item.id}}</span>
        <span>{{itme.ctime | formatTime('/')}}</span>
    </li>
</ul>

<script>
    //通过Vue.filter()方法创建过滤器，它含有两个参数：第一个参数是过滤器的名字，第二个参数是过滤器的处理函数，表示需要过滤的数据
    //创建一个时间过滤器
   //注意第一个参数为item.ctime，第二个参数才是我们的传参
    Vue.filter('formatDate',function(time,sep){
            var y = time.getFullYear()
            var m = (time.getMonth() + 1).toString().padStart(2,'0')
            var d = time.getDate().toString().padStart(2,'0')
            return y + sep + m + sep + d;
        })
        //输出2019/02/18

    var vm = new Vue({
        el: '#app',
        data: {
            list: [{
                id: 1,
                ctime: new Date()
            },
         	{
                 id:2,
                 ctime: new Date()
        	}]
        }
    })
</script>
```

​	12）`computed`：计算属性是根据data中已有的属性，计算得到一个新的属性，基于他们的依赖进行缓存，以后继续使用会从缓存中获取，提升性能明显

```javascript
<div id="app">
 	<h1>{{fullName}}</h1>   
</div>
var vm = new Vue({
    el: '#app',
    data: {
        firstName: 'Ma',
        lastName: 'Jack'
    },
    computed: {
        fullName () {
            return this.firstName + this.lastName;
        }
    }
})
```

​	13）`watch`：监听器，用来监听data中数据的变化，data中数据一变化，它就能执行响应的函数(不能监听对象)

​	开发时能用`computed`做到的就用`computed`

​	需要执行异步操作的时候，就要用到watch

```html
<div id="app">
 	firstName: <input type="text" v-model="firstName">
     lastName: <input type="text" v-model="lastName">
    <hr>
    <h1>computed show</h1>
    <div>{{fullName}}</div>
    <hr>
    <h1>watch show</h1>
    <div>{{fullName}}</div> 
</div>
<script>
	var vm = new Vue({
    el: '#app',
    data: {
        firstName: 'Ma',
        lastName: 'Jack',
        watchFullName: ''
    },
    computed: {
        fullName () {
            return this.firstName + this.lastName;
        }
    },
    //包含两个参数newVal,oldVal
    watch: { 
        firstName (newVal,oldVal){
            this.watchFullName = newVal +  this.lastName;
        },
        lastName (newVal,oldVal){
           this.watchFullName = this.firstName + newVal; 
        }
    }
})
</script>

```

​	14）深度监听：可以用于监听对象

```html
<div id="app">
    <input type='text' v-model='use.name'>
</div>
<script>
    var vm = new Vue({
        el: '#app',
        data: {
            user: {
                name: 'jack'
            }
        },
        watch: {
            user:{
                //深度监听函数
                handler(newVal){
                   console.log(newVal) 
                },
                //深度监听
                deep: true
            }
            }
    })
</script>
```

##### 4、Vue发送请求推荐第三方库axios

​	1、axios基于promise的API

​	2、axios的get请求

```html
<script src="./vue2.js"></script>
<script src="./axios.js"></script>
<div id="app"></div>
<script>
    var vm = new Vue({
        el: '#app',
        data: {},
        mounted(){ 
            axios.get('http://127.0.0.1:3000/api/getProductList')
            .then(res => {
                console.log(res.data)
            })
            .catch(err => {
                console.log(err)
            })
        }
    })
</script>
```

​	3、axios的post请求

```html
<script>
    var vm = new Vue({
        el: '#app',
        data: {},
        mounted(){     
            axios.post('http://127.0.0.1:3000/api/getProductList',{
            name: 'Nike'
        })
            .then(res => {
            console.log(res.data)
        }) 
            .catch(err => {
            console.log(err)
        })
        }
    })
</script>
```

​	4、基于Vue的插件：`vue-resource`，官方已经不推荐使用

```html
<script src="./vue-resource.js"></script>
<script>
    var vm = new Vue({
    	el: "#app",
    	data: {},
        mounted(){
            this.$http.jsonp('url')
                .then(res => {
                console.log(res.body)
            },err => {
                console.log(err)
            })
        }
    })
</script>
```

​	JSONP：浏览器同源策略，域名，协议，端口不同就不让访问

​	5、axios不支持JSONP跨域，视频案例中后台设置了

```html
Access-Control-Allow-Methods: *（允许所有方法获取数据）
Access-Control-Allow-Origin: *（允许所有来源）
```

##### 5、Vue的动画

​	1、过渡的类名

​	过渡的开始状态

​	`.slide-enter`、`.slide-enter-active`、`.slide-enter-to`

​	过渡结束的状态

​	`.slide-leave`、`.slide-leave-active`、`.slide-leave-to`

​	2、Vue配合使用animate.css，具体样式见官方文档

​	3、JavaScript钩子：可以给过渡效果添加事件，详情见官方文档

```html
<div id="app">
        <transition v-on:before-enter="beforeEnter" v-on:enter="enter" v-on:after-enter="afterEnter"
            v-on:before-leave="beforeLeave" v-on:leave="leave" v-on:after-leave="afterLeave">
            <div v-if="isShow">feihong</div>
        </transition>
        <button @click="isShow = !isShow">click to show animation</button>
    </div>
    <script>
        var vm = new Vue({
            el: '#app',
            data: {
                isShow: true
            },
            methods: {
                beforeEnter(el) {
                    // console.log(el)
                    // console.log('beforeEnter')
                    el.style.paddingLeft = '100px'
                },
                //动画结束后一定要调用done函数，否则会出错
                enter(el, done) {
                    var step = 1;
                    var timer = setInterval(() => {
                        step++;
                        el.style.paddingLeft = (100 - step) + 'px';
                        if(step === 100){
                            clearInterval(timer)
                            done()
                        }
                    },5)
                    done()
                },
                afterEnter(el) {
                    el.style.color = 'red'
                },
                beforeLeave(el) {
                    console.log('beforeLeave')
                },
                leave(el, done) {
                    console.log('leave')
                    done()
                },
                afterLeave(el) {
                    console.log('afterLeave')
                }
            }
        })
    </script>
```

​	4、websocket是网页端实时通信

​	手机实时通信，视频通话，聊天（安卓自己的实时通信方式），IOS也有自己的实时通信方式

```javascript
//服务器端websocket实现
//node实现方法：推荐Socket.IO（提供服务器端和客户端实现)
//在线demo,socket.io/demos/chat
//npm i socket.io 安装
//包里有socket.io.js（加载模块的时候会自动托管socket_client目录下的文件，所以不需要我们自己设置静态资源）
const io = require('socket.io')(http)
io.on('connection',socket => {
	console.log('a user connected')
})
//客户端发送消息，socket.emit('test',hello')
//服务器端接收，socket.on('test',msg => {
//console.log(msg)
//})
//服务器端发送消息
socket.emit('test','world')
//服务器端接受一样
//给所有的连接的客户端发送消息
io.emit('chat mesage','welcome')
客户端接收消息 io.on('chat message',msg => {
    console.log(msg)
})
socket.broadcast.emit('hi')排除当前客户端给所有其他客户端发送消息
```

##### 6、Vue组件

​	1、组件开发好处

​		1）封装功能性代码，提升开发效率

​		2）便于团队分工

​	2、组件的创建有三种方式

​	1）使用Vue.extend()和Vue.component()

​		Vue.extend函数会返回一个组件的构造器，里面包含一个参数，为一个对象，里面包含一些配置项。

​		Vue.component()函数会利用Vue.extend()返回的构造器创建一个组件的实例，它有两个参数，一个是组件的名字，一个是组件的构造器。

```javascript
var indexA = Vue.extend({
    //指定组件显示的模板
    //注意：1）模板template中只能有一个根节点
    //2）如果采用驼峰命名法，就要加上‘-’，比如组件名叫indexA,使用的时候为<index-a></index-a>
    template: "<div>main page</div>"
})
//创建一个全局组件index
Vue.component('indexA',index)
```

​	2）直接使用Vue.component()方法创建

```javascript
Vue.component('indexB',{
    template: "<div>我是index-b</div>"
})
//或者
Vue.component('indexB',Vue.extend({
    template: "<div>我是index-b</div>"
}))

```

​	3）通过指定模板创建(<font color='red'>常用</font>)

```html
<template id="itcast">
	<div>
        我是index-d
    </div>
</template>
<index-d></index-d>
<script>
    Vue.component("indexD",{
        template: "#itcast"
    })
</script>
<!-- 或者 -->
<script type="x-template" id="heima">
	<div>我是index-d</div>
</script>
```

​	3、组件中使用指令和事件

​	1）data属性

```html
<template id="itcast">
	<div @click="changeMsg">
        {{msg}}
    </div>
</template>
<div id="app">
    <index></index>
	<index></index>
	<index></index>
</div>
<script>
    Vue.component('index',{
        template: "#itcast",
        //只有data必须函数形式书写,目的是让组件多次利用时，每一个组件的数据是独有的，如果是对象形式，所有组件引用的地址相同，改变一个组件的data属性，其他组件也跟着改变了
        //其他
        data(){
            return {
                msg: '我是组件'
            }
        },
        methods: {
            changeMsg(){
                this.msg = 'hello'
            }
        }
    })
    var vm = new Vue({
        app: '#app'
    })
</script>
```

​	2）事件使用(见上面代码的methods方法)

​	4、父子组件的创建	

```html
<template id="itcast1">
        <div>我是{{msg}}
            <son></son>
        </div>
    </template>

    <template id="itcast2">
        <div>我是子组件</div>
    </template>

    <div id="app">
        <father>
            <son></son>
        </father>
    </div>

    <script>
        Vue.component("father", {
            template: '#itcast1',
            data(){
                return {
                    msg: "父组件"
                }
            },
            components: {
                son: {
                    template: '#itcast2'
                }
            }
        })
        var vm = new Vue({
            el: '#app',
            data: {

            }
        })
    </script>
```

​	5、父组件传值子组件

```html
<div id="app"> 
    <father></father>
</div>
<script> 
    Vue.component('father',{
        template: '<div>我是父组件,子组件名{{sonName}}<son :myName="sonName"></son></div>',
        data(){
            return {
                sonName: 'mike'
            }
        },
        components: {
            son: {
                //声明props,用来接收父组件传过来的值,可以跟一个数组，数组里面保存的是父组件数据里的键值
                props: ['myName'],
                template: '<p>我是子组件，我的名字是{{myName}}</p>'
            }
        }
    })
    var vm = new Vue({
        el: '#app'
    })
</script>
```

​	6、子组件传值给父组件

```html
<div id="app">
    <father></father>
</div>
<script>
    Vue.component('father',{
        template: '<div>我是父组件，我的子组件名字是{{sonName}}<son @tellName="getName"></son></div>',
        data(){
            return {
                sonName: '???'
            }  
        },
        methods: {
            getName(name) {
                //这个函数中有一个默认参数，表示传递过来的值
             console.log(name) 
             this.sonName = name
            }
        }
        components: {
            data() {
                return {
                    myName: 'jack'
                }
            },
            son: {
                template: '<button @click="emitVal">点击传值给父组件传名字</button>',
                methods: {
                    emitVal(){
       //传递需要$emit()方法，可以传递两个参数，一个是事件名称，一个是需要传递的数据
                       this.$emit('tellName',this.myName)
                    }
                }
            }
        }
    })
    var vm = new Vue({
        el: '#app'
    })
</script>
```

​	7、兄弟组件的传值

```html
<div id="app">
    <father>
    	<son1></son1>
        <son2></son2>
    </father>
</div>
<script>
    //创建一个Vue实例
    var eventbus = new Vue()
    Vue.component('father',{
        template: "<div><son1></son1><son2></son2></div>",
        components: {
            son1: {
                data(){
                    return {
                        son2Name: '???'
                    }
                },
                template: "<p>我是son1</p>",
                mounted(){
                    eventbus.$on('tellName',data => {
                        this.son2Name = data
                    })
                }
            },
            son2: {
                data(){
                    return {
                        myName: 'jeremy'
                    }  
                },
                template: "<p @click='enitName'>我是{{myName}}</p>",
                methods: {
                    emitName(){ eventbus.$emit('tellName',this.myName)
                    }
                }
            }
        }
    })
    var vm = new Vue({
        el: "#app"
    })
</script>
```

​	8、创建动态组件

​	1）利用component标签创建动态组件，它的is属性指向谁，就显示哪个组件

```html
<div id="app">
    <p>
        <button @click="current='index'">首页</button>
    	<button @click="current='goods'">商品</button>
    </p>
	<component :is="current"></component>
</div>
<script>
    Vue.component('index',{
        template: '<div>我是首页</div>'
    })
    Vue.component('goods',{
        template: '<div>我是商品/div>'
    })
    var vm = new Vue({
        el: '#app',
        data: {
            current: ''
        }
    })
</script>
```

​	2）局部自定义指令和局部过滤器

​	<font color='red'>注意：只能在定义的组件中使用</font>，全局自定义指令可以在组件中使用

```html
<div id="app">
	<one></one>
    <two></two>
</div>
<script>
    Vue.component('one',{
        template: '<div>局部过滤器和自定义指令<p>{{time | formatTime}}</p></div>',
        data(){
            return {
                time: new Date()
            }
        },
        filters: {
            formatTime(time){
                var y = time.getFullYear().toString()
                var m = time.getMonth().toString().padStart(2,'0')
                var day = time.getDate.toString().padStart(2,'0')
                return y + '/' + m + '/' + day
            }
        }
    })
    Vue.component('two',{
        template: '<div v-myfocus>我是组件2</div>',
        ,
        directives: {
            myfocus: {
                inserted(el,binding){
                    el.style.color = 'red'
                }
            }  
        }
    })
	var vm = new Vue({
        el: "#app",
        data: {}
    })
</script>
```

1、Vue框架生命周期内，每个时机的作用，及每个时机可以做什么（框架流程，运行机制）

2、使用Vue开发项目时，基础环境搭建，框架依赖组件的使用（开发运行环境）

3、当制作博客项目，电商项目，CMS项目（内容管理系统）时，分别需要使用的组件是什么（快捷开发组件）

##### 	6、实例生命周期

##### 	7、Vue路由

​	1）作用：根据路由找到对应组件

​	2）使用

```html
<!--1、引入路由文件-->
<script src="./vue-router.js"></script>
<div id="app">
	<!-- 6、通过router-view，路径匹配到的组件都会渲染到,to属性值必须对应路由中的path，router-link将会被渲染成a标签，它的to属性会被渲染成a标签的href属性，他的值会变成锚点（href="#one"） -->
    <ul>
        <li><router-link to="/one">index</router-link></li>
        <li><router-link to="/two">other</router-link></li>
    </ul>
    <router-view></router-view>
</div>
<script>
    //2、路由要用到的组件
    var one = Vue.component('one',{
        template: '<div>this is the main page</div>'
    })
    var two = Vue.component('two',{
        template: '<div>this is the subjective page</div>'
    })
    //3、创建路由对象，对象里配置路由规则
    var router = new VueRouter({
    //4、通过routes属性配置路由规则，它是一个数组，数组中放的是对象，每个对象对应一条规则，并且每个对象都包含有name（路由规则名称）/path（路径）/component（表示路径对应组件）
        routes:[
            {
                name: 'one',path:'/one',component: one
            },
            {
                name: 'two',path:'/two',component: two
            }
        ]
    })
    var vm = new Vue({
        el: "#app",
        //5、注册路由
        router: router,
        data: {} 
    })
</script>
```

​	3、路由参数

```html
<!--1、引入路由文件-->
<script src="./vue-router.js"></script>
<div id="app">
	<!-- 6、通过router-view，路径匹配到的组件都会渲染到,to属性值必须对应路由中的path，router-link将会被渲染成a标签，它的to属性会被渲染成a标签的href属性，他的值会变成锚点（href="#one"） -->
    <ul>
        <li><router-link to="/one">index</router-link></li>
        //获取路由参数
        <li><router-link to="/two/1">other1</router-link></li>
        <li><router-link to="/two/2">other2</router-link></li>
    </ul>
    <router-view></router-view>
</div>
<script>
    //2、路由要用到的组件
    var one = Vue.component('one',{
        template: '<div>this is the main page</div>'
    })
    var two = Vue.component('two',{
        template: '<div>this is {{$route.params.id}} subjective page<router-view to="/three"></router-view></div>',
        mounted (){
           console.log(this.$route.params.id) 
        },
        //监听路由参数变化
        watch: {
            '$route' (to,from) {
                console.log(to)
                console.log(from)
            }
        }
    })
    var three = Vue.component('three',{
        template: '<div>hi three</div>'
    })
    //3、创建路由对象，对象里配置路由规则
    var router = new VueRouter({
    //4、通过routes属性配置路由规则，它是一个数组，数组中放的是对象，每个对象对应一条规则，并且每个对象都包含有name（路由规则名称）/path（路径）/component（表示路径对应组件）
        routes:[
            {
                name: 'one',path:'/one',component: one,
                children: {
                    name: 'three',
                    path: '/three',
                    component: three
                }
            },
            {
                name: 'two',path:'/two/:id',component: two
            }
        ]
    })
    var vm = new Vue({
        el: "#app",
        //5、注册路由
        router: router,
        data: {} 
    })
</script>
```

​	4、监听路由参数变化

​	5、嵌套路由和编程式导航

​	6、路由导航

​	`var router = new VueRouter({name:'default',path:'*',redirect:'/'})`

Vue作业的心得：

1）给数据添加新的属性，改变他们是无法触发视图更新的，因为他们没有设置get和set属性

```js
created () {
    this.dataList.forEach(item => {
      item.key = true
      item.count = 0
    })
    console.log(this.dataList)
  }

      // this.$set(item,'key',true)
      // this.$set(item,'count',0)
```

使用this.$set()方法：

```js
created () {
    this.dataList.forEach(item => {
       this.$set(item,'key',true)
       this.$set(item,'count',0)
    })
    console.log(this.dataList)
  }
```

Object.assign()方法介绍：

```js
const target = { a: 1, b: 2 };
const source = { b: 4, c: 5 };
const returnedTarget = Object.assign(target, source, {d: 5});
console.log(target);
// Object { a: 1, b: 4, c: 5 , d: 5}

console.log(returnedTarget);
// Object { a: 1, b: 4, c: 5 , d: 5}
console.log(returnedTarget === target)
// true
```

