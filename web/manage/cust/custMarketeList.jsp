<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
    <link rel="stylesheet" href="/js/bPage/b.page.css?${sysversion}">
	<script type="text/javascript" src="/js/bPage/b.page.js?${sysversion}"></script>
	<style>
		.iframeTitle{height:25px;line-height: 25px;background: #4476A7;  color:#fff;padding: 0 20px;}
		.iframeTitle .iframeClose{
			float:right;
			background: url(/js/common/layer/theme/default/icon.png) no-repeat;
			background-size: 300px auto;
			background-position: 3px -57px !important;
			width: 22px;
			height: 22px;
			margin-top: 3px;
			margin-right:20px;
			cursor: pointer;
		}
	</style>
</head>
<body class="bPageBody">
	<div class="bodyBox" style="padding: 0;">
	<div class="iframeTitle">营销记录<i class="iframeClose"></i></div>
		<div style="padding: 5px;">
			<table class="table table-bordered table-condensed table-search">
				<tr class="searchshort">
					<td style="text-align: left;">拜访人电话</td>
					<td style="text-align: left;" >
						<s:textfield id="visttele" readonly="false" theme="simple"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding: 6px;">
						<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
							<i class="icon-search icon-white"></i> 查询
						</button>
						<a href="javascript:void(0);" id="addmarkete" onclick="toDetail('')" class="btn btn-success">
							<i class="icon-plus-sign icon-white"></i> 新增<span id="name"></span>营销记录
						</a>
					</td>
				</tr>
			</table>
			<table class="table table-striped table-bordered table-hover table-condensed">
				<thead>
					<tr style="background-color: #dff0d8">
						<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
						<th>企业名称</th>
						<th>沟通类型</th>
						<th>拜访人名称</th>
						<th>拜访人电话</th>
						<th>拜访人职位</th>
						<th>录入人</th>
						<th>沟通时间</th>
						<th>录入时间</th>
						<th nowrap="nowrap">操作</th>
					</tr>
				</thead>
				<tbody id="bpagetbody"></tbody>
			</table>
			<div id="pagebar"></div>
		</div>
</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/cust!marketeListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"markete.visttele" : $("#visttele").val(),
        	"markete.qiyeid" : '${para.qiyeid[0]}'
        };
    },
    render : function(data) {
		var commtype =  $.parseJSON('${application.diccode.commtype}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.pkid + "'/></td>");
    		html.push("<td>" + udf(row.qiyemingcheng) + "</td>");
    		html.push("<td>" + udf(commtype[row.commtype]) + "</td>");
    		html.push("<td>" + udf(row.vistperson) + "</td>");
    		html.push("<td>" + udf(row.visttele) + "</td>");
    		html.push("<td>" + udf(row.vistposition) + "</td>");
    		html.push("<td>" + udf(row.inputuser) + "</td>");
    		html.push("<td>" + timeformat(row.commdate) + "</td>");
    		html.push("<td>" + timeformat(row.inputtime) + "</td>");
 			html.push("<td><a href='javascript:void(0);' onclick=\"toDetail('" + row.pkid + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>详情</a></td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});
function toDetail(pkid) {
	var lock = '${para.lock[0] }';
	var custmanage = '${para.custmanage[0] }';
	var userid = '${userid }';
	var inputuser = $("#bpagetbody tr:first td:eq(6)").html();
	if (pkid == "" && lock == "10001" && userid != inputuser && custmanage != userid) {
	   layer.alert("该企业已有客户经理维护，暂不能新增!", {icon: 2, title : '提示'});
	   return;
	}
	layer.open({
	    title: '营销记录编辑',
	    type: 2,
	    skin: 'layui-layer-lan  bpagenarrowtitle markete',
	    area: ['100%', '100%'],
	    content: '/manage/cust!custMarketeEdit.action?appmarkete.pkid=' + pkid + "&appmarkete.qiyeid=${para.qiyeid[0]}&qiyename=" + encodeURI('${para.qiyename[0]}')
	});
}
$('.iframeClose').click(function(){
    var parentIndex = parent.layer.getFrameIndex(window.name);
    parent.layer.close(parentIndex);
});
if ('${para.qiyeid[0]}' == "") {
	$("#addmarkete").remove();
}
$("#name").html("【" + decodeURI('${para.qiyename[0]}') + "】");
</script>
</body>
</html>
