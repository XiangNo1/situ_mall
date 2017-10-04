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
		                <a href="${ctx}/slideshow/findSlideshow.action" class="list-group-item">轮播图管理</a>
		                <a href="${ctx}/slideshow/addSlideshow.action" class="list-group-item active">添加轮播图</a>
		                
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li>
		                    <a href="${ctx}/slideshow/findSlideshow.action">轮播图管理</a>
		                </li>
		                <li class="active">
		                	<a href="${ctx}/slideshow/addSlideshow.action">添加轮播图</a>
		                </li>
		            </ul>
		             <form style="width: 60%" action="${ctx}/slideshow/addSlideshow2.action" method="post" enctype="multipart/form-data" id="form-add">
		   	 
			         链接地址:<input id="link" name="link"  class="form-control">
			    轮播图状态：    <select name="status"  class="form-control">
			         	<option value="1">显示</option>
			         	<option value="2">隐藏</option>
			         </select>
			   <div>
			   插入图片：
		           <img alt="" id="imgId" src="" width=100 height=100>
		           <input type="hidden" name="uri" id="uri"/>
		           <input type="file" name="pictureFile" onchange="uploadPic();"/>
		       </div>
		       <p><button class="btn btn-primary" type="submit">保存</button></p>
   		 </form>
					   
					    
					   
		            
		        
		        </div>
		    </div>
		</div>
		
	<script>
	
	function uploadPic() {
		   //定义参数
		   var options = {
		       url:"${ctx}/upload/uploadPic.action",
		       dataType:"json",
		       type:"post",
		       success: function(data) {
		           $("#imgId").attr("src",data.filePath);
		           $("#uri").val(data.fileName);
		       }
		   };
		    $("#form-add").ajaxSubmit(options);
		}
	

</script>	
	</body>
</html>