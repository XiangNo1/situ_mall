<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>靓淘优选</title>
<%@include file="../common/head_front.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/front/css/Style.css" />
</head>

<body>
<div class="bg-box">
<div class="box-center">
		<div class="box1"><span class="wel">欢迎来到靓淘！ <a href="${ctx }/index/index.shtml"> 首页</a></span></div>
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
        	<a href="${ctx }/cart/cart.shtml" class="box5-2"><span class="box5-1">去购物车结算</span></a>
       		<div class="box5-3"></div>
        </div>
    <div class="clearfix"></div>
</div>
<div class="box6">
	<div class="box-center">
    	<ul class="ul6">
        	<li><a class="current" href="">商城首页</a></li>
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
<div class="box7"><span>主要市场</span></div>
<div class="clearfix"></div>
<div class="box8">
<div class="wrraper">
	<div class="box88">
	<c:forEach items="${slideshows}" var="slideshow">
	<a href="${slideshow.link }">
	   <img class="banner" src="/pic/${slideshow.uri}">
	   </a>
	</c:forEach>
	
    </div>
    </div>
	<div class="box-center8">
  		<div class="box24">
  			<c:forEach items="${categories }" var="category">
  				<span style="margin-right:50px;">${category.name }</span>
  				<c:forEach items="${category.list }" var="category2">
  					<a href="${ctx }/details/details1.shtml?id=${category2.id }&parent_id=${category2.parent_id }">${category2.name }</a>
  				</c:forEach>
  			</c:forEach>
      			
        </div>
  		<div class="box25">
        	<ul>
            	<li class="b25l1"><img src="${ctx}/resources/front/image/vip.png"></li>
                <li class="b25l2">主人好！ 欢迎来到靓淘~</li>
                <li class="b25l3"><input type="button" value="会员中心">
                </li>
            </ul>
        </div>
  		<div class="box26">
        	<ul>
                <li class="b25l11">包治百病</li>
                <li class="b25l12">17新款汇</li>
                <li class="b25l13">
                	<img src="${ctx}/resources/front/image/bag.png">
                </li>
            </ul>
        </div>
    	<div class="box40">
        	<a href="${ctx }/cart/cart.shtml">
			<ul class="b40u1">
            	<li><img src="${ctx}/resources/front/image/gouwuche.png"></li>
            	<li>购</li>
            	<li>物</li>
            	<li>车</li>
            </ul>
            </a>
			<ul class="b40u2">
            	<li><img src="${ctx}/resources/front/image/heart2.png"></li>
            	<li><img src="${ctx}/resources/front/image/shoucang.png"></li>
            	<li><img src="${ctx}/resources/front/image/time.png"></li>
            	<li><img src="${ctx}/resources/front/image/advice.png"></li>
            </ul>
            <a href="">
			<ul class="b40u3">
            	<li><img src="${ctx}/resources/front/image/top.png"></li>
            	<li>Top</li>
            </ul>
            </a>
        </div>
	</div>
        <ul class="circle">
        <c:forEach items="${slideshows }" var="slideshow">
        <li></li>
        </c:forEach>
           
        </ul>
  	<script>



$(".box88 img").hide().eq(0).show();
$(".circle li").eq(0).addClass("current");
var n=0;
function s(){
	if(n<$(".box88 img").length-1){
		n=n+1;}
		else{
			n=0;
			}
				$(".circle li").removeClass().eq(n).addClass("current")
				$(".box88 img").hide().eq(n).show();
				}
t=setInterval(s,1000)
$(".wrraper").mouseenter(
	function(){
		clearInterval(t);
		}
)
$(".wrraper").mouseleave(
	function(){
		t=setInterval(s,1000);
		}
)
$(".circle li").mouseenter(
	function(){
		n=$(this).index();
		$(".circle li").removeClass("current").eq(n).addClass("current");
		$(".box88 img").hide().eq(n).show();
	}
)
 
   </script>

</div>
<div class="box-center">
	<div class="box70">
    	<ul>
        	<li><a href="">国货品牌</a></li>
        	<li><a href="">欧美品牌</a></li>
        	<li><a href="">独家品牌</a></li>
        	<li class="b70l4"><a href="">推荐品牌</a></li>
        </ul>
    </div>
</div>
<div class="box-center" style="border-top:2px solid black;">
  <div class="box9"><img src="${ctx}/resources/front/image/41.png"></div>
    <div class="box10">
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/1.png" style="display:block">
        	<a href="" style="text-align:center;">美加净</a>
        </div>	
    	<div class="box50">
       		<img src="${ctx}/resources/front/image/2.png">
        	<a href="" style="text-align:center;">李医生</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/3.png">
        	<a href="" style="text-align:center;">自然堂</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/4.png">
        	<a href="" style="text-align:center;">佳洁士</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/32.png">
        	<a href="" style="text-align:center;">镖旗南海</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/33.png">
        	<a href="" style="text-align:center;">艺元素</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/5.png">
        	<a href="" style="text-align:center;">泊美</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/6.png">
        	<a href="" style="text-align:center;">赤道</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/7.png">
        	<a href="" style="text-align:center;">欧珀莱</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/8.png">
        	<a href="" style="text-align:center;">玉兰油</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/9.png">
        	<a href="" style="text-align:center;">丁家宜</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/11.png">
        	<a href="" style="text-align:center;">露得清</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/12.png">
        	<a href="" style="text-align:center;">宝洁</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/35.png">
        	<a href="" style="text-align:center;">波思兰迪</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/14.png">
        	<a href="" style="text-align:center;">水芝澳</a>
        </div>	
    	<div class="box50">
       		<img src="${ctx}/resources/front/image/51.png">
        	<a href="" style="text-align:center;">傲慢季节</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/47.png">
        	<a href="" style="text-align:center;">丹菲诗</a>
        </div>	
    	<div class="box50">
        	<img src="${ctx}/resources/front/image/38.png">
        	<a href="" style="text-align:center;">奥利斯</a>
        </div>	
    </div>
    <div class="clearfix"></div>
    <div class="box11">
    	<h5>限时快抢</h5>
    	<div class="clearfix"></div>
        <h4>00:00:44</h4>
    	<img src="${ctx}/resources/front/image/19.png">
   </div>
    <div class="box121">
    	<div class="box13">
        	<h4>1元抢好货</h4>
    		<div class="clearfix"></div>
            <h5>整点拼手速</h5>
            <img src="${ctx}/resources/front/image/20.png">
        </div>
    	<div class="box14">
        	<h4>0.01抽好运</h4>
    		<div class="clearfix"></div>
            <h5>一分钱幸运礼遇</h5>
            <img src="${ctx}/resources/front/image/21.png">
        </div>
    </div>
    <div class="box12">
    	<h5>团购特卖</h5>
    	<div class="clearfix"></div>
        <h4>风格大牌春季新品<span>10点上新</span></h4>
    	<div class="clearfix"></div>
    	<img style="margin-top:20px; margin-left:70px;" src="${ctx}/resources/front/image/22.png">
    </div>
    <div class="box121">
    	<div class="box13">
        	<h4>品牌团</h4>
    		<div class="clearfix"></div>
            <h5 style="background-color:black; color:white; width:80px; text-align:center; height:">00:00:44</h5>
            <img style="margin-top:0;" src="${ctx}/resources/front/image/23.png">
        </div>
    	<div class="box14">
        	<h4>入库质检</h4>
    		<div class="clearfix"></div>
            <h5 style="color:#f41443;">精选好货 劣一赔三</h5>
            <img style="margin-right:10px; margin-top:10px;" src="${ctx}/resources/front/image/24.png">
        </div>
    </div>
    <div class="box12">
    	<h5>美妆团</h5>
    	<div class="clearfix"></div>
        <h4>超值大牌 折扣减免</h4>
    	<div class="clearfix"></div>
    	<img style="margin-top:20px; margin-left:70px;" src="${ctx}/resources/front/image/25.png">
    </div>
    <div class="clearfix"></div>
    <div class="box60"><p>红人穿搭</p></div>
    <div class="clearfix"></div>
  <div class="box15"><img src="${ctx}/resources/front/image/26.png"></div>
  <div class="box16"><img src="${ctx}/resources/front/image/27.png"></div>
  <div class="box16"><img src="${ctx}/resources/front/image/28.png"></div>
  <div class="box16"><img src="${ctx}/resources/front/image/29.png"></div>
  <div class="box16"><img src="${ctx}/resources/front/image/30.png"></div>
    <div class="clearfix"></div>
  <div class="box17"><img src="${ctx}/resources/front/image/108.png"></div>
  <div class="box18">
  		<p>靓淘服装</p>
        <ul>
        	<li>热门搜索：</li>
        	<li><a href="">卫衣 |</a></li>
        	<li><a href="">风衣 |</a></li>
        	<li><a href="">连衣裙 |</a></li>
        	<li><a href="">阔腿裤 |</a></li>
        	<li><a href="">小脚裤 |</a></li>
        	<li><a href="">牛仔裤</a></li>
        </ul>
        <span>查看全部 &gt;</span>
  </div>
  <div class="box19">
  	<div class="box30">
    	<img src="${ctx}/resources/front/image/53.png">
    	<p>大牌新品折扣 &gt;</p>
        <h1>牛仔裤潮流趋势</h1>
        <h2>女装春夏新品5折</h2>
    </div>
  	<div class="box31">
    	<div class="box32">
        	<h4>条纹套装新品首发</h4>
 	  	    <div class="clearfix"></div>
            <h5>立即预约享好礼</h5>
    	    <div class="clearfix"></div>
            <h6>夏季新品 预约爆款</h6>
    	    <div class="clearfix"></div>
            <div class="b32d1">立即查看</div>
            <img src="${ctx}/resources/front/image/63.png">
        </div>
    	<div class="box34">
        	<h4>雪纺当道</h4>
    	    <div class="clearfix"></div>
            <h5>一看百变雪纺风采</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/55.png">
        </div>
    	<div class="box34">
        	<h4>帅气黑连体裤</h4>
    	    <div class="clearfix"></div>
            <h5>精致细节利落休闲</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/56.png">
        </div>
   	    <div class="clearfix"></div>
    	<div class="box34">        	
        	<h4>早春时尚新条纹</h4>
    	    <div class="clearfix"></div>
            <h5>春季新款条纹尖货</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/58.png">
		</div>
    	<div class="box34">
        	<h4>春夏型牛仔衬衫</h4>
    	    <div class="clearfix"></div>
            <h5>OL的完美新姿&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img style="margin-top:-13px;" src="${ctx}/resources/front/image/57.png">
        </div>
    	<div class="box34">
        	<h4>Amii工作装</h4>
    	    <div class="clearfix"></div>
            <h5>百搭显瘦实穿时尚</h5>
            <div b32d1></div>
            <img style="margin-top:-15px;" src="${ctx}/resources/front/image/59.png">
        </div>
    	<div class="box34">
        	<h4>初夏时尚T恤</h4>
    	    <div class="clearfix"></div>
            <h5>新超出众</h5>
            <div b32d1></div>
            <img style="margin-top:13px;" src="${ctx}/resources/front/image/61.png">
        </div>
    </div>
  </div>
  <div class="box18">
  		<p>靓淘数码</p>
        <ul>
        	<li>热门搜索：</li>
        	<li><a href="">手机 |</a></li>
        	<li><a href="">台式电脑 |</a></li>
        	<li><a href="">笔记本 |</a></li>
        	<li><a href="">平板电脑 |</a></li>
        	<li><a href="">手机配件 |</a></li>
        	<li><a href="">电脑配件</a></li>
        </ul>
        <span>查看全部 &gt;</span>
  </div>
  <div class="box19">
  	<div class="box30">
    	<img src="${ctx}/resources/front/image/65.png">
    	<p>大牌新品折扣 &gt;</p>
        <h1 style="background-color:#0aa6e8;">笔记本平板换新季</h1>
        <h2 style="background-color:#0aa6e8;">高能高颜爆款立减</h2>
    </div>
  	<div class="box31">
    	<div class="box32">
        	<h4>最新爆款新品发布</h4>
 	  	    <div class="clearfix"></div>
            <h5>立即预约抢好礼</h5>
    	    <div class="clearfix"></div>
            <h6 style="color:#0aa6e8">智能闪光灯 疾速</h6>
            <div class="b32d1" style="margin-left:-60px; margin-top:70px;">立即查看</div>
            <img src="${ctx}/resources/front/image/167.png" style="margin-top:-54px;">
        </div>
    	<div class="box34">
        	<h4>每天都是情人节</h4>
    	    <div class="clearfix"></div>
            <h5>送她所爱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/66.png">
        </div>
    	<div class="box34">
        	<h4>享你所想</h4>
    	    <div class="clearfix"></div>
            <h5>安全便捷存储&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/67.png">
        </div>
   	    <div class="clearfix"></div>
    	<div class="box34">        	
        	<h4>为专业而生</h4>
    	    <div class="clearfix"></div>
            <h5>智能降噪无损音质</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/68.png">
		</div>
    	<div class="box34">
        	<h4>乐心鼠标2</h4>
    	    <div class="clearfix"></div>
            <h5>送多重好礼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img style="margin-top:17px;" src="${ctx}/resources/front/image/69.png">
        </div>
    	<div class="box34">
        	<h4>智享生活</h4>
    	    <div class="clearfix"></div>
            <h5>智慧清洁 想你所想</h5>
            <div b32d1></div>
            <img style="margin-top:-6px;" src="${ctx}/resources/front/image/64.png">
        </div>
    	<div class="box34">
        	<h4>美丽先行者</h4>
    	    <div class="clearfix"></div>
            <h5>从头开始美</h5>
            <div b32d1></div>
            <img style="margin-top:13px;" src="${ctx}/resources/front/image/71.png">
        </div>
    </div>
  </div>
  <div class="box20"><img src="${ctx}/resources/front/image/104.png"></div>
  <div class="bkong"></div>
  <div class="box18">
  		<p>靓淘家居</p>
        <ul>
        	<li>热门搜索：</li>
        	<li><a href="">居家饰品 |</a></li>
        	<li><a href="">大家具 |</a></li>
        	<li><a href="">四件套 |</a></li>
        	<li><a href="">常用药 |</a></li>
        	<li><a href="">家纺 |</a></li>
        	<li><a href="">小家具</a></li>
        </ul>
        <span>查看全部 &gt;</span>
  </div>
  <div class="box19">
  	<div class="box30">
    	<img src="${ctx}/resources/front/image/65.png">
    	<p>大牌新品折扣 &gt;</p>
        <h1 style="background-color:#0aa6e8;">笔记本平板换新季</h1>
        <h2 style="background-color:#0aa6e8;">高能高颜爆款立减</h2>
    </div>
  	<div class="box31">
    	<div class="box32">
        	<h4>最新爆款新品发布</h4>
 	  	    <div class="clearfix"></div>
            <h5>立即预约抢好礼</h5>
    	    <div class="clearfix"></div>
            <h6 style="color:#0aa6e8">智能闪光灯 疾速</h6>
            <div class="b32d1" style="margin-left:-60px; margin-top:70px;">立即查看</div>
            <img src="${ctx}/resources/front/image/167.png" style="margin-top:-54px;">
        </div>
    	<div class="box34">
        	<h4>每天都是情人节</h4>
    	    <div class="clearfix"></div>
            <h5>送她所爱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/66.png">
        </div>
    	<div class="box34">
        	<h4>享你所想</h4>
    	    <div class="clearfix"></div>
            <h5>安全便捷存储&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/67.png">
        </div>
   	    <div class="clearfix"></div>
    	<div class="box34">        	
        	<h4>为专业而生</h4>
    	    <div class="clearfix"></div>
            <h5>智能降噪无损音质</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/68.png">
		</div>
    	<div class="box34">
        	<h4>乐心鼠标2</h4>
    	    <div class="clearfix"></div>
            <h5>送多重好礼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img style="margin-top:17px;" src="${ctx}/resources/front/image/69.png">
        </div>
    	<div class="box34">
        	<h4>智享生活</h4>
    	    <div class="clearfix"></div>
            <h5>智慧清洁 想你所想</h5>
            <div b32d1></div>
            <img style="margin-top:-6px;" src="${ctx}/resources/front/image/64.png">
        </div>
    	<div class="box34">
        	<h4>美丽先行者</h4>
    	    <div class="clearfix"></div>
            <h5>从头开始美</h5>
            <div b32d1></div>
            <img style="margin-top:13px;" src="${ctx}/resources/front/image/71.png">
        </div>
    </div>
  </div>
  <div class="box18">
  		<p>靓淘家电</p>
        <ul>
        	<li>热门搜索：</li>
        	<li><a href="">彩电 |</a></li>
        	<li><a href="">大家电 |</a></li>
        	<li><a href="">小家电 |</a></li>
        	<li><a href="">挂烫机 |</a></li>
        	<li><a href="">和面机 |</a></li>
        	<li><a href="">插座</a></li>
        </ul>
        <span>查看全部 &gt;</span>
  </div>
  <div class="box19">
  	<div class="box30">
    	<img src="${ctx}/resources/front/image/65.png">
    	<p>大牌新品折扣 &gt;</p>
        <h1 style="background-color:#0aa6e8;">笔记本平板换新季</h1>
        <h2 style="background-color:#0aa6e8;">高能高颜爆款立减</h2>
    </div>
  	<div class="box31">
    	<div class="box32">
        	<h4>最新爆款新品发布</h4>
 	  	    <div class="clearfix"></div>
            <h5>立即预约抢好礼</h5>
    	    <div class="clearfix"></div>
            <h6 style="color:#0aa6e8">智能闪光灯 疾速</h6>
            <div class="b32d1" style="margin-left:-60px; margin-top:70px;">立即查看</div>
            <img src="${ctx}/resources/front/image/167.png" style="margin-top:-54px;">
        </div>
    	<div class="box34">
        	<h4>每天都是情人节</h4>
    	    <div class="clearfix"></div>
            <h5>送她所爱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/66.png">
        </div>
    	<div class="box34">
        	<h4>享你所想</h4>
    	    <div class="clearfix"></div>
            <h5>安全便捷存储&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/67.png">
        </div>
   	    <div class="clearfix"></div>
    	<div class="box34">        	
        	<h4>为专业而生</h4>
    	    <div class="clearfix"></div>
            <h5>智能降噪无损音质</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/68.png">
		</div>
    	<div class="box34">
        	<h4>乐心鼠标2</h4>
    	    <div class="clearfix"></div>
            <h5>送多重好礼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img style="margin-top:17px;" src="${ctx}/resources/front/image/69.png">
        </div>
    	<div class="box34">
        	<h4>智享生活</h4>
    	    <div class="clearfix"></div>
            <h5>智慧清洁 想你所想</h5>
            <div b32d1></div>
            <img style="margin-top:-6px;" src="${ctx}/resources/front/image/64.png">
        </div>
    	<div class="box34">
        	<h4>美丽先行者</h4>
    	    <div class="clearfix"></div>
            <h5>从头开始美</h5>
            <div b32d1></div>
            <img style="margin-top:13px;" src="${ctx}/resources/front/image/71.png">
        </div>
    </div>
  </div>
    <div class="box20"></div>
  <div class="box18">
  		<p>靓淘运动</p>
        <ul>
        	<li>热门搜索：</li>
        	<li><a href="">皮肤衣 |</a></li>
        	<li><a href="">运动鞋 |</a></li>
        	<li><a href="">运动裤 |</a></li>
        	<li><a href="">瑜伽垫 |</a></li>
        	<li><a href="">运动套装 |</a></li>
        	<li><a href="">跑步机</a></li>
        </ul>
        <span>查看全部 &gt;</span>
  </div>
  <div class="box19">
  	<div class="box30">
    	<img src="${ctx}/resources/front/image/65.png">
    	<p>大牌新品折扣 &gt;</p>
        <h1 style="background-color:#0aa6e8;">笔记本平板换新季</h1>
        <h2 style="background-color:#0aa6e8;">高能高颜爆款立减</h2>
    </div>
  	<div class="box31">
    	<div class="box32">
        	<h4>最新爆款新品发布</h4>
 	  	    <div class="clearfix"></div>
            <h5>立即预约抢好礼</h5>
    	    <div class="clearfix"></div>
            <h6 style="color:#0aa6e8">智能闪光灯 疾速</h6>
            <div class="b32d1" style="margin-left:-60px; margin-top:70px;">立即查看</div>
            <img src="${ctx}/resources/front/image/167.png" style="margin-top:-54px;">
        </div>
    	<div class="box34">
        	<h4>每天都是情人节</h4>
    	    <div class="clearfix"></div>
            <h5>送她所爱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/66.png">
        </div>
    	<div class="box34">
        	<h4>享你所想</h4>
    	    <div class="clearfix"></div>
            <h5>安全便捷存储&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/67.png">
        </div>
   	    <div class="clearfix"></div>
    	<div class="box34">        	
        	<h4>为专业而生</h4>
    	    <div class="clearfix"></div>
            <h5>智能降噪无损音质</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/68.png">
		</div>
    	<div class="box34">
        	<h4>乐心鼠标2</h4>
    	    <div class="clearfix"></div>
            <h5>送多重好礼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img style="margin-top:17px;" src="${ctx}/resources/front/image/69.png">
        </div>
    	<div class="box34">
        	<h4>智享生活</h4>
    	    <div class="clearfix"></div>
            <h5>智慧清洁 想你所想</h5>
            <div b32d1></div>
            <img style="margin-top:-6px;" src="${ctx}/resources/front/image/64.png">
        </div>
    	<div class="box34">
        	<h4>美丽先行者</h4>
    	    <div class="clearfix"></div>
            <h5>从头开始美</h5>
            <div b32d1></div>
            <img style="margin-top:13px;" src="${ctx}/resources/front/image/71.png">
        </div>
    </div>
  </div>
  <div class="box18">
  		<p>靓淘母婴</p>
        <ul>
        	<li>热门搜索：</li>
        	<li><a href="">儿童 |</a></li>
        	<li><a href="">玩具 |</a></li>
        	<li><a href="">待产用品 |</a></li>
        	<li><a href="">宝宝用品 |</a></li>
        	<li><a href="">奶粉 |</a></li>
        	<li><a href="">亲子装</a></li>
        </ul>
        <span>查看全部 &gt;</span>
  </div>
  <div class="box19">
  	<div class="box30">
    	<img src="${ctx}/resources/front/image/65.png">
    	<p>大牌新品折扣 &gt;</p>
        <h1 style="background-color:#0aa6e8;">笔记本平板换新季</h1>
        <h2 style="background-color:#0aa6e8;">高能高颜爆款立减</h2>
    </div>
  	<div class="box31">
    	<div class="box32">
        	<h4>最新爆款新品发布</h4>
 	  	    <div class="clearfix"></div>
            <h5>立即预约抢好礼</h5>
    	    <div class="clearfix"></div>
            <h6 style="color:#0aa6e8">智能闪光灯 疾速</h6>
            <div class="b32d1" style="margin-left:-60px; margin-top:70px;">立即查看</div>
            <img src="${ctx}/resources/front/image/167.png" style="margin-top:-54px;">
        </div>
    	<div class="box34">
        	<h4>每天都是情人节</h4>
    	    <div class="clearfix"></div>
            <h5>送她所爱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/66.png">
        </div>
    	<div class="box34">
        	<h4>享你所想</h4>
    	    <div class="clearfix"></div>
            <h5>安全便捷存储&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/67.png">
        </div>
   	    <div class="clearfix"></div>
    	<div class="box34">        	
        	<h4>为专业而生</h4>
    	    <div class="clearfix"></div>
            <h5>智能降噪无损音质</h5>
            <div b32d1></div>
            <img src="${ctx}/resources/front/image/68.png">
		</div>
    	<div class="box34">
        	<h4>乐心鼠标2</h4>
    	    <div class="clearfix"></div>
            <h5>送多重好礼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
            <div b32d1></div>
            <img style="margin-top:17px;" src="${ctx}/resources/front/image/69.png">
        </div>
    	<div class="box34">
        	<h4>智享生活</h4>
    	    <div class="clearfix"></div>
            <h5>智慧清洁 想你所想</h5>
            <div b32d1></div>
            <img style="margin-top:-6px;" src="${ctx}/resources/front/image/64.png">
        </div>
    	<div class="box34">
        	<h4>美丽先行者</h4>
    	    <div class="clearfix"></div>
            <h5>从头开始美</h5>
            <div b32d1></div>
            <img style="margin-top:13px;" src="${ctx}/resources/front/image/71.png">
        </div>
    </div>
  </div>
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
</body>
</html>
