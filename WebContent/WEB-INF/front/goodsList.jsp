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
		<div class="box1"><span class="wel">欢迎来到靓淘！<a href="${ctx }/index/index.shtml"> 首页</a></span></div>
		<div class="box2">
        	<ul>
        	<c:if test="${userSession != null }">
            	<li><a class="login">欢迎回来 ： ${userSession.username} </a>
            		<a  href="${ctx }/login/loginOut.shtml">退出登录</a>
            	</li>
        	</c:if>
        	
        	<c:if test="${userSession == null }">
            	<li><a class="login" href="${ctx }/login/login.shtml">请登录</a></li>
        	</c:if>
            	<li><a href="${ctx }/login/register.shtml">快速注册</a></li>
            	<li><a class="collect" href="">我的收藏</a></li>
            	<li><a class="order" href="">我的订单</a></li>
            	<li><a class="phone" href="">手机靓淘</a></li>
            	<li><a href="">我的积分</a></li>
            	<li><a href="">我的评价</a></li>
            </ul>
        </div>
   	 	<div class="clearfix"></div>
    <div class="box3"><img src="${ctx}/resources/front/image/LOGO.png" width="110%" height="110%"></div>
    <div class="box4">
    			 <input class="btn1" type="text" placeholder="洗面奶">
        		 <input class="btn2" type="button" value="搜索">
				<ul class="nav">
                	<li><a href="" style="color:#F41443;">保湿&nbsp;|</a></li>
                	<li><a href="">面膜&nbsp;|</a></li>
                	<li><a href="">洗面奶&nbsp;|</a></li>
                	<li><a href="">补水&nbsp;|</a></li>
                	<li><a href="">香水&nbsp;|</a></li>
                	<li><a href="">眼霜&nbsp;|</a></li>
                	<li><a href="">口红&nbsp;|</a></li>
                	<li><a href="">护肤套装&nbsp;|</a></li>
                	<li><a href="">BB霜&nbsp;|</a></li>
                </ul>
    </div>
    	<div class="box5">
        	<a href="" class="box5-2"><span class="box5-1">去购物车结算</span></a>
       		<div class="box5-3"></div>
        </div>
    <div class="clearfix"></div>
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
  			      			<span style="margin-right:50px; line-height: 20px; font-size: 24px">当前：${category.name}</span>	
      				</div>
      				
      				
      				<div>
					<c:forEach items="${pageBean.list}" var="product">
						<a href="${ctx }/details/details2.shtml?id=${product.id}">
							<div style="margin-right:20px; margin-left:40px; margin-top:40px; width: 200px; height: 350px; float:left;" >
								<img alt="" src="/pic/${product.main_image}" width="180px" height="200px">
								<br/>
								<h5>${product.name }</h5>
								<p style="color:red;">价格：￥${product.price}</p>
							</div>
						</a>
					</c:forEach>
						</div>
					<div class="clearfix"></div>
						<!-- 分页开始 -->
					
				<nav aria-label="Page navigation" class="pull-left">
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
		                 <a href="${ctx}/details/details1.shtml?pageIndex=${pageBean.pageIndex-1}&id=${id}" aria-label="Previous">
		                   <span aria-hidden="true">&laquo;</span>
		                 </a>
		              </li>
		           </c:if>

			   <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
              <c:if test="${pageBean.pageIndex!=page}">
                   <li><a href="${ctx}/details/details1.shtml?pageIndex=${page}&id=${id}">${page}</a></li>
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
		                 <a href="${ctx}/details/details1.shtml?pageIndex=${pageBean.pageIndex+1}&id=${id}" aria-label="Previous">
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
</body>
</html>
