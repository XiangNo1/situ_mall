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
        <li class="active"><a href="${ctx}/product/findAllProduct.action"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 商品管理 <span class="sr-only">(current)</span></a></li>
        <li><a href="${ctx}/category/findAllCategory.action"> <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 分类管理 </a></li>
        <li><a href="${ctx}/banji/findKecheng.action"> <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> xx管理 </a></li>
        <li><a href="${ctx}/banji/findJiaowu.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> xx管理 </a></li>
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
		                <a href="${ctx}/product/findAllProduct.action" class="list-group-item active">商品管理</a>
		                <a href="${ctx}/product/addProduct.action" class="list-group-item">添加商品</a>
		                
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${ctx}/product/findAllProduct.action">商品管理</a>
		                </li>
		                <li>
		                	<a href="${ctx}/product/addProduct.action">添加商品</a>
		                </li>
		                <li><input  class="btn btn-primary" type="button" onclick="deleteAll()" value="批量删除"/></li>
		            </ul>
		            <div class="alert alert-info" role="alert">删除前请认真核对商品的信息<strong>确保无误</strong></div>
					    
					    <form id="searchForm" class="container" action="${ctx}/product/searchProductByCondition.action" method="post">
					    	<input type="hidden" name="pageIndex" id="pageIndex" />
					  	 	    请输入要查询的商品分类id:<input type="text" name="category_id" value="${searchCondition.product.category_id}"/>
					           	&nbsp;&nbsp;&nbsp;
					      	 <button class="btn btn-primary">搜索</button>
					    </form>
					    
					    <form id="mainForm" action="" method="post">
						            <table class="table">
						                <thead>
						                    <tr>
						                    <th><input type="checkbox" onclick="selectAll()" id="selectAlls"/></th>
						                        <th>商品id</th>
												<th>分类id</th>
												<th>商品名称</th>
<!-- 												<th>商品副标题</th>
												<th>产品主图地址</th>
												<th>图片地址</th>
												<th>商品详情</th>
 -->												<th>价格</th>
												<th>库存数量</th>
												<th>商品状态</th>
												<th>创建时间</th>
												<th>更新时间</th>
												<th>状态设置</th>
												<th>删除</th>
												<th>修改</th>
						                    </tr>
						                </thead>
						                <tbody>
						                    
								<c:forEach items="${pageBean.list}" var="product">
									<tr>
									<td><input type="checkbox" name="selectIds" value="${product.id }"/></td>
										<td>${product.id}</td>
										<td>${product.category_id }</td>
										<td>${product.name }</td>
<%-- 										<td>${product.subtitle}</td>
										<td>${product.main_image}</td>
										<td>${product.sub_images}</td>
										<td>${product.detail}</td>
 --%>										<td>${product.price}</td>
										<td>${product.stock}</td>
										<c:if test="${product.status==1}">
										<td>在售</td>
										</c:if>
										<c:if test="${product.status==2}">
										<td>下架</td>
										</c:if>
										
										<td>
										<fmt:formatDate value="${product.create_time}" pattern="yyyy-MM-dd hh:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${product.update_time}" pattern="yyyy-MM-dd hh:mm:ss"/>
										</td>
										
										<c:if test="${product.status==1}">
										<td><a href="${ctx }/product/updateStatusProduct.action?id=${product.id}&status=2">下架</a></td>
										</c:if>
										<c:if test="${product.status==2}">
										<td><a href="${ctx }/product/updateStatusProduct.action?id=${product.id}&status=1">上架</a></td>
										</c:if>
										
										<td><a href="javascript:delProduct(${product.id });">删除</a></td>
										<td><a href="${ctx }/product/updateProduct.action?id=${product.id}">修改</a></td>
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
		                 <a href="javascript:goPage('${pageBean.pageIndex-1}');" aria-label="Previous">
		                   <span aria-hidden="true">&laquo;</span>
		                 </a>
		              </li>
		           </c:if>

			   <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
              <c:if test="${pageBean.pageIndex!=page}">
                   <li><a href="javascript:goPage('${page}');">${page}</a></li>
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
		                 <a href="javascript:goPage('${pageBean.pageIndex+1}');" aria-label="Previous">
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
	
	function goPage(pageIndex){
		$("#pageIndex").val(pageIndex);
		$("#searchForm").submit();
	}
	
	function delProduct(id) {
	       var isDel = confirm("您确认要删除吗？");
	       if (isDel) {
	           //要删除
	           location.href = "${ctx}/product/deleteProduct.action?id="
	                  + id;
	       }
	    };
	function selectAll() {
		
		$("input[name=selectIds]").prop('checked',$("#selectAlls").is(":checked"))
	};
	
	function deleteAll() {
		 var isDel = confirm("您确认要删除吗？");
		    if (isDel) {
		       //要删除
		       $("#mainForm").attr("action", "${ctx}/product/deleteAllProduct.action");
		       $("#mainForm").submit();
		    }

	};

</script>	
	</body>
</html>