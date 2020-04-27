### Nginx

<hr>



顺序：redis，linux，nginx



#### 1、Nginx介绍

Nginx是一个高性能的Http和反向代理服务器。也是一个IMAP/POP3/SMTP等邮件代理服务器。



正向代理

正常访问服务器：client ---> server

正向代理访问：client ---> proxy ---> server

作用：

+ 可以访问原来无法访问的资源
+ 做缓存使用，加快访问速度
+ 对客户端授权或记录访问信息等



反向代理

client ---> proxy-server ---> target server

特点：

+ 保证内网安全，阻止web攻击
+ 负载均衡（优化网站的处理能力）



正向和反向区别，代理服务器在客户端，为正向代理；代理服务器在服务端，为反向代理



#### 2、Nginx安装

需要的压缩包：

nginx-1.17.9

openssl-1.1.1d

pcre-8.44

zlib-1.2.11

