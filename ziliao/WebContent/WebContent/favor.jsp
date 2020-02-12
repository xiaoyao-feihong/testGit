<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的收藏夹</title>

<link rel="stylesheet" type="text/css" href="css/userOther.css" />
<link rel="stylesheet" type="text/css" href="css/fav_message.css" />
<link type="text/css" rel="stylesheet" href="css/delete_order_style.css"/>
</head>
<body>
<!--头部导航开始-->
<%@include file="head.jsp"%>

<div id="bodyPart">
	<div class="w">
		<div class="crumb">
			 <a href="#">首页</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">我的京东</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">我的收藏夹</a>
        </div>
	</div>
	<div class="main">
		<!-- 左侧栏目 -->
		<%@include file="left.jsp"%>
		<!--右侧-->
<div id="right_order">
	<div id="trade">
	<table width="100%" id="trade_record" cellpadding="0" cellspacing="0">
    	<tr bgcolor="#FBF7EE">
        	<th align="left" colspan="6">&nbsp;收藏夹</th>
        </tr>
        <tr style="line-height:35px;">
        	
            <td colspan="6"><a href="#"><img src="images/btn_03.gif" /></a></td>
        </tr>
        <tr><td colspan="6">
        <table width="100%" id="fav_product" cellpadding="0" cellspacing="0">
            <tr align="center" bgcolor="#FBF7EE">
                <td width="5%"></td>
                <td width="20%">商品图片</td>
                <td width="32%">商品名称</td>
                <td width="10%">价格</td>
                <td width="11%">库存</td>
                <td>操作</td>
            </tr>
            <tr>
            	<td align="center"><input type="checkbox" style="border:1px solid #CCCCCC;" /></td>
                <td align="center"><a href="#"><img src="img/fav_01.jpg" /></a></td>
                <td style="padding-left:5px;">
                <a href="#" style="font-size:14px;font-weight:bold;">酷派（Coolpad）N930 双模双待3G手机（黑金色）CDMA2000/GSM 电信定制 	
</a><br />
<span style="color:#999999;">收藏时间：2011-03-18</span></td>
                <td align="center"><b>￥5199:00</b></td>
                <td align="center">现货</td>
                <td align="right" style="padding-right:8px;border-right:none;">
                	<a href="initCart.jsp"><img src="images/btn_07.gif" /></a><br />
                    <a href="#"><img src="images/btn_13.gif" style="margin-top:4px;" /></a>
                </td>
            </tr>
            <tr>
            	<td align="center"><input type="checkbox" style="border:1px solid #CCCCCC;" /></td>
                <td align="center"><a href="#"><img src="img/fav_02.jpg" /></a></td>
                <td style="padding-left:5px;">
                <a href="#" style="font-size:14px;font-weight:bold;">酷派（Coolpad）N930 双模双待3G手机（黑金色）CDMA2000/GSM 电信定制 	
</a><br />
<span style="color:#999999;">收藏时间：2011-03-18</span></td>
                <td align="center"><b>￥5199:00</b></td>
                <td align="center">现货</td>
                <td align="right" style="padding-right:8px;border-right:none;">
                	<a href="initCart.jsp"><img src="images/btn_07.gif" /></a><br />
                    <a href="#"><img src="images/btn_13.gif" style="margin-top:4px;" /></a>
                </td>
            </tr>
            <tr>
            	<td align="center"><input type="checkbox" style="border:1px solid #CCCCCC;" /></td>
                <td align="center"><a href="#"><img src="img/fav_03.jpg" /></a></td>
                <td style="padding-left:5px;">
                <a href="#" style="font-size:14px;font-weight:bold;">酷派（Coolpad）N930 双模双待3G手机（黑金色）CDMA2000/GSM 电信定制 	
</a><br />
<span style="color:#999999;">收藏时间：2011-03-18</span></td>
                <td align="center"><b>￥5199:00</b></td>
                <td align="center">现货</td>
                <td align="right" style="padding-right:8px;border-right:none;">
                	<a href="initCart.jsp"><img src="images/btn_07.gif" /></a><br />
                    <a href="#"><img src="images/btn_13.gif" style="margin-top:4px;" /></a>
                </td>
            </tr>
            <tr>
            	<td align="center" style="border-bottom:none;"><input type="checkbox" style="border:1px solid #CCCCCC;" /></td>
                <td align="center" style="border-bottom:none;"><a href="#"><img src="img/fav_01.jpg" /></a></td>
                <td style="padding-left:5px;border-bottom:none;">
                <a href="#" style="font-size:14px;font-weight:bold;">酷派（Coolpad）N930 双模双待3G手机（黑金色）CDMA2000/GSM 电信定制 	
</a><br />
<span style="color:#999999;">收藏时间：2011-03-18</span></td>
                <td align="center" style="border-bottom:none;"><b>￥5199:00</b></td>
                <td align="center" style="border-bottom:none;">现货</td>
                <td align="right" style="padding-right:8px;border-right:none;border-bottom:none;">
                	<a href="initCart.jsp"><img src="images/btn_07.gif" /></a><br />
                    <a href="#"><img src="images/btn_13.gif" style="margin-top:4px;" /></a>
                </td>
            </tr>
        </table>
        </td></tr>
        <tr>
        	<td colspan="5" style="marign-top:15px;border-right:none;">
            <div style="float:left;padding-top:6px;">&nbsp;<input type="checkbox" />全选</div>
            <div style="float:left;padding-top:6px;margin-left:6px;"">       	
                <a href="initCart.jsp"><img src="images/btn_07.gif"/></a>
            </div>
            </td>
        	<td align="right"><div id="page"><a href="#">1</a></div></td>
        </tr>
    </table>
    	
    
	</div>
</div>
</div>
</div>
<!--主体结束-->

<!-- 底部栏目 -->
	<%@include file="footer.jsp"%>
</div>
</body>
</html>
