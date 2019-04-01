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
	<style type="text/css">.fixed{top:auto;bottom:10%!important;height:82px;}</style>
</head>
<body>
<%@ include file="../header.jsp"%>
<div class="ycdata_bgimg">
	<a href="/incre/toacList.html" target="_blank"> <img src="../image/box/zjbanner.jpg" alt="背景图"></a>
</div>
<div class="ycdata_info">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>中介服务</li>
		</div>
		<div class="data_info_search fr" >
			<input type="text" id="contentquery" onkeypress="if (event.keyCode == 13)  doquery()" value="" placeholder="请输入搜索关键字">
			<a href="javascript:doquery()"><img src="../image/data/fdj.jpg" alt=""></a>
		</div>
	</div>
</div>

<!-- /*服务类型*/ -->
<ul class="widthbox increlist box tc">
			<li>
				<a href="/incre/tocre.html?cretype=12501">+更多</a>
				<ol>
					<li>
						<h2>信用评级</h2>
						<h6><a href="/incre/tocre.html?cretype=12501"></a></h6>
					</li>
					<s:iterator value="#request.incres">
						<s:if test="cretype==12501">
							<li>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${incredescrip}</p>
								<a href="/incredetail/${id}.html">查看详情</a>
							</li>
						</s:if>
					</s:iterator>
				</ol>
			</li>
			<li>
				<a href="/incre/tocre.html?cretype=12502">+更多</a>
				<ol>
					<li>
						<h2>财税服务</h2>
						<h6><a href="/incre/tocre.html?cretype=12502"></a></h6>
					</li>
					<s:iterator value="#request.incres">
						<s:if test="cretype==12502">
							<li>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${incredescrip}</p>
								<a href="/incredetail/${id}.html">查看详情</a>
							</li>
						</s:if>
					</s:iterator>
				</ol>
			</li>

			<li>
				<a href="/incre/tocre.html?cretype=12503">+更多</a>
				<ol>
					<li>
						<h2>法律服务</h2>
						<h6><a href="/incre/tocre.html?cretype=12503"></a></h6>
					</li>
					<s:iterator value="#request.incres">
						<s:if test="cretype==12503">
							<li>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${incredescrip}</p>
								<a href="/incredetail/${id}.html">查看详情</a>
							</li>
						</s:if>
					</s:iterator>
				</ol>
			</li>
			<li>
				<a href="/incre/tocre.html?cretype=12504">+更多</a>
				<ol>
					<li>
						<h2>知识产权</h2>
						<h6><a href="/incre/tocre.html?cretype=12504"></a></h6>
					</li>
					<s:iterator value="#request.incres">
						<s:if test="cretype==12504">
							<li>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${incredescrip}</p>
								<a href="/incredetail/${id}.html">查看详情</a>
							</li>
						</s:if>
					</s:iterator>
				</ol>
			</li>
			<li>
				<a href="/incre/tocre.html?cretype=12505">+更多</a>
				<ol>
					<li>
						<h2>科技保险</h2>
						<h6><a href="/incre/tocre.html?cretype=12505"></a></h6>
					</li>
					<s:iterator value="#request.incres">
						<s:if test="cretype==12505">
							<li>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${incredescrip}</p>
								<a href="/incredetail/${id}.html">查看详情</a>
							</li>
						</s:if>
					</s:iterator>
				</ol>
			</li>
			<li>
				<a href="/incre/tocre.html?cretype=12506">+更多</a>
				<ol>
					<li>
						<h2>人才服务</h2>
						<h6><a href="/incre/tocre.html?cretype=12506"></a></h6>
					</li>
					<s:iterator value="#request.incres">
						<s:if test="cretype==12506">
							<li>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${incredescrip}</p>
								<a href="/incredetail/${id}.html">查看详情</a>
							</li>
						</s:if>
					</s:iterator>
				</ol>
			</li>
			<li>
				<a href="/incre/tocre.html?cretype=12507">+更多</a>
				<ol>
					<li>
						<h2>品牌策划</h2>
						<h6><a href="/incre/tocre.html?cretype=12507"></a></h6>
					</li>
					<s:iterator value="#request.incres">
						<s:if test="cretype==12507">
							<li>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${incredescrip}</p>
								<a href="/incredetail/${id}.html">查看详情</a>
							</li>
						</s:if>
					</s:iterator>
				</ol>
			</li>
			<li>
				<a href="/incre/tocre.html?cretype=12508">+更多</a>
				<ol>
					<li>
						<h2>其他服务</h2>
						<h6><a href="/incre/tocre.html?cretype=12508"></a></h6>
					</li>
					<s:iterator value="#request.incres">
						<s:if test="cretype==12508">
							<li>
								<img src="${picture}" alt="">
								<h3>${increname}</h3>
								<p>${incredescrip}</p>
								<a href="/incredetail/${id}.html">查看详情</a>
							</li>
						</s:if>
					</s:iterator>
				</ol>
			</li>
		</ul>

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
