<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
	<%@include file="../common/head.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
		<title></title>
	</head>
	<body>
		<div style="margin-top: 40px;" class="container-fluid">
		
		
		<div class="wrapper wrapper-content animated fadeInRight">
		
		            <div class="alert alert-info" role="alert">前请认真核对分类的信息<strong>确保无误</strong></div>
					    
		            <div class="alert alert-danger" role="alert">请注意不要添加重复的分类！！！</div>
 <form action="${ctx}/category/addCategory2.action" method="post" id="add-form">
 
  	     父类id<span style="color: red;">(如果要添加一级分类请填写0)</span>：<input class="form-control" type="text" name="parent_id"/>
	       类别名称：<input class="form-control" type="text" name="name"/>
	       	        类别状态:<input id="status" name="status"  class="form-control">
<!-- 	       排序编号：<input class="form-control" type="text" name="sort_order"/>
 -->      <p><button class="btn btn-primary" type="button" onclick="submitForm()">添加分类</button>
       <button class="btn btn-primary" type="button" onclick="clearForm()">清空表单</button></p>
    </form>
</div>
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