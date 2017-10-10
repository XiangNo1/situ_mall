<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>注册</title>
<%@include file="../common/head_front.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/front/css/register.css" /></head></head>

<body>
<div class="box1"><img src="${ctx}/resources/front/image/LOGO.png"></div>
<div class="box2">
	<p class="b2p1">7天无理由退货</p>
	<p class="b2p2">100%正品保障</p>
	<p class="b2p3">退货反运费</p>
</div>
<div class="clearfix"></div>
<div class="box3a">
    <div class="box3">
		<img src="${ctx}/resources/front/image/110.png">
	</div>
</div>
<div class="box4">
	<ul>
    	<li><a href="">关于靓淘 |</a></li>
    	<li><a href="">帮助中心 |</a></li>
    	<li><a href="">开放平台 |</a></li>
    	<li><a href="">诚聘精英 |</a></li>
    	<li><a href="">联系我们 |</a></li>
    	<li><a href="">网站合作 |</a></li>
    	<li><a href="">法律声明及隐私政策 |</a></li>
    	<li><a href="">知识产权 |</a></li>
    	<li><a href="">廉政举报 |</a></li>
    	<li><a href="">规则意见征集</a></li>
    </ul>
</div>
<div class="box6">
    	<p>COPYRIGHT 2010-2017 北京创锐文化传媒有限公司 JUMEI.COM 保留一切权利。客服热线：400-123-8888</p>
        <p>京公网安备 11010102001226|京ICP证111033号|食品流通许可证 SP1101051110165515（1-1）|执业营照</p>
</div>
<div class="box5">
<form action="${ctx }/login/newUser.shtml">
	<h1>用户注册</h1>
    <h2>已有账户<a href="">在此登录</a></h2>
	<div class="clearfix"></div>
    <input class="b5i1" type="text" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;账户名称" name="username" id="username">
	<div class="clearfix"></div>
    <span style="display: block; float: left; margin-left: 30px;" id="nameInfo"></span><br/>
    <input class="b5i1" type="text" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;账户密码" name="password">
 	<div class="clearfix"></div>
   <input class="b5i3" type="text" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;邮箱" name="email">
 	<div class="clearfix"></div>
   <input class="b5i4" type="text" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;电话号码" name="phone">
	<div class="clearfix"></div>
    <input class="b5i5" type="submit" value="同意协议并注册">
	<div class="clearfix"></div>
    <a class="b5a2" href="">《靓淘优选用户协议》</a>
</form>
</div>


<script type="text/javascript">

$(function() {
	$("#username").blur(function(){
        var name = $(this).val();
        $.ajax({
            url:"${ctx}/user/checkUsername.action",
            data:"username="+name,
            dataType:"json",
            success:function(data,textStatus,ajax){
            	
            	if(data){
					$("#nameInfo").html("该用户已经存在");
					$("#nameInfo").css("color", "red");
				}else{
					$("#nameInfo").html("该名称可用");
					$("#nameInfo").css("color", "green");
				}
            }
        });

	});
});
</script>
</body>
</html>