<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>靓淘优选</title>
<%@include file="../common/head_front.jsp" %>
<link rel="stylesheet" href="${ctx }/resources/thirdlib/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="${ctx}/resources/front/css/Style.css" />
<style type="text/css">
body{
	background-color:white;}
</style>

</head>

<body>
<div class="bg-box">
<div class="box-center">
		<%@include file="index_head.jsp" %>
		<%@include file="index_head2.jsp" %>
</div>
<div class="box6">
	<div class="box-center">
    	<ul class="ul6">
        	<li><a class="current" href="${ctx }/index/index.shtml">商城首页</a></li>
        	<li><a href="">美妆商城</a></li>
        	<li><a href="">服装运动</a></li>
        	<li><a href="">家电数码</a></li>
        	<li><a href="">家装家纺</a></li>
        	<li><a href="">淘遍美食</a></li>
        	<li><a href="">国际经营</a></li>
    		<div class="clearfix"></div>
        </ul>
    </div>
</div>
	


<div class="box-center">
				<div style="margin-left: 40px;"><br/>
  			<c:forEach items="${categories }" var="category">
  				<span style="margin-right:50px; line-height: 20px; font-size: 24px">${category.name }</span>
  				<c:forEach items="${category.list }" var="category2">
  					<a style=" line-height: 20px; font-size: 18px" href="${ctx }/details/details1.shtml?id=${category2.id }&parent_id=${category2.parent_id }">${category2.name }</a>
  				</c:forEach>
  				<br/><br/>
  			</c:forEach>
  			<br/>
  			      			<%-- <span style="margin-right:50px; line-height: 20px; font-size: 24px">当前：${category.name}</span>	 --%>
      				</div>
      				
      				
      				<div style="width: 910px; float: right;">
					<c:forEach items="${pageBean.list}" var="product">
						<a onmouseover="inn(${product.id})" onmouseout="outt(${product.id})" href="${ctx }/details/details2.shtml?id=${product.id}">
							<div style="margin-right:50px; margin-left:50px; margin-top:40px; width: 200px; height: 350px; float:left;" >
								<img id="img${product.id}" alt="" src="/pic/${product.main_image}" width="180px" height="200px">
								<br/>
								<h5>${product.name }</h5><div class="clearfix"></div>
								<p style="color:red;">价格：￥${product.price}</p><div class="clearfix"></div>
							</div>
						</a>
					</c:forEach>
						</div>
					<div class="clearfix"></div>
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
		                 <a href="${ctx}/details/details1.shtml?pageIndex=${pageBean.pageIndex-1}&id=${id}&product_name=${product_name}" aria-label="Previous">
		                   <span aria-hidden="true">&laquo;</span>
		                 </a>
		              </li>
		           </c:if>

			   <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
              <c:if test="${pageBean.pageIndex!=page}">
                   <li><a href="${ctx}/details/details1.shtml?pageIndex=${page}&id=${id}&product_name=${product_name}">${page}</a></li>
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
		                 <a href="${ctx}/details/details1.shtml?pageIndex=${pageBean.pageIndex+1}&id=${id}&product_name=${product_name}" aria-label="Previous">
		                   <span aria-hidden="true">&raquo;</span>
		                 </a>
		              </li>
		           </c:if>
			  </ul>
				</nav>
				<!-- 分页结束 -->
			</div>
		</div>
<div class="clearfix"></div>



 			
	<div class="box-center">
	 <div class="box20">
    	<ul>
        	<li class="b20l1">
            	<span>
                	<p>品质保障</p>
                    <p>品质护航 购物无忧</p>
                </span>
            </li>
        	<li class="b20l2">
            	<span>
                	<p>特色服务体验</p>
                    <p>为您呈现不一样的服务</p>
                </span>
            </li>
        	<li class="b20l3">
            	<span>
                	<p>帮助中心</p>
                    <p>您的购物指南</p>
                </span>
            </li>
        	<li class="b20l4">
            	<span>
                	<p>七天无理由退换货</p>
                    <p>为您提供售货物有保障</p>
                </span>
            </li>
        </ul>
    </div>
    <div class="box22">
    	<ul class="b22u1">
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">购物指南</a></li>	
                	<li><a class="b22a2" href="">免费注册</a></li>	
                	<li><a class="b22a2" href="">开通支付宝</a></li>	
                	<li><a class="b22a2" href="">支付宝充值</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">品质保障</a></li>	
                	<li><a class="b22a2" href="">发票保障</a></li>	
                	<li><a class="b22a2" href="">售后规则</a></li>	
                	<li><a class="b22a2" href="">缺货赔付</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">支付方式</a></li>	
                	<li><a class="b22a2" href="">快捷支付</a></li>	
                	<li><a class="b22a2" href="">信用卡</a></li>	
                	<li><a class="b22a2" href="">货到付款</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">商家服务</a></li>	
                	<li><a class="b22a2" href="">商家入驻</a></li>	
                	<li><a class="b22a2" href="">商家中心</a></li>	
                	<li><a class="b22a2" href="">运营服务</a></li>	
                </ul>
            </li>
        	<li>
            	<ul>
                	<li><a class="b22a1" href="">&nbsp;手机靓淘</a></li>
                    <li><img src="${ctx}/resources/front/image/saoma1.png" width="65px" height="65px"></li>
                </ul>
            </li>
        </ul>
        </div>
    </div>
     <div class="box21">
    	<ul>
        	<li><a href="">关于靓淘</a></li>
        	<li><a href="">帮助中心</a></li>
        	<li><a href="">开放平台</a></li>
        	<li><a href="">诚聘精英</a></li>
        	<li><a href="">联系我们</a></li>
        	<li><a href="">网站合作</a></li>
        	<li><a href="">法律声明及隐私政策</a></li>
        	<li><a href="">知识产权</a></li>
        	<li><a href="">廉政举报</a></li>
        	<li><a href="">规则意见征集</a></li>
        </ul>
    </div>
    <div class="box23">
    	<p>COPYRIGHT 2010-2017 北京创锐文化传媒有限公司 JUMEI.COM 保留一切权利。客服热线：400-123-8888</p>
        <p>京公网安备 11010102001226|京ICP证111033号|食品流通许可证 SP1101051110165515（1-1）|执业营照</p>
    </div>
    
    </div>
    <script type="text/javascript">
    //hover 触发两个事件，鼠标移上去和移走
    //mousehover 只触发移上去事件
    function inn(id) {
    	$("#img"+id).width(190);
    	$("#img"+id).height(210);
    };
    function outt(id) {
    	$("#img"+id).width(180);
    	$("#img"+id).height(200);
    };
    
    
    </script>
</body>
</html>
