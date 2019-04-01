<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <s:if test="#session.sessionsubcode=='510117'">
        <!--郫都区-->
        <title>${sessionsubstation}综合金融服务平台</title>
    </s:if>
    <s:else>
        <title>${sessionsubstation}科技金融服务平台</title>
    </s:else>
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/equity.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/about.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resource/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/bPage/pageutil.js"></script>
</head>
<body>
<style>
	.equity_cj_menu_box ul li{height:48px;line-height:44px;margin-right:0px}
	.attentionBox2 div{float:left}
	.attentionStar2{width:80px;margin-top:4px}
	.attentionStar2 b{float:left;font-weight:normal}
	.attentionStar2 span{width:16px;float:left;height:16px;margin-top:-2px;background:url("../../image/stars.png")no-repeat 0px 0}
	.attentionStar2 span.full-star{background-position:-21px 0}
	.attentionStar2 span.half-star{background-position:-42px 0}
	.item_cj_right_price{padding-top:0px;padding-bottom:0px}
	.item_cj_right_price_1{margin-bottom:0px}
	.xmjgfwlc li{max-width:240px}
	.fixed{top:auto;bottom:10%!important;}
</style>
<!-- 网站头部 -->
	<%@ include file="../../header.jsp"%>
<!-- 内容部分 -->

<div class="ycdata_bgimg">
	<a href="${guquantopimg.url }" target="_black"><img id="guquantopimg" src="${guquantopimg.image }"></a>
</div>

<div class="equity_cj_menu_box">
    <div class="cj_container">
        <div class="equity_cj_menu_nav_bar">
            <div class="woshichuangyezhe woshi"><a href="/user/login.html?bzf=c">我是创业者</a></div>
            <div class="woshitouzizhe woshi"><a href="/user/login.html?bzf=t">我是投资者</a></div>
            <div class="equity_cj_menu_nav_right">
                 <input type="text" id="contentquery" onkeypress="if (event.keyCode == 13)  doquery()" placeholder="请输入关键词名称"/>
                 <a href="javascript:doquery()"><span class="glyphicon_search"></span></a>
            </div>
        </div>
    </div>
</div>

<!-- 项目/机构服务流程 -->
<div class="xmjgfwlc_wk">
	<div class="xmjgfwlc">
		<p class="t">融资流程</p>	
		<ul>
			<li>
				<h2><span class="s1">1</span>网上申请<span class="jt">&raquo;</span></h2>
				<p class="d"><span>&nbsp;&nbsp;&nbsp;&nbsp;登陆平台，注册账号，填写信息。</span></p>
			</li>
			<li>
				<h2><span class="s2">2</span>平台辅导<span class="jt">&raquo;</span></h2>
				<p class="d"><span>&nbsp;&nbsp;&nbsp;&nbsp;1周内，帮助梳理融资信息，进行融资宣传。<br/>&nbsp;&nbsp;&nbsp;&nbsp;2周内，开展项目约谈，并签订服务协议。</span></p>
			</li>
			<li>
				<h2><span class="s3">3</span>项目推送<span class="jt">&raquo;</span></h2>
				<p class="d"><span>&nbsp;&nbsp;&nbsp;&nbsp;每月向机构短信告知平台上线企业。<br/>&nbsp;&nbsp;&nbsp;&nbsp;不定期开展融资对接会。<br/>&nbsp;&nbsp;&nbsp;&nbsp;促成优质项目与机构约谈。</span></p>
			</li>
			<li>
				<h2><span class="s4">4</span>融资服务<span class="jt">&raquo;</span></h2>
				<p class="d"><span>&nbsp;&nbsp;&nbsp;&nbsp;提供融资咨询服务。不限于解决融资有关的法律、财务、企业经营等问题。<br/>&nbsp;&nbsp;&nbsp;&nbsp;提供融资培训服务。融资专业导师授课，破译融资难点痛点。<br/>&nbsp;&nbsp;&nbsp;&nbsp;提供融资谈判辅助服务。专业财务顾问，辅助融资谈判，降低融资成本，防范融资风险。</span></p>
			</li>
			<div class="clear"></div>
		</ul>
	</div>
</div>
<!-- 资讯列表 -->
<div class="rmation widthbox">
    <div class="lanren">
        <div class="loaddata"></div>
        <ul class="listjz widthbox"></ul>
        <div class="dianji" onClick="load();"><div class="morejz widthbox" id="loadmoreword">加载更多 </div></div>
   </div>
</div>

<script type="text/javascript">
$('#guquantopimg').error(function(){
    $(this).attr('src', "/image/box/equity_banner1.jpg?${sysversion}");
    $(this).parent().attr('href', "javascript:void(0);");
});
function getCount(count) {
	var num = 0;
	if (count <= 100) {
		num = 2;
	} else if(count <= 200) {
		num = 3;
	} else if(count <= 250) {
		num = 3.5;
	} else if(count <= 300) {
		num = 4;
	} else if(count <= 600) {
		num = 4.5;
	} else if(count > 600) {
		num = 5;
	}
	return num;
}
function star(){
	$(".attentionStar2").each(function(){
		var count = getCount($(this).attr("name"));
        var countInt=parseInt(count);
        $(this).children('span:lt('+countInt+')').addClass('full-star');
      	if(countInt!=count){
          $(this).children('span:nth-child('+(countInt+1)+')').addClass('half-star');
      	}
	});
}
</script>

<script type="text/javascript">
var page = 1;
function load(){
	$("#loadmoreword").html("加载中，请稍后...");
	var subnum = '${subnum}';
	var spsize = $(".listSeparate").length;
	$.ajax({
		type: 'post',
		url: "/front/substation!guquanData.action",
		data: {"subnum": subnum, "mingcheng": $("#contentquery").val(), "page": page ++},
		dataType:"json",
		success: function(data){
			var html = new Array();
			var checksplit = true;
	    	for (var i = 0; i < data.list.length; i ++ ) {
	    		var row = data.list[i];
	    		var substation = udf(row.substation);
	    		if (checksplit &&!subnum == substation && spsize == 0) {
	            	html.push("<img src='<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/fenzhan/listSeparate.png' alt='' class='listSeparate'>");
	            	checksplit = false;
	            }
	    		html.push("<div class='equity_cj_content_item'>");
	    		html.push("	<div class='item_cj_left'>");
	    		html.push("		<img title='" + row.MINGCHENG + "' src='" + row.TUIJIANPIC + "' style='width: 100%;height:100%;'>");
	    		html.push("		<div class='equity_cj_state'>" + udf(row.BIAOQIAN) + "</div>");
	    		html.push("	</div>");
	    		html.push("	<div class='item_cj_right'>");
	    		html.push("		<div class='item_cj_right_title'>" + row.MINGCHENG + "</div>");
	    		html.push("		<div class='item_cj_right_intro'><h3>融资简介：</h3><p>" + row.JIANJIE + "</p></div>");
	    		html.push("		<div class='item_cj_right_price'>");
	    		html.push("			<div class='item_cj_right_price_1'>出让股权比例：<span>" + udf(row.CRGQBL) + "%</span></div>");
	    		html.push("			<div class='item_cj_right_price_1'>融资金额（万元）：<span>" + udf(row.RONGZIEDU) + "万</span></div>");
	    		html.push("			<div class='item_cj_right_price_1'>推荐机构数：<span>" + row.emailcount + "家</span></div>");
	    		html.push("			<div class='item_cj_right_price_1'><div class='attentionBox2'><div>关注度：</div><div class='attentionStar2' name='" + row.BROWSECOUNT + "'><span></span><span></span><span></span><span></span><span></span></div></div></div>");
	    		html.push("			<div class='zqrzjdt'></div>");
	    		html.push("		</div>");
	    		html.push("		<a target='_blank' href='/stockdetail/" + row.ID + ".html'><div class='item_cj_right_bottom'>详细信息</div></a>");
	    		html.push("	</div>");
	    		html.push("</div>");
	    	}
	    	$(".loaddata").append(html.join(""));
			if (data.list.length == data.pageSize) {
				$('#loadmoreword').html("加载更多");
			} else {
				$('#loadmoreword').html("<p style='color:#888;'>没有数据可以加载了</p>");
				$(".dianji").removeAttr("onclick");
			}
			star();
		}
	});
}
load();
function doquery() {
	page = 1;
	$(".loaddata").html("");
	load();
}

</script>

<div class="fixed" id="totop">
    <div class="home">
        <div class="fixed_img tc">
            <a href="javascript:$('body,html').animate({scrollTop:0},500)">
            <a id="backtop" href="javascript:void(0)"><img src="../../image/index/home.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>
<script>
 menu_init("stock");
</script>
<%@ include file="footer.jsp"%>
</body>
</html>