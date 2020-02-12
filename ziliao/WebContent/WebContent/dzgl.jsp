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
			 <a href="#">地址管理</a>
        </div>
	</div>
	<!--主界面-->
	<div class="main">
	<!--左侧-->
	<%@include file="left.jsp"%>
	<!--右侧-->
	<div id="right_order">
		<div class="addr_m">
	    	<div class="addr_tit"><h3>收货地址管理</h3></div>
	        <div class="addr_c">
	        	<div class="addr_list">
	            	<div class="addr_num"><h3>1</h3></div>
	                <div class="addr_info">
	                <table>
	                	<tr>
	                    	<td>收&nbsp;货&nbsp;人：</td>
	                        <td>111111</td>
	                    </tr>
	                    <tr>
	                    	<td>省&nbsp;&nbsp;&nbsp;&nbsp;份：</td>
	                        <td>北京市海淀区</td>
	                    </tr>
	                    <tr>
	                    	<td>地&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
	                        <td>北京市海淀区三环以内</td>
	                    </tr>
	                    <tr>
	                    	<td>邮&nbsp;&nbsp;&nbsp;&nbsp;编：</td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                    	<td>联系电话：</td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                    	<td>手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                    	<td>电子邮件：</td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                    	<td></td>
	                        <td style="height:24px" align="center" ><input type="submit" value="修改"/>&nbsp;<input type="submit" value="删除"/></td>
	                    </tr>
	                </table>
	                </div>
	            </div>
	            <div class="addr_list">
	            	<div class="addr_num"><h3>2</h3></div>
	                <div class="addr_info">
	                <table>
	                	<tr>
	                    	<td>收&nbsp;货&nbsp;人：</td>
	                        <td>111111</td>
	                    </tr>
	                    <tr>
	                    	<td>省&nbsp;&nbsp;&nbsp;&nbsp;份：</td>
	                        <td>北京市海淀区</td>
	                    </tr>
	                    <tr>
	                    	<td>地&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
	                        <td>北京市海淀区三环以内</td>
	                    </tr>
	                    <tr>
	                    	<td>邮&nbsp;&nbsp;&nbsp;&nbsp;编：</td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                    	<td>联系电话：</td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                    	<td>手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                    	<td>电子邮件：</td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                    	<td></td>
	                        <td style="height:24px" align="center" ><input type="submit" value="修改"/>&nbsp;<input type="submit" value="删除"/></td>
	                    </tr>
	                </table>
	                </div>
	        	</div>
				<div class="clear" style="clear:both;"></div>
	    	<div id="addr_new">如果您有新地址，请<a href="#">添加新地址</a>111111111</div>
	    	</div>
		</div>
	    <div class="addr_m">
	    	<div class="addr_tit"><h3>地址维护</h3></div>
	        <div class="addr_c">
	        	<div id="addr_add">
	            	<table>
	                	<tr>
	                    	<td>收&nbsp;货&nbsp;人：</td>
	                        <td><input type="text"/><font color="#ff0000">*</font></td>
	                    </tr>
	                    <tr>
	                    	<td>省&nbsp;&nbsp;&nbsp;&nbsp;份：</td>
	                        <td>
	                        	<select>
	                            	<option>北京&nbsp;&nbsp;</option>
	                            </select>
	                            <select>
	                            	<option>海淀区&nbsp;&nbsp;</option>
	                            </select>
	                            <select>
	                            	<option>三环以内&nbsp;&nbsp;</option>
	                            </select>
	                        </td>
	                    </tr>
	                    <tr>
	                    	<td>地&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
	                        <td><input type="text" size="32"/><font color="#ff0000">*</font></td>
	                    </tr>
	                    <tr>
	                    	<td>邮&nbsp;&nbsp;&nbsp;&nbsp;编：</td>
	                        <td><input type="text"/></td>
	                    </tr>
	                    <tr>
	                    	<td>联系电话：</td>
	                        <td><input type="text"/>如：6543788</td>
	                    </tr>
	                    <tr>
	                    	<td>手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
	                        <td><input type="text"/>我们会用免费短信通知你发货信息</td>
	                    </tr>
	                    <tr>
	                    	<td>电子邮件：</td>
	                        <td><input type="text"/></td>
	                    </tr>
	                    <tr>
	                    	<td></td>
	                        <td style="height:44px" ><input type="submit" value="提交地址"/></td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	    </div>
	</div>
	</div>
</div>
<!--主体结束-->

<!--服务部分开始-->
<%@include file="footer.jsp"%>
</body>
</html>
