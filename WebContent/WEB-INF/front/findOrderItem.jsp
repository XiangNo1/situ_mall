<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="../common/head.jsp" %>
</head>
<body>
<table class="table">
				<tr>
					<th>id</th>
					<th>用户id</th>
					<th>订单号</th>
					<th>商品id</th>
					<th>商品名称</th>
					<th>商品图片</th>
					<th>商品单价</th>
					<th>商品数量</th>
					<th>商品总价</th>
					<th>创建时间</th>
					<th>修改时间</th>
              </tr>
              
			<c:forEach items="${list}" var="orderItem">
				<tr>
					<td>${orderItem.id}</td>
					<td>${orderItem.user_id }</td>
					<td>${orderItem.order_no }</td>
					<td>${orderItem.product_id}</td>
					<td>
					<c:if test="${fn:length(orderItem.product_name) > 3 }">
						${fn:substring(orderItem.product_name,0,20)}...
					</c:if>
					<c:if test="${fn:length(orderItem.product_name)  <= 3 }">
						${orderItem.product_name}
					</c:if>
					<td>
						<img alt="" src="/pic/${orderItem.product_image}" width="100" height="100">
					</td>
					<td>${orderItem.current_unit_price}</td>
					<td>${orderItem.quantity}</td>
					<td>${orderItem.total_price}</td>
					<td>
					<fmt:formatDate value="${orderItem.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
					<fmt:formatDate value="${orderItem.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
				</tr>
			</c:forEach>
</table>
</body>
</html>