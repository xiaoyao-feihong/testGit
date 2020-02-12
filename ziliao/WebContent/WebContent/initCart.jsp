<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="css/book.css" />
<link rel="stylesheet" type="text/css" href="css/userInfo.css" />
<link type="text/css" rel="stylesheet" href="css/delete_order_style.css"/>
</head>
<body>
<!--快捷访问栏开始-->
<%@include file="head.jsp"%>

<div id="bodyPart">

	<div id="cart_left">
    	<div id="succeed">
			<div class="corner tl"></div>
			<div class="corner tr"></div>
			<div class="corner bl"></div>
			<div class="corner br"></div>
			<div class="success">
            	<b>&nbsp;</b>
                <a href="myCart.jsp" class="btn_pay" ></a>
                <a href="book_list.jsp" class="btn_continue"></a>
            </div>
			<div id="cart_yb"></div>
		</div>
        
        <div id="similar">
			<div class="pro_tit">
				<div class="t_left"></div>
				<h2>购买该商品的用户还购买了</h2>
			</div>
			<div class="similar_data">
			     <ul>
                 	<li>
                    	<div class="s_img"><a href="#"><img src="img/cart_01.jpg" /></div>
                        <div class="s_info">
                        	<p>SAP销售与分销实施指南</p>
                            <b>￥59.30</b>
                            <div class="btn_add"><a href="#">&nbsp;</a></div>
                        </div>
                    </li>
                    <li>
                    	<div class="s_img"><a href="#"><img src="img/cart_02.jpg" /></div>
                        <div class="s_info">
                        	<p>说服力：让你的PPT会说话</p>
                            <b>￥29.30</b>
                            <div class="btn_add"><a href="#">&nbsp;</a></div>
                        </div>
                    </li>
                    <li>
                    	<div class="s_img"><a href="#"><img src="img/cart_03.jpg" /></div>
                        <div class="s_info">
                        	<p>说服力：让你的PPT会说话</p>
                            <b>￥19.30</b>
                            <div class="btn_add"><a href="#">&nbsp;</a></div>
                        </div>
                    </li>
                 </ul>
			</div>
			<div class="m_bottom"><div class="bottom_left"></div></div>
		</div>
		
        <div id="similar">
			<div class="pro_tit">
				<div class="t_left"></div>
				<h2>您可能还需要以下商品</h2>
			</div>
			<div class="similar_data">
			     <ul>
                 	<li>
                    	<div class="s_img"><a href="#"><img src="img/cart_04.jpg" /></div>
                        <div class="s_info">
                        	<p>Google Android SDK开发范例大全</p>
                            <b>￥45.50</b>
                            <div class="btn_add"><a href="#">&nbsp;</a></div>
                        </div>
                    </li>
                    <li>
                    	<div class="s_img"><a href="#"><img src="img/cart_05.jpg" /></div>
                        <div class="s_info">
                        	<p>参与观察法</p>
                            <b>￥45.50</b>
                            <div class="btn_add"><a href="#">&nbsp;</a></div>
                        </div>
                    </li>
                    <li>
                    	<div class="s_img"><a href="#"><img src="img/cart_06.jpg" /></div>
                        <div class="s_info">
                        	<p>书名</p>
                            <b>￥45.50</b>
                            <div class="btn_add"><a href="#">&nbsp;</a></div>
                        </div>
                    </li>
                 </ul>
			</div>
			<div class="m_bottom"><div class="bottom_left"></div></div>
		</div>

    </div>
    
    <div id="cart_right">
        <div class="m" id="mycart_detail">
			<div class="corner tl"></div>
			<div class="corner tr"></div>
			<div class="corner bl"></div>
			<div class="corner br"></div>
			<div class="mt">
				<h2><s></s>我的购物车</h2>
			</div>
			<div id="cart_content">
           	 	<p>刚加入购物车的商品</p>
				<div>
                	<div class="pro_img"><img src="img/cart_zend.jpg" /></div>
                	<div class="pro_name">Zend Framework技术大全（附光盘1张）<b>￥53.40</b></div>
                </div>
                <div class="clear"></div>
                <p>您购物车中的其它商品</p>
                <div class="cart_total">
                	共<b>4</b>件商品<br />
					金额总计：<b>￥213.60</b>
                </div>
                <div><a href="#" class="btn_pay"></a></div>
			</div>
         </div>   
    </div>
    
</div>
<!--主体结束-->

<!--服务部分开始-->
<%@include file="footer.jsp"%>
</body>
</html>
