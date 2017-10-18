<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>购物车</title>
<%@include file="../common/head_front.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/front/css/cart.css" />
</head>

<body>
<div class="un">
<div class="box-center">
	
	<div class="box1"><span class="wel">欢迎来到靓淘！ <a href="${ctx }/index/index.shtml"> 首页</a></span></div>
		<div class="box2">
        	<ul>
        	
	        	<c:if test="${userSession != null }">
	            	<li><a class="login">欢迎回来 ： ${userSession.username} </a>
	            		<a  href="${ctx }/login/loginOut.shtml?redirectUri=/cart/addCart.shtml">退出登录</a>
	            	</li>
	        	</c:if>
	        	<c:if test="${userSession == null }">
	            	<li><a class="login" href="${ctx }/login/login.shtml?redirectUri=/cart/addCart.shtml">请登录</a></li>
	        	</c:if>
        	
            	<li><a href="${ctx }/login/register.shtml">快速注册</a></li>
            	<li><a class="collect" href="">我的收藏</a></li>
            	
            	<c:if test="${userSession != null }">
            		<li><a class="order" href="${ctx }/order/myorder.shtml">我的订单</a></li>
        		</c:if>
        		<c:if test="${userSession == null }">
            		<li><a class="order" href="${ctx }/login/login.shtml?redirectUri=/order/myorder.shtml">我的订单</a></li>
        		</c:if>
        	
            	
            	<li><a class="phone" href="">手机靓淘</a></li>
            	<li><a href="">我的积分</a></li>
            	<li><a href="">我的评价</a></li>
            </ul>
        </div>
   	 	<div class="clearfix"></div>
	<div class="box3"><img src="${ctx}/resources/front/image/LOGO.png"><span>购物车</span></div>
	<div class="box4">
    	<input class="b41" type="text" value="华为"><input class="b42" type="button" value="搜索">
    </div>
    <div class="clearfix"></div>
	<div class="box5">
    	<ul>
        	<li class="b51">全部商品</li>
        	<li>降价商品</li>
        	<li>库存紧张</li>
        </ul>
    </div>
	<div class="box6">
    	<span class="s61">配送至：</span>
        <div class="b61"><span class="s62">山东省青岛市市南区</span></div>
    </div>
    <div class="clearfix"></div>
    <div class="box7">
    	<input class="b7i" type="checkbox" id="quanxuan">
        <ul class="b7u1">
        	<li><label for="quanxuan">全选</label></li>
        	<li>商品</li>
        </ul>
        <ul class="b7u2">
        	<li>操作</li>
        	<li>小计</li>
        	<li>数量</li>
        	<li>单价</li>
        </ul>
    </div>
    <div class="box8">
    	<input type="checkbox" id="liangtaoziying"><label for="liangtaoziying"><img src="${ctx}/resources/front/image/156.png"></label>
    </div>
    <div class="box9"><img src="${ctx}/resources/front/image/157.png"></div>
    <div class="clearfix"></div>
    
    
    <c:forEach items="${buyCartVO.items }" var="cartItemVO">
    <div class="box10">
    	<div class="un10">
        	<div class="uu1"><img src="${ctx}/resources/front/image/158.png">		
            </div>
            <span class="s2">活动商品购满￥105.00，即可加价换购商品1件 &gt;</span>
            <span class="s3">查看换购品</span>
            <span class="s4">去凑单 &gt;</span>
        </div>
        <input class="b10i1" type="checkbox">
        <div class="b10b1"><img src="/pic/${cartItemVO.product.main_image}"></div>
        <div class="b10b2">
        		<ul class="b10u1" style="width:260px;">
                	<li>${cartItemVO.product.name}</li>
                	<li class="b10ii1">支持7天无理由退货</li>
                	<li class="b10ii2">选包装</li>
                </ul>
        </div>
        <ul class="ulul1">
            <li class="l90"><div>
            	<p><del style="color:#b3b3b3">￥1699.00</del></p>
            	<p>￥${cartItemVO.product.price}</p>
                </div>
            </li>
        	<li class="l91">
            	<input class="inp1" type="button" value="-" onclick="sub(${cartItemVO.product.id})">
            	<input type="hidden" value="${cartItemVO.amount}" id="input3"/>
            	<input class="inp2" type="text" value="${cartItemVO.amount}" size="4" id="input${cartItemVO.product.id }" onchange="change(${cartItemVO.product.id })">
            	<input type="hidden" value="${cartItemVO.product.id}" id="input2"/>
            	<input class="inp1" type="button" value="+" onclick="increase(${cartItemVO.product.id})">
                
            </li>
        	<li class="l92">￥${cartItemVO.product.price*cartItemVO.amount}</li>
        	<li class="l93"><img src="${ctx}/resources/front/image/166.png" onclick="deleteProduct(${cartItemVO.product.id})"></li>
        </ul>
    </div>
    
    </c:forEach>
    <br/>
    <span><a style="line-height: 30px; font-size: 20px; " href="${ctx }/details/details2.shtml?id=${buyCartVO.productId}">返回继续购物</a></span>
    <div class="box11">
    	<input type="checkbox" id="quan"><label for="quan">全选</label>
    	<c:if test="${userSession != null }">
	        <a href="${ctx }/order/order.shtml" class="jiesuan">立即结算</a>
   		</c:if>
   		<c:if test="${userSession == null }">
   			<a href="javascript:login()" class="jiesuan">立即结算</a>
   		</c:if>
        <span class="b11s1">总金额（已免运费）：<span class="b11s2">￥${buyCartVO.totalPrice}</span></span>
    </div>
    <div class="box12">
    	<ul>
        	<li class="b12l1">
            	<span>
                	<p>品质保障</p>
                    <p>品质护航 购物无忧</p>
                </span>
            </li>
        	<li class="b12l2">
            	<span>
                	<p>特色服务体验</p>
                    <p>为您呈现不一样的服务</p>
                </span>
            </li>
        	<li class="b12l3">
            	<span>
                	<p>帮助中心</p>
                    <p>您的购物指南</p>
                </span>
            </li>
        	<li class="b12l4">
            	<span>
                	<p>七天无理由退换货</p>
                    <p>为您提供售货物有保障</p>
                </span>
            </li>
        </ul>
    </div>
    <div class="box13">
    	<ul class="b13u1">
        	<li>
            	<ul>
                	<li><a class="b13a1" href="">购物指南</a></li>	
                	<li><a class="b13a2" href="">免费注册</a></li>	
                	<li><a class="b13a2" href="">开通支付宝</a></li>	
                	<li><a class="b13a2" href="">支付宝充值</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b13a1" href="">品质保障</a></li>	
                	<li><a class="b13a2" href="">发票保障</a></li>	
                	<li><a class="b13a2" href="">售后规则</a></li>	
                	<li><a class="b13a2" href="">缺货赔付</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b13a1" href="">支付方式</a></li>	
                	<li><a class="b13a2" href="">快捷支付</a></li>	
                	<li><a class="b13a2" href="">信用卡</a></li>	
                	<li><a class="b13a2" href="">货到付款</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b13a1" href="">商家服务</a></li>	
                	<li><a class="b13a2" href="">商家入驻</a></li>	
                	<li><a class="b13a2" href="">商家中心</a></li>	
                	<li><a class="b13a2" href="">运营服务</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b13a1" href="">&nbsp;手机靓淘</a></li>
                    <li><img src="${ctx}/resources/front/image/saoma1.png" width="65px" height="65px"></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
    <div class="box14">
    	<ul>
        	<li><a href="">关于靓淘</a></li>
        	<li><a href="">帮助中心</a></li>
        	<li><a href="">开放平台</a></li>
        	<li><a href="">诚聘精英</a></li>
        	<li><a href="">联系我们</a></li>
        	<li><a href="">网站合作</a></li>
        	<li><a href="">法律声明及隐私政策</a></li>
        	<li><a href="">知识产权</a></li>
        	<li><a href="">廉政举报</a></li>
        	<li><a href="">规则意见征集</a></li>
        </ul>
    </div>
    <div class="box15">
    	<p>COPYRIGHT 2010-2017 北京创锐文化传媒有限公司 JUMEI.COM 保留一切权利。客服热线：400-123-8888</p>
        <p>京公网安备 11010102001226|京ICP证111033号|食品流通许可证 SP1101051110165515（1-1）|执业营照</p>
    </div>
</div>

<script type="text/javascript">
	
	function login() {
		layer.open({
			type:2,//（iframe层）
			title:'用户登录',
			area: ['360px', '390px'],
			offset: '150px',//只定义top坐标，水平保持居中
			content:"${ctx}/login/getLoginPage.shtml"
		});
	}


	function increase(productId){
		var amount = 1;
		window.location.href="${ctx}/cart/addCart.shtml?productId="+productId+"&amount="+amount;
	}
	
	function sub(productId){
		var amount = -1;
		window.location.href="${ctx}/cart/addCart.shtml?productId="+productId+"&amount="+amount;
	}
	
	function deleteProduct(id) {
	       var isDel = confirm("您确认要删除吗？");
	       if (isDel) {
	           //要删除
	           location.href = "${ctx}/cart/deleteProduct.shtml?id="
	                  + id;
	       }
	    };
	    
	    function change(id){
	    	var amount2= $("#input"+ id).val();
	    	window.location.href="${ctx}/cart/updateCart.shtml?id="+id+"&amount="+amount2;
	    }
	    
    /* var productId = $("#input2").val();
    var inputid = "input" + productId;
	$("#${inputid}").change(function(){
		var amount = $("#input").val();
		var de =  amount - $("#input3").val();
		window.location.href="${ctx}/cart/addCart.shtml?productId="+productId+"&amount="+de;
	});
	  $("#input${id}") */
	    
</script>
</body>
</html>