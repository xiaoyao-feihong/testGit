<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的订单</title>
<link type="text/css" rel="stylesheet" href="css/delete_order_style.css"/>
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
			 <a href="#">订单中心</a>
        </div>
	</div>
<div class="main">
	<!--左侧-->
	<%@include file="left.jsp"%>
	<!--右侧-->
	<div id="right_order">

    <ul class="Tab">
    	<li><em><a href="orderList.jsp">我的订单</a></em></li>
    	<li class="curr"><em>查看一个月前订单</em></li>
		<li ><em><a href="deleteOrderList.jsp">查看已取消订单</a></em></li>	
	</ul>
    <div class="table_order">
        <table cellpadding="0" cellspacing="0" width="100%">
        	<tr height="32" bgcolor="#f0f0f0">
            	<th width="12%">订单编号</th>
                <th width="30%">订单商品</th>
                <th width="10%">收货人</th>
                <th width="12%">订单金额</th>
                <th width="10%">下单时间</th>
                <th width="12%">订单状态</th>
                <th width="14%">操作</th>
            </tr>
			<tr height="55" id="order_info">                         
                <td ><a href="#">39025274</a></td>
                <td><a href='#'><img src='#'/></a></td>
                <td class="black">曾庆武</td>
                <td class="black">￥49.00<br />货到付款</td>
                <td>2011-02-03 <br -> 08:45:00</td>
                <td>已完成</td>
                <td style="border-right:none;"><a target="_blank" href="orderInfo.jsp">查看</a></td>                          
            </tr>                         
            <tr align="right">
				<td style="height:30px;" colspan="7">
					<div>
					  等待付款订单数：<strong>0</strong>&nbsp;&nbsp;
					  未完成的订单数：<strong>0</strong>&nbsp;&nbsp;
					  已完成的订单数：<strong>55</strong>&nbsp;&nbsp;
					  已取消订单数：<strong>0</strong>&nbsp;&nbsp;
					  订单总数：<strong>55</strong>&nbsp;&nbsp;
					 </div>
				</td>
			</tr>
          </table>
       </div>

</div>

</div>
</div>
<!--主体结束-->

<!--服务部分开始-->
<%@include file="footer.jsp"%>
</body>
</html>
