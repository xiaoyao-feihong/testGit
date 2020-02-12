<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户信息</title>
<link type="text/css" rel="stylesheet" href="css/delete_order_style.css"/>
<link rel="stylesheet" type="text/css" href="css/book.css" />
<link rel="stylesheet" type="text/css" href="css/userInfo.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	//昵称区域的编辑和显示状态切换
	$(function(){
		$("#nickname_edit_div").hide();//隐藏昵称修改div
		$("#nickname_div").show();//显示昵称显示div
		$("#nickname_edit").click(function(){
			var nickname = $("#nickname_div span").text();
			if(nickname != ""){
				$("#nickname_txt").val(nickname);
			}
			$("#nickname_edit_div").show();//显示昵称修改div
			$("#nickname_div").hide();//隐藏昵称显示div
			return false;
		});
		$("#nickname_cancel").click(function(){
			$("#nickname_edit_div").hide();//隐藏昵称修改div
			$("#nickname_div").show();//显示昵称显示div
			return false;
		});
	});
	//真实姓名的编辑和显示状态切换
	$(function(){
		$("#name_edit_div").hide();//隐藏真实姓名修改div
		$("#name_div").show();//显示真实姓名显示div
		$("#name_edit").click(function(){
			var name = $("#name_div span").text();
			if(name != ""){
				$("#name_txt").val(name);
			}
			$("#name_edit_div").show();//显示真实姓名修改div
			$("#name_div").hide();//隐藏真实姓名显示div
			return false;
		});
		$("#name_cancel").click(function(){
			$("#name_edit_div").hide();//隐藏真实姓名修改div
			$("#name_div").show();//显示真实姓名显示div
			return false;
		});
	});
	
	
	//个人信息区域的编辑和显示状态切换
	$(function(){
		$("#user_edit_div").hide();//隐藏修改div
		$("#user_div").show();//显示文本显示div
		$("#user_edit").click(function(){
			$("#user_edit_div").show();//显示修改div
			$("#user_div").hide();//隐藏文本显示div
			return false;
		});
		$("#user_cancel").click(function(){
			$("#user_edit_div").hide();//隐藏修改div
			$("#user_div").show();//显示文本显示div
			return false;
		});
	});
	
	//联系信息区域的编辑和显示状态切换
	$(function(){
		$("#address_edit_div").hide();//隐藏修改div
		$("#address_div").show();//显示文本显示div
		$("#address_edit").click(function(){
			$("#address_edit_div").show();//显示修改div
			$("#address_div").hide();//隐藏文本显示div
			return false;
		});
		$("#address_cancel").click(function(){
			$("#address_edit_div").hide();//隐藏修改div
			$("#address_div").show();//显示文本显示div
			return false;
		});
	});
	//兴趣爱好区域的编辑和显示状态切换
	$(function(){
		$("#fav_edit_div").hide();//隐藏修改div
		$("#fav_div").show();//显示文本显示div
		$("#fav_edit").click(function(){
			$("#fav_edit_div").show();//显示修改div
			$("#fav_div").hide();//隐藏文本显示div
			return false;
		});
		$("#fav_cancel").click(function(){
			$("#fav_edit_div").hide();//隐藏修改div
			$("#fav_div").show();//显示文本显示div
			return false;
		});
	});
</script>
</head>
<body>
<!--快捷访问栏开始-->
<%@include file="head.jsp"%>
<div id="bodyPart">

<!--位置-->
	<div class="w">
		<div class="crumb">
			 <a href="#">首页</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">我的京东</a>
			 &nbsp;&gt;&nbsp;
			 <a href="#">个人资料</a>
        </div>
	</div>
  <div class="main">
	<!--左侧-->
	<%@include file="left.jsp"%>
	<!--右侧-->
    <div id="right_order">
		<div id="user_info">
			<div class="user_tit">
		    	<h3>个人资料</h3>
		    </div>
		    <div class="user_head">
		    	<h4>当前头像</h4>
		        <div class="img_head">
		        	<div class="img_top"></div>
		            <div class="img_middle"><a href="#"><img src="img/user_head.jpg" /></a></div>
		            <div class="img_bottom"></div>
		        </div>
		        <div class="edit_head">修改头像</div>
		    </div>
		    <div class="text_info">
		     	<h4>会员信息</h4>
		        <div class="text_user">
		        	<div class="u_item">
		            	<div class="u_label">会员登录名：</div>
		                <div class="u_info">woerwin</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">昵 &nbsp;&nbsp;    称：</div>
		                <div class="u_info" id="nickname_edit_div">
		                	<div class="text_frame"><input type="text" id="nickname_txt" class="in_text" value="请输入你的昵称" onfocus="this.value=''" onblur="this.value='请输入你的昵称'"/></div>
		                    <div class="sure_btn">
		                    	<img src="images/personal_ok.gif" /> &nbsp;&nbsp;&nbsp;&nbsp;
		                    	<a href="#" id="nickname_cancel">取消</a>
		                    </div>
		                	<div><span class="text_msg">昵称可由中英文、数字、下划线以及减号组成</span></div>
		                </div>
		                <div class="u_info" id="nickname_div"><span>水晶</span> &nbsp;&nbsp;   <a href="#" id="nickname_edit">修改</a></div>
		            </div>
		            
		            <div class="u_item">
		            	<div class="u_label">真实姓名：</div>
		            	<div class="u_info" id="name_edit_div">
		                	<div class="text_frame"><input type="text" id="name_txt" class="in_text" value="请填写您的真实姓名" onfocus="this.value=''" onblur="this.value='请填写您的真实姓名'"/></div>
		                    <div class="sure_btn">
		                    	<img id="name_save" src="images/personal_ok.gif" /> &nbsp;&nbsp;&nbsp;&nbsp;
		                    	<a href="#" id="name_cancel">取消</a>
		                    </div>
		                	<div><span class="text_msg">姓名只是为好友方便寻找你，不会被显示</span></div>
		                </div>
		                <div class="u_info" id="name_div"><span>曾庆武</span> &nbsp;&nbsp;   <a href="#" id="name_edit">修改</a></div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">会员等级：</div>
		                <div class="u_info">铁牌用户</div>
		            </div>
		            
		        </div>
		        <h4><span class="edit" style=""><a href="#"  id="user_edit">编辑&gt;&gt;</a></span>个人信息</h4>
		        <!-- 个人信息显示区 -->
		        <div id="user_div" class="text_user">
		        	<div class="u_item">
		            	<div class="u_label">性别：</div>
		                <div class="u_info">男</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">生日：</div>
		                <div class="u_info">2010-8-8</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">所属地区：</div>
		                <div class="u_info">北京 昌平区</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">学校信息：</div>
		                <div class="u_info">北京大学</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">公司信息：</div>
		                <div class="u_info">IBM</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">身份证号码： </div>
		                <div class="u_info">5222228...</div>
		            </div>
		        </div>
		        <!-- 个人信息编辑区 -->
		        <div id="user_edit_div" class="text_user">
		        	<div class="u_item">
		            	<div class="u_label">性别：</div>
		                <div class="u_info">
		                	<select>
		                    	<option>请选择</option>
		                        <option selected="selected">男</option>
		                        <option>女</option>
		                    </select>
		                </div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">生日：</div>
		                <div class="u_info">
		                <input type="text" id="birth" class="in_text"/>
		                </div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">所属地区：</div>
		                <div class="u_info">
		            	<input type="text" id="address" class="in_text"/>
		                </div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">学校信息：</div>
		                <div class="u_info">
		                    <input type="text" class="in_text" />
		                </div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">公司信息：</div>
		                <div class="u_info">
		                	<input type="text" class="in_text" />
		                </div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">身份证号码： </div>
		                <div class="u_info">
		                	<input type="text" class="in_text" />
		                </div>
		            </div>
		            <div class="save_info">
		            	 <div class="save_1"><a href="#"><img id="user_save" src="images/personal_icon2.gif" /></a></div>
		                 <div class="cancel_1"><a href="#" id="user_cancel">取消</a></div>
		            </div>
		            <div class="clear"></div>
		        </div>
		        <h4><span class="edit"><a href="#" id="address_edit">编辑&gt;&gt;</a></span>联系信息</h4>
		        <!-- 联系信息显示区 -->
		        <div class="text_user" id="address_div">
		        	<div class="u_item">
		            	<div class="u_label">Email：</div>
		                <div class="u_info">bnuzengqingwu@qq.com</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">电话：</div>
		                <div class="u_info">13811905414</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">手机号：</div>
		                <div class="u_info">13811905414</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">MSN：</div>
		                <div class="u_info">wbnuzengqingwu@hotmail.com</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">QQ：</div>
		                <div class="u_info">673766734</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">个人网址： </div>
		                <div class="u_info">http://www.czdh365.net</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">发货地址： </div>
		                <div class="u_info">北京市海淀区</div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">邮编： </div>
		                <div class="u_info">100875</div>
		            </div>
		        </div>
		        <!-- 联系信息编辑区 -->
		        <div class="text_user" id="address_edit_div">
		        	<div class="u_item">
		            	<div class="u_label">Email：</div>
		                <div class="u_info">
		                	<input type="text" class="in_text" />
		                    <div class="space_msg">&nbsp;</div>请输入常用的邮箱<font color="#FF0000">(必填) </font>
		                </div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">电话：</div>
		                <div class="u_info">
		                	<input type="text" class="in_text" />
		                    <div class="space_msg">&nbsp;</div>请输入正确的区号+电话
		                </div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">手机号：</div>
		                <div class="u_info">
		                	<input type="text" class="in_text" />
		                    <div class="space_msg">&nbsp;</div>请输入正确的11位手机号码 
		                </div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">MSN：</div>
		                <div class="u_info">
		                	<input type="text" class="in_text" />
		                    <div class="space_msg">&nbsp;</div>请输入常用的MSN号码
		                </div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">QQ：</div>
		                <div class="u_info">
		                	<input type="text" class="in_text" />
		                    <div class="space_msg">&nbsp;</div>请输入常用的QQ号码
		                </div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">个人网址： </div>
		                <div class="u_info"><input type="text" class="in_text" /></div>
		            </div>
		            <div class="u_item">
		            	<div class="u_label">发货地址： </div>
		                <div class="u_info"><input type="text" class="in_text" /> </div>
		                <div class="space_msg">&nbsp;</div>去<a href="#">地址管理</a>中修改此项
		            </div>
		            <div class="u_item">
		            	<div class="u_label">邮编： </div>
		                <div class="u_info"><input type="text" class="in_text" /></div>
		                <div class="space_msg">&nbsp;</div>去<a href="#">地址管理</a>中修改此项
		            </div>
		            <div class="save_info">
		            	 <div class="save_1"><a href="#" id="address_save"><img src="images/personal_icon2.gif" /></a></div>
		                 <div class="cancel_1"><a href="#" id="address_cancel">取消</a></div>
		            </div>
		        </div>
		        <div class="clear"></div>
		        <h4><span class="edit"><a href="#" id="fav_edit">编辑&gt;&gt;</a></span>兴趣爱好</h4>
		        <div class="u_item" id="fav_div">
		           <span class="text_msg"></span>
		        </div>
		        <!-- 兴趣爱好编辑区 -->
		        <div id="fav_edit_div">
			        <div class="u_item">
			           <div id="interest_hobby">
			           		<textarea cols="45">没有填写兴趣爱好</textarea>
			           </div>
			           <div id="words_msg">最多1000字符 </div>
			        </div>
		           <div class="save_info">
		           		<div class="save_1"><a href="#" id="fav_save"><img src="images/personal_icon2.gif" /></a></div>
		           		<div class="cancel_1"><a href="#" id="fav_cancel">取消</a></div>
		           </div>
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
