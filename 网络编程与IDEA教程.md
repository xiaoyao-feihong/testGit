### 网络编程

<hr>

##### 1、网络编程

**网络通信三要素：**

*（1）IP地址*

cmd窗口输入ipconfig,查看IP地址

IPV4(32位，8字节，点分十进制)，IPV6(32字节)

*（2）端口号*

端口号就是进程的地址

*（3）协议*

UDP协议：将数据封装成数据包，不需要连接，每个数据报的大小限制在64k内，因为没有连接，所以是不可靠协议，优点是速度传输快

TCP协议：需要建立连接，通过管道进行数据传输，是可靠协议；效率低，但是安全可靠。

TCP三次握手：

A-->B are you alive?(1) 

B-->A I am alive?And you?(2) 

A-->B I am alive.(3)

connection complete.



##### 2、Java中的IP类

所属的包：java.net包下，InetAddress包下，网络编程API都在这个包下

直接子类：Inet4Address（32位无符号数字），Inet6Address（128位无符号数字）

IP是一种低级协议，UDP和TCP是在它基础上构建的

```java
static InetAddress[] getAllByName(String host);//IP地址是唯一的，但是主机名不是唯一的
static InetAddress[] getByName(String host/IP);//既可以给IP地址，也可以给主机名

//address对象的方法
public class Test {
    public static void main (String[] args){
        try{
            //利用网卡的IP测试的
            //重点是获取对象
            InetAddress address = InetAddress.getByName("192.168.43.1");
            System.out.println(address);//*/192.168.43.1 主机名/IP地址
            address.getHostAddress();//192.168.43.1 获取IP地址
            address.getHostName();//u2.ucloudlink.com 获取主机名,可以获取任意IP地址的主机名
            address.getLocalHost();//DESKTOP-5RM9FAN/192.168.137.1 小米电脑的主机名和IP地址
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
```



##### 3、UDP协议使用

##### 发送数据

```java
/***步骤：
1、创建发送端socket对象
2、创建数据并打包
3、发送数据
4、释放资源
(1)DatagramSocket:次类表示用来发送和接收数据，基于UDP协议的
利用构造创建对象方法：
new DatagramSocket()创建Socket对象并随机分配端口号
new DatagramSocket(int port)创建Socket对象并指定分配端口号
(2)DatagramPacket:次类表示数据报包
new DatagramPacket();
***/
public class SendMsgDemo {
    public static void main throws SocketException(String[] args){
        //创建发送端Socket对象
        DatagramSocket ds = new DatagramSocket();
        //创建数据并打包
        String str = "hello,Im xiaomi computer,this is a test msg."
        Byte[] bArr = str.getBytes();
	   int length = bArr.length;
        InetAdress address = InetAdress.getByName("192.168.137.1");
        int port = 8888;
        //打包
        DatagramPacket dp = new DatagramPacket(byArr,length,address,port);
        //发送数据
        ds.send();
        //释放资源
        ds.close();
    }
}

//接收数据
/**
使用UDP协议接收数据：
1、创建接收端Socket对象
2、接收数据
3、解析数据
4、输出数据
5、释放资源
**/
public void receive () throws IOException {
    DatagramSocket ds = new DatagramSocket(8888);
    byte[] bArr = new byte[1024];
    //new DatagramPacket(byte[] buf,int length)
    DatagramPacket dp = new DatagramPacket(bArr,bArr.length);
    dp.receive(dp);
    InetAddress address = dp.getAddress();
    byte[] data = dp.getData();
    int length = dp.getLength();
    System.out.println("sender:"+address.getHostName()+","+new String(data,0,length));
    ds.close();
}

```

使用TCP协议发送数据：

（1）创建发送端Socket对象

（2）获取输出流对象

（3）发送数据

（4）释放资源

发送端：

```java
public class SendDemo {
    public static void main (String[] args){
        Socket s = new Socket(InetAddress.getByName("192.168.137.1"),7777);
        OutputStream os = s.getOutputStream();
        String s = "hello,tcp I am here.";
        os.write(str.getBytes());
        os.close();
        s.close();
    }
}
```

接收端：

（1）创建Socket对象

（2）监听（阻塞）

（3）获取输入流对象

（4）获取数据

（5）输出数据

（6）释放资源

```java
public class ReceiveDemo {
    public static void main (String[] args) throws IOException {
        //获取服务端对象
        ServerSocket ss = new ServerSocket(7226);
        //监听（等待连接）
        Socket s = ss.accept();
        //获取输入流对象
        InputStream is = s.getInputStream();
        byte[] bArr = new byte[1024];
        int count = is.read(bArr);
        String str = "";
        while(count!=-1){
            System.out.println(new String(bArr,0,count));
            str += new String(bArr,0,count);
            count = is.read(bArr);
            System.out.println(count);
        }
        //输出数据
        OutputStream os = s.getOutputStream();
        os.write(str.toUpperCase().getBytes());
    }
}

public class SendDemo {
    public static void main (String[] args) throws IOException {
        //发送数据
        Socket s = new Socket(InetAddress.getByName("192.168.137.1"),7226);
        OutputStream os = s.getOutputStream();
        String str = "this is a massage by TCP.";
        os.write(str.getBytes());
        
        //接收数据
        InputStream is = s.getInputStream();
        byte[] bArr = new byte[1024];
        int count = is.read(bArr);
        String str2 = "3---";
        while(count != -1){
            str2 += new String(bArr,0,count);
            System.out.println(str2);
            count = is.read(bArr);
        }

        //Socket会自动关闭输出流
        //os.close();
        s.close();
    }
}
```

高级流通信：

> 思路：
>
> 1）创建一个Server和一个Client类
>
> 2）两个类只用来创建Socket对象
>
> 3）两个类下各有负责读写的两个子类，如ServerReader,ServerWriter
>
> 4）两个子类实现Runnable接口，利用线程实现读写
>
> 原因：容易导致阻塞



小任务：

1、通信的时候必须按照顺序（添加线程，没有顺序）

2、添加多个客户端，一起通信（QQ的原理）

服务器只有一个（中转站）

服务器有很多socket

服务器的socket存在哪里

需要先读取消息-->转发（先读后写）

添加多个客户端

每个客户端手里有一个Socket

客户端有两个小弟，负责读写





IDEA代码快捷键

（1）`sout`-->`System.out.println();`

（2）数组名.for-->快速生成增强for循环的代码

（3）`psvm`快速生成静态方法的代码块

```java
psvm ---> public static void main (String[] args){}
```

（4）`ctrl+alt+T`-->快速生成`do...while..`,`try...catch...`等代码

​	主要用于快速生成try...catch的代码块



Debug调试模式的使用：

