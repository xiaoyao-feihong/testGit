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



##### 3、二叉树的概念

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



###### 1、前序遍历

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





###### 2、中序遍历

先遍历左子树，在输出父节点，在遍历右子树（代码上）



###### 3、后序遍历

先遍历左子树，在遍历右子树，最后输出父节点（代码上）



###### 4、二叉树查找节点

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



###### 5、二叉树删除节点

无规则二叉树删除节点

规定：

（1）如果删除的是叶子节点，则删除该节点

（2）如果删除的节点是非叶子节点，则删除该子树

思路：

（1）因为二叉树是单向的，所以我们比较的当前的节点的左子节点或右子节点

（2）如果root节点不为空，且值就和查找值相等，二叉树置空

（3）否则root节点执行自身的删除方法

（4）自身删除方法先找左子节点来与查找值判断，如果相等，终止方法

（5）左边不等，找右子节点判断值，如果相等，终止方法

（6）都不等，如果左子节点不为空，执行左子节点的删除方法

（7）还是没找到，如果右子节点不为空，执行右子节点的删除方法

（8）一直没找到，就输出



递归删除节点

```java
//PersonNode删除方法
public PersonNode delete (int num){
        //注意当前节点的判断是通过父节点进行比较的，所以不用考虑
        PersonNode result = null;

        //判断左子节点值是否相等
        if(this.left != null && this.left.getNum() == num){
            result = this.left;
            this.left = null;
            return result;
        }

        //判断右子节点值是否相等
        if(this.right != null && this.right.getNum() == num){
            result = this.right;
            this.right = null;
            return result;
        }

        //递归左子节点删除操作
        if(this.left != null){
            result = this.left.delete(num);
            if(result != null)return result;
        }

        //递归右子节点删除操作
        if(this.right != null){
            result = this.right.delete(num);
            if(result != null)return result;
        }
        return result;
}

//BinaryTree删除方法
public PersonNode delete (int num){
        PersonNode res = null;
        if(this.root != null){
            if(this.root.getNum() == num){
                res = this.root;
                this.root = null;
            }else{
                res = this.root.delete(num);
            }
        }
        if(res == null){
            System.out.println("binary tree is empty.");
        }else{
            System.out.println("删除节点：" + res);
        }
        return res;
}
```



思考：将代码改成，如果找到该节点，删除该节点，如果左子节点不为空，就将左子节点放过来，如果为空，就判断右子节点是否为空，不为空就放右子节点



##### 4、顺序存储二叉树

基本说明：从数据存储来看，数组存储方式和树的存储方式可以相互转换，也就是树可以转化为数组，数组可以转化为树。



顺序存储二叉树的的特点：

（1）顺序二叉树通常只考虑完全二叉树

（2）第n个元素的左子节点放第2\*n + 1个元素，右子节点存放第2\*n + 2个元素

（3）第n个元素的父节点为(n - 1) / 2

（4）n表示二叉树的第n个元素

（5）只是规定存放顺序，和节点或数组里存放的值没有关系



顺序存储二叉树

![](算法img/顺序存储二叉树.png)



顺序存储二叉树代码实现

```java
public class ArrayBinaryTree {
    public static void main (String[] args){
        int[] arr = {1,2,3,4,5,6,7};
    }
    
    private int[] arr;
    public ArrayBinaryTree (int[] arr){
        this.arr = arr;
    }
    
    public void preOrder () {
        this.preOrder(0);
    }
    
    //前序遍历传index=0
    public void preOrder (int index){
        if(arr = null || arr.length = 0){
            System.out.println("Array should not be null.");
            return;
        }
        System.out.println(arr[index]);
        if(index * 2 + 1 < arr.length){
            preOrder(2 * index + 1);
        }
        if(index * 2 + 2 < arr.length){
            preOrder(2*index + 2);
        }
    }
    
     //中序遍历
    public void infixOrderList (int index){
        //数组没有初始化，或传递空数组处理
        if(arr == null || arr.length == 0){
            System.out.println("Array should not be null.");
            return;
        }
        if(index*2 + 1 < arr.length){
            infixOrderList(index*2 + 1);
        }
        System.out.print(arr[index] + "\t");
        if(index*2 + 2 < arr.length){
            infixOrderList(index*2 + 2);
        }
    }

    //后序遍历
    public void postOrderList (int index){
        //数组没有初始化，或传递空数组处理
        if(arr == null || arr.length == 0){
            System.out.println("Array should not be null.");
            return;
        }
        if(index*2 + 1 < arr.length){
            postOrderList(index*2 + 1);
        }
        if(index*2 + 2 < arr.length){
            postOrderList(index*2 + 2);
        }
        System.out.print(arr[index] + "\t");
    }
}
```



使用场景：堆排序利用的数据结构就是顺序存储二叉树



##### 5、线索化二叉树

将数列{1，3，6，8，10，14}构建成一棵二叉树

二叉树：

```java
		1
 	3		6
  8	  10  14         
```

问题：对二叉树进行遍历时，6，8，10，14这几个节点的左右指针，并没有完全的利用上，如果我们想充分利用各个节点的左右指针，让各个节点指向自己的前后节点怎么办？



解决方案：线索化二叉树



线索化二叉树（Threaded Binary Tree）

（1）n个节点的二叉链表中含有n+1个空指针域（2n-（n-1）= n+1）。

***推导：***n个元素会产生2n个指针，两两相连产生的树需要n-1个指针连接，所以空指针数是`2n-(n-1)`个

（2）利用二叉链表的空指针域，存放指向该节点在某种遍历次序下的前驱和后继节点的指针，这种附加的指针称为**线索**。

不同的遍历方式空指针指向的节点不同

（3）加上线索的二叉链表成为**线索链表**，相应的二叉树成为**线索二叉树**。

（4）根据线索性质的不同，线索二叉树分为**前序线索二叉树**、**中序线索二叉树**、**后序线索二叉树**。

（5）一个节点的前一个结点，称为**前驱节点**，一个节点的后一个节点称为**后继节点**



应用案例：中序遍历结果--{8，3，10，1，14，6}

```java
	    1 
   3          6 
 8  10      14
//根据中序遍历结果来的
//8的右指针指向3，10的左指针指向3，右指向1
//14的左指针指向1，右指针指向6
```

说明：当线索化二叉树后，节点的属性left和right，有如下情况：

（1）left的指向是左子树，也可能是指向前驱节点，比如1节点根据中序遍历结果做指针指向10，实际指向3，右指针指向14，实际指向6，10节点左指针指向了前驱节点；

（2）right指向的是右子树，也可能是指向后继节点，比如1节点的right指向的是右子树，而10节点得到right指向的是后继节点。



线索二叉树代码实现：

<font color="red">注意最左的叶子节点左指针，和最右的叶子节点的右指针都是不会被设置上线索的</font>

```java
public class ThreadedBinaryTree {
    private HeroNode root;
    
    //递归进行线索化的时候，总是保留前驱节点
    private HeroNode prev = null;
    
    //二叉树添加中序线索化的方法
    public void threadedNodes (PersonNode node) {
        if(node == null){
            return;
        }
        //1.先线索化左子树
        threaded(node.getLeft());
        
        //2.线索化当前节点
        //2.1先处理当前节点的前驱节点
        if(node.getLeft() == null){
            node.setLeft(prev);
            node.setLeftType(false);
        }
        
        //2.2处理后继节点
        if(prev!= null && prev.getRight() == null){
            //让前驱节点的右指针指向当前节点
            prev.setRight(node);
            prev.setRight(false);
        }
        //每处理一个节点，让当前节点是下一个节点的前驱节点
        prev = node;
        
        //3.线索化右子树
        threaded(node.getRight());
    }
}
//在PersonNode中规定：
//leftType:true左子树，false前驱节点
//leftType:true右子树，false后继节点
```



遍历线索化二叉树

各个节点可以通过线性方式遍历，因此无需递归，提高了遍历效率，遍历次序应当和中序遍历一致

```java
//中序遍历
public void threadedList () {
    PersonNode temp = root;
    while(temp != null){
        while(temp.getLeftType()){
            temp = temp.getLeft();
        }
        //到最左节点并输出
        System.out.println(temp);
        //一直输出后继节点
        while(!temp.getRightType()){
            temp = temp.getRight();
            System.out.println(temp);
        }
        node = node.getRight();
    }
}
```



#### 4、数据结构和算法的应用

##### 1、堆排序介绍与实现

（1）堆排序是利用堆这种数据结构，堆排序是一种选择排序，它的最坏、最好、平均时间复杂度都是O(nlog n)，是不稳定排序

（2）堆是完全二叉树

+ 每个节点的值，都大于等于左右孩子节点的值，成为**大顶堆**
+ 没有要求左右孩子节点的值
+ 每个节点的值都小于或等于左右孩子节点的值，称为**小顶堆**

（3）升序采用大顶堆，降序采用小顶堆



堆排序思想

（1）将待排序序列结构构成一个大顶堆（不需要构建二叉树）

（2）此时整个序列的最大值就是堆顶的根节点

（3）将其与末尾元素进行交换，此时末尾就是最大值

（4）然后将剩余n-1个元素重新构成一个堆，这样会得到n个元素的次小值，如此反复执行，就能得到一个有序序列了。

可以看到构建大顶堆的过程中，元素的个数逐渐减少，最后得到一个有序序列。



堆排序基本思路

（1）将无须序列构成为一个堆（大顶堆或小顶堆）

（2）将堆顶元素和末尾元素交换，将大元素沉到数组末端

（3）重新调整结构，使其满足定义，然后继续交换堆顶元素与当前末尾元素，反复执行调整，交换，知道整个序列有序



堆排序代码实现

```java
public class HeapSort{
    public void heapSort (int[] arr){
       //根据非叶子节点自下而上完成最大值的上浮
        for(int i = arr.length/2 - 1; i >= 0; i--){
            adjustHeap(arr,i,arr.length);
        }
        //将上浮的值交换到数组后面
        int temp = 0;
        for(int j = arr.length-1;j>0;j--){
            temp = arr[j];
            arr[j] = arr[0];
            arr[0] = temp;
            adjustHeap(arr,0,j);
        }
    }
    
    //注意非叶子节点i是自下而上的
    //数组为待调整数组，i表示非叶子节点数组中索引
    //length堆多少个元素进行调整，length在逐渐减少
    //功能：完成将非叶子节点的树调整成大顶堆
    public void addjustHeap (int[] arr,int i,int length){
        int temp = arr[i];
        for(int k = i*2 + 1; k < length; k = k*2 +1){
            //如果左子节点比右子节点小，切到右子节点
            if(k + 1 < length && arr[k] < arr[k+1]){
                k++;//指向右子节点
            }
            //找到子节点中比较大的与当前非叶子节点比较
            if(arr[k] > temp){
                //如果子节点大于父节点，把较大的值赋值给当前节点，让i指向k
                arr[i] = arr[k];
                //切换到当前节点的下一个节点继续循环比较
                i = k;
            }else{
                break;//
            }
        }
        //当循环结束后，已经将i为父节点的树的最大值，放在了最顶上
        //将找到的非叶子节点值赋值过去，完成交换
        arr[i] = temp;
    }
}
```



堆排序速度特别快，不是递归而是迭代，所以强



##### 2、赫夫曼树

基本介绍

（1）给定n个权值作为n个叶子节点，构造一棵二叉树，如果该树的带权路径长度达到最小，称这样的树为最优二叉树

（2）赫夫曼树是带权路径长度最短的树，权值较大的节点离根较近



赫夫曼树重要概念

（1）在一棵树，从一个节点往下达到孩子或孙子节点之间的通路，称为**路径**，通路中分支的数目称为**路径长度**。若规定层数为L，则到L层的路径长度为L-1.

（2）若将树中节点赋给一个有着某种含义的数值，则这个数值称为该节点的**权**。

（3）**节点的带权路径长度**：从根节点到该节点之间的路径长度与该节点的权的乘积（如路径长度是2，目标节点权值为5，带权路径长度为10）

（4）**树的带权路径长度**：树的带权路径长度规定为所有叶子节点的带权路径之和，记为WPL（weighted path length）

（5）WPL最小的就是**赫夫曼树**



赫夫曼树创建思路：

（1）先将数组从小到大进行排序，每一个数据都是一个节点，每个节点可以看成是一棵最简单的二叉树

（2）取出节点权值最小的两棵二叉树

（3）组成一棵新的二叉树，该新的二叉树的根节点的权值是前面两棵二叉树根节点权值的和

（4）将这棵新的二叉树，以根节点的权值大小再次排序，不断重复，知道数列中，所有数据都被处理，就得到一棵赫夫曼树



