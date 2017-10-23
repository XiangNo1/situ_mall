<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../common/head.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<h1>欢迎进入商城后台管理系统！<strong>注册页面</strong></h1>
	<div style="width:30%; margin-top:150px;" class="container">
	<form action="${ctx}/backIndex/backLogin2.action" method = "post" id="form">
		用户名：<input  class="form-control" placeholder="请输入帐号" type="text" name="username"/><br/>
		密 码 : <input  class="form-control" placeholder="请输入密码" type="text" name="password"/><br/>
		<input class="btn btn-primary" type="button" onclick="submitForm()" value="注册"/>
		已有账号<a href="${ctx}/backIndex/backLogin.action">在此登录</a>
	</form>
</div>
</div>
<script type="text/javascript">
function submitForm() {
	var options = {
			url:"${ctx}/backIndex/backRegister2.action",
			type:"post",
			dateType:"json",
			data:$("#form").serialize(),
			success:function(data){
				if(data.status == 0){
					layer.msg(data.msg);
					setTimeout(function(){
	         			window.location.href = "${ctx}/backIndex/backLogin.action";
					},1000);
				}
				else {
					layer.msg(data.msg);
				}
			}
	}
	$.ajax(options)
};



	function refreshCode() {
		$("#codeImg").attr("src", "${ctx}/checkImgServlet?" + Math.random());
	}

</script>
</body>

</html>
