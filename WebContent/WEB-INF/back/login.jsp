<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/head.jsp" %>
</head>
<body>
<div style="width:30%; margin-top:150px;" class="container">
	<form action="${ctx}/student/login.action" method = "post">
		用户名：<input  class="form-control" placeholder="请输入帐号" type="text" name="name"/><br/>
		密 码 : <input  class="form-control" placeholder="请输入密码" type="text" name="password"/><br/>
		验证码：<input class="form-control" type="text" name="checkCode"/>
		<img id="codeImg" src="${ctx}/checkImgServlet" onclick="refreshCode()"/>
		
		<input class="btn btn-primary" type="submit" value="登录"/>
		<a href="${ctx}/jsp/zhuce.jsp">注册账号</a>
		<a href="${ctx}/student?method=findAccounts">管理员登录</a>
	</form>
</div>

<script type="text/javascript">
	function refreshCode() {
		$("#codeImg").attr("src", "${ctx}/checkImgServlet?" + Math.random());
	}

</script>

</body>
</html>