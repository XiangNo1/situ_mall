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
		<div style="margin-top: 40px;" class="container-fluid">
		
		
		
		
		
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${ctx}/category/findAllCategory.action" class="list-group-item">分类管理</a>
		                <a href="${ctx}/product/addProduct.action" class="list-group-item">添加分类</a>
		                <a href="" class="list-group-item active">添加修改</a>
		                
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li>
		                    <a href="${ctx}/category/findAllCategory.action">分类管理</a>
		                </li>
		                <li>
		                	<a href="${ctx}/category/addCategory.action">添加分类</a>
		                </li>
		                <li class="active">
		                	<a href="">修改分类</a>
		                </li>
		            </ul>
		            <div class="alert alert-info" role="alert">前请认真核对分类的信息<strong>确保无误</strong></div>
					    
					     <div style="width:60%; margin-top:20px;">
		            <div class="alert alert-danger" role="alert">请注意不要修改重复id的分类！！！</div>
 <form action="${ctx}/category/updateCategory2.action" method="post" id="add-form">
 
   	    类别id：<input class="form-control" type="text" name="id" id="id" value="${category.id }" readonly="readonly"/>
  	     父类id：<input class="form-control" type="text" name="parent_id" value="${category.parent_id }"/>
	       类别名称：<input class="form-control" type="text" name="name" value="${category.name }"/>
	       	        类别状态:<input id="status" name="status"  class="form-control" value="${category.status }">
       <p><button class="btn btn-primary" type="button" onclick="submitForm()">修改分类</button>
       <button class="btn btn-primary" type="button" onclick="clearForm()">清空表单</button></p>
    </form>
</div>
		            
	<script>
	function submitForm() {
		var options = {
				url:"${ctx}/category/updateCategory2.action",
				type:"post",
				dateType:"json",
				data:$("#add-form").serialize(),
				success:function(data){
					if(data.status == 0){
						layer.confirm(
		            				'修改成功',
		            				{btn:['关闭','跳转到列表界面']},
		            				function(index){
		            					layer.close(index);
		            				},
		            				function(){
		            					window.location.href = "${ctx}/category/findAllCategory.action";
		            				}
		            			);
					}else {
						layer.msg("修改失败");
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