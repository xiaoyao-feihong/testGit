### 查找算法

<hr>



#### 1、查找算法介绍



##### 1、常用的查找算法

顺序查找（线性查找）

二分查找（折半查找）

插值查找

斐波那契查找





##### 2、线性查找算法

线性查找代码：

```java
//线性查找
public static seqSearch (int[] arr,int value){
    for(int i = 0; i < arr.length; i++){
        if(arr[i] == value){
            return i;
        }
    }
    return -1;
}
```



##### 3、二分查找算法

先将数组变为有序数组，然后进行查找



思路分析：

（1）首先确定该数组的中间下表

（2）然后让需要查找的数据与中间值比较，然后根据比较进行递归，决定向哪边递归，如果相等就返回

（3）结束递归条件：找到结束递归，找不到也结束递归



简单二分查找

```java
 //未优化二分查找法
public static int binarySearchOne (int[] arr,int left,int right,int value){
        //当左比右大，返回-1表示没找到
        if(left > right){
            return -1;
        }
        int mid = (left+right)/2;
        int midValue = arr[mid];
        if(value < midValue){
            //没找到mid-1会到-1
            return binarySearchOne(arr,left,mid - 1,value);
        }else if(value > midValue){
            //没找到会mid+1会到arr.length这个数
            return binarySearchOne(arr,mid+1,right,value);
        }else{
            return mid;
        }
    }
}
```



二分查找升级处理

思路分析：

1.找到mid值不要立即返回，向

2.向mid索引值得左边扫描，将所有满足得元素得下标放入到集合

3.2.向mid索引值得右边扫描，将所有满足得元素得下标放入到集合

```java
 //优化二分查找法，找到所有相同值
public static ArrayList<Integer> binarySearchAll (int[] arr,int left,int right,int value){
        //当左比右大，返回空的集合表示没找到
        if(left > right){
            return new ArrayList<Integer>();
        }
        int mid = (left+right)/2;
        int midValue = arr[mid];
        if(value < midValue){
            //没找到mid-1会到-1
            return binarySearchAll(arr,left,mid - 1,value);
        }else if(value > midValue){
            //没找到会mid+1会到arr.length这个数
            return binarySearchAll(arr,mid+1,right,value);
        }else{
            List<Integer> resIndexList = new ArrayList<>();
            //从左边进行查找
            int temp = mid - 1;
            while(true){
                //因为是有序的，所以相同值只会连续出现
                if(temp < 0 || arr[temp] != value){
                    break;
                }
                resIndexList.add(arr[temp]);
                temp--;
            }
            //从右边进行查找
            int temp = mid + 1;
            while(true){
                //因为是有序的，所以相同值只会连续出现
                if(temp > arr.length - 1 || arr[temp] != value){
                    break;
                }
                resIndexList.add(arr[temp]);
                temp++;
            }
            return resIndexList;
        }
    }
}
```



##### 4、插值查找算法

原理：插值查找算法类似于二分查找，不同的是插值查找每次从自适应mid处开始查找，将二分查找的求mid公式

（1）left表示左边索引，right表示右边索引，value为查找值

（2）mid = arr[left] + (right -  left) *(value - arr[left]) /  (arr[right] - a[left])



插值查找的使用场景：

对于数据量较大，关键字分布较均匀得查找表来说，采用插值查找较快；关键字分布不均匀，且数据跳动较大，不一定比二分查找好



插值查找算法代码

```java
public static void insertSearch (int[] arr,left,right,value){
    //防止mid值过大，数组越界，判断必须有
    if(left > right || value < arr[0] || value > arr[arr.length-1]){
        return -1;
    }
    int mid = (value - arr[left])/(arr[right]-arr[left])*(right-left);
    int midValue = arr[mid];
    if(value > midValue){
        return insertSearch(arr,mid+1,right,value);
    }else if(value < midValue){
        return insertSearch(arr,left,mid-1,value);
    }else{
        return mid;
    }
}
```



##### 5、斐波那契查找算法

斐波那契查找算法，也叫黄金分割算法

原理与前两种相似，仅仅改变了中间节点的位置，中间值不再是中值或差值得到，而是位于黄金分割点附近

`mid = left + F(k-1) - 1`



F(k-1) - 1的理解：

（1）由斐波那契数列F(k) - 1 = (F(k-2) - 1) + (F(k-1) - 1) + 1，该式说明，只要顺序表的长度为F(k) - 1，则可以将该表分成长度为F(k-2) - 1和F(k-1) - 1两段，从而中间位置是mid = low + F(k-1) - 1

（2）类似的每一个子段可以采用相同方式分割

（3）但顺序表长度n不一定刚好等于F(k) - 1，这里k值只要能使得F(k)-1恰好大于或等于n即可，由以下代码得到，顺序表长度增加后，新增的位置（从n+1到F(k)-1位置），都赋值为n位置的值即可



公式推导图：

![](算法img/黄金分割公式.png)





斐波那契查找

```java
public static fibonacciSearch (int[] arr,int value){
    int low = 0;
    int high = a.length - 1;
    int k = 0;//斐波那契分割数值下标
    int mid = 0;//存放分割点处的值
    int[] fiboArr = getFibonacciArray(20);
    
    //获取分割数值下标
    while(high > f[k] - 1){
        k++;
    }
    
    //创建临时数组
    int[] temp = Arrays.copyOf(arr,f[k]);
    
    //f[k]的值最后会大于等于数组长度，多余的地方会补0
    //将多余部分进行处理，让数组始终保持有序
    for(int i = high + 1;i < temp.length;i++){
        temp[i] = a[high];
    }
    
    //使用while循环，找到我们要查找的value值
    while(low <= high){
        mid = low + fiboArr[k-1] - 1;
        //向左查找
        if(key < temp[mid]){
            high = mid - 1;
            k--;
        }else if(key > temp[mid]){
            low = mid + 1;
            //因为后面的初始长度是f[k-2],从f[k-2]为分割点
            k -= 2;
        }else{
            //根据大小决定返回索引
            return mid <= high ? mid : high;
        }
        return -1;
    }
}

//创建一个斐波那契数列
public static int[] getFibonacciArray (int maxSize){
    int[] fArr = new int[maxSize];
    f[0] = 1;
    f[1] = 1;
    for(int i = 2;i < maxSize;i++){
        arr[i] = arr[i-1] + arr[i-2];
    }
    return arr;
}
```



#### 2、哈希表（散列表）

哈希表

哈希表也叫散列表，根据关键码值而直接进行访问的数据结构，通过将关键码值映射到表中一个位置来访问记录，以加快查找速度。使用的映射函数我们叫做散列函数，存放记录的数组叫做散列表。



实际中使用缓存层将常用数据存到缓存，能到缓存中读取，就不去读取数据库数据。

缓存层产品：Redis、Memcache（主要就是通过下面两种数据结构实现的）

（1）哈希表（数组+链表） 

（2）数组+二叉树



哈希表主要作用就是做缓存



谷歌上机题：

实际需求：每天当所有员工来报道时，要求将该员工的信息加入（id，性别，年龄，住址），当输入该员工的id时，要求查找到该员工所有信息。

要求：不适用数据库，尽量节省内存，速度越快越好

思路分析：使用哈希表来管理雇员信息



雇员类

```java
class Emp {
    private int id;
    private String name;
    private String address;
    Emp next;
    public Emp (int id,String name,String address){
        this.id = id;
        this.name = name;
        this.address = address;
    }
}
```

散列表

```java
public class HashTableDemo {
    //用来管理多条链表
    private EmpLinketList[] empListArray;
    private int size;
    
    //初始化数组
    public HashTableDemo (int size){
        this.size = size;
        empListArray = new EmpLinketList[size];
        for(int i = 0; i < size; i++){
            empListArray[i] = new EmpLinkedList();
        }
    }
    //添加雇员
    public void add (Emp emp) {
        int hash = getHash(emp.getId);
        empListArray[hash].add(emp);
    }
    
    //遍历散列表
    public void list () {
        for(int i = 0; i < size; i++){
            empListArray[i].list();
        }
    }
    
    //根据id获取哈希
    public int getHash (int id){
        return id % size;
    }
}

class EmpLinkedList {
    private Emp head;
    
    //添加
    public void add (Emp emp){
        if(head == null){
            head = emp;
            return;
        }
        Emp tempEmp = head;
        while(tempEmp.next != null){
            tempEmp = tempEmp.next;
        }
        tempEmp.next = emp;
    }
    
    //遍历
    public void list (){
        if(head == null){
            System.out.println("list is empty.");
            return;
        }
        Emp tempEmp = head;
        while(true){
            System.out.printf("id=%d,name=%s\n",tempEmp.getId(),tempEmp.getName());
            if(tempEmp.next == null){
             	break;   
            }
            tempEmp = tempEmp.next;
        }
    }
}
```



#### 3、树结构

##### 1、为什么需要树这种数据结构

+ 数组
  - 优点：访问元素速度快，查找元素可以通过查找算法提升查找效率，遍历效率高
  - 缺点：查找具体值时，或者插入值，效率较低

+ 链式存储
  - 优点：适合插入，删除效率也很好
  - 缺点：查找效率低

+ 树的存储方式
  - 优点：提高数据存储，读取效率，比如二叉排序树，既可以保证数据查找速度，同时可以保证数据的插入、删除、修改速度



二叉排序树原理图：

![](算法img/二叉排序树.jpg)



##### 2、树的常用术语



###### 1、树的属于介绍

（1）节点

（2）根节点

（3）子节点

（4）父节点

（5）叶子节点：没有子节点的节点

（6）节点的权（节点值）

（7）节点的路径（找到该节点的路线）

（8）层

（9）子树

（10）树的高度（树的最大层数）

（11）森林（多棵子树构成森林）

节点术语理解图：

![](算法img/节点术语.jpg)



###### 2、二叉树的概念

（1）每个节点做多只能有两个子节点的一种形式的树

（2）二叉树的节点分为**左节点**和**右节点**

（3）如果二叉树的所有叶子节点都在最后一层（n），并且总节点数为`2^n-1`，我们称之为**满二叉树**

（4）如果二叉树的所有叶子节点都在最后一层，或者倒数第二层，，而且最后一层的叶子节点在左边连续，倒数第二层的叶子节点在右边连续，我们称之为**完全二叉树**



二叉树的遍历：

（1）前序遍历

（2）中序遍历

（3）后序遍历

根据根节点的输出位置判断是哪一种遍历方法



二叉树遍历的分析：

（1）建立一棵二叉树

（2）前序遍历：先输出当前节点，如果左子节点不为空，则递归继续前序遍历；如果右子节点不为空，则递归继续前序遍历

（3）中序遍历：如果当前节点的左子节点不为空，则递归中序遍历；输出当前节点；如果当前的右子节点不为空，则递归中序遍历

（4）后序遍历：如果当前节点的左子节点不为空，则递归后序遍历；如果当前节点的右子节点不为空，则递归后序遍历；输出当前节点



###### 3、前序遍历

先输出父节点，在遍历左子树和右子树

```java
public class BinaryTree {
    private PersonNode root;
    
    public void setRoot(PersonNode root){
        this.root = root;
    }
    
    //前序遍历
    public void preOrder () {
        if(this.root != null){
            this.root.preOrder();
        }else{
            System.out.println("tree is empty.");
        }
    }
    
    //中序遍历
    public void infixOrder {
        if(this.root != null){
            this.root.infixOrder();
        }else{
            System.out.println("tree is empty.");
        }
    }
    
    //后序遍历
    public void postOrder (){
        if(this.root != null){
            this.root.postOrder();
        }else{
            System.out.println("tree is empty.");
        }
    }   
}

class PersonNode {
    private int no;
    private String name;
    private PersonNode left;
    private PersonNode right;
    
    public PersonNode (int no,String name){
        this.no = no;
        this.name = name;
    }
    
    //getter,setter,toString
    public void setLeft(){}
    public void setRight(){}
    
    //前序遍历
    public void preOrder (){
        System.out.println(this);
        //递归向左子树前序遍历
        if(this.left != null){
            this.left.preOrder();
        }
        //递归向右子树遍历
        if(this.right != null){
            this.right.preOrder();
        }
    }
    
    //中序遍历
    public void infixOrder (){
        //向左子树中序遍历
        if(this.left != null){
            this.left.infixOrder();
        }
        //输出父节点
        System.out.println(this);
        //向右子树中序遍历
        if(this.right != null){
            this.right.infixOrder();
        }
    }
    
    //后序遍历
    public void postOrder () {
         //向左子树中序遍历
        if(this.left != null){
            this.left.postOrder();
        }
        //向右子树中序遍历
        if(this.right != null){
            this.right.postOrder();
        }
        //输出父节点
        System.out.println(this);
    }
}
```





###### 4、中序遍历

先遍历左子树，在输出父节点，在遍历右子树（代码上）



###### 5、后序遍历

先遍历左子树，在遍历右子树，最后输出父节点（代码上）



###### 6、二叉树查找节点

（1）前序查找

思路分析：

+ 先判断当前节点的no是否等于查找的，如果相等，返回当前节点

+ 否则判断左子节点是否为空，不为空，则递归前序查找
+ 左子节点没有找到相等的，则从右节点开始前序查找

```java
public PersonNode preOrderSearch (int no){
    //当前节点比较
    if(this.no == no){
        return this;
    }
    PersonNode temp = null;
    
    //左子树前序遍历
    if(this.left != null){
        temp = this.left.preOrderSearch(no);
    }
    if(temp != null){
        return temp;
    }
    
    //右子树前序遍历
    if(this.right != null){
        temp = this.right.preOrderSearch(no);
    }
    if(temp != null){
        return temp;
    }
    
    return temp;
}
```





（2）中序查找

思路分析：

+ 判断当前左子节点是否为空，否则向左递归中序查找
+ 如果没有找到与当前节点比较，没找到，继续向右中序查找

```java
public infixOrderSearch (int no) {
    //左子树中序遍历
    PersonNode temp = null;
    if(this.left != null){
        temp = this.left.infixOrderSearch(no);
    }
    if(temp != null){
        return temp;
    }
    
    //当前节点比较
    if(this.no == no){
        return this;
    }
    
    //右子树中序遍历
    if(this.right != null){
        temp = this.right.infixOrderSearch(no);
    }
    if(temp != null){
        return temp;
    }
    
    return temp;
}
```





（3）后序查找

思路分析：

+ 判断当前节点左子节点是否为空，如果不为空，向左递归后续查找
+ 左边没找到，继续从右边递归后序查找，还是没找到
+ 与根节点比较

```java
public PersonNode postOrderSearch(int no){
    PersonNode temp = null;
    //左子树后序遍历
    if(this.left != null){
        temp = this.left.postOrderSearch(no);
    }
    if(temp != null){
        return temp;
    }
    
    //右子树后序遍历
    if(this.right != null){
        temp = this.right.postOrderSearch(no);
    }
    if(temp != null){
        return temp;
    }
    
    //当前节点比较
    if(this.no == no){
        return this;
    }
    
    return temp;
}
```



###### 7、三种遍历方式的比较

