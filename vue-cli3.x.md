#### vue-cli 3.0版本以上使用

1、安装或升级vue-cli到3.0版本以上

`npm i @vue/cli -g`

2、使用`vue create my-project`创建项目

​	官方创建方法：

​	指令：`winpty vue.cmd create filename `

​	其他指令：

​	vue add <plugin>添加插件

​	vue invoke <plugin>调用插件

​	vue serve 运行项目开发版本

​	vue build 运行项目发布版本，去除冗余

​	vue create --help(-H)获取更详细的信息

​	会有更多的指令

3、选项

​	1）default/manually select features

​	default：自动完成安装，会包含babel和eslint

​	manually：根据自己手动选择项目需要的依赖（使用空格选中）

​	2）use history mode for router

​	yes：使用history模式，优点是单页面开发中的跳转（锚点实现）和正常请求一样，缺点是前端url必须和后端发起的请求一样否则会返回404错误

​	no：使用hash模式，优点是后端没有做到路由全覆盖也不会报404错误，缺点是调用pushState()方法限制条件更多

​	3）pick a CSS pre-processor

​	less/sass/stylus 根据个人喜好选择CSS预处理器，个人用less，sass安装麻烦太多

​	4）pick a linter / fromatter config

​	选择哪个自动化代码格式化检测

​	eslint + prettier

​	5）pick additional lint features

​	lint on save 保存就检测

​	lint and fix on commit 编书写代码的时候边检测

​	6）where do you prefer placing...

​	相关依赖放在什么地方

​	in dedicated config files放在配置文件中

​	in package.json 放在package.json中

​	7）save this as a preset for future projects

​	是否保存当前为未来项目的预置项

​	yes：以后pick a preset会出现本次配置的选择项

​	no：不出现

4、运行项目

`npm run serve`