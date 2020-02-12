### Linux和Nginx

<hr>



##### 1、Linux介绍

##### （1）Unix

Unix是一个强大的多用户、多任务**操作系统**。

+ 1969年在AT&T的贝尔实验室开发
+ Unix的商标权由国际开放组织（The Open Group）所拥有
+ Unix操作系统是商业版，需要收费，价格比Microsoft Windows正版要贵一些



##### （2）Linux概述

基于Unix的

+ Linux是一种自由和**开放源码**的操作系统，有着许多不同的Linux版本，但是它们都使用了Linux内核。Linux可安装在各种计算机硬件设备中，比如平板、手机、路由、台式计算机等



+ Linux内核衍生出来的操作系统：

CentOS、Linux（红旗）、SuSe、ubuntu



+ 起源：诞生于1991年10月5日，由Linus Torvalds和后来加入的众多爱好者共同开发完成的。1990年年底由个人爱好设计出Linux系统核心。发布于芬兰最大的ftp服务器上，用户可以免费下载，随着可以下载的软件的增多，不断壮大起来。

Logo企鹅：南极的企鹅，因为南极不属于任何国家。



+ Linux系统的应用

服务器系统

嵌入式系统

高性能运算、计算密集型应用

桌面应用系统

移动手持系统



+ Linux的版本

Linux版本分为两种：

内核版和发行版本

内核版本：在Linus领导下的内核小组开发维护的系统内核版本号

发行版本：是一些组织和公司根据自己发行版的不同而制定的



Linux的主流版本：Linux mint、Ubuntu、archlinux、centos、red hat 、Debian、fedora、open SUSE、中标麒麟



##### （3）Linux的安装

虚拟机安装

虚拟机：相当于一台虚拟的电脑

虚拟机常用的软件：VmWare（收费）、VirtualBox（免费）



流程：

> 1、选择典型安装
>
> 2、不断点击下一步
>
> 3、破解



CentOS下载

> 1、创建一个虚拟机（File/new virtual machine）
>
> 2、选择`I will install the operating system later.`，可以看到安装过程，拒绝傻瓜安装
>
> 3、操作系统，选择Linux
>
> 4、安装成功后密码是不显示的



Linux目录结构

> ###### 1、/根路径
>
> ###### 2、bin存放二进制文件
>
> ###### 3、sbin存放二进制可执行文件，只有root才能访问
>
> ###### 4、etc存放系统配置文件
>
> ###### 5、usr存放共享的系统资源
>
> ###### 6、home存放用户文件的根目录
>
> 其它用户的home目录都在home文件夹中，只有超级用户的在root中
>
> ###### 7、root超级用户目录
>
> ###### 8、dev用于存放设备文件
>
> ###### 9、lib存放跟文件系统中的程序运行所需要的共享库及内核模块
>
> ###### 10、mnt系统管理员安装临时文件系统的安装点
>
> ###### 11、boot存放用于系统引导时使用的各种文件
>
> ###### 12、tmp存放各种临时文件
>
> ###### 13、var用于存放运行时需要改变数据的文件



##### （4）Linux的常用命令

查看IP地址：`ifconfig`



切换目录

> cd
>
> 1、`cd app`切换到app目录
>
> 2、`cd ..	`切换到上一层目录
>
> 3、`cd /`	切换到系统根目录
>
> 4、`cd ~	`切换到用户主目录
>
> 5、`cd -`	切换到上一个所在目录



ls列出列表

> 1、`ls -a`显出文件夹下所有文件，包括隐藏文件
>
> 2、`ls -l or ll`列出所有文件的详细信息
>
> 信息中`-`开头的表示文件
>
> `d`开头的表示目录
>
> 3、`dir`查看目录



创建和移除目录

> 1、`mkdir a`创建一个路径
>
> 2、`mkdir -p a/b/c`创建多个路径
>
> 3、`rmdir`用来删除空的子目录



浏览目录

> 1、`cat yum.conf`查看所有文件
>
> 2、`more yum.conf`分页显示，`空格`显示下一页，`回车`显示下一行，`q`退出
>
> 3、`less yum.conf `用法与`more`类似，可以通过`PageUp`和`PageDown`查看
>
> 4、`tail -10`用于显示文件后几行的内容
>
> `tail -f`动态查看日志，如果更新，也会加载输出
>
> `ctrl+c`结束动态查看



删除文件

> 1、`rm a.txt`删除该文件
>
> 2、`rm -f a.txt`不询问删除文件
>
> 3、`rm -r a`删除多级目录，会每次询问每一级的文件进行删除
>
> **不询问的命令要谨慎操作**
>
> `rm -rf a`不询问删除a路径下所有东西
>
> `rm -rf *`删除所有文件
>
> `rm -rf /*`自杀，把所有东西都干掉



 使用远程连接服务器工具

远程连接工具：CRT、Xshell

然后使用远程工具输入Linux命令

> 虚拟机联网的配置
>
> NM_CONTROLLED=no #表示该接口将通过该配置文件进行设置，而不是通过网络管理器进行管理
> `ONBOOT=yes` #开机启动
> BOOTPROTO=static #静态IP
>
> 以下三个配置找到的方法：
>
> （1）首先更改文件`vim /etc/sysconfig/network-scripts/ifcfg-ens33`
>
> （2）如何查看本机地址
>
> CentOS中的编辑/虚拟网络编辑器可以查看本机地址和子网掩码，到NAT设置中可以看到默认网关
>
> `IPADDR=192.168.48.0 `#本机地址
> `NETMASK=255.255.255.0` #子网掩码
> `GATEWAY=192.168.48.2` #默认网关
> DNS1=8.8.8.8 #谷歌服务器域名
> DNS2=8.8.4.4 #谷歌服务器域名
>
> 配置好以后保存并退出



复制、剪切操作

> 1、`cp a.txt a.txt.bak`拷贝一份文件
>
> 2、`cp a.txt a/b/x.txt`复制文件到b文件夹下
>
> 3、`mv a.txt a/b.txt `将文件剪切到a文件夹下，并重命名



打包或解压

> 1、`tar`命令位于`/bin`目录下，它能够将用户指定的文件或目录打包成一个文件，但不做压缩（后缀`.tar`）。打包并压缩的格式`.tar.gz or xxx.tgz`的文件
>
> `-c`：创建一个tar文件（打包文件）
>
> `-v`：显示运行过程的信息
>
> `-f`：指定文件名
>
> `-z`：调用gzip命令进行压缩
>
> `-t`：查看压缩文件的内容
>
> `-x`：解开tar文件
>
> 2、`tar -cvf xxx.tar ./*`将当前文件夹下的文件都打包成`xxx.tar`
>
> 3、`tar -cvfz yyy.tar.gz ./*`将当前目录下的文件都压缩为`yyy.tar`文件
>
> 4、`tar -xvf xxx.tar.gz -C /usr/aaa`将压缩文件解压到指定文件夹下



查找内容

> 1、`grep debug yum.conf`在`yum.conf`下找`debug`文件
>
> 2、`grep error catalina.dat --color -A5 -B3`
>
> 查看Tomcat下的error信息，显示后五行（After）和前三行（Before）
>
> 3、`pwd`显示当前路径
>
> 4、`touch e.txt`创建一个空的文件
>
> `vim e.txt`编辑文件
>
> `:wq`保存并退出，`:!q`不保存强退
>
> 5、`ll -h`友好显示文件，可以显示大小
>
> 6、`wget`下载资料catmkdir



Vi和Vim编辑器

> 1、Vim对Vi做了扩充
>
> 2、`vim index.html`打开文件
>
> 3、`i o a`都能进入插入模式（i:insert,a:after,o:之后插入一行），看Vim操作指令合集
>
> 4、ESC切换后`:wq`保存并退出，`q!`强制退出



重定向输出

> 1、`>`将输出定向到指定文件中，会将文件的内容覆盖
>
> `ifconfig > a.txt`将输出内容保存到指定文件中
>
> 2、`>>`输出定向到指定文件中，会在原有内容上追加



管道

> 1、一个命令的输出作为一个输入命令的输入，符号`|`
>
> 2、`--help | more`将帮助信息从管道中执行分页操作
>
> 3、`ps -ef | grep aio`任务管理器查找`aio`进程
>
> `ps -ef`查看所有进程
>
> 4、`&&`执行并列操作（两个程序都没错误）
>
> `mkdir b && cd b`



网络通讯的命令

> 1、`ifconfig`，`eth0 eth1`表示两个网卡
>
> 2、`ifconfig eth0 up`打开网卡1
>
> 3、`ifconfig eth1 down`关闭网卡2
>
> 4、`ping 192.168.19.130`连接网络，不像Windows只执行四次，会一直执行
>
> 5、`netstat -an`查看端口占用情况
>
> 6、`netstat -an | grep java `查看和Java有关的程序
>
> `netstat -an | grep 3306 `查看端口占用



系统管理相关

> 1、`date -s "2019-08-25 17:00:00"`设置时间
>
> 2、`df -h`查看硬盘的占用信息
>
> 3、`free`查看内存的占用情况
>
> 4、`top`管理执行中的程序
>
> 5、`clear`清屏，只是将当前行定位到当前屏幕
>
> 6、`kill 端口号`杀掉进程
>
> 7、`kill -9 端口号`强制杀死进程
>
> 8、`du -h`显示目录下所有文件的大小
>
> 9、`who`显示当前登录用户的信息
>
> 10、`hostname`查看用户名
>
> 11、`uname`显示本机详细信息
>
> `Linux localhost.localdomain 3.10.0-957.el7.x86_64 #1 SMP Thu Nov 8 23:39:32`
>
> 包含内核版本，主机名，编译日期、操作系统等信息



Linux的用户和组

> 用户管理
>
> 1、`user add username`添加用户（只有管理员有权限添加用户）
>
> 2、`ssh -l username -p 22 192.168.19.130`
>
> 切换用户
>
> 3、`passwd username password`
>
> 4、`su -root`切换用户，直接到新用户的`/home`目录下
>
> 5、`userdel username `删除后该用户的文件夹依然在`/home`目录下
>
> 6、`userdel -r username`连同home文件夹一起删除
>
> 
>
> 组管理
>
> 1、`group add demo`创建一个组
>
> 2、`useradd test -g groupname`将创建的新用户保存到组里
>
> 3、`groupdel`删除组，如果组下由用户不允许删除，必须删除用户才能删除组
>
> 4、`id`查看一个用户的UID和GID
>
> 5、账户文件
>
> `/etc/passwd`用户文件
>
> `/etc/shadow`密码文件
>
> `/etc/group`组信息文件



权限命令

> 1、文件权限
>
> `-rwxrwxr--`第一个表示文件类型，文件夹还是文件，后面每三个一组，依次是属主权限，属组权限，其它用户权限。
>
> `w`可写权限，权重2
>
> `r`可读权限，权重4
>
> `x`可执行，权重1
>
> 2、文件标识符类型（首字符）
>
> `-`文件
>
> `d`目录
>
> `l`链接，相当于快捷方式
>
> `*`进入etc查看
>
> `p`命名管道
>
> 3、文件权限管理
>
> `chmod 777 a.txt`改变权限，change modify，权限均为可读写可执行，000都没有读写执行权
>
> `chown demo:demo-group b.txt`改变组
>
> `chown -R u1:public dir`变更目录，改变目录的情况下将所有子路径的权限也都改为这个组



下载微软图形化界面

> 1、安装x window system
>
> `yum groupinstall "X Window System"`
>
> 2、查看支持的图形化界面工具
>
> `yum grouplist`
>
> 3、下载图形化界面（以GNOME为例）
>
> `yum groupinstall GNOME Desktop`
>
> 4、启动图形化界面
>
> `statx`
>
> 5、出现桌面后，右键computer属性里为当前服务器系统的目录



##### （5）Linux环境部署

RPM：软件包管理器



安装JDK

> 1、卸载自带的JDK
>
> `rpm -qa | grep java`
>
> 2、卸载
>
> `rpm -e --nodeps java-1.7.0...`卸载JDK
>
> 3、安装JDK
>
> 通常安装在`/usr`下，切换到文件夹下
>
> （1）在当前路径创建文件夹：`mkdir java`
>
> （2）上传安装文件到Linux：使用sftp进行上传
>
> （3）解压JDK：
>
> `yum install glibc.i686`安装依赖
>
> `tar -xvf xx.tar.gz -C /usr/local/java`解压下载的JDK到指定目录
>
> 4、配置环境变量
>
> `vim /etc/profile`编辑设置环境变量的文件
>
> 添加内容：
>
> ```java
> #set java environment
> JAVA_HOME=/usr/local/src/java/jdk1.8.0_221
> CLASSPATH=.:$JAVA_HOME/lib/
> PATH=$JAVA_HOME/bin:$PATH
> export JAVA_HOME CLASSPATH PATH
> ```
>
> `source /etc/profile`重新加载以下配置文件
>
> `java -version`查看版本



安装Mysql

> 1、下载MySQL的Linux安装包
>
> 2、上传Linux版本的MySQL压缩包到虚拟机
>
> 3、下载自带的mysql
>
> `rpm -qa | grep mysql`查询存在的所有mysql文件
>
> `rpm -e --nodeps mysql-xxx...`删除默认的mysql
>
> 通过`SSH Secire File Transfer`将文件上传到虚拟机下（`~`超级用户下）或者直接下载
>
> `wget https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-test-5.7.27-linux-glibc2.12-x86_64.tar.gz  ` 
>
> `tar -xvf mysql.xxx... -C 指定目录`解压文件到指定目录下
>
> 4、优秀安装文档：https://www.cnblogs.com/kevingrace/p/8340690.html



安装Tomcat



Linux下发布web项目



##### 2、Linux目录结构



