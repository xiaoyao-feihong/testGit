<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link type="text/css" href="css/orderInfoSure_style.css" rel="stylesheet"/>
</head>

<body>
<div id="bodyPart">
	<div id="top">
		<div id="logo"></div>
		<div id="Cart">
			<ul>
				<li id="myCart">1.我的购物车</li>
				<li id="writeInfo" class="white">2.填写核对订单信息</li>
				<li id="successSub">3.成功提交订单</li>				
			</ul>
		</div>
	</div>
	<div class="List_cart">
		<h2>
			<strong>填写核对订单信息</strong>
		</h2>
				
		<div class="cart_table">		
			<div id="part_consignee">
				<div class="o_show">
			
					<h1>
					收货人信息&nbsp;<a href="#">[修改]</a>
					</h1>
			
					<div class="middle">										
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td align="right" style="width: 80px;">收货人姓名：</td>
								<td>ww</td>
							</tr>
							
							<tr>
								<td align="right">省　　份：</td>
								<td>上海卢湾区内环中环之间</td>
							</tr>
						
							<tr>
								<td align="right">地　　址：</td>
								<td>上海卢湾区内环中环之间aaaa</td>
							</tr>
						
							<tr>
								<td align="right">手机号码：</td>
								<td>15112323781</td>
							</tr>
						
							<tr>
								<td align="right">固定电话：</td>
								<td>15112323781</td>
							</tr>
						
							<tr>
								<td align="right">电子邮件：</td>
								<td>123ww@163.com</td>
							</tr>
						
							<tr>
								<td align="right">邮　　编：</td>
								<td>100100</td>
							</tr>
												
						</table>
					</div>
				</div>
			</div>		


			<div id="part_payTypeAndShipType">
				<div class="o_show">
					<h1>支付及配送方式&nbsp;<a href="#" id="linkPayTypeShipType">[修改]</a></h1>
     				<div class="middle">
						<table cellpadding="0" cellspacing="0">
							  <tr>
								  <td style="text-align: right; width: 80px;">支付方式：</td>
								  <td>在线支付</td>
							  </tr>
							  <tr style="">
								  <td style="text-align: right;">配送方式：</td>
								  <td>京东快递</td>
							  </tr>
							  <tr>
								  <td style="text-align: right;">运　　费：</td>
								  <td>0.00元<span style="color: red;">(免运费)</span></td>
							  </tr>
							  <tr>
								  <td style="text-align: right;">送货日期：</td>
								  <td style="color: red;">只双休日、假日送货(工作日不用送)</td>
							  </tr>
						</table>
       				</div>
				</div>
			</div>


			<div id="part_invoice">
				<div class="o_show">
					 <h1>发票信息&nbsp;<a href="#">[修改]</a></h1>
					  <div class="middle">
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td style="text-align: right; width: 82px;">发票类型：</td>
									<td>普通发票</td>
								</tr>
								<tr>
									<td style="text-align: right;">发票抬头：</td>
									<td>个人 </td>
								</tr>
								 <tr>
								   <td style="text-align: right;">发票内容：</td>
								   <td>明细</td>
								</tr>
							</table>
					   </div>
				 </div>			 
			</div>


			<div id="part_remark">
				<div class="o_show">
				   <h1>订单备注&nbsp;<a href="#">[修改]</a></h1>
					 <div class="middle">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td style="text-align: left; padding-left: 20px;">暂无备注</td>
							</tr>
						</table>
					</div>
				</div>
			</div>


			<div id="part_cart">
				<div class="o_show">
				   <h1><span style="margin-right: 700px;">商品清单</span><a  href="myCart.html" id="backCart">返回修改购物车</a></h1>
				   <div class="middle">
					   <table width="100%" cellspacing="0" cellpadding="0" class="Table">
						 <tr class="align_Center Thead">
							<td width="7%">商品编号</td>
							<td>商品名称</td>
							<td width="10%">京东价</td>
							<td width="8%">返现</td>
							<td width="8%">赠送积分</td>
							<td width="9%">库存状态</td>
							<td width="9%">商品数量</td>
						 </tr>
						
						<tr class="align_Center">
							 <td style="padding: 5px 0pt;">344159</td>
							 <td class="align_Left">
							 	<a href="#">惠普（HP） CB350 数码相机（蓝色订制版）</a>
								<div><span class="tip_bag">[赠品]</span>相机包 <font color="red">×1</font></div>
				
							 </td>
							 <td><span class="price">￥449.00</span></td>
							 <td>￥0.00</td>
							 <td>0</td>
							 <td>现货</td>
							 <td>2</td>
						</tr>
					 </table>
				   </div>
				</div>
			</div>	
	

			<div id="ware_info">
				<div id="acc_info">结算信息</div>
				<h1></h1>
				<div class="middle">
					<ul id="part_info">
						<li style="padding-bottom: 5px;" class="info1">商品金额：898.00元 + 运费：0.00元 - 优惠券：<span id="price_coupon">0.00</span>元 - 礼品卡：<span id="price_coupon">0.00</span>元 - 返现：0.00元
						<br>
						</li>

						<li style="width: 100%; overflow: hidden;" class="info2">
							 <table cellspacing="0" cellpadding="0" width="100%">
								<tr>
								  <td><a href="#">(<span id="couponStateShow">+</span>)使用优惠券抵消部分总额</a>            </td>
								  <td style="text-align: right; font-size: 15px;"><b>应付总额：<font color="red">￥898.00</font> 元</b></td>
							   </tr>
								<tr>
								  <td colspan="2"><a href="#">(<span id="couponStateShow">+</span>)使用京东礼品卡</a>            </td>
							   </tr>
							</table>
						</li>
                    </ul>
				</div>				
			</div>


			<div id="submit_btn"><a href="orderSuccess.jsp"><img src="img/submit.jpg"/></a></div>	
			<div id="line"></div>
		</div><!----cart_table结束---->
		
		<div class="round">
			<div class="lround"></div>
			<div class="rround"></div>
		</div>			
	</div>	
</div>
<!-- 页脚类型1 -->
<%@include file="footer1.jsp"%>
</body>
</html>
