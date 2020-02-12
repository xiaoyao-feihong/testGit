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
			 <a href="#">订单中心</a>
        </div>
	</div>
	
	<div class="main">
	<!-- 左侧栏目 -->
		<%@include file="left.jsp"%>
		<!-- 右侧 -->
		<div id="right_order">
			<ul class="Tab">
				<li ><em><a href="orderList.jsp">最近一个月订单</a></em></li>
				<li class="curr"><em>已取消的订单</em></li>
			</ul>
			<table class="table_a marginb10">
				<tr class="align_Center">
					<th width="15%"><strong>订单编号</strong></th>
					<th><strong>收货人姓名</strong></th>
					<th><strong>支付方式</strong></th>
					<th><strong>订单金额</strong></th>
					<th><strong>取消时间</strong></th>
					<th><strong>取消类型</strong></th>
					<th><strong>操作</strong></th>
				</tr>
				<tr class="align_Center">
					<td>40925346</td>
					<td>ww</td>
					<td>在线支付</td>
					<td>￥449.00</td>
					<td>2011-2-21 10:03:23</td>
					<td>过期未付款</td>
					<td><a href="delete_order_detail.jsp">查看</a><br><a href="initCart.jsp">加入购物车</a></td>
				</tr>
				<tr class="align_Center">
					<td>40925346</td>
					<td>ww</td>
					<td>在线支付</td>
					<td>￥449.00</td>
					<td>2011-2-21 10:03:23</td>
					<td>过期未付款</td>
					<td><a href="delete_order_detail.jsp">查看</a><br><a href="initCart.jsp">加入购物车</a></td>
				</tr>
				<tr class="align_Center">
					<td>40925346</td>
					<td>ww</td>
					<td>在线支付</td>
					<td>￥449.00</td>
					<td>2011-2-21 10:03:23</td>
					<td>过期未付款</td>
					<td><a href="delete_order_detail.jsp">查看</a><br><a href="initCart.jsp">加入购物车</a></td>
				</tr>
				<tr>
					<td colspan="7">
						<div class="pagenum"><span class="float_Right">
						<a class="current" href="#">1</a></span></div>
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
