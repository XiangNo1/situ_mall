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
		
		            <div class="alert alert-info" role="alert">删除前请认真核对图片的信息<strong>确保无误</strong></div>
					    <table class="table">
					    	<tr>
					    		<td>id</td>
					    		<td>图片名称</td>
					    		<td>图片链接地址</td>
					    		<td>示意图</td>
					    		<td>图片状态</td>
					    		<td>创建时间</td>
					    		<td>修改时间</td>
					    		<td>删除</td>
					    		<td>修改</td>
					    	</tr>
					    	<c:forEach items="${list}" var="slideshow">
					    	<tr>
					    		<td>${slideshow.id }</td>
					    		<td>${slideshow.uri }</td>
					    		<td>${slideshow.link }</td>
					    		<td>
					    		<img alt="[无图]" src="/pic/${slideshow.uri }" width="100" height="50"/>
					    		</td>
					    		<td>
					    		<c:if test="${slideshow.status == 1 }">
					    			<a href="${ctx}/slideshow/updateSlideshowStatus.action?status=2&id=${slideshow.id }">显示</a>
					    		</c:if>
					    		<c:if test="${slideshow.status == 2 }">
					    			<a href="${ctx}/slideshow/updateSlideshowStatus.action?status=1&id=${slideshow.id }">隐藏</a>
					    		</c:if>
					    		</td>
					    		<td>
								<fmt:formatDate value="${slideshow.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td>
								<fmt:formatDate value="${slideshow.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
					    		<td><a href="javascript:delSlideshow(${slideshow.id})">删除</a></td>
					    		<td><a href="${ctx}/slideshow/updateSlideshow.action?id=${slideshow.id}">修改</a></td>
					    	</tr>
					    	
					    	</c:forEach>
					    
					    </table>
					   
					    
					   
		            
		        
		        </div>
		    </div>
		</div>
		
	<script>
	
	
	function delSlideshow(id) {
	       var isDel = confirm("您确认要删除吗？");
	       if (isDel) {
	           //要删除
	           location.href = "${ctx}/slideshow/deleteSlideshow.action?id="
	                  + id;
	       }
	    };
	
</script>	
	</body>
</html>