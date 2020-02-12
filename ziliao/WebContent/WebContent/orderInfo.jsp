<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单信息</title>
<link rel="stylesheet" type="text/css" href="css/userInfo.css" />
<link type="text/css" rel="stylesheet" href="css/delete_order_style.css"/>
</head>
<body>
<!--快捷访问栏开始-->
<%@include file="head.jsp"%>
<div id="bodyPart">
	<div class="w">
		<div class="crumb">
			 <a href="index.jsp">首页</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">我的京东</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">订单中心</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">订单：39025274</a>
        </div>
	</div>
	<!--主体-->
  <div class="main">
	<div id="order_info">
	<div class="order_state">
    	<div class="opr_order">
            <strong>订单号：40793886&nbsp;&nbsp;    状态：<span>等待付款</span></strong>
            <div class="state_btn">
                <ul>
                	<li><a href="#">支付</a></li>
                    <li><a href="myCart.jsp">修改</a></li>
                    <li><a href="#">取消</a></li>
                    
                </ul>
            </div>
        </div>
        <div class="clear"></div>
        <p>尊敬的客户，我们还未收到该订单的款项，请您尽快付款（<a href="#">查看邮局汇款信息</a>），如果您已经付款，请务必填写<a href="#">付款确认</a>。<br />
		该订单会为您保留24小时（从下单之日算起），24小时之后如果还未付款，系统将自动取消该订单。</p>
    </div>
    
    <div class="clear"></div>
    
    <div id="process_chart">
    	<div class="dot_line">
        	<ul>
            	<li class="green_dot"></li>
                <li class="green_line"></li>
                <li class="green_dot"></li>
                <li class="gray_line"></li>
                <li class="gray_dot"></li>
                <li class="gray_line"></li>
                <li class="gray_dot"></li>
                <li class="gray_line"></li>
                <li class="gray_dot"></li>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="dl_text">
        	<ul>
            	<li>&nbsp;提交订单<br /><span>2011-02-19 <br />&nbsp;07:54:07<span></li>
                <li>等待付款</li>
                <li><span>商品出库</span></li>
                <li><span>等待收货</span></li>
                <li class="dl_last"><span>完成</span></li>
            </ul>
        </div>
    </div>
    
    <div id="order_track">
    	<ul class="track_1">
        	<li>订单跟踪</li>
            <li class="track_1_1">付款信息</li>
            <li class="track_1_2">&nbsp;</li>
        </ul>
        <div class="clear"></div>
        <ul class="track_2">
        	<li>处理时间<li>
			<li class="new_width">处理信息</li>
			<li>操作人</li>
        </ul>
        <div class="clear"></div>
        <ul class="track_3">
        	<li>2011-2-19 7:54:07</li>
            <li class="new_width">您提交了订单，请等待系统确认</li>
        </ul>
        <div class="clear"></div>
        <div>送货方式：普通快递      </div>
    </div>
    
    <div id="order_text">
    	<h2>订单信息</h2>
        <div id="order_text_1">
        	<div class="order_text_2">
                <b>收货人信息</b>
				<ul>
                	<li>收 货 人：曾</li>
                	<li>地    址：北京海淀区三环以内大钟寺中鼎大厦二楼220</li>
               		<li>固定电话：13811905414</li>
                	<li>手机号码：13811905414</li>
                	<li>电子邮件：bnuzengqingwu@qq.com</li>
                </ul>
            </div>
            <div class="order_text_2">
                <b>支付及配送方式</b>
				<ul>
                	<li>支付方式：邮局汇款</li>
                	<li>运    费：￥0.00</li>
               		<li>送货日期：只双休日、假日送货（工作日不用送）：13811905414</li>
                	<li>配送时间：仅白天送货（8:00至18:00）</li>
                </ul>
            </div>
            <div class="order_text_2">
                <b>发票信息</b>
				<ul>
                	<li>发票类型：普通发票</li>
                	<li>发票抬头：个人</li>
               		<li>发票内容：明细</li>
                </ul>
            </div>
            <div id="order_list">
            	<b>商品清单</b>
            	<table cellpadding="0" cellspacing="0" width="100%">
                    <tr class="tr_1">
                        <td width="10%">商品编号</td>
                        <td width="50%">商品名称</td>
                        <td width="10%">购买价</td>
                        <td width="8%">已优惠</td>
                        <td width="7%">赠送积分</td>
                        <td width="7%">商品数量</td>
                        <td width="8%">库存状态</td>
                    </tr>
                    <tr class="tr_2">
                        <td>10064408</td>
                        <td align="left"><a href="#">&nbsp;软件工程师典藏：PHP开发典型模块大全（修订版）（附光盘1张）</a></td>
                        <td><span>￥59.90</span></td>
                        <td><span>￥0.00</span></td>
                        <td>0</td>
                        <td>1</td>
                        <td class="border_no">现货</td>
                    </tr>                   
                </table>
            </div>           
        </div>
        <div class="order_total">
        	<ul>
            	<li>商品总金额：￥59.90</li>
                <li>+ 运费：￥0.00</li>
                <li>- 优惠：￥0.00</li>
                <li>- 余额：￥0.00</li>
            </ul>
            <div class="m_total"><b>订单支付金额：<span>￥59.90</span></b></div>
        </div>
    </div>

</div>


</div>
</div>
<!--主体结束-->

<div class="clear"></div>
<!-- 页脚部分开始-->
<%@include file="footer.jsp"%>

</body>
</html>
