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
<div class="box1"><img src="${ctx}/resources/front/image/LOGO.png"></div>
<div class="box2">
	<p class="b2p1">7天无理由退货</p>
	<p class="b2p2">100%正品保障</p>
	<p class="b2p3">退货反运费</p>
</div>
<div class="clearfix"></div>
<div class="box3">
	<img src="${ctx}/resources/front/image/beijing.png">
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
<form action="${ctx }/login/loginIn.shtml" method="post">
<div class="box5">
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
	<input class="b5in3" type="submit" value="登录">    
	<div class="clearfix"></div>
    <p class="b5p1">微博登录</p>
    <p class="b5p2">支付宝登录</p>
	<div class="clearfix"></div>
   	<input class="b5in4" type="checkbox" id="b51"><label for="b51">记住用户名</label>
    <ul class="b5u">
    	<li><a class="b5a2" href="${ctx }/login/register.shtml">免费注册</a></li>
    	<li><a class="b5a3" href="">忘记密码</a></li>
    </ul>
</div>
</form>
</body>
</html>