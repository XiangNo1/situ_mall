<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>靓淘优选</title>
<%@include file="../common/head_front.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/front/css/Style.css" />
<link rel="stylesheet" href="${ctx}/resources/front/css/order2.css" />
</head>

<body>
<div class="bg-box">
<div class="box-center">
		<div class="box1"><span class="wel">欢迎来到靓淘！ <a href="${ctx }/index/index.shtml"> 首页</a></span></div>
		<div class="box2">
        	<ul>
        	<c:if test="${userSession != null }">
            	<li><a class="login">欢迎回来 ： ${userSession.username} </a>
            		<a  href="${ctx }/login/loginOut.shtml">退出登录</a>
            	</li>
        	</c:if>
        	
        	<c:if test="${userSession == null }">
            	<li><a class="login" href="${ctx }/login/login.shtml">请登录</a></li>
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
		<%@include file="index_head2.jsp" %>
   
</div>
<div class="clearfix"></div>

<div class="box-center">
	<div class="take-delivery">
 <div class="status">
   <h2>您已成功付款</h2>
   <div class="successInfo">
     <ul>
       <li>付款金额<em>¥${order_session.payment }</em></li>
       <div class="user-info">
         <p>收货人：${shipping_session.receiver_name }</p>
         <p>联系电话：${shipping_session.receiver_mobile }</p>
         <p>收货地址：${shipping_session.receiver_address }</p>
       </div>
             请认真核对您的收货信息，如有错误请联系客服
                               
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="../person/order.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
        <a href="../person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
     </div>
    </div>
  </div>
</div>

</div>









<div class="box-center">
    <div class="box22">
    	<ul class="b22u1">
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">购物指南</a></li>	
                	<li><a class="b22a2" href="">免费注册</a></li>	
                	<li><a class="b22a2" href="">开通支付宝</a></li>	
                	<li><a class="b22a2" href="">支付宝充值</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">品质保障</a></li>	
                	<li><a class="b22a2" href="">发票保障</a></li>	
                	<li><a class="b22a2" href="">售后规则</a></li>	
                	<li><a class="b22a2" href="">缺货赔付</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">支付方式</a></li>	
                	<li><a class="b22a2" href="">快捷支付</a></li>	
                	<li><a class="b22a2" href="">信用卡</a></li>	
                	<li><a class="b22a2" href="">货到付款</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">商家服务</a></li>	
                	<li><a class="b22a2" href="">商家入驻</a></li>	
                	<li><a class="b22a2" href="">商家中心</a></li>	
                	<li><a class="b22a2" href="">运营服务</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">&nbsp;手机靓淘</a></li>
                    <li><img src="${ctx}/resources/front/image/saoma1.png" width="65px" height="65px"></li>
                </ul>
            </li>
        </ul>
    </div>
    </div>
</div><div class="clearfix"></div>
    <div class="box21">
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
    </div><div class="clearfix"></div>
    <div class="box23">
    	<p>COPYRIGHT 2010-2017 北京创锐文化传媒有限公司 JUMEI.COM 保留一切权利。客服热线：400-123-8888</p>
        <p>京公网安备 11010102001226|京ICP证111033号|食品流通许可证 SP1101051110165515（1-1）|执业营照</p>
    </div>
</div>
</body>
</html>
