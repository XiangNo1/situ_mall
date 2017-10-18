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
		
		
		           <div class="alert alert-danger" role="alert">请注意不要添加重复的用户！！！</div>
		           <form action="${ctx}/user/updateUser2.action" method="post">
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