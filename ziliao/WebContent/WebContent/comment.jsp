<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<link href="css/comment_style.css" rel="stylesheet" type="text/css">
<body>
<!-------------顶部------------->
<%@include file="head.jsp"%>

<div id="bodyPart">
	<div class="w">
		<div class="crumb">
			 <a href="index.jsp">首页</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">电脑、软件、办公</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">外设产品</a>
			  &nbsp;&gt;&nbsp;
			 <a href="#">鼠标</a>
			  &nbsp;&gt;&nbsp;
			 <a href="#">罗技M215</a>
			  &nbsp;&gt;&nbsp;
			 <a href="#">商品评价</a>
        </div>
	</div>
	
	<!-- 左侧栏目 -->
	<div class="left">
		<div id="pinfo" class="m">
			<div class="mt"><h2>商品信息</h2></div>		
			<div class="mc">
				<div class="p-img"><a href="#"><img width="130" height="130"src="img/luoji.jpg"></a></div>			
				<div class="p-name">商品名称：<a class="link_1" href="#">罗技（Logitech）M215 无线鼠标 黑色</a></div>
				<div class="p-grade">
					<span class="fl">评价得分：</span>
					<div class="fl">
						<div class="star sa4"></div>(4分)						
					</div>
				</div>
				<div class="num-comment">评论数：17408条</div>
				<div class="btn"><a class="btn-append" href="initCart.jsp">添加到购物车</a></div>			
			</div>
		</div>
	</div>
	
	<div class="right-extra">
		<div id="pubcomment" class="m">
			<div class="mt"><h2>发表评价</h2></div>		
		<form action="mycomments.jsp">
			<div class="mc">
				<div class="prompt">
					欢迎您发表原创并对其它用户有参考价值的商品评价。<br>
					审核通过后您可以获得一定积分奖励，好的评价还会在首页展示并有额外的积分奖励哦！
				</div>	

				<dl>
					<dt><b>*</b>标题</dt>
					<dd>
						<input type="text" class="text input"><label>必填，长度在4-20个字之间</label>
					</dd>
    			</dl>

				<dl id="dlpoint">
					<dt><b>*</b>评分</dt>
					<dd>
						<ul class="list-h form">
							<li>
								<input type="radio" value="5" name="point"><div class="star sa5">
								</div>
								(5分) </li>
							<li>
								<input type="radio" value="4" name="point"><div class="star sa4">
								</div>
								(4分)
								</li><li>
									<input type="radio" value="3" name="point"><div class="star sa3">
									</div>
									(3分) </li>
								<li>
									<input type="radio" value="2" name="point"><div class="star sa2">
									</div>
									(2分) </li>
								<li>
									<input type="radio" value="1" name="point"><div class="star sa1">
									</div>
									(1分) </li>
						</ul>
						<span class="clr"></span>
						<label class="error" style="display: none;" id="pointError">
							你还没有评分，请评分</label>
					</dd>
   				</dl>

				<div id="Re_Explain">
					<dl>
						<dt><b>*</b>使用心得</dt>
						<dd>
							<textarea class="text textarea"></textarea><label>必填，长度在5-200个字之间</label>
							<label>										填写您对此商品的使用心得，例如该商品或某功能为您带来的帮助，或使用过程中遇到的问题等。最多可输入200字。</label>
						</dd>
					</dl>
					
					<dl>
						<dt><b>*</b>优点</dt>
						<dd>
							<input type="text" class="text input"><label>必填，长度在5-100个字之间</label>
						</dd>
					</dl>	
					
					<dl>
						<dt><b>*</b>不足</dt>
						<dd>
							<input type="text" value="暂时还没发现缺点哦！" class="text input"><label>必填，长度在5-100个字之间</label>
						</dd>
					</dl>	
					
					<input type="submit" class="btn-img btn-submit" value="提交" id="saveComment">												
				</div><!--------Re_Explain结束-------->				
						
			</div>
		</form>
		</div>
	</div>

	<!--服务部分开始-->
<%@include file="footer.jsp"%>
	
</div>


</body>
</html>
