## ES6学习

------

##### 1、babel工具本地化使用

​	（1）在线编译工具

​		网址：https://babeljs.io/repl（英文网址）

​		网址：https://www.babeljs.cn（中文网址）

​	（2）命令：

​		`npm init -y` 跳过询问

​		`npm i @babel/core @babel/cli @babel-preset-env`

​		@babel/core：将ES6转化为ES5的核心模块

​		@babel-preset-env：包括ES6各语法块编译的插件集合

​		@babel/cli：对es6代码直接进行转码，转化为使用严格模式的es2015代码

​		`npx babel es6.js -o trans-es6.js `会在.bin文件夹下多一个babel文件夹

​	（3）.babelrc文件配置

```js
{
    "presets": [
        //我们下载的翻译插件写在这
        "@babel/preset-env",
        //如果功能不够（支持新语法），继续安装了es2015插件,直接添加就行
        "es2015"
    ],
        //需要使用的插件
      "plugins": []
}
```

##### 2、ES6语法

###### 	1、var和作用域

​		变量声明提升：变量声明提升会给程序员带来不好的代码书写习惯

​		可重复定义：导致覆盖之前的变量，使错误比较难发现

​		全局变量挂载到window上：如果变量名与window的属性冲突，会造成错误难发现的后果

​		只有全局作用域和函数作用域带来的闭包问题，导致内存泄漏

###### 	2、let，const

​	引入let和const就是解决上述问题

```js
//1.let声明变量：不会声明提升，不允许未定义使用，不会挂载window上，加强了对作用域的控制，let配合{} => 块级作用域，变量的生命周期就只在作用域内，子块级作用域还是可以使用let声明的变量
{
	let a = 10 
    let b = 20
    {
        //临时死区，只要使用了let声明同名变量，不会在上一级作用域查找，没有定义才会沿着作用域链寻找变量
        console.log(b)//20
        console.log(a) //报错
        let a = 20
    }
}

//2.const声明常量：与let作用一样，栈内存地址会被设置为只读(read-only)，推荐使用const，因为let值可以被改变，需要追踪，所以const效率更高

//面试1
console.log(a) //undefined
{
    function a () {}
    //花括号会将函数变为var a = function () {}
}

//面试2
function test (x, y) {
    //函数中的形参相当于是通过var声明的，所以会报错
    let x = 10;
}
test(1, 2)//报错

//面试3
var a = 10
let a = 20  //报错：a已经声明
```

###### 	3、`...`运算符使用（rest&spread剩余和展开）

```js
//...运算符（并没有改变语法糖）
1、搜集作用
//...搜集作用,arg是一个数组，不是实参列表
function sum (...arg) {
    let sumNumber;
    arg.forEach(val => sumNumber += val)
    return sumNumber;
}
sum(1, 3, 5)

//...拓展用法
function test（a , b, ...arg）{
    //注意...arg只能是最后一个参数，（a,..arg,b）报错
    console.log(arg)
    //arg: [3, 'a', 'b']
}
test(1,2,3,'a','b')

//练习：去掉最高分和最低分后求平均值
function average(...arg) {
    let sum = 0;
    arg.sort((a,b) => a - b)
    arg.pop()
    arg.shift()
    arg.forEach(item => sum += item)
    test(...arg)//此时...相当于展开运算符
    return sum / arg.length;
}
function test (...arg) {}

2.展开作用
let arr = [1, 2, 3, 4, 5] ==> 1, 2, 3, 4, 5
console.log(...arr) ==> console.log(1, 2, 3, 4, 5)

3.ES7中...运算符可以对对象进行展开
let company = {
	name: 'cg'
}
let department = {
    leader: {
        name: 'cg',
        age: 18
    },
    num: 25
}
//浅层克隆
let obj = {
    ...company,
    ...department
}

//深层克隆(如果有多层，层层展开反而不适用)
let obj = {
    company: {
        ...company
    },
    department: {
        ...department
    }
}

//深层克隆(有函数和正则的时候不适用)
let obj = JSON.parse(JSON.stringify(department))

//es6提供的对象方法(浅层克隆)
Object.assign({},company,department)
    
    
```

##### 4、解构（destructuring assignment，结构化赋值）

```js
//解构
let obj = {
    name: 'cx',
    age: '18',
    sex: 'female'
}
let ({name,age} = obj)//地址传递
//设置默认值
let {name: oName,age: oAge,sex = 'male'} = obj
//oName: 'cx',oAge: '18'

function sum (a = 10, b = 20) {
    return a + b;
}

//js一切皆对象，只要左右两边对应就能进行结构赋值
let arr = [1,2,3]
1. let {0: x,1: y,2: z,length: len} = arr
2. let [x,y,z] = arr
```

##### 5、箭头函数

```js
//箭头函数：函数目的指向性更强，简化代码，提升开发效率
let sum = (a, b) => a + b;//返回a+b的值
let sum = (a, b) => [a, b]//返回数组
let sum = (a, b) => ({a: a,b: b})//返回对象

let sum = (a, b) => {a: a,b: b} //报错
//相当于
function (a,b) {
    a:a,b:b;
    return undefined
} 

let sum = x => y => z => x + y + z;
//相当于
sum = function (x) {
return {
    function (y) {
        return function (z) {
            return x + y + z;
        }
    }
}
}

let sum = (x, x) => x;
//报错，箭头函数内部相当于用let定义，不允许重复定义

let sum = (x, y) => x + y;
new sum();
//报错，箭头函数没有原型，所以不能使用new指令

let name = 'outer'
let sum = () => {
    console.log(this.name) //this为window
}
let obj = {
    name: 'inner',
    fn: sum
}
obj.sum()  //outer

let obj2 = {
    name: 'inner',
    fn: () => {
        console.log(this.name)
    }
}
obj2.fn()	//outer，因为外围没有非箭头函数
//内部arguments和this由**定义时**的最外一层的**非箭头函数**的arguments和this决定它的值

//用途
let obj = {
    ms: 'zhangsan',
    fn () {
        let self = this
        setTimeout(function(){
            console.log(this.ms)//undefined
            console.log(self.ms)//ms
        },1000)
        //减少了代码量，babel就是将下面代码编译成上面代码
        setTimeout(() => {
            console.log(this.ms)//ms
        },1000)
    }
}

//方便的处理数组
let arr = [10, 20, 30, 40]
```

##### 6、Object.defineProperty(ES5)

可以定义新的具有属性描述的现有属性

1）数据描述符：

​	writable，configurable，enumerable

2）存取描述符

​	set，get

3）使用

​	Object.defineProperty(对象,属性,描述符)

```js
//writable可读写属性
//configurable可配置属性（删除）
//enumerable可枚举属性

Function.ptototype = {}
console.log(Function.prototype)
//function {[Native code]}说明函数的原型不可写

var a = 10;
delete window.a //false，var声明的挂载在window上的全局变量是不可配置的

//Object.protype里的属性时不可以被枚举的
var obj = {
    name: 'mao',
    __proto__: {
        age: 20,
        __proto__: {
            sex: 'male'
        }
    }
}
for(var i in obj){
    console.log(i)//输出：mao 20 male
    //不会枚举Object.prototype上的属性,证明不可枚举
}

//set,get与value,writable不能同时设置
var obj = {}
var temp = 20
Object.defineProperty(obj,'name',{
    enumerable: true,
    configurable: true,
    set: function () {
        return temp;
    },
    get: function (newVal) {
        temp = newVal
    }
})
```

4）ES5数据劫持

​	Vue双向数据绑定核心功能由Observer、Compile、Watcher三部分实现

​	Observer由Object.defineProperty()实现

​	Object.keys(data)会将对象的键名放进一个数组并返回

```html
<!--简单的数据劫持 -->
<input id="demo" type="text"></input>
<div id="show"></div>
<script>
	var oDiv = document.getElementById('show');
    var oInput = document.getElementById('demo');
    var oData = {
        value: 'chenxiang'
    }
    function update () {
        oDiv.innerText = oData.value
    }
   update()
    function Observer (data) {
        if(!data || typeof data !== 'object'){
            return data;
        }else{
            Object.keys(data).forEach(key => {     	definedReactive(data,key,data[key])
            })
    }
    Observer(data)
        function definedReactive(data,key,val) {
            Object.defineProperty(data,key,{
                get () {
                  return val;  
                },
                set (newVal) {
                    if(newVal === val)return;
                   val = newVal;
                    update();
                }
            })
        }
</script>
```

##### 7、ES6的变化

ES6并没有改变js语言的本质

Proxy（代理）和Reflect（映射）：必须浏览器支持才行，不然通过babel转码也还是没法转码，兼容不好，是浏览器提供的构造函数

```js
//代理：简化操作
let oData = {
    val: 'agency chen',
    _val: 'private name'    
}
//返回新的值，不传参会报错
let oProxyData = new Proxy(oData,{
    set (target, key, value, receiver) {
       Reflect.set(target, key, value);
        update()
    },
    //target是传进来的对象，key是返回的属性，receiver是构造函数返回的新对象
    get (target, key, receiver) {
        return Reflect.get(target,key)
    },
    //控制属性的的读取和操作
    has (target, key) {
        //将带有下划线的属性变为私有属性
        return key.indexOf('_') !== -1;
    },
    deleteProperty () {
        //控制属性的删除操作
    }
})
//读写，控制
oData.val = 'jackie'

function update () {
    console.log('更新了')
}

//practice demo
var data = { name: 'public name', _name: 'private name'}
function updateData () {console.log('update!')}
var proxyData = new Proxy(data, {
	set (target, key, value, receiver) {
	Reflect.set(target, key, value);
	updateData()
},
	get (target, key, receiver) {
	return Reflect.get(target, (key) => {
	if(key.indexOf('_')) return '12';
	return key;
});
},
	has(target, key) {
	return target[key].indexOf('_') !== -1;
}
})
proxyData._name = 'changes' //update!
console.log(proxyData._name)	//undefined
data._name	//'changes'
```

##### 8、Class

面向对象效率更高，JavaScript不是面向对象的语言，而是基于对象的语言，Vue和React都是采用面向对象的方式来做的。

```js
//回顾es5组合寄生继承
function Plane (name) {
    this.name = name || 'ordinary plane'
    this.speed = 100
}
Plane.prototype.fly = function () {console.log('fly');}
function AttackPlane (name,blood) {
    //将需要的属性拿过来
    Plane.call(this,name)
    this.blood = blood
    this.speed = 1000
}
AttackPlane.attack = function () {
    console.log('emit a bullet')
}
//利用中间变量
var temp = function () {}
temp.prototype = Plane.prototype
AttackPlane.prototype = new temp()
//优点：继承了fly方法，但是不会得到Plane中没用的属性
var attackPlane1 = new AttackPlane('attack 1',1000)

//更高级的使用方法，因为浏览器允许设置__proto__了
AttackPlane.prototype.__proto__ = Plane.prototype
//ES6的Object.setPrototypeOf(Attack.prototype,Plane.prototype)的原理就是上面的使用方法

```

class：

```js
//class
//ES6不支持添加静态属性，可以添加静态方法
class Plane {
    //会创建一个Plane的构造函数
    //ES7： static alive = 'alive'
    //静态属性只能Plane读取，实例是没有的
    static alive () {
        return 'alive'
    }
    constructor (name) {
        this.name = name || ''
        this.blood = 100
    }
    //会将fly挂载到Plane.prototype上
    fly () {
        console.log('fly')
    }
}
console.log(Plane.alive()) //'alive'
Plane() //不能没有new关键字的情况下执行，报错，Plane.prototype不能枚举，静态属性也是不能枚举的

//继承原型上的属性
class AttackPlane extends Plane {
    constructor () {
        //super:继承Plane的私有属性
        super(name)
        this.logo = 'cx'
    }
    emitBullet () {
        console.log('emit a bullet')
    }
}

//es5模拟class
//检查是否使用new关键字
function _classCallCheck (_this, _constructor) {
    if (!(_this instanceof _constructor)){
        throw 'type error: lack of keyword "new"'
    }
}
//处理公有属性和静态属性
//其他方法可以通过www.babeljs.com查看源码
```

##### 9、ES7-class提案属性

提案特性需要下载：

`npm i @babel/plugin-proposal-decorators`

```js
//usage demo
class Search () {
    //ES7
    static num = 10
    constructor () {
        this.keyValue = '';
    }
    //ES7 修饰符:还是使用defineProperty实现的
    @myReadOnly url = 'urlA';
    @addNewFunction getCount () {
        console.log('send a request to ' + this.url)
        return 'haha'
    }
}
//安装插件@babel/plugin-proposal-decorators
function myReadOnly (proto, key, descriptor) {
    //proto原型,key为属性url,descriptor就是配置属性的读写和枚举功能
    console.log(proto,key,descriptor)
    descriptor.writable = false
    //装饰私有属性的时候值是initializer,装饰原型上的属性时，值是descriptor.value
    descriptor.initiallizer()//'urlA'
    descriptor.initiallizer = () => 6;
    //此时访问url就是6
}

function addNewFunction (proto, key, descriptor) {
    let oldValue = descriptor.value
    descriptor.value = function () {
        //额外功能
        var urlB = 'urlB'
        console.log('send a request to ' + urlB)
        //别人的原生功能
       return oldValue.apply(this,arguments);
    }
}

//给类添加修饰符
@skin class Search () {
    consturctor () {
        this.key = 'haha'
    }
}

function skin (target) {
    //给类添加静态属性
    target.aaa = '20'
}
```

##### 10、set和map

set是es6提供给我们的构造函数，能够造出一种新的存储数据的结构(和Proxy一样是浏览器内置的构造函数，存在兼容性问题)：

```js
//参数必须是[] '' arguments NodeList（拥有迭代接口的值）iterator
let oS = new Set([1,2,3,{},true,'hello']);
//特点：只有属性值，成员值唯一（不重复）
//用途：可以转成数组，本身具备去重，交集，并集，差集的作用 

//1.去重
let oS2 = new Set('abcdabcd') //Set(4){"a","b","c","d"}

//2.增加值
let oS2 = new Set([1])
oS2.add(1);
oS2.add([1,2]);//Set(3){1,Array}，这里的[1,2]没法删除

//3.删除
let arr = [3,4]
oS2.add(arr)
oS2.delete(arr) //删除数组必须有变量保存引用的数组,如果是没有引用的数组，值是无法删除的

//4.清空
oS2.clear()//全部清空

//5.遍历
let oS3 = new Set()
oS3.add('1')
oS3.add([1, 2])
oS3.add(true)
oS3.forEach(val => {console.log(val)})
//'1',Array[1,2],true

//6.ES6：for of
for(let prop of oS3){
    console.log(prop)//'1',Array[1,2],true
}

//7.Set中Set对象转化为数组(Set对象拥有迭代接口,就可以使用Array.from和展开运算符)
let arr = [1, 2, 3, 4]
let oS5 = new Set(arr)
1.Array.from(oS5)
2.let arr2 = [...oS5]
```

使用Set：

```js
//哈希去重
let arr = [1,2,3,2,3,5,6,1,2,3]
let obj = {}
let newArr = []
for(let i = 0;i < arr.length ; i++){
    //默认会认为arr[i]是字符串，调用Object.prototype.toString()方法,obj['1']
    if(!obj[arr[i]]){
        newArr.push(arr[i])
        obj[arr[i]] = true
}
}

//去重(哈希去重无法搞定对象的去重)
let obj = {name: 'cx'}
let obj2 = {name: 'cg'}
let arr = [obj,1, 2, 3, obj2, 4, obj]
let oS = new Set(arr)
//输出：obj,1,2,3,obj2,4

//并集
let arr1 = [1,2,3,2,3,5,6,1,2,3]
let arr2 = [3,2,4,5,2]
let arr3 = Array.form(new Set([...arr1,...arr2]))
//输出：[1,2,3,4,5]

//交集（都有的元素）
let arr1 = [1,2,3,2,3]
let arr2 = [3,2,4,5,2]
let oS1 = new Set(arr1)
let oS2 = new Set(arr2)
let arr3 = [...oS1].filter(elem => oS2.has(elem))
//输出：[2,3]

//差集
let arr1 = [1,2,3,2,3]
let arr2 = [3,2,4,5,2]
let oS1 = new Set(arr1)
let oS2 = new Set(arr2)
let arr3 = [...oS1].filter(elem => !oS2.has(elem))
let arr4 = [...oS2].filter(elem => !oS1.has(elem))
let arr5 = [...arr3,...arr4]
```

map原理：本质是键值对的集合

```js
//初始化传值，一种新的数据结构
let oMap = new Map([['name','chen'],['age',18],['sex','male']])
console.log(oMap)//Map(3) {"name" => "chen", "age" => 18, "sex" => "male"}

//对象也可以作为属性，需要存对象的时候可以使用
let oMap2 = new Map([{},'---'])

//api存储值
let oMap3 = new Map()
oMap3.set('name','chen')
let obj = {}//可以取到
oMap3.set(obj,'---')
oMap3.set({},'+++')//取不到
oMap3.get('name')//'chen'
oMap3.get(obj)//'---'
oMap3.get({})//undefined 取不到
oMap3.size//3
oMap3.delete('name')//删除属性
for(let i of oMap3) {
    console.log(i)
 //['name','chen'] [{...},'---'] [{...},'+++']
    console.log(i[0],i[1])//'name' 'chen' ...
}
oMap3.has('name')//true
```

Map存储原理分析：

```js
//铺垫：链接链表、hash算法、桶
1.JavaScript链表：通过取值的方式能
let node1 = {
    key: 'first',
    next: null
}

let node2 = {
    key: 'second',
    next: node1
}

let node3 = {
    key: 'third',
    next: ndoe2
}
//Map实现
let oMap = new Map([['name1','1'],['name2','2']])

//hash -> 将不定的属性值通过算法实现在一定范围内

```

Map存储原理图：

![](C:\Users\Administrator\Desktop\markdown笔记

\typoraImg\Map原理图.png)

<font color="red">优化：</font>相同类型的值存取福过多会开辟新的对象进行关联存储（通过算法优化实现）

Map模拟实现：

```js
//1.存储值不能重复
//2.键名可以是任意类型：Number Function Object String Array等
//3.拥有set,get,delete,has,clear方法
function myMap () {
    //规定桶的长度为8
    this.bucketLength = 8
    this.init()
}
myMap.prototype.init = function () {
    //初始化一个桶
    this.bucket = new Array(this.bucketLength)
    for(let i = 0; i < this.bucket.length; i++){
        this.bucket[i] = {
            type: 'bucket_'  + i,
            next: null
        }
    }
}
myMap.prototype.makeHash = function () {
    //哈希算法：范围限定[0,8) 重复算值固定
    let hash = 0
    if(typeof key !== 'string'){
        //判断数字类型，将NaN区分开
        if(typeof key === 'number') {
            //Object.is()可以判断NaN，原理是NaN + '' === 'NaN'，严格相等
            hash = Object.is(key,NaN) ? 0 : key;
        }
        //判断对象类型
        else if(typeof key === 'object'){
            //{} [] null
            hash = 1
        }
        //判断布尔值
        else if(typeof key === 'boolean'){
            hash = Number(key)
        }else {
            //undefined和function
            hash = 2
        }
    }else {
        //string类型 
        //长度大于等于3，前三个字符ASCII累加
        for(let i = 0; i < 3; i++) {
            //防止字符串太小报错进行存在的判断
            hash += key[i] ? key[i].charCodeAt() : 0;
        } 
    }
    //让hash在一个0-8的范围
        return hash % 8;
}

//查找链表,进行值得设置
myMap.prototype.set = function (key, value) {
    //根据这个值判断方进哪个桶
    let hash = this.makeHash(key)
    //当前桶的值
    let oTempBucket = this.bucket[hash]
    //如果当前桶有值，就去看下一个next的值
    while(oTempBucket.next){
        //如果键名重复，就进行值的覆盖
        if(oTempBucket.next.key === key){
           oTempBucket.next.value = value
        } else{
           oTempBucket = oTempBucket.next
        }
    }
    //键名不存在，进行存值
    oTempBucket.next = {key,value,next: null};
}

//找值
myMap.prototype.get = function (key) {
    let hash = this.makeHash(key)
    let oTempBucket = this.bucket[hash]
    //优化：跳出第一个存取type的,这不是我们存取的，不进行判断
    while(oTempBucket.next){
        oTempBucket = oTempBucket.next;
        if(oTempBucket.key === key){
            return oTempBucket.value;
        }
    }
    return false;
}

myMap.prototype.delete = function (key) {
    let hash = this.makeHash(key)
    let oTempBucket = this.bucket[hash]
    while(oTempBucket.next){
        //原文较绕，进行更改
        oTempBucket = oTempBucket.next;
        if(oTempBucket.key === key){
            //直接用后面的值覆盖前面的值，完成删除
            oTempBucket = oTempBucket.next;
            return true;
        }
    }
    return false;
}

myMap.prototype.has = function (key) {
    let hash = this.makeHash(key)
    let oTempBucket = this.bucket[hash]
    while(oTempBucket.next){
        oTempBucket = oTempBucket.next;
        if(oTempBucket.key === key){
            return true;
        }
    }
    return false;
}
myMap.prototype.clear = function () {
    this.init()
}
let oMap = new myMap()
oMap.set('name','chenxiang')
```

##### 11、promise异步编程

异步编程简述：无论是浏览器环境中还是node环境中，我们都会使用JavaScript完成各种异步操作，如在浏览器环境中的定时器、事件、Ajax等或是node环境中的文件读取、事件等。伴随着异步编程的就是回调机制，异步编程避免不了回调。

异步编程问题：产生回调地狱、难于维护和扩展，同步并发的异步存在一定问题，try...catch..只能捕获同步代码中出现的异常

jQuery：callbacks管理回调

Loadash：回调管理（Loadash.js）

Promise前奏：

```js
//高阶函数：函数参数函数，函数返回值是函数
let fs = require('fs')
//异步操作,data保存路径，一级一级找最后的文件，回调地狱
fs.readFile('./data/name.txt',(err,data) => {
    if(err) console.log('fail to open the file');
    if(data) {
        fs.readFile(data,(err,data) => {
            ...
        })
    }
})；
        
//前端错误补救
window.onerror = (e) => {
   console.log('haha')
    do something here...
}
console.log(a)
    
//后端错误补救
1.try {
    //报错
     console.log(arr)
}catch(e) {
    console.log(e)
    //继续执行
    console.log(9)
}

2.process.on('uncaughtException',(err) => {
    //继续执行的代码
    console.log('go on')
})
//报错
console.log(haha)
  
//发布订阅
let Store = {
     list: [],
     times: 3,
     subscribe (func) {
        this.list.push(func)
  },
     fire (...arg) {
          --this.times == 0 && 							 this.list.forEach(elem => 						 elem.apply(null,arguments))
  }
}
```

Promise：

```js
//Promise是内置函数，必须传入执行函数
//jQuery中deffered: done fail progress,resolve reject notify
let oPro = new Promise((resolve, reject) => {
    console.log(0)//传入的执行函数是同步执行的
})
console.log(1)//输出： 0 1

//Promise是利用
//异步操作分类：
//1.宏任务（优先放进任务队列中）：Ajax任务 事件
//2.微任务有优先执行权：promise就是
let oPro2 = new Promise((resolve, reject) => {
    setTimeout(() => {
        Math.random()*100 > 60 ? resolve('pass') : reject('fail');
    },1000)
})
//then注册成功失败的回调，只能传递两个参数，注册的函数是同步执行的
//1.上一个then不抛出错误的话，下一个then执行成功的函数
//2.返回值作为下一个then的注册函数的执行函数
//3.返回Promise对象，下一个then根据前面成功失败进行执行成功还是失败
//4.抛出错误的话，下一个then执行失败的回调
oPro2.then((val) => {
    console.log(val)
},(f) => {
    console.log(f)
})

//利用Promise解决回调地狱
let fs = require('fs')
function readFile (path) {
    return new Promise((res,rej) => {
        fs.readFile(path,'utf-8',(err,data) => {
            if(data) {
                res(data)
            }
        })
    })
}

readFile('./data/number.txt').then((data) => {
    return readFile(data);
}).then((data) => {
    return readFile(data);
}).then(data => {
    console.log(data)
})

//链式调用的时候，如果写一个空的then不会影响后面的then的执行
//注意：1.使用.catch捕获异常，后面的then也会执行，但是传递的参数不会传到成功函数里 2.只传成功，不返回promise对象，一直走成功回调 3.finally结束回调

//Promise.all
Promise.all([readFile(path1),readFile(path2),readFile(path3)]).then(() => {
    console.log(val)//val为{path1,path2,path3}
})

//测试Promise.all()
function test (x) {
    return new Promise((res,rej) => {
        setTimeout(() => {
            Math.random()*100 > 60 ? res(x) : reject(x);
        },1000)
    })
}

//成功的时候返回的是一个结果的数组
//失败的时候则返回最先被reject的值
let oPromise = new Promise.all([test('a'),test('b'),test('c')])
oPromise.then((success) => {
    console.log(success)
},(failure) => {
    console.log(failure)
})

//只要一个成功
Promise.race([readFile(path1),readFile(path2)]).then((val) => {
    console.log(val)
})
```

Promise实现：

```js
//触发状态
function MyPromise (executor) {
    var self = this
    self.status = 'pending'
    self.resolveValue = null
    self.rejectReason = null
    
    function resolve (val) {
        if(self.status === 'pending') {
           self.status = 'Fulfilled' 
           self.resolveValue = val
        }
    }
    
    function reject (reason) {
        if(self.status === 'pending') {
          	self.status = 'Rejected'
            self.rejectReason = reason
        }
    }
    
    //抛出错误走reject函数
    try {
        executor(resolve,reject)
    }catch (e) {
        reject(e)
    }
}

MyPromise.prototype.then = function (onfulfilled,onrejected) {
    var self = this;
    if(self.status === 'Fulfilled') {
       onfulfilled(self.reslveValue) 
    }
    
    if(self.status === 'Rejected') {
       onrejected(self.reslveValue) 
    }
}
```

