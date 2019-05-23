## 框架学习阶段

#### 一、git学习

##### （一）什么是git

##### 	1、Git是一款源代码管理工具（版本控制工具）

​	源代码有必要管理吗？有必要，因为人工去处理不同的版本，做响应备份会很麻烦。

​	源代码管理工具有svn,vss,vcs...Git是Linux之父---Linus之前也是手动维护；于是自己写了一个版本管理工具，并开源了，被很多使用（Git）

##### 	2、git安装

​	1）官网下载git，根据需要选择32位或64位

​	2）shift+右键：会有Git GUI here （Git图形化操作界面，一般不使用）和Git bash here（命令行界面）

##### 	3、git使用

​	~：表示用户

​	**1、**初始化Git仓库：项目目录shift+右键，点击Git Bash here，然后输入git init命令进行初始化，会在当前项目目录新建一个.git的隐藏文件夹

​	**2、**将我们工作区文件备份到.git隐藏目录（注意必须在项目文件中打开命令行）

​	**3、**自报家门：因为git所有项目开发者都可以存储，这样不知道谁的备份。

​		1）设置邮箱用户名：`git config --global user.name "xiaoming"`	

​		2）设置邮箱地址：`git config --global user.email 'feihong@qq.com'`

​		3）每次备份都会把用户信息记录下来

​	**4、**存储到仓库

​		1）代码放到仓库门口：`git add ./readme.md`

​		2）代码放到仓库房间：`git commit -m "说明"`；-m:message 

​		如果没有写说明会进入一个提示页，让我们完善message，esc打开命令行，:q(quit); 退出 :q!;强制退出

​	**5、**添加功能：与存储到仓库操作一样

​	**6、**Git了解

​	项目目录（工作区，不包含.git）

​	.git区为暂存区

​	存储后放入版本库

​	**7、**查看保存状态：`git status`（会监听项目变化）

​	modified: readme.md（表示已经操作成功）

​	未提交任何更改就查看状态：nothing to commit ,working directory clean（未添加）

​	**8、**添加多个文件（readme.md,01.js）

​	`git add ./`	就能将当前路径下的所有文件放进仓库

​	`git commit -m` ”添加多个文件“；commit添加

​	**9、**一次性放到房间方法：--all将所有文件提交

​	`git commit --all -m` "一次性操作"

​	**10、**添加想要进库的文件，不要webstorm编辑器没用的.idea文件

​	忽略文件： `.gitignore`

​	新建一个.gitignore文件，在文件中添加/.idea，一行写一个可以对多个文件进行忽略

​	`/.idea`忽略.idea文件

​	`/js`忽略js文件夹下所有j文件

​	`/js/*.js`忽略js文件夹下所有.js后缀的文件

​	**11、**查看日志

​	`git log`查看历史提交完整日志

​	显示详细信息

​	`git log --oneline`查看简洁版的日志

​	在一行显示一条数据，信息：数据唯一标识 message(更改信息)

​	**12、**回退到以前版本

​	`git reset --hard Head~0`	Head指向最近保存的文件,Head后面的数字表示回退的索引，此时项目文件全部回退到以前的版本

![](C:\Users\Administrator\Desktop\Git时间线.png)

​	<font color='red'>注意：</font>回退过多，新版本的log是看不到的

​	**13、**Git版本号切换

​	使用版本的唯一标识：随机字符串，精确回退到某一版本

​	`git reset --hard ca3cc90`

​	如果回退版本过多，日志没有之后的版本，利用以前能看到的唯一标识还可以回去，但是不小心退出了窗口，找不到最新版本的唯一标识怎么办？

​	`git reflog`可以看到以前的所有版本号了，通过message查找，获得唯一标识，`git reset --hard ccaf49`就可以回到最新版本

​	**14、**Git创建分支

​	master主分支

​	功能完成到一半，要提交，又不能让别人使用，因为功能没有完成，Git允许我们创建分支（另一条平行的时间线）

​	1）创建分支

​	`git branch dev(branchName) `此时和master的日志一样

​	`git checkout dev`切换到dev房间

​	`git add ./`

​	`git commint -m "尚未完成"`

​	2）合并分支（功能完成后）

​	`git add ./`

​	`git commint -m "已经完成"`

​	`git checkout master`切换到主分支

​	`git merge dev `合并分支，查看日志，所有日志都能看到了`git branch`查看当前所处分支

​	`git branch -d dev`删除分支，必须切换到别的分支才能删除此分支

​	如果不小心在分支做了功能，又在主分支做了功能，此时Git无法做合并，必须自己手动更改，处理后还需要再提交一次

​	.git文件夹中都是二进制文件，不建议去看它

​	**15、**GitHub

​	1）不是git，只是一个网站

​	2）GitHub提供了允许别人通过git上传代码的功能，相当于Git服务器的功能

​	3）建库，新建账号，然后create repository建立新仓库

​	4）取仓库名，description描述，选择public（开源的，允许我们免费用库），private（只有自己能看到的库，但是要收费），注意不要勾选initialize this repository with a README（提供自动初始化功能）

​	5）复制GitHub给的网址

​	`git push + https://github.com/test112.git master`推送文件

​	第一次使用要求账户和密码（github account)

​	6）第三方拿别人上传文件

​	1）在GitHub上找到项目，使用clone and download，复制地址

​	在自己的项目下载别人的文件

​	`git init`新建仓库

​	`git pull https://github.com/test112.git master`获取文件

​	下载时退不出来，使用q退出

​	2）downloadZip直接下载

​	3）新建文件夹

​	打开git命令窗口

​	克隆：`git clone + https://github.com/test112`

​	会得到远程仓的相同的数据，如果多次执行会覆盖本地内容。

​	**16、**上传方式：ssh

​	1）ssh：公钥和私钥，两者之间是有关联的

​	2）运行指令： `ssh-keygen -t rsa`生成一个id_rsa.txt.pub的文件

​	3）复制id_rsa.txt.pub的内容到GitHub上（设置里面，添加ssh keys）

​	**17、**先Pull别人更新的文件，在解决冲突，在push自己更改了的文件，否则版本不一样会产生冲突，git报错

​	esc + :wq;		w:保存	q:退出

​	**18、**声明变量

​	`git remote add serverAddr(变量名) https://github.com/test112(变量值)`

​	`git push  serverAddr -u master`-u：表示将本地master与仓库的master分支进行关联

​	以后使用`git push`或`git pull`就能轻松获取和上传文件（不用再写变量名）