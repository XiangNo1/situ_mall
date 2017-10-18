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
		
		
		             <form action="${ctx}/slideshow/updateSlideshow2.action" method="post" enctype="multipart/form-data" id="form-add">
		   	 id<input name="id" class="form-control" value="${slideshow.id }" readonly="readonly" />
			         链接地址:<input id="link" name="link"  class="form-control" value="${slideshow.link }">
			    轮播图状态：    <select name="status"  class="form-control" id="status">
			         	<option value="1">显示</option>
			         	<option value="2">隐藏</option>
			         </select>
			   <div>
			   插入图片：
		           <img alt="" id="imgId" src="/pic/${slideshow.uri }" width=100 height=100>
		           <input type="hidden" name="uri" id="uri"/>
		           <input type="file" name="pictureFile" onchange="uploadPic();"/>
		       </div>
		       <p><button class="btn btn-primary" type="submit">保存</button></p>
   		 </form>
					   
					    
					   
		            
		        
		        </div>
		    </div>
		</div>
		
	<script>
	
	$(function(){
	    $("#status option[value='${slideshow.status}']").prop("selected", true);
	 });
	
	function uploadPic() {
		   //定义参数
		   var options = {
		       url:"${ctx}/upload/uploadPic.action",
		       dataType:"json",
		       type:"post",
		       success: function(data) {
		           $("#imgId").attr("src",data.filePath);
		           $("#uri").val(data.fileName);
		       }
		   };
		    $("#form-add").ajaxSubmit(options);
		}
	

</script>	
	</body>
</html>