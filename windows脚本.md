### windows cmd批处理脚本

<hr>

### 1、常用批处理命令

#### （1）copy创建bat文件

copy con filename.bat可以创建一个批处理文件（适用于创建简单的批处理文件）

```bat
> copy con demo.bat
@echo on
if exist a.txt echo There is a.txt exsisted already!
# 生成一个简单批处理脚本
#　使用ctrl + z退出编辑，回到命令行
```



#### （2）edit创建bat文件

win7下没有，XP和DOS下的编辑工具



#### （3）echo命令

命令格式： echo [{on|off}] [message]

echo回显命令（是否在命令行显示这条命令）

on：允许在执行过程中回显

off：关闭回显

@：关闭此条命令自身的回显，因为echo自身是要显示出来的

```bat
echo on 
# type命令，在命令行显示文件内容
# 命令行默认GBK（ANSI），UTF-8格式会乱码
type a.txt
echo hidden the comman line in cmd
echo off
type a.txt
```

`echo.`输出指令后输出空白行

`pause`暂停脚本，按任意键继续，后面的指令才执行



#### （4）call命令

调用另一个批处理文件，或者调用一次`:标识符`后的所有执行语句一次，然后返回标号出继续向下执行

命令格式： call [ [Drive:]\[path] filename [BatchParameters] ] [:label] [arguments]

`call C:/demo.bat hello chenxiang`

```bat
@echo off 
echo 111***
call :goto
echo 222***
:goto
echo 333****
```



#### （5）rem命令

注释命令

```bat
@echo off
rem 这是简单的批处理文件注释
echo hello > a.txt
type a.txt
rem dir命令显示文件的详细信息
dir a.txt
```



#### （6）set命令

设置临时环境变量

所有在**cmd**命令行里对环境变量的修改只对当前窗口有效，关闭**cmd**命令行窗口，将不再起作用。

`set mypath=%mypath%;c:/Users/86180`



设置永久环境变量

`setx mypath "c:/"`

```bat
@echo off
rem 设置变量mypath，必须使用"双引号
set mypath="c:/"
rem 或者写为 set mypath=%mypath%;c:/Users/86180

rem 输出一段描述文字
echo show variables start with word m

rem 显示所有以m开头的环境变量
set m

rem 显示所有C盘下的文件夹,\w以列表形式显示所有内容
dir /w %mypath%

rem 清除变量mypath
set mypath=
```



#### （7）分支语句goto

命令格式：goto label

直接跳转到该标签下的语句进行执行

注意label名**有效长度**为8个字符，可以使用空格，不能使用,和：

```bat
@echo off
goto last 
rem 以下命令不会执行
dir
type a.txt
:last
dir a.txt
```



#### （8）start命令

启动一个单独的窗口以运行指定的程序或命令

start ["title"] [/d Path] [/i:] [/min] [/max] [{/separate|shared}] [/wait]



  "title"     在窗口标题栏中显示的标题。
  path        启动目录。
  B           启动应用程序，但不创建新窗口。
              应用程序已忽略 ^C 处理。除非应用程序
              启用 ^C 处理，否则 ^Break 是唯一可以中断
              该应用程序的方式。
  I           新的环境将是传递
              给 cmd.exe 的原始环境，而不是当前环境。
  MIN         以最小化方式启动窗口。
  MAX         以最大化方式启动窗口。
  SEPARATE    在单独的内存空间中启动 16 位 Windows 程序。
  SHARED      在共享内存空间中启动 16 位 Windows 程序。
  LOW         在 IDLE 优先级类中启动应用程序。
  NORMAL      在 NORMAL 优先级类中启动应用程序。
  HIGH        在 HIGH 优先级类中启动应用程序。
  REALTIME    在 REALTIME 优先级类中启动应用程序。
  ABOVENORMAL 在 ABOVENORMAL 优先级类中启动应用程序。
  BELOWNORMAL 在 BELOWNORMAL 优先级类中启动应用程序。
  NODE        将首选非一致性内存结构(NUMA)节点指定为
                十进制整数。



### 2、PowerShell学习

#### 2.1 PowerShell简介

支持面向对象，与.net绑定，可以与vbs互相调用，可扩展性好

```cmd
# 查看powershell版本
ps > $PSVersionTable
```



#### 2.2 常用指令

##### （1）管道

powershell支持查看文件信息的方式：ls（Linux）和dir（Windows）

管道作用，将第一次的执行结果作为第二次指令筛选后的结果

```cmd
# 显示当前路径所有文件信息
# format-table表格所有信息 + 展示的指定列
ps > ls | format-table name,mode
```



##### （2）重定向

\>：清除后重新写入

\>\>：在原文件后追加

```cmd
# 将hello写入demo.txt
ps > echo hello > demo.txt
# 将world写入demo.txt，此时文件内容只有world
ps > echo world > demo.txt

ps > echo hello > demo.txt
# 此时文件内容为hello world
ps > echo world >> demo.txt
```



##### （3）基础运算

```cmd
# 逻辑运算,比较运算
ps > 2.8gb -gt 2086mb  
True

# 数学运算
ps > 2000/4/2*30
7500

# 进制转换（将16进制转化为10进制）
ps > 0x11
17
```



##### （4）添加环境变量

系统变量，可以直接打开所有注册了环境变量的程序

```cmd
# 打开系统环境变量中存在的程序
# 打开微信
ps > wechat.exe

# 在当前窗口添加一个mypath的环境变量（只在当前窗口生效）
ps > $env:mypath=$env:mypath+"c:/"
```



##### （5）命令集

```cmd
# 查看命令集
ps > get-command
CommandType     Name             Version    Source
Alias           Add-AppPackage   2.0.1.0    Appx

# 查看某个命令用法 可以查到别名是gcm
ps > get-help get-command

# 查看当前目录的信息 可以查到别名是gci
ps > get-childItem

# 查看指令对应的真实底层指令
ps > get-alias -name ls
```

powershell启动会加载cmd程序

Cmdlet,Alias,Function指令是powershell的指令信息



##### （6）alias指令

```cmd
# 查看所有以Remove开头的指令
ps > get-alias | where {$_.definition.startswith("Remove")}

# 获取所有别名信息，根据对象名，对象，降序排序并计算数量
ps > get-alias | group-object definition | sort -descending Count
```

$_当前对象(get-alias获取的的对象)，definition是一个数组，调用startswith方法筛选



自定义别名：临时生效

```cmd
# 将notepad设置别名为mypad
ps > set-alias -name mypad -value nodepad

# 删除别名
ps > del alias:pad
```



导出别名

```cmd
# 导出别名到一个文件
export-alias demo.ps1

# 强制导入一个别名文件
import-alias -force demo.ps1
```



##### （7）变量相关

定义变量

注意：大小写不敏感，A和a是相同的

```cmd
# 定义变量，打印变量值
ps > $name="xiaoming"
ps > $name
xiaoming

# 定义特殊名字的变量
ps > ${oh 1*(^$*# 太难了}="shit"  
ps > ${oh 1*(^$*# 太难了}
shit

ps > $n=7*8-6+50  
ps > $n
100
ps > $n=ls
# 与ls一样会显示文件夹信息
ps > $n
```



变量值修改与查看

```cmd
ps > $num1=20
ps > $num2=30
# 交换变量值
ps > $num1,$num2=$num2,$num1

# 查看变量值，显示所有以num开头的变量值
ps > ls variable:num*
# 查看所有正在使用的变量值
ps > ls variable:

# 查看变量值是否存在
ps > test-path variable:num1
True
ps > test-path variable:num0
False

# 删除变量
ps > del variable:num1
ps > test-path variable:num1
False
ps > clear-variable num2
ps > remove-variable num2

# 定义只读变量，值不允许修改
ps > new-variable num -value 100 -force -option readonly
# 删除操作，必须-force强制删除
ps > del variable:num -force
```



自动化变量

powershell窗口打开就会加载的变量

```cmd
# 自动化变量，ps自动创建，很多是只读的
ps > $home
C:\Users\86180

# ps窗口的进程号
ps > $pid
3472
```

$$：显示最后一条指令 $?：显示最后一条指令运行成功还是失败



环境变量

```cmd
# 查看环境变量
ps > ls env:
ps > $env:windir
c:/windows

ps > $env:name="digest"
ps > $env:name
digest
ps > ls $env:na*
name   digest

# 删除环境变量
ps > del env:name

# 设置环境变量，变量名path，值为D:/，只对当前用户生效
ps > [environment]::setenvironmentvariable("PATH","D:/","User")
ps > [environment]::getenvironmentvariable("PATH","User")
```



##### （8）解除策略和执行ps脚本

流程

+ 将ps1脚本拖到ps窗口，默认是无法执行的
+ 执行`get-excutionpolicy`指令，查看ps的执行策略
+ 执行`set-excutionpolicy`指令，修改为RemoteSigned
+ 可以执行了



##### （9）调用脚本文件相关

调用bat脚本文件

```bat
c: > copy con demo.bat
@echo off
echo hello world
c: > powershell
ps > .\demo.bat
hello
world
```



调用VBS脚本

demo.vbs

```vbscript
msgbox "hello world"
```

执行.\demo.vbs



通过批处理调用ps1脚本

ps1

```ps1
$number=49
switch($number){
	{$_ -lt 50} -and ($_ -gt 40) {"此数值小于50，大于四十"}
	50 {"此数值等于50"}
	{$_ -lt 40} {"此数值小于40"}
	{$_ -gt 50} {"此数值大于50"}
}
```



cmd命令行执行批处理脚本，执行powershell脚本

bat

```bat
@echo off
powershell "& 'C:\Users\86180\Desktop\demo.ps1'"
```



操作符

-eq 等于 

-nq 不等于

-le 小于等于

-ge 大于等于

-lt 小于

-gt 大于

-le 小于等于

-ge 大于等于

-contains 包含

-notcontains 不包含

-and 与

-not 非

-or 或

-xor 异或



条件判断

ps1脚本

（1）if语句

```bat
$num=100
if($num -gt 90){"num > 90"}else{"num <= 90"}
if($num -gt 100){"num > 100"}
elseif($num -eq 100){"num == 100"}
else{"num < 100"}
```



（2）switch语句

```powershell
$num=30
switch($num){
	{$_ -gt 50} {"num > 50"}
	50 {"num == 50"}
	{$_ -lt 50} {"num < 50"}
}
```



（3）foreach

```powershell
$arr=1..10
foreach ($n in $arr){
	$n*$n
}

# 打印桌面大于1MB的文件名
$c_path=dir c:\Users\86180\Desktop
foreach ($file in $c_path){
	if($file.length -gt 1mb){
		$file.name
	}
}
```



（4）do while

while

```powershell
$num=15
while($num -gt 10){
	$num
	$num--
}
```

do while

```bat
$num=15
do{
	$num
	$num--
}while($num -gt 10)
```



（5）break和continue

break跳出整个循环

continue跳出某次循环



（6）powershell实现1-100求和

```bat
$num=0
for($i=1;$i -le 100;$i++){
	$num+=i;
}
$num
```



（7）switch循环

```bat
$num=1..10
switch($num){
	default{"num=$_"}
}

$num=1..10
switch($num){
	{($_ % 2 -eq 0)} {"num id odd"}
	{($_ % 2 -eq 0)} {"num is even"}
}
```



（8）创建数组

```bat
$arr=1..10
$arr=1,3,5,7
$arr=1,"hello"

# 定义空数组
$arr=@()

# 只有一个元素
$arr=,"hello world"

# 判断是否为数组
$arr -is [array]

# 操作系统相关数组
$arr=ipconfig
$arr -is [array]
```



访问数组

```bat
$arr=1,"hello",(get-date)
# 访问数组元素
$arr[2]

# 访问最后一个元素
$arr[-1]

# 赋值
$arr=$arr[0..2]

# 查看数组元素长度
$arr.count

# 倒序
$arr=1,"hello",(get-date)
$arr[($arr.count)..0]

# 添加元素
$arr+="hahaha"
```



（9）函数

```bat
function myFunc (){
	ping www.baidu.com
}

function myPing ($site) {
	ping $site
}

function myPrint ($name,$age) {
	$content="I am $name,I am $age years old."
	write-host $content
}

myPing www.baidu.com
```



函数返回值

```bat
function returnValFunc ($num) {
	return $num*$num
}

# 多个返回值
function returnVals ($num) {
	//查看数据类型
	$num.gettype().fullname
	$num1=$num*$num
	$num2=$num+20
	return $num1,$num2
}

function myPing ($site) {
	ping $site
}
function myPrint ($name,$age) {
	$content="name:$name,age:$age"
	write-host $content
}
function returnValFunc ($num) {
	$num.gettype().fullname
	return $num*$num
}
function returnVals ($num) {
	$num1=$num*$num
	$num2=$num+20
	return $num1,$num2
}
function sayShadiao ($name) {
	$content=$name+"是沙雕"
	write-host $content
}
function sayShadiao ($name) {
	$content=$name+":灰灰,我爱你,你删了我以后，我难过了好久，终日以泪洗面"
	write-host $content
}
sayShadiao "李斌"
```

转移字符\`

\`n换行

\`t制表符



操作注册表

regedit