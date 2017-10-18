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
		
		<div class="wrapper wrapper-content animated fadeInRight">
		
		
		
		            <div class="alert alert-info" role="alert">前请认真核对分类的信息<strong>确保无误</strong></div>
					    
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