<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
    <link rel="stylesheet" href="/js/bPage/b.page.css?${sysversion}">
	<script type="text/javascript" src="/js/bPage/b.page.js?${sysversion}"></script>
</head>
<body class="bPageBody">
	<div class="bodyBox">
	<table class="table table-bordered table-condensed table-search">
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
			<td colspan="6">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
			</td>
		</tr>
	</table>
	<table class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th>培训活动名称</th>
				<th>用户编号</th>
				<th>企业名称</th>
				<th>参加人的名字</th>
				<th>参加人电话</th>
				<th>参加人职务</th>
				<th>数据来源</th>
				<th>状态</th>
				<th>是否签到</th>
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
$('#pagebar').bPage({
    url : '/manage/activitiesapp!getAcAppListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"e.activities_name" : $("#activities_name").val(),
        	"e.userid" : $("#userid").val(),
        	"e.username" : $("#username").val(),
        	"e.attendname" : $("#attendname").val(),
        	"e.activitiid" : $("#activitiid").val()
        };
    },
    render : function(data) {
		var datasources =  $.parseJSON('${application.diccode.datasources}');
		var bmzt =  $.parseJSON('${application.diccode.bmzt}');
		var whether =  $.parseJSON('${application.diccode.whether}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.ID + "'/></td>");
    		html.push("<td>" + udf(row.ACTIVITIES_NAME) + "</td>");
    		html.push("<td>" + udf(row.USERID) + "</td>");
    		html.push("<td>" + udf(row.USERNAME) + "</td>");
    		html.push("<td>" + udf(row.ATTENDNAME) + "</td>");
    		html.push("<td>" + udf(row.ATTENDCELL) + "</td>");
    		html.push("<td>" + udf(row.ATTENDDUTY) + "</td>");
    		html.push("<td>" + udf(datasources[row.datasource]) + "</td>");
    		html.push("<td>" + udf(bmzt[row.stat]) + "</td>");
    		html.push("<td>" + udf(whether[row.checked]) + "</td>");
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
	    title: '详细信息',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: '/manage/activitiesapp!toEdit.action?e.id=' + id
	});
}
</script>
</body>
</html>
