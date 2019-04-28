## Vue电商项目

#### 一、UI框架介绍

1、elementUi

2、安装：`npm i element-ui -S`

3、引入

完整引入：

```js
//main.js
import VUe from 'vue'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'

Vue.use(ElementUI)
```

部分引入：

```js
import {Button,Select} from 'element-ui'

Vue.component(Button.name,Button)
Vue.component(Select.name,Select)
```

4、其他UI框架iView，和移动端基于Vue的框架，多做掌握

#### 二、项目相关

1、团队角色

产品经理：挖掘客户需求并形成文档

项目经理：不敲代码的技术，对项目进行把控，对项目风险进行评估和对项目进度进行把控

UI：画视觉稿

UE：画交互稿

前端：调用后端接口，实现UI设计稿

后端：调用数据库，完成业务逻辑

测试：测试代码是否有bug（单元测试、黑盒测试、集成测试、压力测试）

DBA数据库管理员

事实/运维负责程序的上线和运行监控

全栈工程师

2、开发流程

需求分析，概要设计，详细设计，编码，测试，上线，运维，迭代更新

技术选型：vue,vue-router,axios,element-ui,webpack

后端：node.js,express,mysql

3、电商后台管理系统（用于运营人员）

#### 三、项目知识点