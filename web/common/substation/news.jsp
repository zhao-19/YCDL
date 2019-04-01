<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <s:if test="#session.sessionsubcode=='510117'">
        <!--郫都区-->
        <title>${sessionsubstation}综合金融服务平台</title>
    </s:if>
    <s:else>
        <title>${sessionsubstation}科技金融服务平台</title>
    </s:else>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script type="text/javascript" src="/resource/js/jquery-1.9.1.min.js"></script>
   	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/bPage/pageutil.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
</head>
<body>


<!-- 网站头部 -->
	<%@ include file="../../header.jsp"%>


<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<a href="${newstopimg.url }" target="_black"><img id="newstopimg" src="${newstopimg.image }"></a>
</div>

<div class="ycdata_info">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>盈创资讯</li>
		</div>
		<div class="data_info_search fr">
			<input id="queryx" type="text" onkeypress="if (event.keyCode == 13)  doquery()" placeholder="请输入搜索名称">
			<a href="javascript:doquery()"><img src="../../image/data/fdj.jpg" alt=""></a>
		</div>
	</div>
</div>


<!-- 资讯列表 -->
<div class="rmation widthbox">
    <div class="lanren">
        <div class="loaddata"></div>
         <ul class="listjz widthbox"></ul>
         <div class="dianji" onclick="load();"><div class="morejz widthbox" id="loadmoreword">加载更多 </div></div>
      </div>
</div>

<script type="text/javascript">
$('#newstopimg').error(function(){
    $(this).attr('src', "/image/box/rm_bg1.jpg?${sysversion}");
    $(this).parent().attr('href', "javascript:void(0);");
});
var page = 1;
function load(){
	$("#loadmoreword").html("加载中，请稍后...");
	var subnum = '${subnum}';
	$.ajax({
		type: 'post',
		url: "/front/substation!newsData.action",
		data: {"subnum": subnum, "title": $("#queryx").val(), "page": page ++},
		dataType:"json",
		success: function(data){
			var html = new Array();
	    	for (var i = 0; i < data.list.length; i ++ ) {
	    		var row = data.list[i];
	    		var substation = udf(row.substation);
	    		html.push("<div class='outside_bor'>");
	    		html.push("	<div class='img fl'>");
	    		html.push("		<img style='width: 207px;height: 138px;' alt='" + row.TITLE + "' src='" + row.COVER + "'>");
	    		html.push("	</div>");
	    		html.push("<div class='info fr'>");
	    		html.push("	<div class='title'><a target='_blank' href='/newsdetail/" + row.ID + ".html'>[" + row.CATAID + "]" + row.TITLE + "</a></div>");
	    		html.push("	<div class='datatime'>");
	    		html.push("		<li class='time fl'>" + stimeformat(row.SENDTIME) + "</li>");
	    		html.push("		<div class='source fl'>来源：" + row.SOURCE + "</div>");
	    		html.push("	</div>");
	    		html.push("	<div class='center'>" + row.CONTENTS + "<a target='_blank' href='/newsdetail/" + row.ID + ".html'>[更多+]</a></div>");
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
<style type="text/css">
.fixed{top:auto;bottom:10%!important;}
</style>

<script>
 menu_init("news");
</script>

<!--盈创活动end-->
         <%@ include file="footer.jsp"%>
</body>
</html>
