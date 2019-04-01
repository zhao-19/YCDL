<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@page import="com.winpow.core.front.SystemManager"%>
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
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/bPage/pageutil.js"></script>
</head>
<body>
<!-- 网站头部 -->
	<%@ include file="../../header.jsp"%>

<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<a href="${producttopimg.url }" target="_black"><img id="producttopimg" src="${producttopimg.image }"></a>
</div>


<div class="creitdor widthbox">
	<div class="creitdor_num">
		<div class="num_l fl">
			<li class="title">债权融资</li>
			<li class="content">共有债权融资项目：<span id="pcount">100</span>条</li>
		</div> 
		<div class="num_r fr">
				<span style="display:inline-block;position:relative;padding-left:50px;">
					<span class="ssppan">名字：</span>
						<input type="text" class="form_text" id="prodname" name="prodname" placeholder="请输入搜索名字"/>
				</span>
				<span >
					<input type="button" class="submit" onclick="doquery()" value="搜 索">
				</span>
		</div>
	</div>
	 <div class="loaddata"></div>
</div>
<div class="data_loading_gd widthbox" >
	<li id="loadmoreword" onclick="load()">查看更多</li>
</div>
<script type="text/javascript">
$('#producttopimg').error(function(){
    $(this).attr('src', "/image/box/cre_bg.png?${sysversion}");
    $(this).parent().attr('href', "javascript:void(0);");
});
 menu_init("product");
var page = 1;
function load(){
	$("#loadmoreword").html("加载中，请稍后...");
	var subnum = '${subnum}';
	$.ajax({
		type: 'post',
		url: "/front/substation!productData.action",
		data: {"subnum": subnum, "prodname": $("#prodname").val(), "page": page ++},
		dataType:"json",
		success: function(data){
			var dkdbfs =  $.parseJSON('${application.diccode.dkdbfs}');
			$("#pcount").html(data.totalRow);
			var html = new Array();
	    	for (var i = 0; i < data.list.length; i ++ ) {
	    		var row = data.list[i];
	    		var substation = udf(row.substation).length == 6 ? row.substation : "000000";
	    		var usedistrict = udf(row.usedistrict);
	    		var biaoqian = udf(row.BIAOQIAN).split(" ");
	    		biaoqian = biaoqian[0] == "" ? [] : biaoqian; 
	    		html.push("<div class='product_list'>");
	    		html.push("	<div class='list_title fl'>");
	    		html.push("		<div class='lt'><img src='" + udf(row.Banks) + "' style='width: 20px;height: 20px;margin-right: 5px;'/>" + row.PRODNAME + "</div>");
	    		html.push("		<div class='spp' style='font-size:12px;'>");
	    		for (var j = 0; j < biaoqian.length;j++) {
	    			html.push("		<span class='ltdiv1'><a href='javascript:void(0);'>" + biaoqian[j] + "</a></span>");
	    		}
	    		html.push("		</div>");
	    		html.push("	</div>");
	    		html.push("	<div class='list_money fl'>");
	    		html.push("		<li class='lm'>" + udf(row.LOANAMT) + "-" + udf(row.LOANAMTMAX) + "万</li>");
	    		html.push("		<li class='lms'>贷款额度</li>");
	    		html.push("	</div>");
	    		html.push("	<div class='list_date fl'>");
	    		html.push("		<li class='ld'>" + udf(row.LOANTERM) + (udf(row.LOANTERM) != udf(row.LOANTERMMAX) ? ("-" + udf(row.LOANTERMMAX)) : "") + "个月</li>");
	    		html.push("		<li class='lds'>贷款期限</li>");
	    		html.push("	</div>");
	    		html.push("	<div class='list_fangshi fl'>");
	    		html.push("		<li class='ld'>" + udf(dkdbfs[row.LOANGUR]) + "</li>");
	    		html.push("		<li class='lds'>担保方式</li>");
	    		html.push("	</div>");
	    		html.push("	<div class='list_addr fl'>");
	    		html.push("		<li class='la'>" + udf(row.LOANAREA) + "</li>");
	    		html.push("		<li class='las'>适用地区</li>");
	    		html.push("	</div>");
	    		html.push("	<div class='list_but fl'><a target='_blank' href='/productdetail/" + row.ID + ".html'>立即申请</a></div>");
	    		html.push("</div>");
	    	}
	    	$(".loaddata").append(html.join(""));
			if (data.list.length == data.pageSize) {
				$('#loadmoreword').html("查看更多");
			} else {
				$('#loadmoreword').html("<p style='color:#888;'>没有数据可以加载了</p>");
				$(".loadmoreword").removeAttr("onclick");
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
<%@ include file="footer.jsp"%>
</body>
</html>