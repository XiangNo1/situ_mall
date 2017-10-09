<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>靓淘优选</title>
<%@include file="../common/head_front.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/front/css/Style.css" />
</head>

<body>
<div class="bg-box">
<div class="box-center">
		<div class="box1"><span class="wel">欢迎来到靓淘！ 首页</span></div>
		<div class="box2">
        	<ul>
        	<c:if test="${userSession != null }">
            	<li><a class="login">欢迎回来 ： ${userSession.username} </a>
            		<a  href="${ctx }/login/loginOut.shtml">退出登录</a>
            	</li>
        	</c:if>
        	
        	<c:if test="${userSession == null }">
            	<li><a class="login" href="${ctx }/login/login.shtml">请登录</a></li>
        	</c:if>
            	<li><a href="${ctx }/login/register.shtml">快速注册</a></li>
            	<li><a class="collect" href="">我的收藏</a></li>
            	<li><a class="order" href="">我的订单</a></li>
            	<li><a class="phone" href="">手机靓淘</a></li>
            	<li><a href="">我的积分</a></li>
            	<li><a href="">我的评价</a></li>
            </ul>
        </div>
   	 	<div class="clearfix"></div>
    <div class="box3"><img src="${ctx}/resources/front/image/LOGO.png" width="110%" height="110%"></div>
    <div class="box4">
    			 <input class="btn1" type="text" value="洗面奶">
        		 <input class="btn2" type="button" value="搜索">
				<ul class="nav">
                	<li><a href="" style="color:#F41443;">保湿&nbsp;|</a></li>
                	<li><a href="">面膜&nbsp;|</a></li>
                	<li><a href="">洗面奶&nbsp;|</a></li>
                	<li><a href="">补水&nbsp;|</a></li>
                	<li><a href="">香水&nbsp;|</a></li>
                	<li><a href="">眼霜&nbsp;|</a></li>
                	<li><a href="">口红&nbsp;|</a></li>
                	<li><a href="">护肤套装&nbsp;|</a></li>
                	<li><a href="">BB霜&nbsp;|</a></li>
                </ul>
    </div>
    	<div class="box5">
        	<a href="" class="box5-2"><span class="box5-1">去购物车结算</span></a>
       		<div class="box5-3"></div>
        </div>
    <div class="clearfix"></div>
</div>
<div class="box6">
	<div class="box-center">
    	<ul class="ul6">
        	<li><a class="current" href="">商城首页</a></li>
        	<li><a href="">美妆商城</a></li>
        	<li><a href="">服装运动</a></li>
        	<li><a href="">家电数码</a></li>
        	<li><a href="">家装家纺</a></li>
        	<li><a href="">淘遍美食</a></li>
        	<li><a href="">国际经营</a></li>
    		<div class="clearfix"></div>
        </ul>
    </div>
</div>
<div style="height: 450px; margin-top: 40px;">
	<div class="box-center">
	<c:forEach items="${products}" var="product">
	<a href="${ctx }/details/details2.shtml?id=${product.id}">
		<div style="margin-right:20px; width: 200px; height: 300px; border: 1px solid red; float:left;" >
			<h1>${product.name }</h1>
			<br/>
			<img alt="" src="/pic/${product.main_image}" width="180px" height="200px">
		</div>
	</a>
	</c:forEach>
	</div>

</div>
	<div class="box-center">
    <div class="box22">
    	<ul class="b22u1">
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">购物指南</a></li>	
                	<li><a class="b22a2" href="">免费注册</a></li>	
                	<li><a class="b22a2" href="">开通支付宝</a></li>	
                	<li><a class="b22a2" href="">支付宝充值</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">品质保障</a></li>	
                	<li><a class="b22a2" href="">发票保障</a></li>	
                	<li><a class="b22a2" href="">售后规则</a></li>	
                	<li><a class="b22a2" href="">缺货赔付</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">支付方式</a></li>	
                	<li><a class="b22a2" href="">快捷支付</a></li>	
                	<li><a class="b22a2" href="">信用卡</a></li>	
                	<li><a class="b22a2" href="">货到付款</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">商家服务</a></li>	
                	<li><a class="b22a2" href="">商家入驻</a></li>	
                	<li><a class="b22a2" href="">商家中心</a></li>	
                	<li><a class="b22a2" href="">运营服务</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">&nbsp;手机靓淘</a></li>
                    <li><img src="${ctx}/resources/front/image/saoma1.png" width="65px" height="65px"></li>
                </ul>
            </li>
        </ul>
        </div>
    </div>
    </div>
</body>
</html>
