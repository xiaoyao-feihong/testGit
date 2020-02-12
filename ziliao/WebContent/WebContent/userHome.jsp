<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的订单</title>
<link rel="stylesheet" type="text/css" href="css/book.css" />
<link rel="stylesheet" type="text/css" href="css/userOther.css" />
<link type="text/css" rel="stylesheet" href="css/delete_order_style.css"/>
</head>
<body>
<!--头部导航开始-->
<%@include file="head.jsp"%>

<div id="bodyPart">

<div class="main">

<!--左侧-->
<%@include file="left.jsp"%>
<!--中间-->
<div id="home_mid">
	<h2>您好，woerwin。欢迎您回来！</h2>
    <div id="back_time">上一次登录时间：2011-3-9 20:25:35</div>
    <div class="clear"></div>
    <h2>订单列表</h2>
	<table id="home_table">
    	<tr>
        	<th>订单编号</th>
			<th>下单时间</th>
            <th>收货人</th>
            <th>支付方式</th>
            <th>订单状态</th>
            <th>操作</th>
        </tr>
        <tr align="center">
        	<td colspan="6">暂时没有订单信息</td>
        </tr>
        <tr align="right">
        	<td colspan="6"><a href="#">更多商品&gt;&gt;&nbsp;</a></td>
        </tr>		
    </table>
    <h2>也许您会对下列商品感兴趣</h2>
    <div class="clear"></div>
    <ul>
    	<li>
        	<div><img src="img/home_01.jpg"/></div>
            <div class="interest_name"><a href="#">TP-LINK WR340G+ 54M 无线宽带路由器</a></div>
            <div>京东价：<b>￥86.00</b></div>
        </li>
        <li>
        	<div><img src="img/home_02.jpg"/></div>
            <div class="interest_name"><a href="#">迅捷（FAST）FR40 高性能宽带路由器 4口</a></div>
            <div>京东价：<b>￥58.00</b></div>
        </li>
        <li>
        	<div><img src="img/home_03.jpg"/></div>
            <div class="interest_name"><a href="#">清华同方（TSINGHUA TONGFANG）光电鼠标</a></div>
            <div>京东价：<b>￥72.00</b></div>
        </li>
        <li>
        	<div><img src="img/home_04.jpg"/></div>
            <div class="interest_name"><a href="#">威刚（A-Data）C802燕尾碟4GB(蓝色)</a></div>
            <div>京东价：<b>￥88.00</b></div>
        </li>
        <li>
        	<div><img src="img/home_05.jpg"/></div>
            <div class="interest_name"><a href="#">磊科（Netcore）54M无线USB网卡 NW330</a></div>
            <div>京东价：<b>￥56.00</b></div>
        </li>
    </ul>
    
</div>
<!--右侧-->
<div id="home_right">
	<div id="home_rt">会员账户</div>
    <div id="home_rc">
    	<div id="home_head"><img src="img/home_head.jpg" /></div>
        <div class="home_uInfo">xdl<br/>贴牌用户<br/><a href="#">修改头像</a></div>
        <div class="clear"></div>
        <div class="home_uInfo">
            * 真实姓名：账付<br/>
            * 完成订单：4个<br/>
            * 年内消费：￥180.00<br/>
            * 总消费额：￥530.00<br/>
		</div>
        <div class="clear"></div>
        
    </div>
</div>
</div>
</div>
<!--主体结束-->
<%@include file="footer.jsp"%>
</body>
</html>
