<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="css/user_changepassword.css" rel="stylesheet"/>
<title>无标题文档</title>
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
			 <a href="#">修改密码</a>
        </div>
	</div>
	
	<div class="main">
		<!-- 左侧栏目 -->
		<%@include file="left.jsp"%>
		<!-- 右侧栏目 -->
		<div class="right1">
			<table class="table_a">
				<tr>
					<th align="left" colspan="2"><strong>修改密码</strong></th>
				</tr>
				<tr>
					<td width="10%" align="center">
						旧密码：</td>
					<td><input type="password"></td>
				</tr>
				<tr>
					<td width="10%" align="center">新密码：</td>
					<td><input type="password"></td>
				</tr>
				<tr>
					<td width="10%" align="center">确认密码：</td>
					<td><input type="password"></td>
				</tr>
				<tr>
					<td class="align_Center" colspan="2">
						<input type="submit" value="修改密码">
						<input type="submit" value="取消">
					</td>
				</tr>
			</table>
		</div>		
	</div>
	<!-- 底部栏目 -->
	<%@include file="footer.jsp"%>

		
</div>

</body>
</html>
