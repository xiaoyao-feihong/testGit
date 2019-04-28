webpack学习

#### 一、什么是webpack

webpack是一个现代JavaScript应用程序的模块打包器，会分析项目结构，找到JavaScript模块以及其他浏览器不能直接运行的拓展语言（Sass,typeScript等），并将其转换为合适的格式供浏览器使用。

#### 二、为什么需要webpack

1、现在的前端越来越复杂，特别是SPA(single page web application)单页面应用流行后，一个应用往往会依赖很多其他的模块，或者编译scss、less、stylus等，如果仅仅依靠人来管理不太可能，这个时候我们必须依赖webpack解决。

2、现在流行的三个SPA框架，都与webpack紧密相连：

React.js + webpack

Vue.js + webpack

Angular.js + webpack

3、学习webpack的内容

入口（entry），输出（output），加载器(loader)，插件(plugins)

#### 三、安装

1、安装：`npm install webpack@3.11.0 -g`全局安装

​	`npm i webpack -D`安装开发依赖，引入webpack

2、安装：`npm install nrm -g`可以切换镜像源,可提升下	载速度，这个慢了就切换

​	切换镜像源：`nrm use cnpm`

​	nrm ls　　// 查看所有的支持源（有*号的表示当前所使用的源,以下[name]表示源的名称）

​	nrm use [name]　　// 将npm下载源切换成指定的源

​	nrm help　　// 查看nrm帮助

​	nrm home [name]　　// 跳转到指定源的官网

3、使用：在多个js文件中使用module.export和require

```js
//add.js
function add(x,y){
    return x + y
}
module.exports = add

//sub.js
function sub(x,y){
    return x - y
}
var add = require('./add.js')

document.write(sub(add(30,28),18))

```

指令：`webpack ./sub.js ./dist/index.js `讲sub.js打包到当前文件夹下dist文件夹下的index.js中

4、在`webpack.config.js`中配置（文件与当前文件处同一文件夹）

```js
//webpack.config.js
const path = require('path')
module.exports = {
    //配置入口文件
    entry: './sub.js',
    //配置输出文件
    output: {
        //必须是绝对路径
        path: path.join(__dirname,'dist'),
        //静态资源在服务器上运行时的访问路径
        publicPath: './dist',
        filename: 'bundle.js'
    }
}
```

只需要使用`webpack`指令就可以自动刷新

5、使用`webpack-dev-server`保存文件后就会自动在内存中保存变化

`npm init`初始化package.json文件

1）全局安装：

`npm i webpack webpack-dev-server -g`

2）新版需要安装脚手架工具

`npm i webpack webpack-dev-server webpack-cli -D`

3）运行`webpack-server-dev`

成功后会有`Project is runnning at http://localhost:8080`，打开后即可，更新js保存后就可以自动捕捉变化了

4）自动打开服务器

指令：

`webpack-dev-server --inline --hot --open --port 3000`

--inline 表示自动打开浏览器

--hot 表示热加载，会自动刷新变化

5）在package.json配置脚本

```js
//在package.json中配置脚本
{
    "scripts": {
        "dev": "webpack-dev-server --inline --hot --open --port 3000"
    } 
}
```

`npm run dev`运行我们配置得脚本

#### 四、webpack-css安装

1、安装

`npm i css-loader style-loader -D`

-D相当于--save-dev

2、配置webpack.config.js文件

```js
{
    entry: './subtract.js',
    output: {
        path: path.join(__dirname,'/dist'),
        //静态资源在服务器上运行时的访问路径
        publicPath: '/dist',
        filename: 'bundle.js'
    },
    //css配置
    module: {
        rules: [
            {
       //匹配.css后缀得文件
                test: /\.css$/,
       //调用得包，webpack调用顺序为右到左
       //css-loader加载.css后缀文件,style-loader创建一个link标签放进样式作用
                use: ['style-loader','css-loader']
            }
        ]
    }
}
```

3、运行指令：`npm run dev`

#### 五、webpack-less

1、安装

`npm i less less-loader (sass-loader) （node-sass） -D`

<font color='red'>注意：</font>node-sass比较难下载，多下载几次

2、在rules中添加

```js
module: {
    test: /\.less$/,
   //test: /\.scss$/
        use: ['style-loader','css-loader','less-loader']
}
```

<font color='red'>注意：</font>顺序不要错，webpack是从右到左使用loader的

#### 六、webpack-image&font

1、安装

`npm i url-loader file-loader -D`

<font color='red'>注意：</font>url-loader,file-loader都要下载，实践证明，只下载url-loader会报错，没有包含关系

2、配置文件

```js
module: {
    //匹配图片和字体图标样式
    test: /\.(png|jpg|gif|eot|svg|ttf|woff)/,
        use: [{
            loader: 'url-loader',
            options: {
    //limit表示图片如果大于50000byte，就以路径形式展示（使用的file-loader），小于的话就以base64格式展示(使用的url-loader)
                limit: 50000
            }
        }]
}
```

<b>作用：会将css中的路径自动根据大小自动解析，两个都要加载，否则会报错</b>

3、字体配置

1）在icommon下载字体图标，引入font文件夹

2）只保留style.css文件和fonts文件夹

3）在icommon上下载样式，加入到html文件中

```html
<span class="icon-html-five"></span>
```

<font color='red'>注意：</font>webpack.config.js中一定要配置

```js
module: {
    rules: rules: [
            {
                test: /\.less$/,
                use: ['style-loader','css-loader','less-loader']
            },
        //一定要配置匹配.css后缀的规则，否则读取字体图标的style.css会出错，因为没有对css后缀进行处理的loader，main.js中要记得引入require('path/style.css')
            {
                test: /\.css$/,
                use: ['style-loader','css-loader']
            },
            {
       //针对图片和字体图标格式进行支持
                test: /\.(jpg|png|gif|eot|svg|ttf|woff)$/,
                use: [{
                    loader: 'url-loader',
                    options: {
                        limit: 5000
                    }
                }]
            }
        ]
}
```

#### 七、webpack-html

1、下载命令：`npm i html-webpack-plugin -D`

​	插件作用：自动根据配置项js文件名称变化，将script标签动态插入到html文件中

2、webpack.config.js中引入`const htmlPlugin = require('html-webpack-plugin')`

3、注释掉以前配置的publicPath配置项，回和插件冲突

4、添加配置

```js
plugins: [
    new htmlPlugin({
        //保存到webpack上的文件名
        filename: 'demo.html',
        //我们的html文件
        template: 'index.html'
    })
]
```

**问题：**npm run dev执行脚本的时候展示项目列表，点击index.html的时候打开的是源文件（模板文件），没有引入我们的css和js文件

<font color='red'>原因：</font>webpack-dev-server提供一个http服务，浏览器在访问这个http服务的时候，默认访问项目根目录的index.html，如果没有默认index.html文件，http服务将会给用户展示项目列表，供用户选择查看的文件，此时我们点击index.html打开的是源文件，自然没引入webpack上demo.html文件，此时通过localhost:3000/demo.html（我们脚本文件指定的端口），webpack-dev-server就能读取内存webpack保存的demo.html给我们

#### 八、webpack-babel

1、安装：`npm i babel-core babel-loader babel-preset-env -D`

<font color='red'>注意：</font>版本对应下载

| webpack版本 | babel-loader版本 |
| ----------- | ---------------- |
| 1.x         | <=6.x            |
| 2.x         | >=7.x            |
| 3.x         | >=7.1            |

2、配置文件

```js
{
    //匹配.js后缀文件
    test: /\.js$/,
    //解析文件的路径
    include: [path.resolve(__dirname,'src')],
   //使用解析的loader
    use: {
          loader: 'babel-loader',
          options: {
         //表示es6的版本
              presets: ['env']
                }
        }
}
```

3、webpack3引入了很多es6语法，但是还没有完全实现，所以还是需要下载webpack-babel

4、将配置项options的内容拿到.babelrc文件中，方便维护，因为babel有很多配置

5、错误原因：babel-preset-env下载丢包或者不成功

​	解决方法：利用nrm ls（查看镜像源）,nrm use taobao使用taobao镜像源重新下载

![](C:\Users\Administrator\Desktop\typoraImg\error.png)

#### 九、gulp

```js
const gulp = require('gulp')

//下载sass必须先下载ruby（sass是基于ruby语言开发的）
const sass = requie('gulp-sass')

//针对js文件压缩
const uglify = require('gulp-uglify')

//针对css文件进行压缩
const css = require('gulp-clean-css')

//改名插件
const rename = require('gulp-rename')

//自动刷新
const livereload = require('gulp-livereload')

//同步执行gulp.task(任务名，依赖任务，完成回调)
gulp.task('hello',gulp.series('copyfile','moretask'),done => {
    //告诉完成，否则会报错，任务不结束
    console.log("my gulp's task")
    done()
})
//通过`gulp 任务名` 执行

//gulp.series()同步执行，gulp.paralle()异步执行

//dest将通道数据流写到指定目录里
//pipe执行管道内方法对数据进行处理

gulp.task('copysass',done => {
 //src读取文件，pipe复制文件到的地址
 //编译sass，压缩编译后文件，复制到指定文件夹下    
    gulp.src('./src/sass/*.scss').pipe(rename({
        suffix: '.min'
    })).pipe(sass()).pipe(css()).pipe(gulp.dest('./dist/css/'))
})

 gulp.src('./src/js/*.js').pipe(rename({
     //将.min加入到中间，生成index.min.js
        suffix: '.min'
 })).pipe(uglify()).pipe(gulp.dest('./dist/css/'))
})

//默认执行的任务,不需要done，命令gulp就会自动执行
gulp.task('default',(done) => {
    //监听任意.scss后缀文件，会自动将复制的文件内容更新
  gulp.watch('./src/sass/*.scss',gulp.series('copysass'))
    gulp.watch('./src/js/*.js',gulp.series('copyjs'))
    done()
})
```

extend:

1）webpack-dev-server提供一个http服务，浏览器在访问这个http服务的时候，默认访问项目根目录的index.html，如果没有默认index.html文件，http服务将会给用户展示项目列表，供用户选择查看的文件

2）typora复选框： `- [ ] xxx`

#### 十、webpack结合Vue

1、单文件组件

​	1）**Vue组件缺点：**

​	（1）Vue.component()的缺点：项目太大，组件命名的全局定义

​	（2）组件模板中没有语法高亮

​	  (3）不支持CSS

​	  (4）限制只能使用HTML和ES5

​	2）单文件组件解决了以上缺点

​	3）结合webpack

2、Vue-cli脚手架工具

​	1）将所有单文件组件都放到components文件夹，文件名为app.vue

```html
<template>
    <div>{{msg}}</div>
</template>

<script>
    export default{
        data (){
            return {
                msg: 'hello world'
            }
        }
    }
</script>
<!-- 使用scoped可以让子组件的样式不影响父级组件 -->
<style>
    div {
        color: red;
    }
</style>
```



​	2）配置webpack相关的loader

​	`npm i vue -S`

​	`npm i vue-loader vue-template-compiler -D`

```js
//在webpack.config.js中配置
{
    test: /\.vue$/,
    loader: 'vue-loader'
}
//如果使用webpack1.x，还需要安装'babel-plugin-transform-runtime',并添加一下配置（webpack2.x以上忽略此配置）
{
    test: /\.js$/,
    include: [path.resolve(__dirname,'src')],
    use: {
         loader: 'babel-loader',
   options: {
          presets: ['env'] 
       //plugins: ['transform-runtime']
             }
        }
}
```

​	引入：

```js
//app.js文件
//引入node-modules中的vue
import Vue from 'vue'
import App from './components/app.vue'
new Vue({
    //页面中id为app的元素
    el: '#app',
    //渲染App.vue文件
    render: h => h(App)
})
```

​	出现的问题：

![](C:\Users\Administrator\Desktop\typoraImg\error-vue-webpack.jpg)

​	原因：因为下载的vue-loader是15.7.0版本，15.x.x以后的版本的vue-loader会产生一个VueLoaderPlugin插件

​	解决办法：

```js
//配置webpack.config.js
const VueLoaderPlugin = require('vue-loader/lib/plugin')

module.exports = {
    ...
    plugins: [
        new VueLoaderPlugin()
    ]
    ...
}
```

3、路由配置

​	安装：`npm i vue-router -S`

​	导入：

```js
//app.js
//相当于在bundle.js中导入vue.js,所以是安装在依赖中而不是开发依赖中
import Vue from 'vue'

//导入路由模块,相当于在bundle.js中导入vue-router.js
import VueRouter from 'vue-router'

import app from './components/app.vue'
import login from './components/login.vue'
//使用路由模块
Vue.use(VueRouter)
//配置路由规则
const router = new VueRouter({
    routes: [{
        name:'login',
        path:'./login',
        component: login
    }]
})
new Vue({
    el: '#app',
    router,
    //渲染函数r
    render: r => r(app)
})
```

4、vue-cli脚手架工具

​	可以自动帮我们完成vue的一些基本配置，快速搭建大型单页面应用

​	1）安装：`npm i vue-cli -g`

​	2）初始化：`vue init webpack(1) admin(2)`

​	初始化一个项目以webpack为模板，项目名为admin

​	1模板类型：webpack(不常用)

​	2项目名：admin

​	3）`npm run dev`打开开发环境下的项目

​	`npm run build`构建上线环境下的项目，生成一个dist文件夹，会自动压缩去注释，直接生成上线环境的文件

​	4）问题：download template一直不见动静

​	解决方法：重新安装vue-cli

5、解释生成的配置

​	1）webpack.base.config.js开发上线都需要

​	webpack.dev.config.js开发需要

​	webpack.pro.config.js上线需要

​	2）src

​	assets：放静态资源文件

​	components：放vue组件

​	router：放路由

​	3）在config/index.js下改默认端口

