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
		                <li><input  class="btn btn-primary" type="button" onclick="upAll()" value="批量上架"/></li>
		                <li><input  class="btn btn-primary" type="button" onclick="downAll()" value="批量下架"/></li>
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
												<th>商品详情</th>
-->												<th>图片</th>
 												<th>价格</th>
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
										<td>${product.sub_images}</td>
										<td>${product.detail}</td>
 --%>									
 										
										<td>
										<img alt="[无图]" src="${product.fullUrl}" width="50" height="50">
										</td>
 										<td>${product.price}</td>
										<td>${product.stock}</td>
										<c:if test="${product.status==1}">
										<td>在售</td>
										</c:if>
										<c:if test="${product.status==2}">
										<td>下架</td>
										</c:if>
										
										<td>
										<fmt:formatDate value="${product.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${product.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										
										<c:if test="${product.status==1}">
										<td><a href="${ctx }/product/updateStatusProduct.action?id=${product.id}&status=2&pageIndex=${pageBean.pageIndex}">下架</a></td>
										</c:if>
										<c:if test="${product.status==2}">
										<td><a href="${ctx }/product/updateStatusProduct.action?id=${product.id}&status=1&pageIndex=${pageBean.pageIndex}">上架</a></td>
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
		          var options = {
				url:"${ctx}/product/deleteProduct.action",
				type:"post",
				dateType:"json",
				data:'id='+id,
				success:function(data){
					if(data.status == 0){
						layer.confirm(
	            				'删除成功',
	            				{btn:['关闭']},
	            				function(){
	            					window.location.href = "${ctx}/product/findAllProduct.action";
	            				}
	            			);
					}else {
						layer.msg("删除失败");
					}
				}
			}
			$.ajax(options)
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
	function upAll() {
		 var isDel = confirm("您确认要上架吗？");
		    if (isDel) {
		       //要删除
		       $("#mainForm").attr("action", "${ctx}/product/upAllProduct.action");
		       $("#mainForm").submit();
		    }
	};
	function downAll() {
		 var isDel = confirm("您确认要下架吗？");
		    if (isDel) {
		       //要删除
		       $("#mainForm").attr("action", "${ctx}/product/downAllProduct.action");
		       $("#mainForm").submit();
		    }
	};

</script>	
	</body>
</html>