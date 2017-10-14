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
        <li class="active"><a href="${ctx}/category/findAllCategory.action"> <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 分类管理 </a></li>
        <li><a href="${ctx}/slideshow/findSlideshow.action"> <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 轮播图管理 </a></li>
        <li><a href="${ctx}/user/findUser.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 用户管理 </a></li>
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
		                <a href="${ctx}/category/findAllCategory.action" class="list-group-item">分类管理</a>
		                <a href="${ctx}/product/addProduct.action" class="list-group-item active">添加分类</a>
		                
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li>
		                    <a href="${ctx}/category/findAllCategory.action">分类管理</a>
		                </li>
		                <li class="active">
		                	<a href="${ctx}/category/addCategory.action">添加分类</a>
		                </li>
		            </ul>
		            <div class="alert alert-info" role="alert">前请认真核对分类的信息<strong>确保无误</strong></div>
					    
					     <div style="width:60%; margin-top:20px;">
		            <div class="alert alert-danger" role="alert">请注意不要添加重复的分类！！！</div>
 <form action="${ctx}/category/addCategory2.action" method="post" id="add-form">
 
  	     父类id：<input class="form-control" type="text" name="parent_id"/>
	       类别名称：<input class="form-control" type="text" name="name"/>
	       	        类别状态:<input id="status" name="status"  class="form-control">
<!-- 	       排序编号：<input class="form-control" type="text" name="sort_order"/>
 -->      <p><button class="btn btn-primary" type="button" onclick="submitForm()">添加分类</button>
       <button class="btn btn-primary" type="button" onclick="clearForm()">清空表单</button></p>
    </form>
</div>
		            
	<script>
	function submitForm() {
		var options = {
				url:"${ctx}/category/addCategory2.action",
				type:"post",
				dateType:"json",
				data:$("#add-form").serialize(),
				success:function(data){
					if(data.status == 0){
						layer.confirm(
		            				'添加成功',
		            				{btn:['关闭','跳转到列表界面']},
		            				function(index){
		            					layer.close(index);
		            				},
		            				function(){
		            					window.location.href = "${ctx}/category/findAllCategory.action";
		            				}
		            			);
					}else {
						layer.msg("添加失败");
					}
				}
		}
		$.ajax(options)
	};
	function clearForm() {
		$("#add-form")[0].reset();
	}
</script>	
	</body>
</html>