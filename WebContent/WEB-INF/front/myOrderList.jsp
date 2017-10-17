<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>靓淘优选</title>
<%@include file="../common/head_front.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/front/css/Style.css" />
<link rel="stylesheet" href="${ctx}/resources/front/css/myOrderList.css" />

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
				
	<div class="member-center clearfix">
		<div class="member-left fl">
			<div class="member-apart clearfix">
				<div class="fl"><a href="#"><img src="img/mem.png"></a></div>
				<div class="fl">
					<p>用户名：</p>
					<p><a href="#">亚里士多德</a></p>
					<p>搜悦号：</p>
					<p>389323080</p>
				</div>
			</div>
			<div class="member-lists">
				<dl>
					<dt>我的商城</dt>
					<dd class="cur"><a href="#">我的订单</a></dd>
					<dd><a href="#">我的收藏</a></dd>
					<dd><a href="#">账户安全</a></dd>
					<dd><a href="#">我的评价</a></dd>
					<dd><a href="#">地址管理</a></dd>
				</dl>
				<dl>
					<dt>客户服务</dt>
					<dd><a href="#">退货申请</a></dd>
					<dd><a href="#">退货/退款记录</a></dd>
				</dl>
				<dl>
					<dt>我的消息</dt>
					<dd><a href="#">商城快讯</a></dd>
					<dd><a href="#">帮助中心</a></dd>
				</dl>
			</div>
		</div>
		<div class="member-right fr">
			<div class="member-head">
				<div class="member-heels fl"><h2>我的订单</h2></div>
				<div class="member-backs member-icons fr"><a href="#">搜索</a></div>
				<div class="member-about fr"><input style="margin-top: 8px;" placeholder="商品名称/商品编号/订单编号" type="text"></div>
			</div>
			<div class="member-whole clearfix">
				<ul id="H-table" class="H-table">
					<li class="cur"><a href="#">我的订单</a></li>
					<li><a href="#">待付款<em>(44)</em></a></li>
					<li><a href="#">待发货</a></li>
					<li><a href="#">待收货</a></li>
					<li><a href="#">交易完成</a></li>
					<li><a href="#">订单信息</a></li>
				</ul>
			</div>
			<div class="member-border">
				<div class="member-return H-over">
					<div class="member-cancel clearfix">
						<span class="be1">订单信息</span>
						<span class="be2">收货人</span>
						<span class="be2">订单金额</span>
						<span class="be2">订单时间</span>
						<span class="be2">订单状态</span>
						<span class="be2">订单操作</span>
					</div>
					<div class="member-sheet clearfix">
						<ul>
						
						<c:forEach items="${pageBean.list}" var="order">
							<li>
								<div class="member-minute clearfix">
									<span><fmt:formatDate value="${order.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
									<span>订单号：<em>${order.order_no }</em></span>
									<span class="member-custom">客服电话：<em>xxx-xxxx-xxxx</em></span>
								</div>
								<div class="member-circle clearfix">
									<div class="ci1">
									
									<c:forEach items="${orderItems }" var="orderItem">
										<c:if test="${orderItem.order_no == order.order_no }">
											<div class="ci7 clearfix">
												<div style="float: left;" class="gr1"><a href="#"><img src="/pic/${orderItem.product_image }" title="" width="60" height="60"></a></div>
												<div style="width: 240px; float: right;" class="gr2"><a href="#">${orderItem.product_name }</a>
												<span class="gr3">X${orderItem.quantity }</span>
												</div>
												<div style="clear: both;"></div>
												
											</div>
										</c:if>
									</c:forEach>	
									</div>
									<div class="ci2">${userSession.username }</div>
									<div class="ci3"><b>￥${order.payment }</b><p>
									<c:if test="${order.payment_type == 1 }">
										在线支付
									</c:if>
									<c:if test="${order.payment_type == 2 }">
										货到付款
									</c:if>
									</p><p class="iphone">手机订单</p></div>
									<div class="ci4"><p><fmt:formatDate value="${order.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/></p></div>
									<div class="ci5"><p>
									<c:if test="${order.status == 0 }">
										已取消
									</c:if>
									<c:if test="${order.status == 10 }">
										未付款
									</c:if>
									<c:if test="${order.status == 20 }">
										已付款取消
									</c:if>
									<c:if test="${order.status == 40}">
										已发货
									</c:if>
									<c:if test="${order.status ==50 }">
										交易成功
									</c:if>
									<c:if test="${order.status ==60 }">
										交易关闭
									</c:if>
									</p> <p><a onclick="moreAc(${order.order_no})">订单详情</a></p></div>
									<div class="ci5 ci8"><p><a href="#">查看</a> | <a href="#">删除</a></p> <p></p><p><a href="#" class="member-touch">确认收货</a></p></div>
								</div>
							</li>
						</c:forEach>
							
						</ul>
					</div>
				</div>
				<div class="H-over member-over" style="display:none;"><h2>待发货</h2></div>
				<div class="H-over member-over" style="display:none;"><h2>待收货</h2></div>
				<div class="H-over member-over" style="display:none;"><h2>交易完成</h2></div>
				<div class="H-over member-over" style="display:none;"><h2>订单信息</h2></div>







				<div class="clearfix" style="padding:30px 20px;">
					<div class="fr pc-search-g pc-search-gs">
						<a style="display:none" class="fl " href="#">上一页</a>
						<a href="${ctx}/order/myorder.shtml?pageIndex=1" class="current">1</a>
						<a href="${ctx}/order/myorder.shtml?pageIndex=2">2</a>
						<a href="${ctx}/order/myorder.shtml?pageIndex=3">3</a>
						<a href="${ctx}/order/myorder.shtml?pageIndex=4">4</a>
						<a href="${ctx}/order/myorder.shtml?pageIndex=5">5</a>
						<a href="${ctx}/order/myorder.shtml?pageIndex=6">6</a>
						<a href="${ctx}/order/myorder.shtml?pageIndex=7">7</a>
						<span class="pc-search-di">…</span>
						<a href="javascript:;">1088</a>
						<a title="使用方向键右键也可翻到下一页哦！" class="" href="javascript:;">下一页</a>
					</div>
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
<script type="text/javascript">
function moreAc(order_no){
	//iframe窗
	layer.open({
	  type: 2,
	  title: false,
	 // closeBtn: 0, //不显示关闭按钮
	  shade: [0],
	  area: ['1040px', '515px'],
	 // offset: 'rb', //右下角弹出
	 // time: 2000, //2秒后自动关闭
	  anim: 2,
	  content: ['${ctx}/backOrder/findOrderItem.action?order_no='+order_no, 'yes'], //iframe的url，no代表不显示滚动条
	  /* end: function(){ //此处用于演示
	    layer.open({
	      type: 2,
	      title: '很多时候，我们想最大化看，比如像这个页面。',
	      shadeClose: true,
	      shade: false,
	      maxmin: true, //开启最大化最小化按钮
	      area: ['893px', '600px'],
	      content: '//fly.layui.com/'
	    });
	  } */
	})
};
</script>
</body>
</html>
