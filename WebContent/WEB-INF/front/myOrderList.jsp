<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>靓淘优选</title>
<%@include file="../common/head_front.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/front/css/Style.css" />
</head>

<body>
<div class="bg-box">
<div class="box-center">
		<%@include file="index_head.jsp" %>
		<%@include file="index_head2.jsp" %>
   
</div>
<div class="clearfix"></div>

<div class="box-center">
									 <table class="table">
						                <thead>
						                    <tr>
						                        <th>id</th>
												<th>订单号</th>
												<th>用户id</th>
												<th>shipping—id</th>
												<th>实际付款金额</th>
												<th>支付类型</th>
												<th>运费</th>
												<th>订单状态</th>
												<th>支付时间</th>
												<th>发货时间</th>
												<th>交易完成时间</th>
												<th>交易关闭时间</th>
												<th>创建时间</th>
												<th>修改时间</th>
						                    </tr>
						                </thead>
						                <tbody>
						                    
								<c:forEach items="${pageBean.list}" var="orderr">
									<tr>
										<td>${orderr.id}</td>
										<td>${orderr.order_no }</td>
										<td>${orderr.user_id }</td>
										<td>${orderr.shipping_id}</td>
										<td>${orderr.payment}</td>
										<td>${orderr.payment_type}</td>
										<td>${orderr.postage}</td>
										<td>${orderr.status}</td>
										<td>
										<fmt:formatDate value="${orderr.payment_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${orderr.send_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${orderr.end_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${orderr.close_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${orderr.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${orderr.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td><a onclick="moreAc(${orderr.order_no})">详细信息</a></td>										
									</tr>
								</c:forEach>
						                </tbody>
						            </table>

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
