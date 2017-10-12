<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="../common/head_front.jsp" %>
</head>
<body>

   	 	 <div class="box3"><img src="${ctx}/resources/front/image/LOGO.png" width="110%" height="110%"></div>
    <div class="box4">
    	<form action="${ctx }/details/details1.shtml" method="post">
    			 <input class="btn1" type="text" placeholder="洗面奶" name="product_name" value="${product_name}${category.name}">
        		 <input class="btn2" type="submit" value="搜索">
		</form>
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
        	<a href="${ctx }/cart/cart.shtml" class="box5-2"><span class="box5-1">去购物车结算</span></a>
       		<div class="box5-3"></div>
        </div>
    <div class="clearfix"></div>
</body>
</html>