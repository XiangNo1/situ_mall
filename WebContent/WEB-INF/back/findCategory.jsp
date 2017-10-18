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
						                  <!--   <th><input type="checkbox" onclick="selectAll()" id="selectAlls"/></th> -->
						                        <th>类别id</th>
												<th>父类id</th>
												<th>类别名称</th>
												<th>类别状态</th>
												<!-- <th>排序编号</th> -->
												<th>创建时间</th>
												<th>更新时间</th>
						                    </tr>
						                </thead>
						                <tbody>
						                    
								<c:forEach items="${pageBean.list}" var="category">
									<tr>
								<%-- 	<td><input type="checkbox" name="selectIds" value="${category.id }"/></td> --%>
										<td>${category.id}</td>
										<td>${category.parent_id }</td>
										<td>${category.name }</td>
										<td>${category.status}</td>
										<%-- <td>${category.sort_order}</td> --%>
										<td>
										<fmt:formatDate value="${category.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td>
										<fmt:formatDate value="${category.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td><a href="javascript:delCategory(${category.id });">删除</a></td>
										<td><a href="${ctx }/category/updateCategory.action?id=${category.id}">修改</a></td>
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
		                 <a href="${ctx}/category/findAllCategory.action?pageIndex=${pageBean.pageIndex-1}" aria-label="Previous">
		                   <span aria-hidden="true">&laquo;</span>
		                 </a>
		              </li>
		           </c:if>

			   <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
              <c:if test="${pageBean.pageIndex!=page}">
                   <li><a href="${ctx}/category/findAllCategory.action?pageIndex=${page}">${page}</a></li>
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
		                 <a href="${ctx}/category/findAllCategory.action?pageIndex=${pageBean.pageIndex+1}" aria-label="Previous">
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
	
	function delCategory(id) {
	       var isDel = confirm("您确认要删除吗？");
	       if (isDel) {
	    	 //要删除
		          var options = {
				url:"${ctx}/category/deleteCategory.action",
				type:"post",
				dateType:"json",
				data:'id='+id,
				success:function(data){
					if(data.status == 0){
						layer.confirm(
	            				'删除成功',
	            				{btn:['关闭']},
	            				function(){
	            					window.location.href = "${ctx}/category/findAllCategory.action";
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