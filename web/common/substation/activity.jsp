<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.winpow.core.system.bean.Config"%>
<%@ page import="com.winpow.core.front.SystemManager"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
   	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/bPage/pageutil.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
</head>
<body>

<!-- 网站头部 -->
	<%@ include file="../../header.jsp"%>

<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<a href="${activitytopimg.url }" target="_black"><img id="activitytopimg" src="${activitytopimg.image }"></a>
</div>

<div class="ycdata_info">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>盈创活动</li>
		</div>
		<div class="data_info_search fr" >
			<input id="contentquery"  onkeypress="if (event.keyCode == 13)  doquery()"
			 type="text" placeholder="请输入搜索名称">
			<a href="javascript:doquery()"><img src="../../image/data/fdj.jpg" alt=""></a>
		</div>
		
	</div>
</div>


<!-- 盈创活动列表 -->
<div class="college_info widthbox">
    <div class="lanren">
        <div class="loaddata"></div>
        <ul class="listjz widthbox"></ul>
        <div class="dianji" onClick="load();" style="margin-bottom: 50px;"><div class="morejz widthbox" id="loadmoreword">加载更多 </div></div>
     </div>
</div>
<!--<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/fenzhan/listSeparate.png" alt="" class="listSeparate">-->

<script type="text/javascript">
$('#activitytopimg').error(function(){
    $(this).attr('src', "/image/college/banner.jpg?${sysversion}");
    $(this).parent().attr('href', "javascript:void(0);");
});
var page = 1;
function load(){
	$("#loadmoreword").html("加载中，请稍后...");
	var subnum = '${subnum}';
	$.ajax({
		type: 'post',
		url: "/front/substation!activityData.action",
		data: {"subnum": subnum, "title": $("#contentquery").val(), "page": page ++},
		dataType:"json",
		success: function(data){
			var nowtime = data.nowtime;
			var html = new Array();
	    	for (var i = 0; i < data.list.length; i ++ ) {
	    		var row = data.list[i];
	    		var substation = udf(row.substation);
	    		var endtime = row.ENDTIME;
	    		var attend = nowtime - endtime > 0;
	    		html.push("<div class='college_info_list " + ( attend ? "libg" : "") + "'>");
	    		html.push("	<div class='college_info_list_l fl'><a target='_blank' href='/collegedetail/" + row.ID + ".html'><img src='" + row.ACTIVITIES_IMAGE + "' ></a></div>");
	    		html.push("	<div class='fr' style='width:855px;'>");
	    		html.push("		<div class='college_info_list_r_title fl'>");
	    		html.push("			<h3><a target='_blank' href='/collegedetail/" + row.ID + ".html'>" + row.ACTIVITIES_NAME + "</a><span>" + (attend ? "(已举办)" : "") + "</span></h3>");
	    		html.push("			<div><span>报名截止时间：" + timeformat(row.STOPTIME) + "</span><br>");
	    		html.push("			<span>活动开始时间：" + timeformat(row.BEGINTIME) + "</span><br>");
 	    		html.push("			<span>活动结束时间：" + timeformat(row.ENDTIME) + "</span><br>");
 	    		html.push("			<span>活动地址：" + row.ADDRESS + "</span></div>");
	    		html.push("		</div>");
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
            <a id="backtop" href="javascript:void(0)"><img src="../..//image/index/home.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>
<style type="text/css">
.fixed{top:auto;bottom:10%!important;}
</style>

<script>
 menu_init("college");
</script>

<!-- 网站尾部 --> 
         <%@ include file="footer.jsp"%>
         
         
</body>
</html>