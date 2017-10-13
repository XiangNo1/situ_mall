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
	<%@include file="../common/head.jsp" %>
			<link href="${ctx}/resources/thirdlib/kindeditor/themes/default/default.css" type="text/css" rel="stylesheet">
 <script type="text/javascript" charset="utf-8" src="${ctx}/resources/thirdlib/kindeditor/kindeditor-all-min.js"></script>
 <script type="text/javascript" charset="utf-8" src="${ctx}/resources/thirdlib/kindeditor/lang/zh_CN.js"></script>
	
	</head>
	<body>
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
        <li><a href="${ctx}/slideshow/findSlideshow.action"> <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 轮播图管理 </a></li>
        <li><a href="${ctx}/user/findUser.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 用户管理 </a></li>
        <li><a href="${ctx}/shipping/findShipping.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 收货地址管理 </a></li>
        <li><a href="${ctx}/backOrder/findBackOrder.action"> <span class="glyphicon glyphicon-tags" aria-hidden="true"></span> 订单管理 </a></li>
        <li><a href="#"> 欢迎回来:${accounts.name }</a> </li>
        
        
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      
        <li><a href="${pageContext.request.contextPath }/logout"> 退出登陆</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin <span class="caret"></span></a>
          <ul class="dropdown-menu">
          
          <c:forEach items="${onlineStudentList }" var="accounts">
			<li><a href="#">${accounts.name } :  ${accounts.password }</a></li>
		</c:forEach>
		
          </ul>
        </li>
        
       
        
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
		
		
		
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/student/searchByCondition.action" class="list-group-item">商品管理</a>
		                <a href="${pageContext.request.contextPath}/student/addStudent.action" class="list-group-item">添加商品</a>
		                <a href="" class="list-group-item active">修改商品</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		             <ul class="nav nav-tabs">
		                <li>
		                    <a href="${ctx}/product/findAllProduct.action">商品管理</a>
		                </li>
		                <li>
		                	<a href="${ctx}/product/addProduct.action">添加商品</a>
		                </li>
		                <li class="active">
		                	<a href="">修改商品</a>
		                </li>
		                <li><input  class="btn btn-primary" type="button" onclick="deleteAll()" value="批量删除"/></li>
		            </ul>
				   <div style="width:60%; margin-top:20px;">
		            <div class="alert alert-danger" role="alert">请注意不要添加重复id的商品！！！</div>
 <form action="${ctx}/product/updateProduct2.action" method="post" enctype="multipart/form-data" id="form-add">
   	    商品id：<input class="form-control" type="text" name="id" id="id" value="${product.id }" readonly="readonly"/><br/>
   	    当前商品分类：
   	    ${c1.name } &nbsp;&nbsp;&nbsp;${c2.name }
   	    <br/>
   	    <p>若要修改分类请选择(不修改请忽略)：</p>
   	       一级分类:
    <select class="form-control" id="province" onchange="selectCitys(this)">
       <option value="">-请选择-</option>
       
    </select>
	  二级分类:
	<select class="form-control" id="city" name="category_id">
       <option value="">-请选择-</option>
    </select>
   	    
	       商品名称：<input class="form-control" type="text" name="name" value="${product.name }"/><br/>
 	       商品副标题：<input class="form-control" type="text" name="subtitle" value="${product.subtitle }"/><br/>
<!--	          产品主图地址：<input class="form-control" type="text" name="main_image" value="${product.main_image }"/><br/>
	         图片地址:<input id="sub_images" name="sub_images"  class="form-control value="${product.sub_images }"">
	         商品详情:<input id="detail" name="detail"  class="form-control value="${product.detail }"">
 -->	 <div>      
  		修改图片：
           <img alt="" src="${product.fullUrl }" id="imgId" src="" width=100 height=100>
           <input type="hidden" name="main_image" id="main_image" value="${product.main_image }"/>
           <input type="file" name="pictureFile" onchange="uploadPic();"/>
       </div>
 		  价格:<input id="price" name="price"  class="form-control" value="${product.price }">
	         库存数量:<input id="stock" name="stock"  class="form-control" value="${product.stock }">
	           商品状态：    <select id="status" name="status"  class="form-control">
	         	<option value="1">在售</option>
	         	<option value="2">下架</option>
	         </select>
	         
	         <div class="form-group">
 				  	<label>商品图片</label>
 				  	 <a href="javascript:void(0)" class="picFileUpload" id="picFileUpload">上传图片</a>
 	                 <input type="hidden" name="sub_images" id="subImages" value="${product.sub_images }"/>
 	                 <div id="J_imageView"></div>
 				  </div>
 				  <div class="form-group">
 				  	<label>商品描述</label>
 				  	 <textarea style="width:900px;height:300px;visibility:hidden;" name="detail" value="${product.detail }"></textarea>
 				  </div>  
       <p><button class="btn btn-primary" type="submit">保存</button></p>
    </form>
</div>
</div>
</div>
<script type="text/javascript">

var myKindEditor ;
KindEditor.ready(function(K) {
	var kingEditorParams = {
			//指定上传文件参数名称
			filePostName  : "pictureFile",
			//指定上传文件请求的url。
			uploadJson : "${ctx}/upload/pic.action",
			//上传类型，分别为image、flash、media、file
			dir : "image"
	}
	var editor = K.editor(kingEditorParams);
	//多图片上传
	K('#picFileUpload').click(function() {
		editor.loadPlugin('multiimage', function() {
			editor.plugin.multiImageDialog({
				clickFn : function(urlList) {
					console.log(urlList);
					var div = K('#J_imageView');
					var imgArray = [];
					div.html('');
					K.each(urlList, function(i, data) {
						imgArray.push(data.name);
						div.append('<img src="' + data.url + '" width="80" height="50">');
					});
					$("#subImages").val(imgArray.join(","));
					editor.hideDialog();
				}
			});
		});
	});
	//富文本编辑器
	myKindEditor = KindEditor.create('#form-add[name=detail]', kingEditorParams);
});


$(function(){
    $("#status option[value='${product.status}']").prop("selected", true);
 });

$(function() {
    $.ajax({
        url:"${ctx}/product/selectProvince.action",
        dataType:"json",
        success:function(data,textStatus,ajax){
           //append_template(data, "province");
           var html = "<option>-请选择-</option>";
           for(var i=0;i<data.length;i++){
               html +="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
           }
            $("#province").html(html);
        }
    });
});
 
function selectCitys(obj) {
    var id = $(obj).val();
    //清空城市下拉框中的内容，出第一项外
    $("#city option:gt(0)").remove();
    $.ajax({
        url:"${ctx}/product/selectCitys.action",
        data:"id="+id,
        dataType:"json",
        success:function(data,textStatus,ajax){
           //alert(ajax.responseText);
           //append_template(data, "city");
           
           var html = "<option>-请选择-</option>";
           for(var i=0;i<data.length;i++){
               html +="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
           }
           $("#city").html(html);
        }
    });
}

function uploadPic() {
	   //定义参数
	   var options = {
	       url:"${ctx}/upload/uploadPic.action",
	       dataType:"json",
	       type:"post",
	       success: function(data) {
	           $("#imgId").attr("src",data.filePath);
	           $("#main_image").val(data.fileName);
	       }
	   };
	    $("#form-add").ajaxSubmit(options);
	}

</script>
		
	</body>
</html>