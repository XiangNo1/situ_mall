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
		<div style="margin-top: 40px;" class="container-fluid">
		
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${ctx}/shipping/findShipping.action" class="list-group-item active">收货地址管理</a>
		                <a href="${ctx}/shipping/addShipping.action" class="list-group-item">添加地址</a>
		                
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${ctx}/shipping/findShipping.action">收货地址管理</a>
		                </li>
		                <li>
		                	<a href="${ctx}/shipping/addShipping.action">添加收货地址</a>
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
												<th>用户id</th>
												<th>收货人姓名</th>
												<th>收货固定电话</th>
												<th>收货移动电话</th>
												<th>省份/城市/县</th>
												<th>详细地址</th>
												<th>邮编</th>
												<th>创建时间</th>
												<th>修改时间</th>
						                    </tr>
						                </thead>
						                <tbody>
						                    
								<c:forEach items="${pageBean.list}" var="shipping">
									<tr>
								<%-- 	<td><input type="checkbox" name="selectIds" value="${category.id }"/></td> --%>
										<td>${shipping.id}</td>
										<td>${shipping.user_id }</td>
										<td>${shipping.receiver_name }</td>
										<td>${shipping.receiver_phone}</td>
										<td>${shipping.receiver_mobile}</td>
										<td>${shipping.receiver_province}/${shipping.receiver_city}/${shipping.receiver_district}</td>
										<td>${shipping.receiver_address}</td>
										<td>${shipping.receiver_zip}</td>
										<td>
										<fmt:formatDate value="${shipping.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${shipping.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td><a href="javascript:delShipping(${shipping.id });">删除</a></td>
										<td><a href="${ctx }/shipping/updateShipping.action?id=${shipping.id}">修改</a></td>
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
		                 <a href="${ctx}/shipping/findShipping.action?pageIndex=${pageBean.pageIndex-1}" aria-label="Previous">
		                   <span aria-hidden="true">&laquo;</span>
		                 </a>
		              </li>
		           </c:if>

			   <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
              <c:if test="${pageBean.pageIndex!=page}">
                   <li><a href="${ctx}/shipping/findShipping.action?pageIndex=${page}">${page}</a></li>
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
		                 <a href="${ctx}/shipping/findShipping.action?pageIndex=${pageBean.pageIndex+1}" aria-label="Previous">
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