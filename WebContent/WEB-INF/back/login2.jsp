<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../common/head.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title> - 主页示例</title>

    <link rel="shortcut icon" href="favicon.ico"> <link href="${ctx}/resources/hAdmin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/resources/hAdmin/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${ctx}/resources/hAdmin/css/animate.css" rel="stylesheet">
    <link href="${ctx}/resources/hAdmin/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
	<h1>欢迎进入商城后台管理系统！</h1>
	<div style="width:30%; margin-top:150px;" class="container">
	<form action="${ctx}/backIndex/backLogin2.action" method = "post">
		用户名：<input  class="form-control" placeholder="请输入帐号" type="text" name="name"/><br/>
		密 码 : <input  class="form-control" placeholder="请输入密码" type="text" name="password"/><br/>
		验证码：<input class="form-control" type="text" name="checkCode"/>
		<img id="codeImg" src="${ctx}/checkImgServlet" onclick="refreshCode()"/>
		
		<input class="btn btn-primary" type="submit" value="登录"/>
		<a href="${ctx}/jsp/zhuce.jsp">注册账号</a>
	</form>
</div>
</div>
<script type="text/javascript">
	function refreshCode() {
		$("#codeImg").attr("src", "${ctx}/checkImgServlet?" + Math.random());
	}

</script>
</body>

</html>
