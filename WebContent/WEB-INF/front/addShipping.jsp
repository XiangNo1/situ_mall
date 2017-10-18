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
						 <form action="${ctx}/shipping/addShipping2.action" method="post" id="form">
						 
						  	     收货姓名：<input class="form-control" type="text" name="receiver_name"/>
							      收货固定电话：<input class="form-control" type="text" name="receiver_phone"/>
							      收货移动电话：<input class="form-control" type="text" name="receiver_mobile"/>
					       	       省份:<input id="status" name="receiver_province"  class="form-control">
							      城市：<input class="form-control" type="text" name="receiver_city"/>
							      区/县：<input class="form-control" type="text" name="receiver_district"/>
							      详细地址：<input class="form-control" type="text" name="receiver_address"/>
							      邮编：<input class="form-control" type="text" name="receiver_zip"/>
						       <p><button class="btn btn-primary" type="button" onclick="submitForm()"">保存</button></p>
					    </form>
		
	</body>
	<script type="text/javascript">
	 function submitForm() {
	        var options = {
	            url : "${ctx}/login/addShipping2.shtml",
	            type : "post",
	            dataType : "json",
	            data : $("#form").serialize(),
	            success : function(data) {
	                if (data.status == 0) {
	                    layer.msg(data.msg);
	                    //当你在iframe页面关闭自身时
	                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	                    setTimeout(function() {
	                        parent.layer.close(index); //再执行关闭 
	                        window.parent.location.reload();//刷新父页面
	                    }, 1000);
	                } else {
	                    layer.msg(data.msg);
	                }
	            }
	        };
	        $.ajax(options);
	    }
	</script>
	
</html>