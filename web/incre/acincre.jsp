<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>

<html>
<head lang="en">
	<meta charset="UTF-8">
	<title>盈创动力-国内领先的科技金融服务门户网站</title>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
	<style type="text/css">
		.fixed{top:auto;bottom:10%!important;height:82px;}
		.zjbg{background: linear-gradient(#7213ba,#39008e)}
		.increlist>li>ol>li:nth-child(1),.increlist>li>ol>li{background: #fff;border-top: 1px solid #ddd !important;border-right: 1px solid #ddd;padding:0; }
		.increlist>li>h2{background: #ff003e;color: #fff;line-height: 60px;font-size: 26px;}
		.increlist>li{height:auto;}
		.increlist>li>ol>li>a{width: 100%;background: #fff !important;}
		.increlist>li>ol>li .price span{color:#ec1337; font-weight: bold;}
		.increlist>li>ol>li .price span>b{font-size:26px;}
		.increlist>li>ol>li .price s{color: #999; margin-left: 7px;}
		.increlist>li>ol>li h3{margin:0;}
		.increlist>li>ol>li img{background: #f9f9f9;}
		.increlist>li>ol>li>a{margin:0;border: 1px solid transparent;border-radius: 0;padding: 15px;height: 337px;position: relative;}
		.increlist>li>ol>li>a:hover{border-color:#ff003e;}
		.increlist>li>ol>li>a>i{position: absolute;top:15px;left:15px;width: 140px;height: 36px;
			background-image: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/incre/zjtips.png");
			background-repeat:no-repeat;
			background-position: 0 0;
		}
		.increlist>li>ol>li>a>i.k1{background-position: 0 0;}
		.increlist>li>ol>li>a>i.k2{background-position: 0 -46px;}
		.increlist>li>ol>li>a>i.k3{background-position: 0 -92px;}
		.increlist>li>ol>li>a>i.k4{background-position: 0 -138px;}
		.increlist>li>ol>li>a>i.k5{background-position: 0 -184px;}
		.increlist>li>ol>li>a>i.k6{background-position: 0 -230px;}

	</style>

</head>
<body>
<%@ include file="../header.jsp"%>
<div class="ycdata_bgimg">
	<a href="/incredetail/22.html"> <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/box/zjacbanner.png" alt="背景图" style="height: auto;"></a>
</div>
<!-- /*服务类型*/ -->
<div class="zjbg">
	<ul class="widthbox increlist box tc">
		<li>
			<h2>优惠专区</h2>
			<ol>
				<s:iterator value="#request.incres">
					<s:if test="cretype==12501">
						<li>
							<a href="/incredetail/${id}.html">
								<i class="k1"></i>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${cmpname}</p>
								<div class="price"><span>¥<b>${activityprice}</b>起</span><s>¥${increprice}</s></div>
							</a>
						</li>
					</s:if>
				</s:iterator>
				<s:iterator value="#request.incres">
					<s:if test="cretype==12504">
						<li>
							<a href="/incredetail/${id}.html">
								<i class="k2"></i>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${cmpname}</p>
								<div class="price"><span>¥<b>${activityprice}</b>起</span><s>¥${increprice}</s></div>
							</a>
						</li>
					</s:if>
				</s:iterator>
				<s:iterator value="#request.incres">
					<s:if test="cretype==12502">
						<li>
							<a href="/incredetail/${id}.html">
								<i class="k3"></i>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${cmpname}</p>
								<div class="price"><span>¥<b>${activityprice}</b>起</span><s>¥${increprice}</s></div>
							</a>
						</li>
					</s:if>
				</s:iterator>
				<s:iterator value="#request.incres">
					<s:if test="cretype==12507">
						<li>
							<a href="/incredetail/${id}.html">
								<i class="k4"></i>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${cmpname}</p>
								<div class="price"><span>¥<b>${activityprice}</b>起</span><s>¥${increprice}</s></div>
							</a>
						</li>
					</s:if>
				</s:iterator>
				<s:iterator value="#request.incres">
					<s:if test="cretype==12503">
						<li>
							<a href="/incredetail/${id}.html">
								<i class="k5"></i>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${cmpname}</p>
								<div class="price"><span>¥<b>${activityprice}</b>起</span><s>¥${increprice}</s></div>
							</a>
						</li>
					</s:if>
				</s:iterator>
				<s:iterator value="#request.incres">
					<s:if test="cretype==12506">
						<li>
							<a href="/incredetail/${id}.html">
								<i class="k6"></i>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${cmpname}</p>
								<div class="price"><span>¥<b>${activityprice}</b>起</span><s>¥${increprice}</s></div>
							</a>
						</li>
					</s:if>
				</s:iterator>
				<li style="width: 80%;">
					<a href="/incre/toList.html">
						<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/incre/zjzhanwei.png" alt="" style="width: 100%;height: auto;">
					</a>
				</li>
			</ol>
		</li>
	</ul>
</div>


<script>
    function doquery(){
        var query = $('#contentquery').val();
        if(query=='') {
        }else {
            var url = '/incre/tocre.html?cretype=${cretype}&increname='+query;
            window.location = url;
            return ;
        }
    }

    window.onload=function (ev) {
        $('.increlist>li').each(function (i,v) {
			if($(this).find('li').length<5){
			    $(this).children('a').hide();
			}
        })
	}
</script>

<div class="fixed" id="totop">
	<div class="home">
		<div class="fixed_img">
			<a href="javascript:$('body,html').animate({scrollTop:0},500)">
				<a id="backtop" href="javascript:void(0)"><img src="../image/index/home.png" alt="返回顶部"></a>
			</a>
		</div>
	</div>
</div>
<script>
    menu_init("incre");
</script>

<!--盈创活动end-->
<%@ include file="../footer.jsp"%>

</body>
</html>
