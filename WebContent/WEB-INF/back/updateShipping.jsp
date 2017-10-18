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
		                <a href="${ctx}/shipping/findShipping.action" class="list-group-item">收货地址管理</a>
		                <a href="${ctx}/shipping/addShipping.action" class="list-group-item">添加收货地址</a>
		                <a href="${ctx}/shipping/addShipping.action" class="list-group-item active">修改收货地址</a>		                
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li>
		                    <a href="${ctx}/shipping/findShipping.action">收货地址管理</a>
		                </li>
		                <li>
		                	<a href="${ctx}/shipping/addShipping.action">添加收货地址</a>
		                </li>
		                <li class="active">
		                	<a href="${ctx}/shipping/addShipping.action">修改收货地址</a>
		                </li>
		            </ul>
				     <div style="width:60%; margin-top:20px;">
		            <div class="alert alert-danger" role="alert">修改前请仔细检查！！！</div>
						 <form action="${ctx}/shipping/updateShipping2.action" method="post">
					  	 	 id：<input class="form-control" type="text" name="id" value="${shipping.id }" readonly="readonly"/>
						   	    用户id：<input class="form-control" type="text" name="user_id" value="${shipping.user_id }"/>
						  	     收货姓名：<input class="form-control" type="text" name="receiver_name" value="${shipping.receiver_name }"/>
							      收货固定电话：<input class="form-control" type="text" name="receiver_phone" value="${shipping.receiver_phone }"/>
							      收货移动电话：<input class="form-control" type="text" name="receiver_mobile" value="${shipping.receiver_mobile }"/>
					       	       省份:<input id="status" name="receiver_province"  class="form-control" value="${shipping.receiver_province }"/>
							      城市：<input class="form-control" type="text" name="receiver_city" value="${shipping.receiver_city }"/>
							      区/县：<input class="form-control" type="text" name="receiver_district" value="${shipping.receiver_district }"/>
							      详细地址：<input class="form-control" type="text" name="receiver_address" value="${shipping.receiver_address }"/>
							      邮编：<input class="form-control" type="text" name="receiver_zip" value="${shipping.receiver_zip }"/>
						       <p><button class="btn btn-primary" type="submit">保存</button></p>
					    </form>
					</div>
		            
		            
		        </div>
		    </div>
		</div>
		
	<script>
</script>	
	</body>
</html>