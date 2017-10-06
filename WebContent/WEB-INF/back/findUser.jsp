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
        <li class="active"><a href="${ctx}/user/findUser.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 用户管理 </a></li>
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
		                <a href="${ctx}/user/findUser.action" class="list-group-item active">用户管理</a>
		                <a href="${ctx}/user/addUser.action" class="list-group-item">添加用户</a>
		                
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${ctx}/user/findUser.action">用户管理</a>
		                </li>
		                <li>
		                	<a href="${ctx}/user/addUser.action">添加用户</a>
		                </li>
		            </ul>
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