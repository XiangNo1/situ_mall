<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>靓淘登录</title>
<%@include file="../common/head_front.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/front/css/login.css" /></head>

<body>
<form action="" method="post" id="login_form">
<div class="box5" style="top:0; right: 0;">
	<label>
    	<tr>
        	<td><a class="b5a1" href="">密码登录</a></td>
            <td><a href="">扫码登录</a></td>
        </tr>
    </label>
	<div class="clearfix"></div>
	<input type="hidden" name="redirectUri" value="${redirectUri}"/>
    <input class="b5in1" type="text" name="user" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员名/邮箱/手机号" />
	<div class="clearfix"></div>
    <input class="b5in2" type="text" name="password" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码"/>
	<div class="clearfix"></div>
	<input class="b5in3" type="button" onclick="submitForm()" value="登录">    
	<div class="clearfix"></div>
    <p class="b5p1">微博登录</p>
    <p class="b5p2">支付宝登录</p>
	<div class="clearfix"></div>
   	<input class="b5in4" type="checkbox" id="b51"><label for="b51">记住用户名</label>
    <ul class="b5u">
    	<li><a class="b5a2" href="">免费注册</a></li>
    	<li><a class="b5a3" href="">忘记密码</a></li>
    </ul>
</div>
</form>

<script type="text/javascript">
	function submitForm() {
		var options = {
				url:"${ctx}/login/loginInPage.shtml",
				type:"post",
				dataType:"json",
				data:$("#login_form").serialize(),
				success:function(data){
					if(data.status == 0) {
						layer.msg(data.msg);
						//当你在iframe页面关闭自身时
						var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
						setTimeout(function(){
							parent.layer.close(index); //再执行关闭  
							window.parent.location.href = "${ctx}/order/order.shtml";
						},1000);
					} else {
						layer.msg(data.msg);
					} 
				}
		};
		$.ajax(options);
	}
</script>
</body>
</html>