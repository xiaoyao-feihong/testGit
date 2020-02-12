<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>京东商城 - 图书频道首页</title>
<link rel="stylesheet" type="text/css" href="css/book.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var showIndex = 0; //要显示的图片的索引号
		var demo; //定时器
		autoScroll(); //不间断切换方法
		function autoScroll(){
			$("#pfocus_btn li").removeClass("current");
			$("#pfocus_btn a").removeClass("textcolor");
			$("#pfocus_btn li").eq(showIndex).addClass("current");
			$("#pfocus_btn a").eq(showIndex).addClass("textcolor");
			$("#pfocus_piclist li").eq(showIndex).fadeIn("slow");
			$("#pfocus_piclist li").eq(showIndex-1).hide();
			showIndex++;
			showIndex=showIndex>=5?0:showIndex;
			demo=setTimeout(autoScroll,2000);
		}
		function stopScroll(){
			clearTimeout(demo); //清除定时器
		}
		//鼠标移入移出小图按钮时执行
		$("#pfocus_btn li").hover(function(){
			stopScroll();
			$("#pfocus_btn li").removeClass("current");
			$("#pfocus_btn a").removeClass("textcolor");
			$(this).addClass("current");
			currentId=$(this).attr("id");
			picId = currentId.substring(currentId.length-1);
			$("#pfocus_btn a").eq(picId).addClass("textcolor");
			$("#pfocus_piclist li").hide();
			$("#pfocus_piclist li").eq(picId).fadeIn("slow");
		},function(){
			currentId=$(this).attr("id");
			picId = currentId.substring(currentId.length-1);
			showIndex = picId;
			autoScroll();
		})
		//鼠标移入移出大图时执行
		$("#pfocus_piclist li").hover(function(){
			stopScroll();
			$("#pfocus_piclist li").hide();
			$(this).show();
			currentId=$(this).attr("id");
			picId = currentId.substring(currentId.length-1);
			$("#pfocus_btn li").eq(picId).addClass("current");
			$("#pfocus_btn a").eq(picId).addClass("textcolor");
			
		},function(){
			currentId=$(this).attr("id");
			picId = currentId.substring(currentId.length-1);
			showIndex = picId;
			autoScroll();
		})
	})
</script>
</head>
<body id="book">

<!--头部导航开始-->
<%@include file="head.jsp"%>
<!--头部导航结束-->
<div class="clear"></div>
<!--主体main部分开始-->
<div class="main page_width">
	<!--左边部分开始-->
	<div id="left">
    	<div id="book_sort">
        	<div class="sort_title">
            	<h2>图书分类</h2>
            </div>
            <div class="sort_list">
                <div class='item'>
                	<h3><b>&gt;</b><a href='book_list.jsp' class="dot"> 小说</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='book_list.jsp' class="dot">文学</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='book_list.jsp' class="dot">青春文学</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='book_list.jsp' class="dot">传记</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='book_list.jsp' class="dot">艺术</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='book_list.jsp' class="dot">少儿</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='book_list.jsp' class="dot">经济</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='book_list.jsp' class="dot">金融与投资</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='book_list.jsp' class="dot">管理</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='book_list.jsp' class="dot">励志与成功</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='book_list.jsp' class="dot">生活</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">健身与保健</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">家庭与育儿</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">旅游</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">动漫/幽默</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">历史</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">哲学</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">国学</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">政治/军事</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">法律</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">宗教</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">心理学</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">文化</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">社会科学</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">科技</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">工程</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">建筑</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">医学</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">科学与自然</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">计算机与互联网</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">体育/运动</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">教材教辅</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">教育与考试</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">外语学习</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">新闻出版</a></h3>
                </div>
                <div class='item'>
                	<h3><b>&gt;</b><a href='#' class="dot">语言文字</a></h3>
                </div>
            </div>          
        </div>
        
        <div id="publishers">
        	<div class="book_title">
				<h2>品牌出版商<br /><span>Top Publishers</span></h2>
			</div>
            <ul>
            	<li class='fore'><a href='#' target="_blank">人民出版社</a></li>
                <li class=''><a href='#' target="_blank">人民文学出版社</a></li>
                <li class=''><a href='#' target="_blank">中华书局</a></li>
                <li class=''><a href='#' target="_blank">生活・读书・新知三联书店</a></li>
                <li class=''><a href='#' target="_blank">商务印书馆</a></li>
                <li class=''><a href='#' target="_blank">科学出版社</a></li>
                <li class=''><a href='#' target="_blank">北京大学出版社</a></li>
                <li class=''><a href='#' target="_blank">中国人民大学出版社</a></li>
                <li class=''><a href='#' target="_blank">广东省出版集团</a></li>
                <li class=''><a href='#' target="_blank">河北出版传媒集团</a></li>
                <li class=''><a href='#' target="_blank">上海文艺出版集团</a></li>
                <li class=''><a href='#' target="_blank">重庆出版集团</a></li>
                <li class=''><a href='#' target="_blank">复旦大学出版社</a></li>
                <li class=''><a href='#' target="_blank">江苏译林出版社</a></li>
                <li class=''><a href='#' target="_blank">法律出版社</a></li>
                <li class=''><a href='#' target="_blank">时代光华图书有限公司</a></li>
                <li class=''><a href='#' target="_blank">童趣出版公司</a></li>
                <li class=''><a href='#' target="_blank">连环画出版社</a></li>
                <li class=''><a href='#' target="_blank">新华文轩出版传媒股份有限公司</a></li>
                <li class=''><a href='#' target="_blank">中国经济出版社</a></li>
            </ul>
        </div>
   
    </div>
    <!--左边部分结束-->
    
    <!--中间部分开始-->
    <div id="middle">
    	<div id="slide">
        	
            <div id="pfocus">
                <div id="pfocus_piclist">
                    <ul>
                        <li id="p0"><a href="#"><img src="img/ad01.jpg" /></a></li>
                        <li id="p1"><a href="#"><img src="img/ad02.jpg" /></a></li>
                        <li id="p2"><a href="#"><img src="img/ad03.jpg" /></a></li>
                        <li id="p3"><a href="#"><img src="img/ad04.jpg" /></a></li>
                        <li id="p4"><a href="#"><img src="img/ad05.jpg" /></a></li>
                        <li id="p5"><a href="#"><img src="img/ad06.jpg" /></a></li>
                    </ul>
                </div>
    			<div id="pfocus_btn">
                    <ul>
                        <li class="current" id="b0"><a href="#" class="textcolor">1</a></li>
                        <li id="b1"><a href="#">2</a></li>
                        <li id="b2"><a href="#">3</a></li>
                        <li id="b3"><a href="#">4</a></li>
                        <li id="b4"><a href="#">5</a></li>
                        <li id="b5"><a href="#">6</a></li>
                    </ul>
    			</div>
			</div>
        </div>
        
       
        
        <div class="clear"></div>
        
        <div id="new_books">
			<div class="book_tit">
				<h2><b style="font-size:16px;color:#289703;font-family: 'microsoft yahei',arial;">新书速递</b><br /><span>New Title Express</span></h2>
				<ul class="tab">	 
		  			<li class='curr'>1</li>	
                    <li >2</li>
                    <li >3</li>	
				</ul>
			</div>
	        <div class='book_content'>
				<ul class="pic_list">		
					<li>
						<div class="pic_name"><a href="#" target="_blank">成功学</a></div>
						<div class="pic_book">
							<div class=""><a href="#"  target="_blank"><img src='img/book_10.jpg' /></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">转运：给残酷人生做一个温暖规划</a></div>
						<div class="pic_price">定价：<del>￥24.00</del></div>
						<div class="pic_price">会员价：<strong>￥16.70</strong></div>
					</li>		
					<li>
						<div class="pic_name"><a href="#" target="_blank">创业必修</a></div>
						<div class="pic_book">
							<div class=""><a href="#"  target="_blank"><img src='img/book_11.jpg'/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">MBA教不了的创富课：我在30岁之前赚到1000万的经验谈</a></div>
						<div class="pic_price">定价：<del>￥28.00</del></div>
						<div class="pic_price">会员价：<strong>￥17.10</strong></div>
					</li>			
					<li>
						<div class="pic_name"><a href="#" target="_blank">女性人物</a></div>
						<div class="pic_book">
							<div class=""><a href="#"  target="_blank"><img src='img/book_12.jpg' /></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">风雨哈佛路</a></div>
						<div class="pic_price">定价：<del>￥38.00</del></div>
						<div class="pic_price">会员价：<strong>￥24.00</strong></div>
					</li>
			
					<li>
						<div class="pic_name"><a href="#" target="_blank">文化专题研究</a></div>
						<div class="pic_book">
							<div class=""><a href="#"  target="_blank"><img src='img/book_13.jpg' width="130" height="130" /></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">知日：奈良美智</a></div>
						<div class="pic_price">定价：<del>￥35.00</del></div>
						<div class="pic_price">会员价：<strong>￥21.70</strong></div>
					</li>		
				</ul>
			</div>
       	</div>
        
        <div class="ad_middle"><a href="" target="_blank">
			<img height="120" width="546" src="img/book_14.jpg"/></a>
		</div>
        
        <div id="editor_recommend">
        	<div class="book_tit">
				<h2>热销图书<br /><span>Editor's Picks</span></h2>
			</div>
            <div class="book_content">
				<ul class="pic_list">
					<li>
						<div class="pic_book">
							<div><a href="#" target="_blank"><img src="img/book_15.jpg" /></a></div>
						</div>
						<div class="pic_intr">
                        	<a href="#" target="_blank">中国海魂：从郑和到钓鱼岛</a>
                        </div>
						<div class="pic_price">定价：<del>￥38.00</del></div>
						<div class="pic_price">会员价：<strong>￥25.10</strong></div>
					</li>
					<li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_16.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">再见，出租屋</a></div>
						<div class="pic_price">定价：<del>￥28.00</del></div>
						<div class="pic_price">会员价：<strong>￥18.30</strong></div>
					</li>
                    <li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_17.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">马云内部讲话</a></div>
						<div class="pic_price">定价：<del>￥28.00</del></div>
						<div class="pic_price">会员价：<strong>￥16.20</strong></div>
					</li>
                    <li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_18.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">将才：让年轻人少奋斗5年</a></div>
						<div class="pic_price">定价：<del>￥25.80</del></div>
						<div class="pic_price">会员价：<strong>￥11.70</strong></div>
					</li>
				</ul>
			</div>
            
            
           
           <div class="book_content">
				<ul class="pic_list">
					<li>
						<div class="pic_book">
							<div><a href="#" target="_blank"><img src="img/book_19.jpg" /></a></div>
						</div>
						<div class="pic_intr">
                        	<a href="#" target="_blank">怪诞行为学：可预测的非理性（升级版）</a>
                        </div>
						<div class="pic_price">定价：<del>￥45.00</del></div>
						<div class="pic_price">会员价：<strong>￥27.70</strong></div>
					</li>
					<li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_20.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">三毛1943-1991</a></div>
						<div class="pic_price">定价：<del>￥39.80</del></div>
						<div class="pic_price">会员价：<strong>￥27.30</strong></div>
					</li>
                    <li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_21.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">DSLR数码单反摄影完全手册（附DVD光盘2张）</a></div>
						<div class="pic_price">定价：<del>￥99.00</del></div>
						<div class="pic_price">会员价：<strong>￥68.90</strong></div>
					</li>
                    <li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_22.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">新育儿百科</a></div>
						<div class="pic_price">定价：<del>￥68.00</del></div>
						<div class="pic_price">会员价：<strong>￥42.00</strong></div>
					</li>
				</ul>
			</div>
           
        </div>
        
        
       
        
        
        <div id="discount">
			<div class="book_tit">
				<h2>超低折扣<br /><span>Discount Books</span></h2>
				
                <div class="extra">
					<a href="#" target="_blank">全部特价&gt;&gt;</a>
				</div>
			</div>
			<div class="book_content">
				<ul class="pic_list">
					<li>
						<div class="pic_book">
							<div><a href="#" target="_blank"><img src="img/book_43.jpg" /></a></div>
						</div>
						<div class="pic_intr">
                        	<a href="#" target="_blank">怪诞行为学：可预测的非理性（升级版）</a>
                        </div>
						<div class="pic_price">定价：<del>￥45.00</del></div>
						<div class="pic_price">会员价：<strong>￥27.70</strong></div>
					</li>
					<li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_44.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">三毛1943-1991</a></div>
						<div class="pic_price">定价：<del>￥39.80</del></div>
						<div class="pic_price">会员价：<strong>￥27.30</strong></div>
					</li>
                    <li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_45.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">DSLR数码单反摄影完全手册（附DVD光盘2张）</a></div>
						<div class="pic_price">定价：<del>￥99.00</del></div>
						<div class="pic_price">会员价：<strong>￥68.90</strong></div>
					</li>
                    <li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_46.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">新育儿百科</a></div>
						<div class="pic_price">定价：<del>￥68.00</del></div>
						<div class="pic_price">会员价：<strong>￥42.00</strong></div>
					</li>
				</ul>
			</div>
			<br/>
			<div class="book_content">
				<ul class="pic_list">
					<li>
						<div class="pic_book">
							<div><a href="#" target="_blank"><img src="img/book_43.jpg" /></a></div>
						</div>
						<div class="pic_intr">
                        	<a href="#" target="_blank">怪诞行为学：可预测的非理性（升级版）</a>
                        </div>
						<div class="pic_price">定价：<del>￥45.00</del></div>
						<div class="pic_price">会员价：<strong>￥27.70</strong></div>
					</li>
					<li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_44.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">三毛1943-1991</a></div>
						<div class="pic_price">定价：<del>￥39.80</del></div>
						<div class="pic_price">会员价：<strong>￥27.30</strong></div>
					</li>
                    <li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_45.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">DSLR数码单反摄影完全手册（附DVD光盘2张）</a></div>
						<div class="pic_price">定价：<del>￥99.00</del></div>
						<div class="pic_price">会员价：<strong>￥68.90</strong></div>
					</li>
                    <li>
						<div class="pic_book">
							<div class=""><a href="#"><img src="img/book_46.jpg" width="130" height="130"/></a></div>
						</div>
						<div class="pic_intr"><a href="#" target="_blank">新育儿百科</a></div>
						<div class="pic_price">定价：<del>￥68.00</del></div>
						<div class="pic_price">会员价：<strong>￥42.00</strong></div>
					</li>
				</ul>
			</div>
		</div>
        
         	
    </div>
    <!--中间部分结束-->
    
    <!--右边部分开始-->
    <div id="right">
    	<div class="" id="report">
			<div class="book_tit">
				<h2>图书资讯<br /><span>Book News</span></h2>
			</div>
			<div class="book_content">
				<ul>
                     <li>・<a  Target="_blank"  href="#">京东读书频道正式上线喽！</a></li>
                     <li>・<a  Target="_blank"  href="#">好书360和Best So Far活动上线！</a></li>
                     <li>・<a  Target="_blank"  href="#">投资好书大集结33折起</a></li>
                     <li>・<a  Target="_blank"  href="#">孕产育儿畅销书27折起！</a></li>
                     <li>・<a  Target="_blank"  href="#">《1Q84》Book3突破性完结！</a></li>
                     <li>・<a  Target="_blank"  href="#">全网独家！1039行车手册</a></li>
                     <li>・<a  Target="_blank"  href="#">全网独家！1039行车手册</a></li>
                     <li>・<a  Target="_blank"  href="#">全网独家！1039行车手册</a></li>
                     <li>・<a  Target="_blank"  href="#">全网独家！1039行车手册</a></li>
                     <li>・<a  Target="_blank"  href="#">全网独家！1039行车手册</a></li>
				</ul>
			</div>
		</div>
        
        <div id="week_sale">
			<div class="book_tit">
				<h2>每周畅销榜<br /><span>Daily Bestsellers</span></h2>
			</div>
            <div class="book_content">
            	
                <ul class="rank">
					<li class='fore'>
                    	<span>1</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>养育女孩 </a></div>
                        <div class='pic_price'>定价：<del>￥24.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥14.80</strong></div>
                    </li>
                    <li>
                    	<span>2</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_52.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                   	<li>
                    	<span>3</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>4</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>5</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>6</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>7</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>8</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>9</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
				</ul>
            </div>       
		</div>
        
        <!-- 广告位  -->
        
        <div id="new_sale">
			<div class="book_tit">
				<h2>新书热销榜<br /><span>Hot New Books</span></h2>
			</div>
            <div class="book_content">
                <ul class="rank">
					<li class='fore'>
                    	<span>1</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>养育女孩 </a></div>
                        <div class='pic_price'>定价：<del>￥24.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥14.80</strong></div>
                    </li>
                    <li>
                    	<span>2</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_52.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                   	<li>
                    	<span>3</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>4</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>5</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>6</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>7</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>8</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
                    <li>
                    	<span>9</span>
                        <div class='p-img'><a href='#' target='_blank'><img src='img/book_51.jpg'/></a></div>
                        <div class='p-name'><a href='#'  target='_blank'>乐活族-最经典的脑筋急转弯 </a></div>
                        <div class='pic_price'>定价：<del>￥10.00</del></div>
                        <div class='pic_price'>会员价：<strong>￥1.00</strong></div>
                    </li>
				</ul>
				
            </div>

		</div>
        
    </div>
    <!--右边部分结束-->
</div>

<%@include file="footer.jsp" %>
</body>
</html>
