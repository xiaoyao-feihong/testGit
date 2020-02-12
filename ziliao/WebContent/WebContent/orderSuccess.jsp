<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/success_style.css" type="text/css" rel="stylesheet">
</head>

<body>
<div id="bodyPart">
	<div id="top">
		<div id="logo"></div>
		<div id="Cart">
			<ul>
				<li id="myCart">1.我的购物车</li>
				<li id="writeInfo">2.填写核对订单信息</li>
				<li id="successSub" class="white">3.成功提交订单</li>		
			</ul>
		</div>
	</div>

	<div class="List_cart">
		<h2>
			<strong></strong>
		</h2>
		<div class="cart_table">		
			<div class="tip_1">
				<p>订单已提交，请尽快付款！</p>
			</div>	
			
			<div class="tip_5">
				<p>
					您的订单号：<strong>40845524</strong>&nbsp;&nbsp;&nbsp;&nbsp;
					应付金额：<strong>449.00</strong>元&nbsp;&nbsp;&nbsp;&nbsp;
					支付方式：在线支付&nbsp;&nbsp;&nbsp;&nbsp;
					配送方式：京东快递&nbsp;&nbsp;&nbsp;&nbsp;
					送货时间：只双休日、假日送货(工作日不用送)
				</p>
            </div>
			
			<div class="tip_6">
				  <span>还差一步，请立即支付(请您在24小时内付清款项，否则订单会被自动取消)</span>
				  <span style="margin-left: 90px;"><a target="_blank" href="orderInfo.jsp">查看订单状态</a></span>&nbsp;&nbsp;<a target="_blank" href="#">查看银行限额帮助</a>			
			</div>	
			
			<div class="tip_3">
				<h4>请点击以下银行支付：</h4>
				<ul>
					<li><img src="img/logo_zggsyh.gif"/></li>
					<li><img src="img/logo_bjyh.gif"/></li>
					<li><img src="img/logo_gdfzyh.gif"/></li>
					<li><img src="img/logo_jtyh.gif"/></li>
					<li><img src="img/logo_msyh.gif"/></li>
					<li><img src="img/logo_pfyh.gif"/></li>
					<li><img src="img/logo_szfzyh.gif"/></li>
					<li><img src="img/logo_xyyh.gif"/></li>
					<li><img src="img/logo_zggdyh.gif"/></li>
					<li><img src="img/logo_zgjsyh.gif"/></li>
					<li><img src="img/logo_zgnyyh.gif"/></li>
					<li><img src="img/logo_zgyh.gif"/></li>
					<li><img src="img/logo_zsyh.gif"/></li>
					<li><img src="img/logo_zxyh.gif"/></li>
					<li><img src="img/mobile.gif"/></li>
					<li><img src="img/y_zfb.gif"/></li>
				</ul>
				<h4 class="t">请选择以下支付平台支付：</h4>
				<ul>
					<li><img src="img/logo_zggsyh.gif"/></li>
					<li><img src="img/logo_bjyh.gif"/></li>
					<li><img src="img/logo_gdfzyh.gif"/></li>
					<li><img src="img/logo_jtyh.gif"/></li>
					<li><img src="img/logo_msyh.gif"/></li>
					<li><img src="img/logo_pfyh.gif"/></li>
				</ul>
			</div>
			<div id="divContent">
				<b>提示：</b><br>
				&nbsp;&nbsp;尊敬的用户，因手机支付进行系统维护，将于23:50~00:50可能无法使用。请稍后重试，给您带来的不便敬请谅解！<br>
				<b>如何进行大额支付：</b><br>
				1、如您订单金额较大，可以使用快钱支付中的招行、工行、建行、农行、广发进行一次性大额支付（一万元以下）；<br>
				2、如果您有财付通、支付宝或快钱账户，可将款项先充入相应账户内，然后使用账户余额进行一次性大额支付；<br>
				3、直接进入“我的京东”-“在线支付”页面进行分次支付（财付通支持多次支付），支付时请输入相应订单号及支付金额。
    		</div>			
			<div class="tip_4">
                    完成支付后，您可以：<a  href="orderInfo.jsp">查看订单状态</a>&nbsp;&nbsp;&nbsp;<a  href="index.jsp">继续购物</a>
                    &nbsp;&nbsp;&nbsp;<a  href="#">问题反馈</a>
                    
            </div>	
		</div>
	</div>
	<div class="round">
		<div class="lround"></div>
		<div class="rround"></div>
	</div>			
</div>	

<!-- 页脚类型1 -->
<%@include file="footer1.jsp"%>
</body>
</html>
