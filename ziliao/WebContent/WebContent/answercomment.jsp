<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/answercomment_style.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<body>
<!-------------顶部------------->
<div id="shortcut">
	<div class="w">
		<ul>
			<li class="fore1" id="loginfo">您好！欢迎来到京东商城！<span><a href="#">[请登录]</a>，新用户<a href="#" class="link-regist">[免费注册]</a></span></li>
			<li class="fore2"><a href="#">我的订单</a></li>

			<li><a href="#">我的京东</a></li>
			<li><a href="#">装机大师</a></li>
			<li><a href="#">礼品卡</a></li>
			<li><a href="#">企业客户</a></li>
			<li class="sub"><b></b>帮助中心</li>
		</ul>
	</div>
</div>
<!-------------顶部------------->
<%@include file="head.jsp"%>
<div id="bodyPart">	

	<div class="crumb">
		<a href="#">首页</a>&nbsp;&gt;&nbsp;
		<a href="#">电脑、软件、办公</a>&nbsp;&gt;&nbsp;
		<a href="#">外设产品</a>&nbsp;&gt;&nbsp;
		<a href="#">鼠标</a>&nbsp;&gt;&nbsp;
		<a href="#">罗技</a>&nbsp;&gt;&nbsp;
		<a href="#">罗技M215</a>&nbsp;&gt;&nbsp;商品评价
	</div>

	<div class="left">
		<div id="pinfo" class="m">
			<div class="mt"><h2>商品信息</h2></div>		
			<div class="mc">
				<div class="p-img"><a href="#"><img width="130" height="130"src="img/luoji.jpg"></a></div>			
				<div class="p-name">商品名称：<a class="link_1" href="#">罗技（Logitech）M215 无线鼠标 黑色</a></div>
				<div class="p-grade">
					<span class="fl">评价得分：</span>
					<div class="fl">
						<div class="star sa4"></div>(4分)						
					</div>
				</div>
				<div class="num-comment">评论数：17408条</div>
				<div class="btn"><a class="btn-append" href="#">添加到购物车</a></div>			
			</div>
		</div>
	</div>
	<div class="right-extra">
		<div id="comment" class="m">
			<div class="mt">
				<h2>商品评价</h2>
				<span>(共0条回复)</span>
            </div>	
			<div class="mc">
				<div id="divitem" class="item">
					<div class="user">
						<div class="u-icon"><a target="_blank" href="#"><img width="50" height="50" src="img/sma.jpg"></a></div>
						<div class="u-name"><a target="_blank" href="#">nightx</a></div>		
						<div class="u-address">浙江</div>
						<div class="date-buy">购买日期<br>2011-03-17</div>						
					</div>
					<div class="i-item">
						<div class="o-topic">
							<strong class="topic"><a target="_blank" href="#">不错・~~~</a></strong>
							<span class="star sa4"></span>
							<span class="date-comment">2011-3-20 0:45:30</span>
						</div>
						<div class="comment-content">
							<dl><dt>优点：</dt><dd>东西不错挺好用</dd></dl>
							<dl><dt>不足：</dt><dd>暂时还没发现缺点哦！</dd></dl>
							<dl><dt>使用心得：</dt><dd>东西不错挺好用</dd></dl>
						</div>						

						<div class="btns"><div class="useful"><span>此评价对我</span><a title="0" href="#none" id="agree" class="btn-agree">有用(0)</a><a href="#none" id="oppose" class="btn-oppose" title="0">没用(0)</a></div><a href="#" class="btn-reply">回复</a></div>
						
					</div>	
					<div class="corner tl"></div>			
					<div class="corner tr"></div>					
					<div class="corner b"></div>			
					<div class="corner bl"></div>			
					<div class="corner br"></div>			
				</div>
				<div id="replyform" class="item">
					<dl class="i-item">
						<dt>发表回复</dt>
						<dd>
							<textarea class="text textarea" name="replyContent" id="replyContent"></textarea><br>
							<label id="replyContenterror">
								请填写回复内容，长度在5-300位字符之间</label></dd>
						<dd>
							<input type="button" class="btn-submit" value="提交" id="saveCommentReply">
						</dd>
					</dl>
					<div class="corner tl"></div>			
					<div class="corner tr"></div>					
					<div class="corner b"></div>			
					<div class="corner bl"></div>			
					<div class="corner br"></div>								
				</div>

				<div class="item" id="relative">
					<strong>相关商品：</strong>
					<a href="#">罗技M215</a>
					<a href="#">罗技m215</a>
					<a href="#">罗技M215无线鼠标</a>
					<a href="#">罗技M215红色2.4G无线鼠标</a>
					<a href="#">罗技M215黑色2.4G无线鼠标</a>
					<a href="#">罗技M215蓝色2.4G无线鼠标</a>
					<a href="#">罗技M115</a>
					<a href="#">罗技M305nano24G</a>
					<a href="#">罗技M950鼠标</a>
					<a href="#">罗技M905鼠标</a>
				</div>
			</div>
		</div>
	</div>

	<div id="tail">
		<div id="service">
			<div class="info">
				<div class="tt">
					<ul>
						<li><img src="img/ln_foot1.jpg"></li>
						<li class="buyInfo"><strong>购物指南</strong></li>
						<li class="cutline">&nbsp;</li>
					</ul>
				</div>
				<div class="tc">
					<ul>
						<li>・购物流程</li>
						<li>・会员介绍</li>
						<li>・订单状态</li>
						<li>・常见问题</li>
						<li>・大家电</li>
						<li>・联系客服</li>
					</ul>
				</div>
			</div>
			<div class="info">
				<div class="tt">
					<ul>
						<li><img src="img/ln_foot1.jpg"></li>
						<li class="buyInfo"><strong>购物指南</strong></li>
						<li class="cutline">&nbsp;</li>
					</ul>
				</div>
				<div class="tc">
					<ul>
						<li>・购物流程</li>
						<li>・会员介绍</li>
						<li>・订单状态</li>
						<li>・常见问题</li>
						<li>・大家电</li>
						<li>・联系客服</li>
					</ul>
				</div>
			</div>
			<div class="info">
				<div class="tt">
					<ul>
						<li><img src="img/ln_foot1.jpg"></li>
						<li class="buyInfo"><strong>购物指南</strong></li>
						<li class="cutline">&nbsp;</li>
					</ul>
				</div>
				<div class="tc">
					<ul>
						<li>・购物流程</li>
						<li>・会员介绍</li>
						<li>・订单状态</li>
						<li>・常见问题</li>
						<li>・大家电</li>
						<li>・联系客服</li>
					</ul>
				</div>
			</div>
			<div class="info">
				<div class="tt">
					<ul>
						<li><img src="img/ln_foot1.jpg"></li>
						<li class="buyInfo"><strong>购物指南</strong></li>
						<li class="cutline">&nbsp;</li>
					</ul>
				</div>
				<div class="tc">
					<ul>
						<li>・购物流程</li>
						<li>・会员介绍</li>
						<li>・订单状态</li>
						<li>・常见问题</li>
						<li>・大家电</li>
						<li>・联系客服</li>
					</ul>
				</div>
			</div>
			<div class="info">
				<div class="tt">
					<ul>
						<li><img src="img/ln_foot1.jpg"></li>
						<li class="buyInfo"><strong>购物指南</strong></li>
						<li class="cutline">&nbsp;</li>
					</ul>
				</div>
				<div class="tc">
					<ul>
						<li>・购物流程</li>
						<li>・会员介绍</li>
						<li>・订单状态</li>
						<li>・常见问题</li>
						<li>・大家电</li>
						<li>・联系客服</li>
					</ul>
				</div>
			</div>
			<div id="foot-img">
				<ul>
					<li><img src="img/ln_foot6.jpg"></li>
					<li><img src="img/ln_foot7.jpg"></li>
					<li><img src="img/ln_foot8.jpg"></li>
					<li><img src="img/ln_foot9.jpg"></li>
				</ul>
			</div>
		</div><!--service结束-->
	</div><!--tail结束-->

	<div id="footer" class="w">
		<div class="flinks"><a href="#">关于我们</a>|<a href="#">联系我们</a>|<a href="#">人才招聘</a>|<a href="#">商家入驻</a>|<a href="#">广告服务</a>|<a href="#">京东社区</a>|<a href="#">友情链接</a>|<a href="#">销售联盟</a></div>
		<div class="copyright">北京市公安局海淀分局备案编号：1101081681&nbsp;&nbsp;京ICP证070359号&nbsp;&nbsp;<a target="_blank" href="img/f_music.jpg">音像制品经营许可证苏宿批005 号</a><br>Copyright&copy;2004-2011&nbsp;&nbsp;360buy京东商城&nbsp;版权所有</div>
		<div class="ilinks"><a href="#">
			<img width="108" height="40" src="img/f_icp.gif"></a>
			<a id="urlknet"href="#"><img width="112" height="40" border="true" src="img/knetSealLogo.jpg"></a>
			<a href="#"><img width="108" height="40" alt="海淀网络警察" src="img/f_hdwj.jpg"></a>
		</div>
	</div>


	
	
</div>
</body>
</html>
