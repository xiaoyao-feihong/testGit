<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="css/delete_order_detail_style.css"/>
</head>
<body>

<!-------------顶部------------->
<%@include file="head.jsp"%>

<div id="bodyPart">
	<div class="w">
		<div class="crumb">
			 <a href="#">首页</a>
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
		<div class="right">
			<div class="o-mt"><h2>已取消订单</h2></div>
			<div class="mt">
				<h3>商品信息</h3>
				<div class="extra"><span class="fl">如需再次购买订单中的商品，您可以</span><a class="btn01" href="initCart.jsp"><s></s>将全部商品放入购物车</a><div class="clr"></div>
				</div>
			</div>
			<table width="100%" class="table_a marginb10">
				<tr>
					<th width="10%">商品编号</th>
					<th width="50%">商品名称</th>
					<th width="10%">京东价</th>
					<th width="10%">赠送积分</th>
					<th>商品数量</th>
					<th>操作</th>
				</tr>
				
					<tr>
						<td>344159</td>
						<td class="align_Left"><a target="_blank" href="#">惠普（HP） CB350 数码相机（蓝色订制版）</a></td>
						<td><strong>￥449.00</strong></td>
						<td>0</td>
						<td>2</td>
						<td class="align_Center"><a class="btn01" href="initCart.jsp"><s></s>放入购物车</a></td>
					</tr>
				
					<tr>
						<td>344296</td>
						<td class="align_Left"><a target="_blank" href="#">相机包</a></td>
						<td><strong>￥0.00</strong></td>
						<td>0</td>
						<td>2</td>
						<td class="align_Center"><a class="btn01" href="initCart.jsp"><s></s>放入购物车</a></td>
					</tr>
				</table>

				<table class="table_a marginb10">
					<tr><th align="left"><strong>订单信息</strong></th></tr>
					<tr>
						<td>
							<div class="pD1">						
							 订单编号：40804346<br>
							 支付方式：在线支付<br>
							 配送方式：快递运输<br>
							 下单时间：2011-2-19 10:36:00<br>
							 取消时间：2011-2-19 10:51:23<br>
							 取消类型：主动取消订单
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="pD1">
								<strong>收货人信息</strong><br>
								收货人姓名：ww<br>
								地址：上海卢湾区内环中环之间aaaa&nbsp; &nbsp;邮编：
								100100<br>
								固定电话：15112323781    
								手机号码：15112323781<br>
								电子邮件：123ww@163.com
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="pD1">
								<strong>发票信息</strong><br>
								发票类型：普通发票<br>
								发票抬头：个人<br>
								发票内容：明细
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="pD1">
								<strong>订单备注</strong><br>
								无
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="pD1">
								<strong>结算信息</strong><br>
								商品金额：898.00元 + 
								运费：0.00元 - 
								优惠券：0.00元-
								使用余额：0.00元
								 = 
								<strong class="h1">订单总金额：<span class="red">898.00元</span></strong>
							</div>
						</td>
					</tr>
				</table>


						
		</div>		<!----right----->
	</div>
</div>
<%@include file="footer.jsp"%>

</body>
</html>
