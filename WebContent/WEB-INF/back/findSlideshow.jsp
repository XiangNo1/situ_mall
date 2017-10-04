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
        <li class="active"><a href="${ctx}/slideshow/findSlideshow.action"> <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 轮播图管理 </a></li>
        <li><a href="${ctx}/banji/findJiaowu.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> xx管理 </a></li>
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
		                <a href="${ctx}/slideshow/findSlideshow.action" class="list-group-item active">轮播图管理</a>
		                <a href="${ctx}/slideshow/addSlideshow.action" class="list-group-item">添加轮播图</a>
		                
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${ctx}/slideshow/findSlideshow.action">轮播图管理</a>
		                </li>
		                <li>
		                	<a href="${ctx}/slideshow/addSlideshow.action">添加轮播图</a>
		                </li>
		            </ul>
		            <div class="alert alert-info" role="alert">删除前请认真核对图片的信息<strong>确保无误</strong></div>
					    <table class="table">
					    	<tr>
					    		<td>id</td>
					    		<td>图片名称</td>
					    		<td>图片链接地址</td>
					    		<td>示意图</td>
					    		<td>图片状态</td>
					    		<td>删除</td>
					    		<td>修改</td>
					    	</tr>
					    	<c:forEach items="${list}" var="slideshow">
					    	<tr>
					    		<td>${slideshow.id }</td>
					    		<td>${slideshow.uri }</td>
					    		<td>${slideshow.link }</td>
					    		<td>
					    		<img alt="[无图]" src="/pic/${slideshow.uri }" width="100" height="50"/>
					    		</td>
					    		<td>
					    		<c:if test="${slideshow.status == 1 }">
					    			<a href="${ctx}/slideshow/updateSlideshowStatus.action?status=2&id=${slideshow.id }">显示</a>
					    		</c:if>
					    		<c:if test="${slideshow.status == 2 }">
					    			<a href="${ctx}/slideshow/updateSlideshowStatus.action?status=1&id=${slideshow.id }">隐藏</a>
					    		</c:if>
					    		</td>
					    		<td><a href="javascript:delSlideshow(${slideshow.id})">删除</a></td>
					    		<td><a href="${ctx}/slideshow/updateSlideshow.action?id=${slideshow.id}">修改</a></td>
					    	</tr>
					    	
					    	</c:forEach>
					    
					    </table>
					   
					    
					   
		            
		        
		        </div>
		    </div>
		</div>
		
	<script>
	
	
	function delSlideshow(id) {
	       var isDel = confirm("您确认要删除吗？");
	       if (isDel) {
	           //要删除
	           location.href = "${ctx}/slideshow/deleteSlideshow.action?id="
	                  + id;
	       }
	    };
	
</script>	
	</body>
</html>