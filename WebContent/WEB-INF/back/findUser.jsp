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
		<div class="wrapper wrapper-content animated fadeInRight">
		            <div class="alert alert-info" role="alert">删除前请认真核对分类的信息<strong>确保无误</strong></div>
					    
					    <form id="mainForm" action="" method="post">
						            <table class="table">
						                <thead>
						                    <tr>
						                        <th>id</th>
												<th>账户名称</th>
												<th>账户密码</th>
												<th>邮箱</th>
												<th>手机号码</th>
												<th>密保问题</th>
												<th>密保答案</th>
												<th>账户类型</th>
												<th>创建时间</th>
												<th>修改时间</th>
						                    </tr>
						                </thead>
						                <tbody>
						                    
								<c:forEach items="${pageBean.list}" var="user">
									<tr>
										<td>${user.id}</td>
										<td>${user.username }</td>
										<td>${user.password }</td>
										<td>${user.email}</td>
										<td>${user.phone}</td>
										<td>${user.question}</td>
										<td>${user.answer}</td>
										<td>
										<c:if test="${user.role == 0}">管理员</c:if>
										<c:if test="${user.role == 1}">普通用户</c:if>
										</td>
										<td>
										<fmt:formatDate value="${user.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${user.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td><a href="javascript:delUser(${user.id });">删除</a></td>
										<td><a href="${ctx }/user/updateUser.action?id=${user.id}">修改</a></td>
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
		                 <a href="${ctx}/user/findUser.action?pageIndex=${pageBean.pageIndex-1}" aria-label="Previous">
		                   <span aria-hidden="true">&laquo;</span>
		                 </a>
		              </li>
		           </c:if>

			   <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
              <c:if test="${pageBean.pageIndex!=page}">
                   <li><a href="${ctx}/user/findUser.action?pageIndex=${page}">${page}</a></li>
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
		                 <a href="${ctx}/user/findUser.action?pageIndex=${pageBean.pageIndex+1}" aria-label="Previous">
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
	
	function delUser(id) {
	       var isDel = confirm("您确认要删除吗？");
	       if (isDel) {
	           //要删除
	           location.href = "${ctx}/user/deleteUser.action?id="
	                  + id;
	       }
	    };
	

</script>	
	</body>
</html>