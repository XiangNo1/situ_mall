<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
		<title></title>
	</head>
	<body>
	<%@include file="../common/head.jsp" %>
		<div class="container-fluid">
		
		<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">商城后台管理系统</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="${ctx}/product/findAllProduct.action"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 商品管理 <span class="sr-only">(current)</span></a></li>
        <li><a href="${ctx}/category/findAllCategory.action"> <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 分类管理 </a></li>
        <li><a href="${ctx}/slideshow/findSlideshow.action"> <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 轮播图管理 </a></li>
        <li><a href="${ctx}/user/findUser.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 用户管理 </a></li>
        <li><a href="${ctx}/shipping/findShipping.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 收货地址管理 </a></li>
        <li class="active"><a href="${ctx}/backOrder/findBackOrder.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 订单管理 </a></li>
        <li><a href="#"> 欢迎回来:${accounts.name }</a> </li>
        
        
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${ctx }/student/loginout.action"> 退出登陆</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin <span class="caret"></span></a>
          <ul class="dropdown-menu">
          			<li><a href="#">帐号： ${accounts.name }   密码:  ${accounts.password }</a></li>
          
          <%-- <c:forEach items="${onlineStudentList }" var="accounts">
			<li><a href="#">帐号： ${accounts.name }   密码:  ${accounts.password }</a></li>
		  </c:forEach> --%>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
		
		
		
		
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${ctx}/backOrder/findBackOrder.action" class="list-group-item active">订单管理</a>
		                
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${ctx}/backOrder/findBackOrder.action">订单管理</a>
		                </li>
		                <!-- <li><input  class="btn btn-primary" type="button" onclick="deleteAll()" value="批量删除"/></li> -->
		            </ul>
		            <div class="alert alert-info" role="alert">删除前请认真核对地址的信息<strong>确保无误</strong></div>
					    
					    <form id="mainForm" action="" method="post">
						            <table class="table">
						                <thead>
						                    <tr>
						                  <!--   <th><input type="checkbox" onclick="selectAll()" id="selectAlls"/></th> -->
						                        <th>id</th>
												<th>订单号</th>
												<th>用户id</th>
												<th>收货id</th>
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
								<%-- 	<td><input type="checkbox" name="selectIds" value="${category.id }"/></td> --%>
										<td>${orderr.id}</td>
										<td>${orderr.order_no }</td>
										<td>${orderr.user_id }</td>
										<td>${orderr.shipping_id}</td>
										<td>${orderr.payment}</td>
										<td>
											<c:if test="${orderr.payment_type == 1}">
												在线支付
											</c:if>
											<c:if test="${orderr.payment_type == 2}">
												货到付款
											</c:if>
										</td>
										<td>${orderr.postage}</td>
										<td>
											<c:if test="${orderr.status == 0 }">
											已取消
											</c:if>
											<c:if test="${orderr.status == 10 }">
												未付款
											</c:if>
											<c:if test="${orderr.status == 20 }">
												已付款取消
											</c:if>
											<c:if test="${orderr.status == 40}">
												已发货
											</c:if>
											<c:if test="${orderr.status ==50 }">
												交易成功
											</c:if>
											<c:if test="${orderr.status ==60 }">
												交易关闭
											</c:if>
										</td>
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
										<td><a href="javascript:delShipping(${shipping.id });">删除</a></td>
										<td><a href="${ctx }/backOrder/updateBackOrder.action?id=${orderr.id}">修改</a></td>
										<td><a onclick="moreAc(${orderr.order_no})">详细信息</a></td>										
									</tr>
								</c:forEach>
						                </tbody>
						            </table>
		            
		            </form>
		            
		            <!-- 分页开始 -->
				<nav aria-label="Page navigation" class="pull-right">
				 <ul class="pagination">
			    <c:if test="${pageBean.pageIndex==1}">
		              <li class="disabled">
		                 <a href="javascript:void(0);" aria-label="Previous">
		                   <span aria-hidden="true">&laquo;</span>
		                 </a>
		              </li>
          		 </c:if>
		           <c:if test="${pageBean.pageIndex!=1}">
		              <li>
		                 <a href="${ctx}/backOrder/findBackOrder.action?pageIndex=${pageBean.pageIndex-1}" aria-label="Previous">
		                   <span aria-hidden="true">&laquo;</span>
		                 </a>
		              </li>
		           </c:if>

			   <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
              <c:if test="${pageBean.pageIndex!=page}">
                   <li><a href="${ctx}/backOrder/findBackOrder.action?pageIndex=${page}">${page}</a></li>
              </c:if>
              <!-- 遍历的时候page和pageIndex相等，高亮显示 -->
              <c:if test="${pageBean.pageIndex==page}">
                   <li class="active"><a href="javascript:void(0);">${page}</a></li>
              </c:if>
           </c:forEach>

			  
			   
			 <c:if test="${pageBean.pageIndex == pageBean.totalPage}">
		              <li class="disabled">
		                 <a href="javascript:void(0);" aria-label="Previous">
		                   <span aria-hidden="true">&raquo;</span>
		                 </a>
		              </li>
          		 </c:if>
		           <c:if test="${pageBean.pageIndex!=pageBean.totalPage}">
		              <li>
		                 <a href="${ctx}/backOrder/findBackOrder.action?pageIndex=${pageBean.pageIndex+1}" aria-label="Previous">
		                   <span aria-hidden="true">&raquo;</span>
		                 </a>
		              </li>
		           </c:if>
			 
			 
			 
			  </ul>
				</nav>
				<!-- 分页结束 -->
		        </div>
		    </div>
		</div>
		
	<script>
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
	});
}	
	
	function delShipping(id) {
	       var isDel = confirm("您确认要删除吗？");
	       if (isDel) {
	           //要删除
	           location.href = "${ctx}/shipping/deleteShipping.action?id="
	                  + id;
	       }
	    };
	/* function selectAll() {
		
		$("input[name=selectIds]").prop('checked',$("#selectAlls").is(":checked"))
	}; */
	
	/* function deleteAll() {
		 var isDel = confirm("您确认要删除吗？");
		    if (isDel) {
		       //要删除
		       $("#mainForm").attr("action", "${ctx}/student/deleteAllStudent.action");
		       $("#mainForm").submit();
		    }

	}; */

</script>	
	</body>
</html>