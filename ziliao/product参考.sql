create table  jd_product(
        product_id	INT auto_increment,
	name	VARCHAR(50),
	keywords	VARCHAR(50),
	add_time	TimeStamp,
	picture	VARCHAR(50),
	big_picture	VARCHAR(50),
	fixed_price	INT,
	lower_price	INT,
	description	VARCHAR(100),
	author	VARCHAR(100),
	publishing	VARCHAR(100),
	publish_time	TimeStamp,
	isbn	VARCHAR(100),
	language	VARCHAR(100),
	which_edtion	VARCHAR(100),
	total_page	VARCHAR(100),
	bind_layout	VARCHAR(100),
	book_size	VARCHAR(100),
	editor_description	VARCHAR(1000),
	catalog	VARCHAR(1000),
	book_summary	VARCHAR(1000),
	author_summary	VARCHAR(1000),
	extracts	VARCHAR(1000),
	print_time	TimeStamp,
	print_INT	INT,
	paper_type	VARCHAR(100),
	print_frequency	VARCHAR(100),
    constraint  jd_product_product_id_pk primary key(product_id)
);

insert  into  jd_product values(1,
 '让子弹飞','子弹  飞   葛优 姜文 发哥',current_timestamp(),'img/book01.jpg',
 'img/big/book01.jpg',100,20,'让子弹飞啊','姜文','兄弟连出版社',current_timestamp(),
  'ISBN_0001','简体中文','第三版','350页','简装','16K',
  '编辑描述 你猜有没有','第一章之后就没有了','告诉你了就是让子弹飞',
  '不知道是个演员 还是个导演','吃着火锅唱着歌',current_timestamp(),5000,'泥皮','第五次加印');

insert into jd_product values(2,
  '藏地密码4','藏地 密码 哈哈',current_timestamp(),'img/book02.jpg',
  'img/big/book02.jpg',120,150,'让藏地来了密码','河马','兄弟连出版社',
  current_timestamp(),'ISBN_0102','简体中文','第五版','250页','精装','16K',
  '长篇小说很棒棒','第一章主人公卒','让藏地带一个密码','编剧和作家',
  '遥远的藏地有一个密码叫高伟萎',current_timestamp(),2000,'牛皮纸','修正液版');  
insert into jd_product values(3,
  '藏地密码5','藏地 密码 哈哈',current_timestamp(),'img/book03.jpg',
  'img/big/book03.jpg',120,50,'让藏地来了密码','河马','兄弟连出版社',
  current_timestamp(),'ISBN_0102','简体中文','第五版','250页','精装','16K',
  '长篇小说很棒棒','第一章主人公卒','让藏地带一个密码','编剧和作家',
  '遥远的藏地有一个密码叫高伟萎',current_timestamp(),2000,'牛皮纸','修正液版');
insert into jd_product values(4,'藏地密码6','藏地 啊藏地',
current_timestamp(),'img/book04.jpg','img/big/book04.jpg',88,30,'藏地密码密码',
'西藏人民','中国出版社',current_timestamp(),'ISBN_0004','繁体中文',
'第四版','180页','精装','20k','编辑描述 你猜有没有',
'第一章之后就没有了','告诉你了就是藏地密码','不知道是不是一个人',
'哈哈哈哈哈 ',current_timestamp(),4800,'牛皮','第四次加印');

insert into jd_product values(5,'黑道飞云20年','古惑仔 山鸡 陈浩南',
current_timestamp(),'img/book05.jpg','img/big/book05.jpg',100,20,'黑道飞云20年啊',
'山鸡','人民出版社',current_timestamp(),'ISBN_0005','简体中文',
'第三版','500页','精装','16k','编辑描述 你猜有没有',
'第一章之后就没有了','告诉你了就是黑道飞云20年','是个古惑仔',
'指导我大哥是谁吗',current_timestamp(),5000,'金皮','第六次加印');
insert into jd_product values(6,
'风雨哈佛路','风雨 哈佛 路',current_timestamp(),'img/book06.jpg',
'img/big/book06.jpg',100,99,'风雨哈佛路','外国人',
'总监出版社',current_timestamp(),'ISBN_0002','简体中文','第二版','350页',
'精装','16k','编辑描述','第一章','风雨哈佛路','外国妞','吃着火锅唱着歌',
current_timestamp(),5000,'牛皮纸','第二次加印');
insert into jd_product values(7,
'奈良美智','奈良 美 智',current_timestamp(),'img/book07.jpg',
'img/big/book07.jpg',100,99,'奈良美智','日本人',
'总监出版社',current_timestamp(),'ISBN_0003','简体中文','第二版','350页',
'精装','16k','编辑描述','第一章','奈良美智','日本r','吃着火锅唱着歌',
current_timestamp(),5000,'牛皮纸','第二次加印');
insert into jd_product values(8,
'说服力','ppt 说 说服力 会说话',current_timestamp(),'img/book08.jpg',
'img/big/book08.jpg',100,20,'说服力 让你的PPT会说话',
'张志 刘俊 包翔','人民邮电出版社',current_timestamp(),'ISBN_0008',
'简体中文','第一版','520页','精装','16K','编辑描述 让你的PPT会说话',
'第一章说服力了','说服力 ...省略一万字','不知道是一个人写到还是三个人写的..',
'让你的PPT会说话',current_timestamp(),10000,'宣纸','第一次精印');

insert into jd_product values(9,
'再见出租屋','再见 出租屋 屋',current_timestamp(),'img/book09.jpg','img/big/book09.jpg',
100,20,'再见出租屋','李冰','生活?读书?新知三联书店',current_timestamp(),'ISBN_0009',
'简体中文','第五版','400页','精装','16K','编辑描述 这是一本好书',
'第一章我的北漂生活','北漂生活 ...省略一万字','不知道这是谁..','再见出租屋',
current_timestamp(),2500,'竹纸','第六次印');

 insert  into  jd_product values(10,
 '将才','将 大将 人才',current_timestamp(),'img/book10.jpg',
 'img/big/book10.jpg',100,20,'人才指南','将才作者本人','兄弟连出版社',current_timestamp(),
  'ISBN_0010','简体中文','第一版','350页','简装','16K',
  '成为将才，必先掌握一技之长','总共36章','人才成长必备',
  '著名作家','不想成为将军的士兵不是好士兵',current_timestamp(),5000,'牛皮','第三次第一次印刷'); 
  insert  into  jd_product values(11,
 '怪诞行为学','怪诞 行为 心理学 行为学',current_timestamp(),'img/book11.jpg',
 'img/big/book11.jpg',100,20,'这是一本关于行为和心理方面的著作','高伟伟','兄弟连出版社',current_timestamp(),
  'ISBN_0011','简体中文','第三版','350页','简装','16K',
  '行为理性息息相关','总共31章','要想学习心理学，必先读此书',
  '马太效应 从众心理','停车做爱枫林晚，桑叶红于二月花',current_timestamp(),5000,'特级纸','第五次加印'); 

select * from  jd_product;