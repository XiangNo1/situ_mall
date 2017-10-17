<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>详情页</title>
<%@include file="../common/head_front.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/front/css/details.css" />

</head>

<body>
<div class="bg-box">
<div class="box-center">
	<div class="box1"><span class="wel">欢迎来到靓淘！ <a href="${ctx }/index/index.shtml"> 首页</a></span></div>
		<div class="box2">
        	<ul>
        	<c:if test="${userSession != null }">
            	<li><a class="login">欢迎回来 ： ${userSession.username} </a>
            		<a  href="${ctx }/login/loginOut.shtml?redirectUri=/details/details2.shtml?id=${product.id}">退出登录</a>
            	</li>
        	</c:if>
        	
        	<c:if test="${userSession == null }">
            	<li><a class="login" href="${ctx }/login/login.shtml?redirectUri=/details/details2.shtml?id=${product.id}">请登录</a></li>
        	</c:if>
            	<li><a href="${ctx }/login/register.shtml">快速注册</a></li>
            	<li><a class="collect" href="">我的收藏</a></li>
            	<c:if test="${userSession != null }">
            		<li><a class="order" href="${ctx }/order/myorder.shtml">我的订单</a></li>
        		</c:if>
        		<c:if test="${userSession == null }">
            		<li><a class="order" href="${ctx }/login/login.shtml?redirectUri=/order/myorder.shtml">我的订单</a></li>
        		</c:if>
            	<li><a class="phone" href="">手机靓淘</a></li>
            	<li><a href="">我的积分</a></li>
            	<li><a href="">我的评价</a></li>
            </ul>
        </div>
   	 	<div class="clearfix"></div>
    <div class="box3"><img src="${ctx}/resources/front/image/LOGO.png"></div>
    <div class="box4">
    <form action="${ctx }/details/details1.shtml" method="post">
    			 <input class="b4i1" type="text" placeholder="洗面奶" name="product_name" value="${product_name}${category.name}">
        		 <input class="b4i2" type="submit" value="搜索">
		</form>
    	<div class="clearfix"></div>
        <ul>
        	<li><a href="">值得买 |</a></li>
        	<li><a href="">小米6 |</a></li>
        	<li><a href="">金立 |</a></li>
        	<li><a href="">华为畅享 7P |</a></li>
        	<li><a href="">苹果7 |</a></li>
        	<li><a href="">1元800M</a></li>
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
        	<li><a class="current" href="">全部商品分类</a></li>
        	<li><a href="">商城首页</a></li>
        	<li><a href="">手机首页</a></li>
        	<li><a href="">新机首发</a></li>
        	<li><a href="">手机社区</a></li>
        	<li><a href="">企业采购</a></li>
        	<li><a href="">精选店铺</a></li>
    		<div class="clearfix"></div>
        </ul>
	</div>
</div>
<div class="box7">
	<div class="box-center">
	<ul class="b7u1">
    	<li><a href="">家电数码 &gt;</a></li>
    	<li><a href="">手机通讯 &gt;</a></li>
    	<li><a href="">手机 &gt;</a></li>
    	<li><a class="b7a4" href="">华为（HUAWEI）</a></li>
    	<li><a href="">&gt; 华为畅享6S</a></li>
    </ul>
    <ul class="b7u2">
    	<li><a class="b7a6" href="">联系供应商</a></li>
    	<li><a href="">华为官方旗舰店</a></li>
    </ul>
    		<div class="clearfix"></div>
    <p>联系供应商</p>
    </div>
</div>
<div class="clearfix"></div>
<div class="box-center">
	<div class="box8">
    	<div class="box13">
    		<div class="box9">
    		<img style="width:320px; height:320px;" src="/pic/${product.main_image}">
    		</div>
    		<div class="box10">
            	<img class="b10i1" src="${ctx}/resources/front/image/18.png">
            	<c:forEach items="${img }" var="image">
            		<div class="box10d"><img src="/pic/${image}"></div>
            	</c:forEach>
                <img class="b10i2" src="${ctx}/resources/front/image/17.png">
				<div class="clearfix"></div>
            </div>
    		<div class="box11">
            	<p class="b11p1">关注</p>
                <p class="b11p2">分享</p>
                <p class="b11p3">对比</p>
            </div>
        </div>
    	<div class="box12">
        	<h1>${product.name }</h1>
			<div class="clearfix"></div>
            <h2>${product.subtitle}</h2>
 			<div class="clearfix"></div>
            <div class="b12b1">
            	<img class="b12b1i1" src="${ctx}/resources/front/image/117.png">
                <p class="b12b1p1">&nbsp;&nbsp;全靓淘实物商品通用</p>
                <p class="b12b1p2">去刮卷</p>
  				<div class="clearfix"></div>
                <span style="font-size:14px; color:#666666; float:left;">&nbsp;&nbsp;&nbsp;&nbsp;促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</span><span style="color:#f41443;">&nbsp;&nbsp;&nbsp;￥${product.price}</span><del>￥1999</del>
                <br/>
                <span style="font-size:14px; color:#666666; float:left; margin-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;支&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;持</span><img style="float:left; margin-left:10px; margin-top:5px;" src="${ctx}/resources/front/image/119.png"><img style="float:left; margin-left:10px; margin-top:5px;" src="${ctx}/resources/front/image/118.png">
  				<div class="clearfix"></div>
                <span style="font-size:14px; color:#666666; float:left; margin-top:10px;">&nbsp;&nbsp;&nbsp;&nbsp;本店活动</span><span style="float:left; margin-top:10px;">&nbsp;&nbsp;&nbsp;&nbsp;满79元，包邮</span>
                 <p class="b12b1p3">更多优惠</p>
  				<div class="clearfix"></div>
         </div>
 			<div class="clearfix"></div>
            <p class="b12p1" style="float:left; margin-left:15px;">运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费&nbsp;&nbsp;&nbsp;广东深圳&nbsp;&nbsp;至&nbsp;<span>青岛&nbsp;&nbsp;&nbsp;</span><span>&nbsp;市南区</span><span>&nbsp;香港中路街道</span>&nbsp;快递：0.00</p>
            <div class="b12d1">
				<div class="b12d11">
                	<p class="p1"><span>选择颜色</span><a class="a1" href="">金色</a><a class="a2" href="">银色</a><a class="a3" href="">粉色</a></p>
 						<div class="clearfix"></div>
                    <p><span>选择版本</span><a class="a4" href="">普通版</a><a class="a5" href="">移动定制版</a></p>
 						<div class="clearfix"></div>
                    <p><span>购买方式</span><a class="a6" href="">官方标配</a></p>
 						<div class="clearfix"></div>
                    <p><span>增值保障</span><a class="a7" href=""><img src="${ctx}/resources/front/image/cu.png">屏碎保一年 ￥66</a><a class="a9" href=""><img src="${ctx}/resources/front/image/124.png">一年内换新 ￥86</a><a class="a8" href=""><img src="${ctx}/resources/front/image/125.png">碎屏保两年 ￥96</a></p>
                </div>
 				<div class="clearfix"></div>
                <p class="p2">数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量(库存：${product.stock})</p>
                <input class="input1" type="text" value="1" id="input1">
                <div class="b121">
                	<input type="button" value="+" id="on">
                    <input type="button" value="-" id="up">
                </div>
                <input class="input2" type="button"  onclick="addCart(${product.id})" value="加入购物车">
                 <div class="clearfix"></div>
					<p class="p3">温馨提示&nbsp;&nbsp;&nbsp;&nbsp;·支持7天无理由退货</p>
            </div>
       </div>
    </div>
    
    
    <script type="text/javascript">
        $(document).ready(function(){
            var $miaobian=$('.box10>div');
            var $huantu=$('.box9>img');
            /* var $miaobian1=$('.Xcontent26>div'); */
            $miaobian.mousemove(function(){miaobian(this);});
            /* $miaobian1.click(function(){miaobian1(this);}); */
            function miaobian(thisMb){
                for(var i=0; i<$miaobian.length; i++){
                    $miaobian[i].style.borderColor = '#dedede';
                }
                $huantu[0].src = thisMb.children[0].src;
                thisMb.style.borderColor = '#cd2426';
            }
            /* function miaobian1(thisMb1){
                for(var i=0; i<$miaobian1.length; i++){
                    $miaobian1[i].style.borderColor = '#dedede';
                }
				//		thisMb.style.borderColor = '#cd2426';
                $miaobian.css('border-color','#dedede');
                thisMb1.style.borderColor = '#cd2426';
                $huantu[0].src = thisMb1.children[0].src;
            } */
            
            
            $("#on").click(function(){
                var value=parseInt($('#input1').val())+1;
                if(value<11){
               	 $('#input1').val(value);
           		 }
            });

            $("#up").click(function(){
                var num = $("#input1").val()
                if(num>0){
                    $("#input1").val(num-1);
                }

            });

        });
        
        
        function addCart(productId){
			var amount = $("#input1").val();
			window.location.href="${ctx}/cart/addCart.shtml?productId="+productId+"&amount="+amount;
		}
        
       		 
	</script>
	
    <div class="box14">
	    <ul class="ul6">
        	<li><a class="current" href="">人气配件</a></li>
        	<li><a href="">手机贴膜</a></li>
        	<li><a href="">手机保护套</a></li>
        	<li><a href="">数据线</a></li>
        	<li><a href="">充电器</a></li>
        	<li><a href="">移动电源</a></li>
        	<li><a href="">更多</a><img src="${ctx}/resources/front/image/129.png"></li>
    		<div class="clearfix"></div>
        </ul>
    </div>
    <div class="box15">
    	<div class="b15b1">
        	<img src="${ctx}/resources/front/image/70.png">
    		<div class="clearfix"></div>
            <p>派滋 华为畅享6S钢化膜</p>
            <p>畅享6S手机贴膜 高清透</p>
        </div>
        <div class="b15b2">
        	<img src="${ctx}/resources/front/image/jia.png">
        </div>
        <div class="b15b3">
        	<img src="${ctx}/resources/front/image/131.png">
            <p>机灵猫 畅享6S手机壳女</p>
            <p>防摔带支架保护套</p>
    		<div class="clearfix"></div>
            <input type="checkbox"><span>￥18.00</span>
        </div>
        <div class="b15b3">
        	<img src="${ctx}/resources/front/image/137.png">
            <p>机灵猫 畅享6S手机壳女</p>
            <p>防摔带支架保护套</p>
    		<div class="clearfix"></div>
            <input type="checkbox"><span>￥26.00</span>
        </div>
        <div class="b15b3">
        	<img  src="${ctx}/resources/front/image/132.png">
            <p>品胜 Type-C/Micro</p>
            <p>USb/Lightning接口三</p>
    		<div class="clearfix"></div>
            <input type="checkbox"><span>￥29.00</span>
        </div>
        <div class="b15b3">
        	<img src="${ctx}/resources/front/image/133.png">
            <p>品胜Ipad充电器 移动电</p>
            <p>源充电</p>
    		<div class="clearfix"></div>
            <input type="checkbox"><span>￥35.00</span>
        </div>
        <div class="b15b3">
        	<img src="${ctx}/resources/front/image/134.png">
            <p>罗马仕（POMOSS）</p>
            <p>Led数显示屏</p>
    		<div class="clearfix"></div>
            <input type="checkbox"><span>￥108.00</span>
        </div>
        <div class="b15b2">
        	<img src="${ctx}/resources/front/image/17.png">
        </div>
        <div class="b15b2">
        	<img style="margin-top:65px;" src="${ctx}/resources/front/image/136.png">
        </div>
        <div class="b15b4">
        	<p style="margin-top:40px;">已选择0个配件</p>
            <p>组合价 <span>￥1499.00</span></p>
            <input class="b15b4i1" type="button" value="立即购买">
            <input class="b15b4i2" type="button" value="配件选购中心">
        </div>
    </div>
    <div class="box16">
    	<div class="b16b1">
        	<div class="b16b1b1">关于手机，您可能再找</div>
            <p>&nbsp;&nbsp;<a href="">安卓（Android）</a></p>
            <p>&nbsp;&nbsp;<a href="">5.0-4.6英寸</a>&nbsp;&nbsp;<a href="">双卡双待</a></p>
            <p>&nbsp;&nbsp;<a href="">骁龙芯片</a>&nbsp;&nbsp;<a href="">自拍神器</a>&nbsp;&nbsp;<a href="">3GB</a></p>
            <p>&nbsp;&nbsp;<a href="">联通4G</a>&nbsp;&nbsp;<a href="">电信4G</a></p>
            <p>&nbsp;&nbsp;<a href="">移动4G/联通4G/电信4G</a></p>
            <p>&nbsp;&nbsp;<a href="">移动4G</a>&nbsp;&nbsp;<a href="">32GB</a>&nbsp;&nbsp;<a href="">八核</a></p>
        </div>
        <ul class="u16">
        	<li>
            	<img src="${ctx}/resources/front/image/phone1.png">
            	<p>分辨率：1280x720（HD）</p>
            </li>
        	<li>
            	<img src="${ctx}/resources/front/image/shexiang.png">
            	<p>后置摄像头：1300万像素</p>
    			<div class="clearfix"></div>
            	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;前置摄像头：500万像素</p>
            </li>
        	<li>
            	<img src="${ctx}/resources/front/image/cpu.png">
            	<p>核数：八核</p>
     			<div class="clearfix"></div>
           		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;频率：最高1.4GHZ</p>
            </li>
        </ul>
        <p class="b16p1">品牌：<a href="">华为（HUAWEI）</a>&nbsp;&nbsp;&nbsp;<a class="b16a" href="">关注</a></p>
        <ul class="u162">
        	<li>
            	<ul>
                	<li>商品名称：华为畅享6S</li>
                	<li>系统：安卓（Android）</li>
                	<li>机身内存：32GB</li>
                </ul>
            </li>
        	<li>
            	<ul>
                	<li>运行内存：3GB</li>
                	<li>运行内存：3GB</li>
                	<li>机身颜色：金色、银色、粉色</li>
                </ul>
            </li>
        	<li>
            	<ul>
                	<li>商品产地：中国大陆</li>
                	<li>电池容量：3000mAh-3999mAh</li>
                </ul>
            </li>
        	<li>
            	<ul>
                	<li>电池容量：3000mAh-3999mAh</li>
                	<li>热点：骁龙芯片、双卡双待</li>
                </ul>
            </li>
        </ul>
        <a class="b16a2">更多参数&gt;&gt;</a>
    </div>
</div>
<div class="box-center">
    <div class="box17">
    	<div class="b17b1">
        	<div class="b17b1b1">达人选购</div>
        	<div class="b17b1b2"><img src="${ctx}/resources/front/image/138.png">
            	<p> &nbsp;荣耀 畅玩6X 32GB 全网通4G &nbsp;手机 高配版 铂光金</p>
                <p class="b17b1b2p2">￥1299.00</p>
            </div>
        	<div class="b17b1b2"><img src="${ctx}/resources/front/image/139.png">
            	<p> &nbsp;华为 4GB 32GB 全网通4G &nbsp;&nbsp;&nbsp;手机 高配版 白色</p>
                <p class="b17b1b2p2">￥1299.00</p>
            </div>
        	<div class="b17b1b2"><img src="${ctx}/resources/front/image/140.png">
            	<p> &nbsp;华为 HUAWEI noal64G版本 手机 高配版 玫瑰金</p>
                <p class="b17b1b2p2">￥1299.00</p>
            </div>
        	<div class="b17b1b2"><img src="${ctx}/resources/front/image/141.png">
            	<p> &nbsp;荣耀 麦芒5X 32GB 全网通4G &nbsp;手机 高配版 香槟金</p>
                <p class="b17b1b2p2">￥1299.00</p>
            </div>
        	<div class="b17b1b2"><img src="${ctx}/resources/front/image/142.png">
            	<p> &nbsp;荣耀 V9 4GB+64GB 全网通4G &nbsp;手机 高配版 极光蓝</p>
                <p class="b17b1b2p2">￥1499.00</p>
            </div>
        	<div class="b17b1b2"><img src="${ctx}/resources/front/image/144.png">
            	<p> &nbsp;荣耀 P9 双卡双待 全网通4G &nbsp;手机 高配版 铂皓月银</p>
                <p class="b17b1b2p2">￥1699.00</p>
            </div>
        	<div class="b17b1b2"><img src="${ctx}/resources/front/image/138.png">
            	<p> &nbsp;荣耀 畅玩6X 32GB 全网通4G &nbsp;手机 高配版 铂光金</p>
                <p class="b17b1b2p2">￥1299.00</p>
            </div>
        	<div class="b17b1b2"><img src="${ctx}/resources/front/image/145.png">
            	<p> &nbsp;荣耀8 青春版 32GB 全网通4G &nbsp;手机 高配版 铂光金</p>
                <p class="b17b1b2p2">￥1299.00</p>
            </div>
        </div>
        <div class="b17b2">
        	<div class="b17b1b1">手机热销榜</div>
            <div class="b17b2b2">
            	<ul>
                	<li><a class="b17b2b2a1" href="">同价位</a></li>
                	<li><a class="b17b2b2a2" href="">同品牌</a></li>
                	<li><a class="b17b2b2a2" href="">总排行</a></li>
                </ul>
            </div>
            <div class="b17b2b3">
            	<img class="b17b2b3i1" src="${ctx}/resources/front/image/146.png">
                <img class="b17b2b3i2" src="${ctx}/resources/front/image/yuan2.png">
                <p class="b17b2b3p1">360N5</p>
                <p class="b17b2b3p2">￥1699.00</p>
            </div>
            <div class="b17b2b3">
            	<img class="b17b2b3i1" src="${ctx}/resources/front/image/147.png">
                <img class="b17b2b3i2" src="${ctx}/resources/front/image/yuan1.png">
                <p class="b17b2b3p1">OPPOA57</p>
                <p class="b17b2b3p2">￥1699.00</p>
            </div>
            <div class="b17b2b3">
            	<img class="b17b2b3i1" src="${ctx}/resources/front/image/151.png">
                <img class="b17b2b3i2" src="${ctx}/resources/front/image/yuan3.png">
                <p class="b17b2b3p1">小米note4</p>
                <p class="b17b2b3p2">￥1699.00</p>
            </div>
            <div class="b17b2b3">
            	<img class="b17b2b3i1" src="${ctx}/resources/front/image/148.png">
                <img class="b17b2b3i2" src="${ctx}/resources/front/image/yuan4.png">
                <p class="b17b2b3p1">华为荣耀6X</p>
                <p class="b17b2b3p2">￥1699.00</p>
            </div>
            <div class="b17b2b3">
            	<img class="b17b2b3i1" src="${ctx}/resources/front/image/149.png">
                <img class="b17b2b3i2" src="${ctx}/resources/front/image/yuan5.png">
                <p class="b17b2b3p1">诺基亚6</p>
                <p class="b17b2b3p2">￥1699.00</p>
            </div>
            <div class="b17b2b3">
            	<img class="b17b2b3i1" src="${ctx}/resources/front/image/149.png">
                <img class="b17b2b3i2" src="${ctx}/resources/front/image/yuan6.png">
                <p class="b17b2b3p1">乐视乐2</p>
                <p class="b17b2b3p2">￥1699.00</p>
            </div>
            <div class="b17b2b3">
            	<img class="b17b2b3i1" src="${ctx}/resources/front/image/146.png">
                <img class="b17b2b3i2" src="${ctx}/resources/front/image/yuan7.png">
                <p class="b17b2b3p1">小米5</p>
                <p class="b17b2b3p2">￥1799.00</p>
            </div>
        </div>
    </div>
    <div class="bigimg">${product.detail }</div>
    <div class="box18">
    	<div class="b18b1"><span>售后保障</span></div>
        <div class="b18b2">
        	<h1>厂家服务</h1>
            <p>本产品全国联保，享受三包服务，保质期为：一年质保</p>
            <p>如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在保质期内享受保修等三包服务！</p>
            <p>（注：如厂家在商品介绍中有售后保障的说明，则此商品按照厂家说明执行售后保障服务。）</p>
        </div>
        <div class="b18b2">
        	<h1>靓淘承诺</h1>
            <p>本产品全国联保，享受三包服务，保质期为：一年质保</p>
            <p>如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在保质期内享受保修等三包服务！</p>
            <p>（注：如厂家在商品介绍中有售后保障的说明，则此商品按照厂家说明执行售后保障服务。）</p>
        </div>
        <div class="b18b2">
        	<h1>全国联保</h1>
            <p>本产品全国联保，享受三包服务，保质期为：一年质保</p>
            <p>如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在保质期内享受保修等三包服务！</p>
        </div>
        <div class="b18b3">
            <p>注：因厂家在没有任何提前通知的情况下更改产品包装、产地或者一些附件，不能确保客户收到的货物与商城图片一致，只能确保为原厂正品货物！</p>
            <p>若本商城没有及时更新，请大家谅解！</p>
         </div>
    </div>
     <div class="clearfix"></div>
</div>
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
</body>
</html>