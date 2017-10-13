<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
		<title></title>
	</head>
	<body>
	<%@include file="../common/head.jsp" %>
		<div class="container-fluid">
		
		<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">商城后台管理系统</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="${ctx}/product/findAllProduct.action"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 商品管理 <span class="sr-only">(current)</span></a></li>
        <li><a href="${ctx}/category/findAllCategory.action"> <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 分类管理 </a></li>
        <li><a href="${ctx}/slideshow/findSlideshow.action"> <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 轮播图管理 </a></li>
        <li><a href="${ctx}/user/findUser.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 用户管理 </a></li>
        <li class="active"><a href="${ctx}/shipping/findShipping.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 收货地址管理 </a></li>
        <li><a href="${ctx}/backOrder/findBackOrder.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 订单管理 </a></li>
        <li><a href="#"> 欢迎回来:${accounts.name }</a> </li>
        
        
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${ctx }/student/loginout.action"> 退出登陆</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin <span class="caret"></span></a>
          <ul class="dropdown-menu">
          			<li><a href="#">帐号： ${accounts.name }   密码:  ${accounts.password }</a></li>
          
          <%-- <c:forEach items="${onlineStudentList }" var="accounts">
			<li><a href="#">帐号： ${accounts.name }   密码:  ${accounts.password }</a></li>
		  </c:forEach> --%>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
		
		
		
		
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${ctx}/shipping/findShipping.action" class="list-group-item">收货地址管理</a>
		                <a href="${ctx}/shipping/addShipping.action" class="list-group-item">添加收货地址</a>
		                <a href="${ctx}/shipping/addShipping.action" class="list-group-item active">修改收货地址</a>		                
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li>
		                    <a href="${ctx}/shipping/findShipping.action">收货地址管理</a>
		                </li>
		                <li>
		                	<a href="${ctx}/shipping/addShipping.action">添加收货地址</a>
		                </li>
		                <li class="active">
		                	<a href="${ctx}/shipping/addShipping.action">修改收货地址</a>
		                </li>
		            </ul>
				     <div style="width:60%; margin-top:20px;">
		            <div class="alert alert-danger" role="alert">修改前请仔细检查！！！</div>
						 <form action="${ctx}/shipping/updateShipping2.action" method="post">
					  	 	 id：<input class="form-control" type="text" name="id" value="${shipping.id }" readonly="readonly"/>
						   	    用户id：<input class="form-control" type="text" name="user_id" value="${shipping.user_id }"/>
						  	     收货姓名：<input class="form-control" type="text" name="receiver_name" value="${shipping.receiver_name }"/>
							      收货固定电话：<input class="form-control" type="text" name="receiver_phone" value="${shipping.receiver_phone }"/>
							      收货移动电话：<input class="form-control" type="text" name="receiver_mobile" value="${shipping.receiver_mobile }"/>
					       	       省份:<input id="status" name="receiver_province"  class="form-control" value="${shipping.receiver_province }"/>
							      城市：<input class="form-control" type="text" name="receiver_city" value="${shipping.receiver_city }"/>
							      区/县：<input class="form-control" type="text" name="receiver_district" value="${shipping.receiver_district }"/>
							      详细地址：<input class="form-control" type="text" name="receiver_address" value="${shipping.receiver_address }"/>
							      邮编：<input class="form-control" type="text" name="receiver_zip" value="${shipping.receiver_zip }"/>
						       <p><button class="btn btn-primary" type="submit">保存</button></p>
					    </form>
					</div>
		            
		            
		        </div>
		    </div>
		</div>
		
	<script>
</script>	
	</body>
</html>