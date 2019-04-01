<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
	<link rel="stylesheet" href="/resource/css/FZbase.css?${sysversion}">
    <link rel="stylesheet" href="/js/bPage/b.page.css?${sysversion}">
	<script type="text/javascript" src="/js/bPage/b.page.js?${sysversion}"></script>
	<script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>
</head>
<body class="bPageBody FZbPageBody">
	<div class="bodyBox">
	<table class="table  table-condensed table-search">
		<tr class="searchshort">
			<td style="text-align: right;">名称</td>
			<td style="text-align: left;" >
				<s:textfield id="activities_name" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">编号</td>
			<td style="text-align: left;" >
				<s:textfield id="id" readonly="false" theme="simple"/>
			</td>
 		 
			<td style="text-align: right;">活动类型</td>
			<td style="text-align: left;" >
				<s:select list="%{#application.dic.activitytype.childs}" listKey="id" 
					headerKey="" headerValue="" listValue="name" id="activitiestype" label="活动类型" theme="simple"/>  
         	</td>
				<td style="text-align: right;">活动日期</td>
				<td style="text-align: left;" >
				<input type="text" class="Wdate" id="begintime"
					onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd'})" theme="simple"/>
         	</td>
			<td>

			</td>
		</tr>
		<tr>
			<td colspan="8">
				<button class="btn btn-warning" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button>
				<a href="/usermanage/actiEdit.html" class="btn btn-info">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
			</td>
		</tr>
	</table>
	<table class="table table-striped  table-hover table-condensed">
		<thead class="table_title">
			<tr>
				<th width="20"><label class="labelAll"><input type="checkbox" id="firstCheckbox"/></label></th>
				<th>编号</th>
				<th>名称</th>
				<th style="width: 115px;">开始时间</th>
				<th>参加人数</th>
				<th>报名人数</th>
				<th>录入人</th>
				<th style="width: 64px;">修改时间</th>
				<th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
var substation = '${sessionsubcode}';
if (substation == "") {
	window.parent.location.href = "/usermanage/loginout.html";
}
$('#pagebar').bPage({
    url : '/usermanage/getActiListData.html',
    asyncLoad : true,
    params : function() {
        return {
        	"activities.id" : $("#id").val(),
        	"activities.activities_name" : $("#activities_name").val(),
        	"activities.activitiestype" : $("#activitiestype").val(),
        	"activities.begintime" : $("#begintime").val(),
        	"activities.substation" : substation
        };
    },
    render : function(data) {
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><label class=\"labelContain\"><input type='checkbox' name='ids' value='" + row.ID + "'/><label</td>");
    		html.push("<td>" + udf(row.ID) + "</td>");
    		html.push("<td>" + udf(row.ACTIVITIES_NAME) + "</td>");
    		html.push("<td>" + timeformat(row.BEGINTIME) + "</td>");
    		html.push("<td>" + udf(row.MAXATTEND) + "人</td>");
    		html.push("<td>" + udf(row.attendcount) + "人</td>");
    		html.push("<td>" + udf(row.INPUTUSER) + "</td>");
    		html.push("<td>" + stimeformat(row.LASTCHGTIME) + "</td>");
    		html.push("<td nowrap='nowrap'>");
    		html.push("	<a href='javascript:void(0);' onclick=\"toDetail('" + row.ID + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑 </a>");
    		html.push("	<a href='/usermanage/actiAppList.html?acid=" + row.ID + "' class='btn btn-mini btn-border'>查看报名信息 </a>");
    		html.push("	<a href='/manage/downloadexcel.action?fileName=activities&id=" + row.ID + "' class='btn btn-mini btn-border'>报名名单导出 </a>");
    		html.push("</td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});
function toDetail(id) {
	layer.open({
	    title: '< 返回上一级',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: '/usermanage/actiEdit.html?activities.id=' + id
	});
}
</script>
</body>
</html>
