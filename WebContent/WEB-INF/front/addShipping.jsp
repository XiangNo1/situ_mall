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
						 <form style="width: 90%;margin: 0 auto;" action="${ctx}/shipping/addShipping2.action" method="post" id="form">
						 
						  	     收货姓名：<input class="form-control" type="text" name="receiver_name"/>
							      收货固定电话：<input class="form-control" type="text" name="receiver_phone"/>
							      收货移动电话：<input class="form-control" type="text" name="receiver_mobile"/>
					       	  省份:
							    <select class="form-control" name="receiver_province" id="province" onchange="selectCitys(this)">
							       <option value="">-请选择-</option>
							    </select>
							    城市:
							    <select class="form-control" name="receiver_city" id="city" onchange="selectAreas(this)">
							       <option value="">-请选择-</option>
							    </select>
							    区域:
							    <select class="form-control" name="receiver_district" id="area">
							       <option value="">-请选择-</option>
							    </select>
					       	   
					       	 
					       	 
					       	   
					       	  <!--      省份:<input id="status" name="receiver_province"  class="form-control">
							      城市：<input class="form-control" type="text" name="receiver_city"/>
							      区/县：<input class="form-control" type="text" name="receiver_district"/> -->
							      详细地址：<input class="form-control" type="text" name="receiver_address"/>
							      邮编：<input class="form-control" type="text" name="receiver_zip"/>
						       <p><button class="btn btn-primary" type="button" onclick="submitForm()">保存</button></p>
					    </form>
		
	</body>
	<script type="text/javascript">
	
	
	
	
	$(function() {
        $.ajax({
            url:"${ctx}/province/selectProvinces.shtml",
            dataType:"json",
            success:function(data,textStatus,ajax){
               //append_template(data, "province");
               var html = "<option>-请选择-</option>";
               for(var i=0;i<data.length;i++){
                   html +="<option value='"+data[i].province+"'>"+data[i].province+"</option>";
               }
                $("#province").html(html);
            }
        });
    });
    
    function selectCitys(obj) {
        var province = $(obj).val();
        //清空城市下拉框中的内容，出第一项外
        $("#city option:gt(0)").remove();
        //清空地区下拉框中的内容，出第一项外
        $("#area option:gt(0)").remove();
        $.ajax({
            url:"${ctx}/province/selectCitys.shtml",
            data:"province="+province,
            dataType:"json",
            success:function(data,textStatus,ajax){
               //append_template(data, "city");
               
               var html = "<option>-请选择-</option>";
               for(var i=0;i<data.length;i++){
                   html +="<option value='"+data[i].city+"'>"+data[i].city+"</option>";
               }
               $("#city").html(html);
            }
        });
    }
    
    function selectAreas(obj) {
        var city = $(obj).val();
        //清空地区下拉框中的内容，出第一项外
        $("#area option:gt(0)").remove();
        $.ajax({
            url:"${ctx}/province/selectAreas.shtml",
            data:"city="+city,
            dataType:"json",
            success:function(data,textStatus,ajax){
               //append_template(data, "area");
               
               var html = "<option>-请选择-</option>";
               for(var i=0;i<data.length;i++){
                   html +="<option value='"+data[i].area+"'>"+data[i].area+"</option>";
               }
               $("#area").html(html);
            }
        });
    }
    
	
	
	
	
	
	
	
	
	
	
	
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