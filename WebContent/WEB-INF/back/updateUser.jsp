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
        <li class="active"><a href="${ctx}/user/findUser.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 用户管理 </a></li>
        <li><a href="${ctx}/shipping/findShipping.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 收货地址管理 </a></li>
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
		                <a href="${ctx}/user/findUser.action" class="list-group-item">用户管理</a>
		                <a href="${ctx}/user/addUser.action" class="list-group-item">添加用户</a>
		                <a href="" class="list-group-item active">修改用户</a>
		                
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li>
		                    <a href="${ctx}/user/findUser.action">用户管理</a>
		                </li>
		                <li>
		                	<a href="${ctx}/user/addUser.action">添加用户</a>
		                </li>
		                <li class="active">
		                	<a href="">修改用户</a>
		                </li>
		            </ul>
		           <div class="alert alert-danger" role="alert">请注意不要添加重复的用户！！！</div>
		           <form style="width: 60%" action="${ctx}/user/updateUser2.action" method="post">
   	    id：<input class="form-control" type="text" name="id" id="id" value="${user.id }" readonly="readonly"/>
  	     账户名称：<input class="form-control" type="text" name="username" value="${user.username }"/>
	       账户密码：<input class="form-control" type="text" name="password" value="${user.password }"/>
	       	        邮箱:<input id="email" name="email"  class="form-control" value="${user.email }">
	       	        电话号码:<input id="phone" name="phone"  class="form-control" value="${user.phone }">
	       	      密保问题:<input id="question" name="question"  class="form-control" value="${user.question }">
	       	       密保答案:<input id="answer" name="answer"  class="form-control" value="${user.answer }">
	       	        账户类型:<select id="role" name="role"  class="form-control">
	       	        	<option value="0">管理员</option>
	       	        	<option value="1">普通用户</option>
	       	        </select>
	       	        
       <p><button class="btn btn-primary" type="submit">保存</button></p>
    </form>
		            
		        </div>
		    </div>
		</div>
		
	<script>
	$(function(){
	    $("#role option[value='${user.role}']").prop("selected", true);
	 });

	
</script>	
	</body>
</html>