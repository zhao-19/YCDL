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
</head>
<body class="bPageBody FZbPageBody">
	<div class="bodyBox">
	<table class="table table-condensed table-search">
		<tr class="searchshort">
         	<td style="text-align: right;">培训活动名称</td>
			<td style="text-align: left;" >
				<s:textfield id="activities_name" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">用户编号</td>
			<td style="text-align: left;" >
				<s:textfield id="userid" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">企业名称</td>
			<td style="text-align: left;" >
				<s:textfield id="username" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">参加人的名字</td>
			<td style="text-align: left;" >
				<s:textfield id="attendname" readonly="false" theme="simple"/>
			</td>
			</tr><tr>
			<td style="text-align: right;">活动编号</td>
 		 	<td  style="text-align: left;">
				<s:textfield id="activitiid" readonly="false" theme="simple"/>
			</td>

		</tr>
		<tr>
			<td colspan="8">
				<button class="btn btn-warning" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button>
			</td>
		</tr>
	</table>
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr class="table_title">
				<th width="20"><label class="labelAll"><input type="checkbox" id="firstCheckbox"/></label></th>
				<th>培训活动名称</th>
				<th>用户编号</th>
				<th>企业名称</th>
				<th>参加人的名字</th>
				<th>参加人电话</th>
				<th>参加人职务</th>
				<th>数据来源</th>
				<th>状态</th>
				<th style="width: 115px;">报名时间</th>
				<th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
$("#activitiid").val('${acid }');
var substation = '${sessionsubcode}';
if (substation == "") {
	window.parent.location.href = "/usermanage/loginout.html";
}
$('#pagebar').bPage({
    url : '/usermanage/actiAppListData.html',
    asyncLoad : true,
    params : function() {
        return {
        	"activitiesapp.activities_name" : $("#activities_name").val(),
        	"activitiesapp.userid" : $("#userid").val(),
        	"activitiesapp.username" : $("#username").val(),
        	"activitiesapp.attendname" : $("#attendname").val(),
        	"activitiesapp.activitiid" : $("#activitiid").val(),
        	"activitiesapp.substation" : substation
        };
    },
    render : function(data) {
		var datasources =  $.parseJSON('${application.diccode.datasources}');
		var bmzt =  $.parseJSON('${application.diccode.bmzt}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><label class='labelContain'><input type='checkbox' name='ids' value='" + row.ID + "'/></label></td>");
    		html.push("<td>" + udf(row.ACTIVITIES_NAME) + "</td>");
    		html.push("<td>" + udf(row.USERID) + "</td>");
    		html.push("<td>" + udf(row.USERNAME) + "</td>");
    		html.push("<td>" + udf(row.ATTENDNAME) + "</td>");
    		html.push("<td>" + udf(row.ATTENDCELL) + "</td>");
    		html.push("<td>" + udf(row.ATTENDDUTY) + "</td>");
    		html.push("<td>" + udf(datasources[row.datasource]) + "</td>");
    		html.push("<td>" + udf(bmzt[row.stat]) + "</td>");
    		html.push("<td>" + timeformat(row.LASTCHGTIME) + "</td>");
    		html.push("<td>");
    		html.push("		<a href='javascript:void(0);' onclick=\"toDetail('" + row.ID + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a>");
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
	    content: '/usermanage/actiAppEdit.html?activitiesapp.id=' + id
	});
}
</script>
</body>
</html>
