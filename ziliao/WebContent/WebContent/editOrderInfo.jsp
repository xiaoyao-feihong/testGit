<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="css/editOrderInfo_style.css" type="text/css">
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
			<div class="o_write">
				<h1>收货人信息&nbsp;<a href="#">[关闭]</a></h1>	
				<div class="middle">
					<table width="100%" cellspacing="0" border="0">
						<tr>
							<td width="85" valign="middle" align="right"><font color="red">*</font>收货人姓名：</td>
							<td valign="middle" align="left">
								<input type="text" class="txt" id="consignee_addressName">&nbsp;
							</td>
						</tr>
						
						<tr>
							<td valign="middle" align="right"><font color="red">*</font>省　　份：</td>
							<td valign="middle" align="left">
								<span>
									<select>
										<option>请选择</option>
										<option>北京</option>
										<option>上海</option>
										<option>天津</option>
									</select>
									<select>
										<option>请选择</option><option>黄浦区*</option>
										<option>卢湾区*</option>
										<option>徐汇区*</option>
									</select>
								</span>&nbsp;&nbsp;注:标“*”的为支持货到付款的地区，<a href="#">查看货到付款地区</a>
							</td>
						</tr>
						
						<tr>
							<td valign="middle" align="right"><font color="red">*</font>地　　址：</td>
							<td valign="middle" align="left">
								<span>上海卢湾区内环中环之间</span>
								<input type="text" style="margin-left: 2px; width: 327px;" maxlength="50" class="txt">&nbsp;
							</td>
						</tr>
						
						<tr>
							<td valign="middle" align="right"><font color="red">*</font>手机号码：</td>
							<td valign="middle" align="left">
								<input type="text"  class="txt"> &nbsp;或者 固定电话： <input type="text"class="txt">&nbsp;<font color="#000000">用于接收发货通知短信及送货前确认</font>
							</td>
						</tr>
						
						
						<tr>
							<td valign="middle" align="right">电子邮件：</td>
							<td valign="middle" align="left">
								<input type="text" class="txt"> &nbsp;<font color="#000000">用来接收订单提醒邮件，便于您及时了解订单状态</font>
							</td>
						</tr>
						
						
						<tr>
							<td valign="middle" align="right">邮政编码：</td>
							<td valign="middle" align="left">
								 <input type="text"  style="width: 77px;" class="txt">&nbsp;<font color="#000000" style="margin-left: 53px;">有助于快速确定送货地址</font>
							 </td>
						</tr>
					</table>				
				</div><!--middle结束--->
				<div id="comUseAdd"><a  href="#">[添加到常用地址]</a></div>				
				<div class="footer"><input type="button" value="保存收货人信息" class="btn"></div>
			</div>
			<div class="o_write">
				<h1>支付及配送方式&nbsp;<a href="#">[关闭]</a></h1>	
				<div id="middle">
					<table width="100%" cellspacing="0" cellpadding="0" border="0">
						 <tr>
							<td style="width: 240px;"><div class="grouptitle">支付方式</div></td>
							<td style="border-bottom: 1px solid rgb(238, 238, 238);">备注</td>
						 </tr>
					</table>	
					
					<table width="100%" cellspacing="0" cellpadding="0" border="0">
						<tr>
						   <td valign="top" align="left" style="width: 240px;">
								<input type="radio" name="IdPaymentType"><label style="margin-left: 2px;">货到付款</label>
							</td>
							<td valign="top" class="gray">当面付款后验货，支持现金、POS机刷卡、支票支付 <a href="#">查看运费及配送范围</a></td>
						</tr>
					</table>	
					
					
					<table width="100%" cellspacing="0" cellpadding="0" border="0">
						<tr>
						   <td valign="top" align="left" style="width: 240px;">
								<input type="radio" name="IdPaymentType"><label style="margin-left: 2px;">在线支付</label>
							</td>
							<td valign="top" class="gray">即时到帐，支持绝大数银行借记卡及部分银行信用卡 <a href="#">查看银行及限额</a></td>
						</tr>
					</table>									
				
					<div class="tsbox" id="payRemark">
					   <div style="padding: 2px 0pt;">支持以下银行在线支付：</div>
					   <table cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td style="height: 45px; width: 24%;"><img src="img/logo_zggsyh.gif"></td>
								<td style="width: 24%;"><img src="img/logo_zgjsyh.gif"></td>
								<td style="width: 24%;"><img src="img/logo_zsyh.gif"></td>
								<td><img src="img/logo_jtyh.gif"></td>
							</tr>
							<tr>
								<td style="height: 45px;"><img src="img/logo_zgnyyh.gif"></td>
								<td><img src="img/logo_gdfzyh.gif"></td>
								<td><img src="img/logo_xyyh.gif"></td>
								<td><img src="img/logo_zggdyh.gif"></td>
								</tr>
							<tr>
								<td style="height: 45px;"><img alt="中信银行" src="img/logo_zxyh.gif"></td>
								<td><img src="img/logo_pfyh.gif"></td>
								<td><img src="img/logo_zgyh.gif"></td>
								<td><img src="img/logo_szfzyh.gif"></td>
							</tr>
							<tr>
								<td style="height: 45px;"><img src="img/logo_msyh.gif"></td>
								<td><img src="img/logo_bjyh.gif"></td>
								<td cospan="2"></td>
							</tr>
							<tr>
								<td style="height: 18px; padding: 0px;" colspan="4"><div style="text-align: left;">支持以下支付平台：</div></td>
							</tr>
							<tr>
								<td><img align="center" src="img/y_cft.gif"></td>
								<td><img src="img/y_kq.gif"></td>
								<td><img src="img/y_zfb.gif"></td>
								<td><img src="img/mobile.gif"></td>
							</tr>
						</table>
					</div>				

					<table width="100%" cellspacing="0" cellpadding="0" border="0">
						<tr>
						   <td valign="top" align="left" style="width: 240px;"><input type="radio" name="IdPaymentType"><label style="margin-left: 2px;">来京东自提</label></td>
							<td valign="top" class="gray">当面付款后验货，支持现金、POS机刷卡、支票支付 <a href="#">查看自提点地址</a></td>
						</tr>
					</table>

					<table width="100%" cellspacing="0" cellpadding="0" border="0">
						<tr>
						   <td valign="top" align="left" style="width: 240px;"><input type="radio" name="IdPaymentType"><label style="margin-left: 2px;">公司转账</label></td>
							<td valign="top" class="gray">转帐后1－5个工作日内到帐 <a href="#">查看帐户信息</a></td>
						</tr>
					</table>
					
					<table width="100%" cellspacing="0" cellpadding="0" border="0">
						<tr>
						   <td valign="top" align="left" style="width: 240px;">
								<input type="radio" name="IdPaymentType"><label style="margin-left: 2px;">邮局汇款</label></td>
							<td valign="top" class="gray">汇款后1－5个工作日内到帐 <a href="#">查看汇款地址</a></td>
						</tr>
					</table>					
				</div>	
				<div class="middle t">
					<table width="100%" cellspacing="0" cellpadding="0" border="0" align="enter" id="ShipMentTab">
					   <tr>
							<td width="130px" valign="top" height="24" align="left" style="border-bottom: 1px solid rgb(238, 238, 238);">
								<div class="grouptitle">配送方式</div>
							</td>
							<td width="155px" valign="top" align="left" style="border-bottom: 1px solid rgb(238, 238, 238);">运费</td>
					
							<td width="105px" valign="top" align="left" style="border-bottom: 1px solid rgb(238, 238, 238);">货物在途时间</td>
							<td valign="top" align="left" style="border-bottom: 1px solid rgb(238, 238, 238);">备注</td>
					   </tr>
					</table>

					<table width="100%" cellspacing="0" cellpadding="0" border="0">
					   <tr>
							<td width="130px" valign="top" height="24" align="left"><input type="radio" name="IdPaymentType"><label style="margin-left: 2px;">京东快递</label></td>
							<td width="155px" valign="top" align="left">0.00元<span style="color: red;">(免运费)</span></td>
							<td width="105px" valign="top" align="left">1-2天</td>
							<td valign="top" align="left" class="gray">由京东公司负责配送，速度很快，还接受上门刷卡付款服务。</td>
					   </tr>
					</table>
					<div class="tsbox w">
						<table width="100%" cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td valign="top" style="width: 60px;">送货日期：</td><td>
							<input type="radio" name="CODTime"><label style="margin-left: 3px;">只工作日送货(双休日、假日不用送)</label><br>
							
							<input type="radio" name="CODTime"><label style="margin-left: 3px;">工作日、双休日与假日均可送货</label><br>
							
							<input type="radio" name="CODTime"><label style="margin-left: 3px;">只双休日、假日送货(工作日不用送)</label><br>
								</td>
							</tr>
						</table>					
						<div class="gray">声明：我们会努力按照您指定的时间配送，但因天气、交通等各类因素影响，您的订单有可能会有延误现象！敬请谅解！</div>

						<div>是否送货前电话确认：
							<input type="radio" name="isInformRad"><label>是</label>
							<input type="radio" name="isInformRad"><label>否</label>
						</div>
						<div style="margin-bottom: 3px;"><span style="color: red;">声明：</span>部分服务仅在京东配送区域提供，非京东配送区域无法选择，请大家谅解！</div>
					</div>
					<div class="footer">
						<input type="button" value="保存支付方式及配送方式" class="btn">
					</div>				
				</div>
			</div>
			<div class="o_write">
				<h1>发票信息  <a href="#">[关闭]</a></h1>
				<div class="middle">
					<table width="100%" cellspacing="0" cellpadding="0" border="0">
						<tr>
						   <td valign="top" align="left" colspan="2"><span style="margin-right: 8px;">发票类型：</span>
							<input type="radio" name="invoince_type"><label>普通发票</label>
							<input type="radio" name="invoince_type"><label>增值税发票</label>
							</td>
						</tr>
						<tr>
						   <td valign="top" align="left" colspan="2"><span style="margin-right: 8px;">发票抬头：</span>
							<input type="radio" name="invoince_pttt"><label for="invoince_pttt4">个人 </label>
							<input type="radio"	name="invoince_pttt"><label for="invoince_pttt5">单位</label>
							</td>
						</tr>
					</table>
					
					<table width="100%" cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td width="70px" valign="top" align="left" style="padding-top: 4px;"></td>
							<td><a href="#" style="color:#005EA7">[添加至常用发票信息]</a></td>
						</tr>
					</table>

					<table width="100%" cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td width="70px" valign="top" align="left" style="padding-top: 4px;">发票内容：</td>
							<td align="left">
								<table width="100%" cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td>
											<input type="radio" name="invoince_content"><label>明细</label>
											<input type="radio" name="invoince_content"><label>办公用品</label>
											<input type="radio" name="invoince_content"><label>电脑配件</label>
											<input type="radio" name="invoince_content"><label>耗材</label>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					
					<table width="100%" cellspacing="0" cellpadding="0" border="0">
						<tr class="txt_color_hui">
							 <td valign="top" align="left"><span class="gray">				声明：尊敬的客户，非图书商品发票内容建议开为商品明细，否则您将无法享受厂商和京东商城提供的正常质保，且京东商城不对此承担责任；<br>图书商品发票内容暂时不支持开明细，请您谅解，祝您购物愉快！</span>
							</td>
						</tr>
					</table>
					<div class="footer"><input type="button" value="保存发票信息" class="btn"></div>
				</div>
				
				<div class="o_write bn">
					<h1>订单备注 <a href="#">[关闭]</a> <span class="f12 fw100">声明：备注中有关收货人信息、支付方式、配送方式、发票信息等购买要求一律以上面的选择为准，备注无效。</span></h1>	
					<div class="middle"><input type="text" maxlength="15" style="width: 300px;" class="txt">   &nbsp;&nbsp;&nbsp;<font color="#cccccc">限15个字</font>
					</div>
					<div class="footer">
						<input type="button" value="保存订单备注" class="btn">
					</div>														
				</div>
			</div>
			<div id="part_cart">
				<div class="o_show">
				   <h1><span style="margin-right: 700px;">商品清单</span><a  href="#" id="backCart">返回修改购物车</a></h1>
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

			<div id="submit_btn"><input type="image" src="img/submit.jpg"></div>	
			<div id="line"></div>
		</div><!---cart_table结束--->
		<div class="round">
			<div class="lround"></div>
			<div class="rround"></div>
		</div>					
	</div><!---List_cart结束--->
</div>
<div id="footer">
	<div class="flinks"><a href="#">关于我们</a>|<a href="#">联系我们</a>|<a href="#">人才招聘</a>|<a href="#">商家入驻</a>|<a href="#">广告服务</a>|<a href="#">京东社区</a>|<a href="#">友情链接</a>|<a href="#">销售联盟</a></div>
	<div class="copyright">北京市公安局海淀分局备案编号：1101081681&nbsp;&nbsp;京ICP证070359号&nbsp;&nbsp;<a target="_blank" href="img/f_music.jpg">音像制品经营许可证苏宿批005 号</a><br>Copyright&copy;2004-2011&nbsp;&nbsp;360buy京东商城&nbsp;版权所有</div>
	<div class="ilinks"><a href="#">
		<img width="108" height="40" src="img/f_icp.gif"></a>
		<a id="urlknet"href="#"><img width="112" height="40" border="true" src="img/knetSealLogo.jpg"></a>
	</div>
</div>



</body>
</html>
