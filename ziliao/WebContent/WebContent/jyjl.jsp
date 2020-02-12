<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的订单</title>
<link type="text/css" rel="stylesheet" href="css/delete_order_style.css"/>
<link rel="stylesheet" type="text/css" href="css/userOther.css" />
</head>
<body>
<!--快捷访问栏开始-->
<%@include file="head.jsp"%>

<div id="bodyPart">
	<div class="w">
		<div class="crumb">
			 <a href="#">首页</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">我的京东</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">交易记录</a>
        </div>
	</div>
	<div class="main">
<!--左侧-->
<%@include file="left.jsp"%>
<!--右侧-->
<div id="right_order">
	<div id="trade">
	<table width="100%" id="trade_record" cellpadding="0" cellspacing="0">
    	<tr>
        	<th align="left" colspan="8">&nbsp;交易记录</th>
        </tr>
        <tr>
        	<th width="8%">编号</th>
            <th width="14%">订购时间</th>
            <th width="11%">订单金额</th>
            <th width="11%">优惠金额</th>
            <th width="11%">运费金额</th>
            <th width="11%">支付金额</th>
            <th width="11%">交易余额</th>
            <th>查看</th>
        </tr>
        <tr align="center">
        	<td>39025274</td>
            <td>2011-2-3</td>
            <td>￥49.00</td>
            <td>￥0.00</td>
            <td>￥0.00</td>
            <td>￥49.00</td>
            <td>￥0.00</td>
            <td><a href="orderInfo.jsp">查看</a></td>
        </tr>
        <tr align="center">
        	<td>39025274</td>
            <td>2011-2-4</td>
            <td>￥119.00</td>
            <td>￥0.00</td>
            <td>￥0.00</td>
            <td>￥119.00</td>
            <td>￥0.00</td>
            <td><a href="orderInfo.jsp">查看</a></td>
        </tr>
        <tr>
        	<td colspan="8" align="right"><div id="subTotal">订单余额小计：<b>￥0.00</b>元<div></td>
        </tr>
        <tr>
        	<td colspan="8" align="right"><a href="#"><div id="page">1</div></a></td>
        </tr>
    </table>
    	

    	
    
	</div>
</div>

</div>
<!--主体结束-->

<div class="clear"></div>
<!--服务部分开始-->
<%@include file="footer.jsp"%>
</body>
</html>
