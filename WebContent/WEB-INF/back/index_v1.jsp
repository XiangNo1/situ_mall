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
		
</div>
</div>
<script type="text/javascript">
	function refreshCode() {
		$("#codeImg").attr("src", "${ctx}/checkImgServlet?" + Math.random());
	}

</script>
</body>

</html>
