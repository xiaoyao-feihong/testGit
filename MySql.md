## MySql学习

##### 1、学习流程

MySQL：最流行的开源数据库

JDBC：数据库连接池

JavaEE（Web部分）：Tomcat，Servelet，JSP，EL+JSTL，Filter，Listener，XML，Cookie，AJAX

##### 2、数据库介绍 

数据库：本质就是文件，进行数据永久的保存，有很多的流程，可以帮我们操作文件

数据库分类：关系型数据库（SQL结构化查询语言），非关系型数据库（NOSQL）

##### 3、SQL由来

+ 1970年，IBM公司研究室，研究存储数据与数据之间的关系，将数据存储在表格里，表格之间的联系记录某种关系
+ 1974年，IBM公司，研究出一套规范语言（SEQUEL：sturctured english query language）
+ 1976年，发布新版本SEQUEL/2
+ 1980年，SQL（structured query language）
+ 1989年，国际化标准化组织（ISO）颁布SQL正式国际标准，SQL89标准，现在很多数据库厂商还在遵循沿用这套规范
+ 微软公司：SQLServer数据库，Access数据库（Office办公软件）
+ Oracle公司：Oracle数据库，MySQL数据库（最早是瑞典一家公司MySQL），SUN并购了MySQL，后SUN公司被Oracle数据库
+ 大型服务器系统是Linux，所以微软的数据库存在兼容性问题，一般使用MySQL和Oracle数据库

##### 4、操作数据库的语言规范

 Structured Query Language

+ <font color="red">DDL</font>：data definition language，数据定义语言，用来创建，删除修改数据库中的对象（表格，用户，索引，试图，存储过程，触发器）
  - 关键字：`create`创建，`drop`删除，`alter`修改
  - 不区分大小写，执行前都会转化为大写，所以建议指令使用大写；
+ <font color="red">DML</font>：data manipulation language数据操作语言，用来操作数据库表格中的具体数据
  - 写数据：`insert`新增，`delete`删除，`update`修改
  - 读数据：select查询
    - DQL：data query language读数据的分支，数据查询语言
      - `select`查询，`where`条件，`group by`分组，`having`条件，`order by`排序


+ DCL：data control language数据控制语言
  - 用来控制用户权限：SYSDBA数据库管理员，`grant to`赋予权限，`revoke from`回收权限

+ <font color="red">TPL</font>：transaction process language事物处理语言（多线程并发访问同一个文件资源，带来的安全问题），`begin Transaction`操作，`commit`提交，`rollback`回滚，`save point A`保存还原点

##### 5、安装和卸载MySql

+ 网址：https://www.mysql.com，下载社区版（MySQL Community Downloads）
+ MySql8.0版本还不太稳定，所以下载5.7版本

+  安装完成以后，在我的电脑M里找到MySQL（MySQL5.7 command line client）
+ 输入密码后显示welcome表示连接数据库成功，一个服务中可以有多个小工程
+ 一些操作小指令：`show databeses;`显示root账户下所有的数据库，注意数据库语句必须以`;`表示语句结束；`use 数据库名字;`表示使用某一个数据库；`show tables;`指令显示当前的database种所有的表格；`exit;`退出窗口
+ 使用数据库时需注意的小问题
  - 先启动服务器，loacalhost 3306，在我的电脑右键管理/服务和应用程序/服务/MySQL，右键属性/启动类型种可以设置自动和手动，如果设置手动，MySQL不会自动开启，要自己记得开启，自动则会在电脑开启时启动MySQL服务器，建议设置自动
  - 如果打开命令行窗口，输入密码没有反应，1）密码错误 2）MySQL没有启动
  - 删除数据库的时候记得要先停止MySQL的服务

+ 卸载：1）停止服务 2）卸载产品 3）利用卸载程序卸载 4）删除注册表
  - 先进入运行（win+r），输入regedit,找到HKEY_LOCAL_MACHINE/SYSTEM/ControlSet001/Services/MySQL和EventLog/MySQL，所有的ControlSet的Service和EventLog都要找一遍，然后删掉MySQL
  - 手动访问当前目标的安装目录，找到MySQL文件夹，然后删掉
  - 找到系统盘中的ProgramData里的MySQL文件夹删掉
  - 删除后要重启电脑，如果重新安装出现冲突问题，说明注册表还有残留，继续寻找删除

##### 6、DDL数据库定义语言

+ 先在MySQL数据库中创建一个database：`create database 数据库名;`名字不区分大小写，保证见名知意
+ 创建table，`create table 表格名字(列名 数据类型（长度）,列名 数据类型（长度）)`
  - 数据库中数据类型，按存储数据的方式来分类
    - 数值型
      - 整数：tinyint(1byte) smallint(2byte) mediumint(3byte) *int(4byte)/integer bigint(8byte)
      - 浮点：*float(4byte) *double(8byte) decimal(4byte) numeric(8byte);float和double更精确
    - 字符串
      - 存储字符串
        - *varchar(4byte)可变长字符串，根据存入的字符个数可以变长，'a'1字节，'ab'2字节
        - char(4byte)字符串，固定字节，'a'4字节，'ab'4字节
      - 存储二进制
        - binary二进制
        - varbinary可变二进制
        - blob二进制大文本
        - text正常字符大文本
    - 日期/时间
      - *date日期
      - time时间
      - *datetime日期和时间
      - timestamp时间戳

+ 修改表格的结构
  - 表格名字修改：`alter table 原表名 rename to 新表名;`
  - 修改原有的列名（列类型不对，列长度不够）：`alter table 表名 原列名 change  新列名 新类型 新长度; `
  - 新增一个列：`alter table 表名 add 新列名 新类型 新长度 `
  - 删除一个原有的列：`alter table 表名 drop 列名  ;`
  - 删除表格：`drop table 表格名字;`
  - 删除数据库：`drop database 数据库名字;`

```java
create database test;
use test;
create table student (
	sid int(20);
    sname varchar(40);
    sage int(4)
);
alter table student rename to stuinform;//表格重命名
alter table stuinform change sid snum;//更改表格列名
alter table stuinform add sscore int(4);//表格添加一列
alter table stuinform drop sscore;//删除一列
drop stuinform;//删除一个表
drop database test;//删除数据库
```

##### 7、DML（data manupalation language）数据库操作语言

+ `insert`新增记录：`insert into tablename(sid,sname) values(1123,'chen');`，如果想要新增的记录是全部表格的列，可以省略表名后的括号内容，但是values值的个数与类型都必须与表格中列顺序，类型，个数一致`insert into tablename values(),(),();`

+ `select`查询记录：`select sid,sname sage,ssex from student;  `选择指定表中指定的信息，`select * from student;`选择所有元素（性能较慢，不建议使用）
- 查询数据库编码字符集：`select schema_name,default_character_set_name from information_schema.schemata where schema_name = 'test' ;`默认字符集是latin1字符集
  
- 设置默认编码字符集：`create database test default character set = 'utf8';`
  
- 创建表格的时候设置字符集：`create table tablename()character set utf8;`
  
+ `delete`删除记录：`delete from tablename where 条件` 

+ `update`改变记录：`update tablename set ssex='male',sname='chen' where...; `
- 建议不要使用*
  - 默认排序方式
    - utf8_general_ci性能比较高，可能不精确（俄罗斯，越南）
    - utf8_uncode_ci性能较低，扩展性好



###### （1）条件筛选where

> 1）`where`除去insert，其它操作都可以做筛选
>
> 2）`where`是一个关键字，拼接在语句的基本结构之后
>
> 3）按照某一个列或者是一些条件进行筛选
>
> 4）`where`的运算符：
>
> 比较运算符 `>` `>=` `<` `<=` `!=` `=`
>
> 算数运算符 `+` `-` `*` `/`
>
> 逻辑运算符 `and`(且) `or`(或) `not`(非)
>
> 5）数据库底层做的事情
>
> `and`运算符（`and` 和 `or` 同时出现时，`and` 优先级高）
>
> （1) 解析数据库
>
> （2) 将表格中所有数据读取出来，放在数据库缓存，集合List
>
> （3) 将List循环遍历，每一次拿到一行记录，判断是否符合条件
>
> ​	假设我们有7条记录，5条满足条件1，2条同时满足
>
> ​	条件1和2，先运行7次，得到结果5条
>
> ​	第二个where条件，循环5次，得到最终我们想要2条的数据
>
> （4) 如果语句中使用and，将条件苛刻的放在and前面，提高查询性能
>
> （5) between and可以替代and，功能一样，但是性能更高，类似一个条件查询
>
> `in`运算符
>
> 如下的1条件满足一个即可
>
> eg：select * from student where chinese in (92,97)只查找语文成绩为92或97的
>
> `like`运算符
>
> 查询像什么，**模糊查询**(%用来代替0-n个字符，_用来代替一个字符，有且只有一个)
>
> eg：`select * from student where sname like 'z%';`查找名字以z开头的
>
> eg：`select * from student where sname like '_h%';`查找第二个字母是h的
>
> eg：`select * from student where sname like '%n%';`查找名字中含有n的所有匹配项
>
> 6）`as` 运算符
>
> eg：select sname,chinese,chinese+english as sum from student;
>
> 选择语文并新建一个列名为sum，值为语文英语成绩之和的列
>
> 7）demo
>
> ```java
> //创建一个学生表格，记录学生信息
> create database demo;
> use demo;
> create table sutdent(
> 	sid int(5),
>     sname varchar(10),
>     ssex varchar(4),
>     sage int(3),
>     sbirth date,
>     Chinese float(5.2),//总共存储5个数字，小数点后2位
>     English float(5.2),
>     Physics float(5.2),
>     Chemistry float(5.2)
> )character set utf8；
> insert into student values(1,'zhangsan','nan',18,'2000-01-01',97,95,92,82);
> insert into student values(2,'lisi','nan',18,'2000-01-01',87,75,62,93);
> insert into student values(3,'wangwu','lv',19,'2000-02-01',54,85,99,98);
> insert into student values(4,'zhaoliu','lv',17,'2001-01-08',97,95,62,58);
> ```



###### （2）排序order by

> 1.升序排列
>
> `select * from student order by chinese asc;`
>
> 根据语文成绩升序排列
>
> 2.降序排列
>
> `select * from student order by chinese desc;`
>
> 根据语文成绩降序排列
>
> 3.多个条件
>
> `select * from student order by chinese desc,english asc;`
>
> 根据语文成绩降序排列，如果语文成绩相同，根据英语成绩程序升序排列
>
> 小任务：
>
> 创建一个person表，共有4个列，向表中插入数据
>
> username	address	salary	department
>
> 张三		  武当		6000	   保洁部
>
> 张无忌		魔教		6000	   事业部
>
> 张三丰		武当		7000	   保洁部
>
> 周芷若		峨眉		8000	   产业部
>
> 谢逊		  魔教        5000       产业部
>
> 杨逍		  魔教		7000	   事业部
>
> （1）假设person表中所有人每个月还有100元的奖金，查询出所有人的姓名，地址年薪
>
> `select username,address,salary*12+1200 as annualsalary from person;`
>
> （2）每人每年有1000元奖金，查询出所有人的姓名，地址年薪
>
> `select username,address,salary*12+1000 as annualsalary from person;`
>
> （3）查询出所有部门为事业部的所有人信息
>
> `select * from person where department='事业部';`
>
> （4）查询工资为6000-8000之间的所有人信息
>
> `select * from person where salary between 6000 and 8000;`
>
> （5）查询所有工资为6000，7000，8000，或者姓张，并且不叫张三丰的所有人的信息
>
> `select * from person where salary in (6000,7000,8000) or username like '张%' and username!+"张三丰";`



###### （3）函数

> 1.可以理解为Java中定义的方法
>
> 2.函数需要调用才能执行，函数直接放在语句中相当于调用
>
> 3.函数可以出现的位置
>
> 4.根据功能进行划分：比较函数，数学函数，**字符串函数**，**分组函数**
>
> 5.下载数据库函数参考手册
>
> 6.流程控制函数
>
> （1）**if**(sage>18,'成人',"未成年")类似三目运算符
>
> （2）ifnull(value,targetVal)判断是否为空，为空就用后面的targetVal值 
>
> （3）字符串函数，String类
>
> ***`length()`***
>
> ***`concat()`***
>
> ***`substr(str,1,3)`***从1开始截取,截取3个
>
> ***`instr(str,'a')`***找寻a第一次出现的位置，返回索引（注意索引从1开始）
>
> ***`replace()`***
>
> ***`upper()`***
>
> ***`lower()`***
>
> `ltrim()`,`rtrim()`
>
> **`now()`**获取当前时间
>
> `lpad(sname,10,".")`最多显示10个长度，不够补.（从左边补）
>
> `rpad(sname,10,".")`最多显示10个长度，不够补.（从右边补）
>
> `reverse()`
>
> 7.demo
>
> select sname,year(sbirthday),month(abirthday);
>
> `year()`获取存入的日期格式时间的年
>
> `month()`获取月
>
> `day()`获取天
>
> 8.数学相关函数
>
> `abs()`绝对值
>
> `floor()`向下取整
>
> `round()`四舍五入
>
> `mod()`取余
>
> `pow()`求幂



###### （4）分组函数

> 1.去掉重复元素（`distinct`）
>
> `select distict ssex from student;`去重
>
> 前后列数必须保持一致
>
> `select distinct ssex,sname form student;`
>
> 必须两列都一致才会去重
>
> 2.分组函数就是为了获取元素进一步分析数据而使用的
>
> `count()`用来统计个数
>
> `max()`找最大值
>
> `min()`找最小值
>
> `avg()`求平均值
>
> `sum()`求和
>
> 3.分组条件（`group by`）
>
> （1）如果搭配了分组条件，只展示两种：分组条件，分组函数
>
> ` select ssex,count(Physics) from student where Physics<70 group by ssex;`可以对分组的数量进行统计
>
> （2）***<font color='red'>优先级：筛选（where）> 分组（group by）> 排序（order by）</font>***
>
> `having`使用与`where`类似，但是优先级别比分组`group by`低
>
> 4.嵌套查询
>
> 一个完整的SQL语句中，嵌套了另一个完整的SQL语句
>
> demo：查询表格中语文成绩最高的人
>
> `select * from student where chinese = (select max(chinese) from student);`
>
> 使用：可以将一个查询结果作为外层条件进行查询
>
> `select * from (select * from student where chinese > 80) newStudent;`
>
> 注意：将结果当作表格的时候需要给新表指定名字
>
> 5.嵌套的关键字使用
>
> `in`
>
> 以下关键字不允许写固定值，只允许写SQL语句（只能通过嵌套）
>
> `any`满足查询子集中任何一个即可	
>
> demo:`select ename from student where score = any(select score from student where score % 2 != 0;)`查找所有成绩为奇数分的同学名字
>
> `some`与any的使用完全一致
>
> `all`满足查询子集中的全部才可以
>
> 6.集合操作（Oracle数据库含有交集--intersect,差集minus）
>
> union并集(两个集合的列数必须一致)
>
> 1）*要求前后两个查询子集的列数一致*
>
> 2）类型没有要求（与Oracle可能不一致的地方，MySQL会自动进行类型转化）
>
> 3）拼接后显示的列名是前一个子集默认的列名
>
> 4）注意union和union all的区别
>
> union会在拼接时自动去掉重复，产生重复，记录的是第一次出现的元素（性能比较慢）
>
> union all将两个查询的子集直接做合并，不做任何处理，性能较快，建议使用union all来进行合并处理
>
> demo:两张表格，学生信息，老师信息，学校需要给所有老师和同学都准备统一的衣服
>
> `select tid,tname,tsex from teacher union select sid,sname,ssex from student;`



###### （5）列的约束

> 1.主键约束(`primary key`)
>
> （1）每一个表格内只能有一个列被设置为主键约束
>
> （2）主键约束通常是用来标记表格中数据的唯一存在
>
> （3）主键约束要求值非空且不能重复（唯一性）
>
> （5）使用：
>
> 所有遵循设置主键的规范：
>
> `alter table tablename add constraint constrain-name primary key (constraint-row-name)`
>
> 描述表格description：
>
> `desc tablename`描述表格description
>
> 查看表格的主键信息：
>
> `show keys from tablename`
>
> 添加主键后可以设置自增：
>
> `alter table myclass modify classid int(4) auto_increment`
>
> 和change的用法类似：
>
> `alter table myclass change classid classnumber int(4) auto_increment = 10 `
>
> 删除主键,但是非空特性还在：
>
> `alter table myclass modify classid int(4)`//修改为新列，约束就会消失
>
> `alter table myclass drop primary key`//删除主键
>
> `alter table myclass modify classid int(4) null;`//允许非空
>
> 从10开始自增
>
> `alter table myclass primary key(classid) auto_increment = 10`
>
> 可以在创建的时候设置
>
> `create table class(id int(4) primary key,name varchar(10));`
>
> 2.唯一约束(`unique key`)
>
> （1）可以为表格中的某一个列添加唯一约束，约束与主键类似
>
> （2）唯一约束表示的是列的值，不能重复，可以为空
>
> （3）唯一约束中可以存在多个列
>
> （4）使用：
>
> `alter table tablename add constraint constraint-name unique key(row-name)`
>
> 举例：
>
> `alter table myclass add constraint unique_class unique key(location)`
>
> 删除唯一约束：
>
> `alter table drop index constraintname`
>
> `alter table drop index row-name` 删除使用默认名的唯一约束
>
> 3.非空约束
>
> （1）在表格中的某一个列上添加非空约束
>
> （2）当前列的值不能为null
>
> （3）使用
>
> `alter table tablename modify 原列名 原类型 原长度 not null;  `
>
> eg:`alter table myclass modify cname varchar(20) not null`
>
> 设置默认值
>
> eg:`alter table myclass modify cage int(6) not null default 18;`
>
> **4.外键约束(`foreign key`)**
>
> 当前的列可以为空，可以重复，受到另一个表格某一列的影响，约束自己表格内的信息不能随意填写
>
> （1）添加外键约束
>
> `alter table class add constraint contsraint-name foreign key(row) references another-table`
>
> eg:`alter table class add constraint fk_key foreign key (class_id) references myclass(class_id);`
>
> （2）删除外键约束
>
> 注意外键约束其中一列是另一个表的主键
>
> `drop foreign key keyname;`
>
> 需要将两个表格中的约束都删掉，否则信息一直在
>
> `alter table table-name drop key key-name;`//列名就是另一个表格的默认外键名
>
> **建议创建外键时取约束名，否则删除时，名字并不是列名，需要自己查找进行删除**
>
> (3)显示创建表格时的定义
>
> `show create table table-name `
>
> （4）出现<font color='red'>ERROR 1215 (HY000): Cannot add foreign key constraint</font>
>
> 原因：两个关联表类型，大小不一致
>
> 解决：让它们一致
>
> 5.检查约束（Check）
>
> `alter table student add constraint ck_sage check(sage>15 and sage<30)`
>
> 列在存值的时候做一个检查，可以设置默认的范围，但是MySQL可以添加检查约束但是不起作用

###### （6）连表查询

> 1、表格之间的关系（都靠外键进行关联）
>
> （1）一对多
>
> 靠外键进行关联
>
> 设计：一端保证一个主键，多端保证一个外键
>
> （2）多对多
>
> 依靠中间表记录多对多关系 
>
> 设计：中间表设置两个外键，关联表设置主键
>
> 中间表主键：
>
> `alter table middleTable add constraint m_s_t primary key(sid,tid)`//表示联合在一起为主键
>
> （3）一对一
>
> 2、连表查询
>
> （1）等值连接
>
> + 广义笛卡尔积：比如欧洲球队（4）VS 美洲球队（3），表格之间可以没有关系
>
> + 将两个表直接都查询就是一个笛卡尔积的大表
>
> + 添加查询条件（相等的列）精简表格：在拼接后的大表的基础上通过where做筛选
>
> （2）外连接
>
> + 基本语法：`select * from A left/right [outer] join B on 条件`
> + left/right：选择左右那张表为基准，作为基准的表格数据必须全部显示出来
> + 非基准的表格按照on条件与之连接，若找到条件，正常显示，若找不到满足的条件则为null
> + 先出现的表格显示在左边，后面的表格显示在右边
>
> （3）内连接（自连接）
>
> `select * from emp inner join dept on 条件`
>
> + 查询出的结果与等值连接一致
> + 内连接不分左右，不能省略inner关键字
> + 表格可以是同一张表格，单必须取别名
> + 表格需要一定的设计
> + 性能比等值更高
>
> demo:
>
> `select a1.empno,a1.ename,a1.mgr,b1.empno,b1.ename from emp a1 inner join emp b1 on a1.mgr = b1.empno;`



###### （7）行列互换

> 1.体会
>
> | 仓库名称(wname) | 库存(wstorage) | 月份(month) |
> | --------------- | -------------- | ----------- |
> | A仓库           | 100            | 一月        |
> | B仓库           | 150            | 一月        |
> | C仓库           | 70             | 一月        |
> | A仓库           | 120            | 二月        |
> | B仓库           | 170            | 二月        |
> | C仓库           | 50             | 二月        |
>
> 统计每一个仓库前两个月的库存，变成下面这种表格：
>
> | 仓库名称 | 一月 | 二月 |
> | -------- | ---- | ---- |
> | A        | 100  | 120  |
> | B        | 150  | 170  |
> | C        | 70   | 50   |
>
> 2.设计
>
> 一旦使用`group by`，显示的列只有两种（分组条件，分组函数）
>
> `select wname as 仓库名,max(if(wmonth='一月份',wstorage,0)) as 一月份,max(if(wmonth='二月份',wstorage,0)) as 二月份,max(if(wmonth='三月份',wstorage,0)) as 三月份 from warehouse group by wname;  ` 
>
> 3.分页
>
> 分页查询 查询`limit a,b;`
>
> a表示开始的索引，b表示包括此行的偏移量
>
> 如果数量不组b条，就有多少条显示多少条
>
> demo:`select * from users limit 0,5;`从0号索引开始，显示5条数据



##### 8、DCL数据控制语言

​	database control language

> 1.控制用户的权限
>
> 2.关键字：`grant`、`invoke`
>
> 3.流程
>
> + 创建一个新用户
>
> + 给新用户赋予权限
>
> + 注销
>
> + 用新用户登录
>
> + 回收用户权限
>
> + 删除创建用户
>
> 4.MySQL配置环境变量
>
> 1）利用Windows的cmd命令行
>
> 2）目录：MySQL所在文件夹/MySQL server 5.7/bin，复制路径，添加到环境变量
>
> 3）切换到管理员文件夹（当前电脑86180），输入指令：
>
> `mysql -u root -p`关联root的密码
>
> 40通过root账号连接到mysql的数据库中找到user表（记录用户信息的表）
>
> 5）查看user host password(5.7版本密码采用md5进行了加密) authentication_string列
>
> 6）创建用户
>
> `create user 用户名@IP identified by 密码;`
>
> demo：`create user 'cx'@'localhost' identified by '123456';`
>
> 创建成功以后用户只有一个权限Usage，只允许登录不允许其它操作
>
> 7）赋予权限
>
> 查看权限：`show grants for 'cx'@'localhost';`
>
> 赋予权限：
>
> grant 权限 on 数据库名.表 to '用户名'@'IP'
>
> `grant all on *.* to 'cx'@'localhost;'`赋予所有权限，最后应该刷新
>
> `flush privileges`
>
> 8）回收用户权限
>
> `revoke 权限 on 数据库.表名 from '用户名'@'IP'  `
>
> 权限可以查询百度
>
> 9）修改用户密码
>
> `update user set authentication_string = password(newpassword) where user = 'zzt';`
>
> 10）删除用户
>
> `drop user 'username'@'IP';`删除更干净，用户和关联表的信息都会删除（用delete只是删除了user表的信息，但是账号与数据库的关联没有删除，如果重新创建的用户名重复会导致继承这个关系，带来冲突）

##### 9、数据库设计的范式

> 1.设计数据库时，遵循的不同规范，范式的目的时减少数据库中的冗余，类似于Java的设计模式（Normal Form）
>
> 2.第一范式（原子性）
>
> + 数据库中的每一个列都是不可分割的
> + 每一个表格都要有主键约束
> + 如果都不满足主键条件，可以采用联合主键
>
> 3.第二范式（部分依赖性）
>
> + 在满足第一范式的前提下
> + 不允许出现部分依赖性（非主键列不能收到主键列或主键的一部分影响）
>
> 4.第三范式
>
> + 在满足前两个范式的前提下，不允许出现传递依赖性
> + 不允许出现传递依赖性(非主键列不能受到非主键列或非主键的一部分影响)
> 
> 5.范式可以方便我们进行连表查询



##### 10、编辑器的安装与卸载

> 1.WorkBench（MySQL官方提供的）
>
> 推荐使用
>
> （1）下载安装程序：https://dev.mysql.com/downloads/workbench
>
> （2）在other download下选择安装
>
> （3）可能会在安装过程中缺失一个环境
>
> ​	Microsoft .NET Framework 4.x
>
> ​	在下载页上面可以找到
>
> 2.SQLYog
>
> 3.Navicat

##### 11、Transaction

> 1.事物可以理解为让数据库做事情
>
> + 一件事情中的所有操作应该是统一的，要么都成功，要么都失败
> + 多线程并发操作同一张表格可能带来的安全问题
>
> 2.事物的四大特性
>
> + A：Atomicity，原子性，一个事物的所有操作是一个整体，不可再分
> + C：Consistency，一致性，多个用户看到的效果一致
> + I：Isolation，隔离性，多个用户并发访问的时候，一个用户操作数据库，另一个用户不能有所干扰，多个用户之间的数据事物要互相隔离（隔离级别越高，性能越差）
> + D：Durability，持久性，指的是一个用户操作数据的事物一旦提交，数据库底层的改变是永久性的
>
> 3.事物的流程
>
> （1）开启一个事物
>
> ​	每一次执行一条语句之前，MySQL都会默认开启一个事物
>
> （2）执行操作
>
> ​	insert,update,delete真实改变数据
>
> ​	select开启事物，只是不改变数据
>
> （3）事物的处理
>
> ​	提交/回滚/保存还原点，mysql会默认执行提交事物，Oracle需要手动提交
>
> （4）事物操作
>
> + 查询变量
>
> `show variables like '%commit%';`查询变量
>
> `show variables like 'autocommit';`查询自动开启的变量
>
> + 设置变量
>
> `set autocommit = off;`设置自动提交关闭
>
> + 手动开启事物
>
> `begin;相当于start transaction;`如果不提交最后数据是没法更改的
>
> `begin; insert into student values(...);`
>
> + 回滚
>
> `rollback;` *回滚*(Rollback)指的是程序或数据处理错误,将程序或数据恢复到上一次正确状态的行为
>
> + 提交
>
> `commit;`
>
> （5）事物隔离级别（按照级别高到低排序）
>
> `Seriralizable`级别最高，可以避免所有出现的问题，性能最差
>
> `Repeatable Read`可重复读（避免脏读，不可重复读）
>
> `Read Commited`读已提交（避免脏读,不能避免不可重复读）
>
> `Read UnCommited`读取未提交（所有效果均无法保证）
>
> *不设置隔离级别可能导致的问题：*
>
> **脏读**：一个人读到另外一个人还没有提交的数据。
>
> 级别是uncomitted会出现
>
> A，B操作同一个表，A对表格进行了操作，但是没有提交，然后回滚取消了修改，此时B读取到了没用的数据
>
> **不可重复读**
>
> 级别是commited会出现
>
> A，B操作同一个表，A先读取了一个数据，读完之后B此时将数据做了修改/删除操作，A按照之前的条件重新读一遍，与第一次读取的不一致
>
> **幻读**
>
> A，B操作同一个表，A先读取了一些数据，读完之后B此时将数据做了新增，A在按照之前的条件重新读一遍，与第一次读取的数据不一致
>
> MySQL默认设置级别是不可重复度（Repeatable Read）
>
> （6）设置隔离级别
>
> 设置隔离级别：
>
> `set session transaction isolation level uncommited;`
>
> serializable,repeatable read,commited,uncommited
>
> 查看隔离级别：
>
> `select @@tx_isolation;`