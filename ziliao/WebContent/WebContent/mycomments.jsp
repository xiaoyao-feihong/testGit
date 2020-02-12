<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="css/delete_order_style.css"/>
</head>

<body>

<!-------------顶部------------->
<%@include file="head.jsp"%>

<div id="bodyPart">
	<div class="w">
		<div class="crumb">
			 <a href="index.jsp">首页</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">我的京东</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">我的评价</a>
        </div>
	</div>
	
	<div class="main">
	<!-- 左侧栏目 -->
		<%@include file="left.jsp"%>
		<!-- 右侧 -->
		<div id="right_order">
			<ul class="Tab">
				<li class="curr"><em>商品评价</em></li>				
			</ul>
			<table class="table_a marginb10">
				<tr class="align_Center">
					<th width="15%"><strong>商品编号</strong></th>
					<th><strong>商品名</strong></th>
					<th><strong>订单编号</strong></th>
					<th><strong>购买时间</strong></th>
					<th><strong>评价</strong></th>
					<th><strong>评价积分</strong></th>
				</tr>
				<tr class="align_Center">
					<td>1000016823</td>
					<td>Warsteiner 威斯堡沃斯乐啤酒5L</td>
					<td>40925346</td>
					<td>2011-01-19</td>
					<td><a target="_blank" href="answercomment.jsp">查看评价</a></td>
					<td>3分</td>
				</tr>
								<tr class="align_Center">
					<td>1000016823</td>
					<td>Warsteiner 威斯堡沃斯乐啤酒5L</td>
					<td>40925346</td>
					<td>2011-01-19</td>
					<td><a target="_blank" href="answercomment.jsp">查看评价</a></td>
					<td>3分</td>
				</tr>
								<tr class="align_Center">
					<td>1000016823</td>
					<td>Warsteiner 威斯堡沃斯乐啤酒5L</td>
					<td>40925346</td>
					<td>2011-01-19</td>
					<td><a href="comment.jsp">发表评价</a></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="7">
						<div class="pagenum"><span class="float_Right">
						<a class="current" href="#">1</a></span></div>
					</td>
				</tr>				
			</table>
			<table class="table_a marginb10">
				<tr>
					<td>
					<strong>评价说明：</strong><br/>
					1、只能对在半年内购买的商品进行评价，赠品可以评价但不赠送积分；<br/>
					2、同一订单或相隔15日内订单中的相同商品，只有一次评价可以获得积分；<br/>
					3、根据不同会员级别和产品价格，赠送积分会有所不同，详见帮助；<br/>
					4、欢迎您发表有价值的评价，拷贝他人内容、内容重复、过多标点符号等情况不赠送积分，详见帮助；
					</td>
				</tr>
			</table>	
		</div>		
		
	</div>
</div>
<!-- 页脚 -->
<%@include file="footer.jsp"%>
</body>
</html>
