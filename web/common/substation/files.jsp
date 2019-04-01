<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.incre.bean.Incre"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
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
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/bPage/pageutil.js"></script>
</head>
<body>
<!-- 网站头部 -->
	<%@ include file="../../header.jsp"%>
<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<a href="${filestopimg.url }" target="_black"><img id="filestopimg" src="${filestopimg.image }"></a>
</div>
<div class="ycdata_info">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>资料下载</li>
		</div>
		<div class="data_info_search fr" >
			<input id="querycontent" type="text" onkeypress="if (event.keyCode == 13)  doquery()">
			<a href="javascript:doquery()"><img src="../../image/data/fdj.jpg" alt=""></a>
		</div>
	</div>
</div>

<div class="downkind bl">
    <input type="hidden" id="filetype2">
    <div class="ov fenlei">
        <span class="fl">分类：</span>
        <ul class="fr" id = "filetype">
            <li><a class="typea active" onclick="loadtype(this)" href="javascript:void(0)" lang="" >全部</a></li>
            <s:iterator value="%{#application.dic.filetype.childs}" var="type">
            <li><a class="typea" onclick="loadtype(this)" href="javascript:void(0)" lang="<s:property value="#type.id"/>"><s:property value="#type.name"/></a></li>
            </s:iterator>
        </ul>
    </div>
</div>
<div class="download widthbox">   
 	<ul class="downlist"></ul>
	<ul class="morebox"></ul>
	<li id="loadmorewordh" onclick="load();" >查看更多</li>
</div>
<script type="text/javascript">
$('#filestopimg').error(function(){
    $(this).attr('src', "/image/box/dl_bg.png?${sysversion}");
    $(this).parent().attr('href', "javascript:void(0);");
});
String.prototype.endWith = function(endStr) {
	var d = this.length - endStr.length;
	return (d >= 0 && this.lastIndexOf(endStr) == d)
}
function gettype(name) {
	var type = "def";
	if (name.endWith("doc")) {
		type = "doc n1";
	} else if (name.endWith("docx")) {
		type = "docx n2";
	} else if (name.endWith("ppt")) {
		type = "ppt odd";
	} else if (name.endWith("pptx")) {
		type = "pptx even";
	} else if (name.endWith("pdf")) {
		type = "pdf odd";
	} else if (name.endWith("rar")) {
		type = "rar even";
	} else if (name.endWith("xls")) {
		type = "xls odd";
	} else if (name.endWith("xlsx")) {
		type = "xlsx even";
	}
	return type;
}
var page = 1;
function load(){
	$("#loadmorewordh").html("加载中，请稍后...");
	$.ajax({
		type: 'post',
		url: "/front/substation!filesData.action",
		data: {"subnum": '${subnum}', "title": $("#querycontent").val(), "filetype": $("#filetype2").val(), "page": page ++},
		dataType:"json",
		success: function(data){
			var html = new Array();
	    	for (var i = 0; i < data.list.length; i ++ ) {
	    		var row = data.list[i];
 	    		var fileurl = gettype(row.FILEURL);
 	    		var sort = udf(row.sort);
 	    		var hot = "";
 	    		if (sort != "" && sort >= 100) {
 	    			hot = "<i></i>";
 	    		}
	    		html.push("<li class='" + fileurl + "' name='" + fileurl + "'>");
	    		html.push("	<div class='downtitle'><p>" + hot + row.TITLE + "</p></div>");
	    		html.push("	<div class='downintro'>");
	    		html.push("		<div class='downintrotxt'><p>" + row.CONTENTS + "</p></div>");
	    		html.push("		<div class='downnow'><a href='/download.action?number=2&id=" + row.ID + "' download='" + row.TITLE + "'>立即下载</a></div>");
	    		html.push("	</div>");
	    		html.push("</li>");
	    	}
	    	$(".downlist").append(html.join(""));
			if (data.list.length == data.pageSize) {
				$('#loadmorewordh').html("加载更多");
			} else {
				$('#loadmorewordh').html("<p style='color:#888;'>没有数据可以加载了</p>");
				$(".loadmorewordh").removeAttr("onclick");
			}
		}
	});
}
load();
function doquery() {
	page = 1;
	$(".downlist").html("");
	load();
}
function loadtype(obj) {
   	$(".typea").removeClass('active');
   	$(obj).addClass('active');
   	$("#filetype2").val($(obj).attr("lang"));
   	doquery();
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
 menu_init("files");
</script>
         <%@ include file="footer.jsp"%>
</body>
</html>
