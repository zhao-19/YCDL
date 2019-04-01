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
		<tr>
			<td style="text-align: right;">电话号码</td>
			<td style="text-align: left;" >
				<s:textfield id="telnumber" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">类型</td>
			<td style="text-align: left;" >
				<select id="inputuser">
				    <option value=""></option>
				    <option value="acceptsms">接收短信</option>
				    <option value="workflow">工作流</option>
				    <option value="system">系统</option>
				</select>
			</td>
		</tr>
		<tr>	
			<td colspan="4" style="padding: 6px;">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
				<a href="/manage/message!toAdd.action" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
				<a href="javascript:void(0);" onclick="getSms();" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 收取短信
				</a>
			</td>
		</tr>
	</table>
	<table class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th style="max-width: 20%;">电话号码</th>
				<th style="width: 50%;">短信内容</th>
				<th style="width: 115px;">发送时间</th>
				<th>状态</th>
				<th>录入人</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/message!messageListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"e.telnumber" : $("#telnumber").val(),
        	"e.inputuser" : $("#inputuser").val()
        };
    },
    render : function(data) {
		var khlx =  $.parseJSON('${application.diccode.khlx}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.ID + "'/></td>");
    		html.push("<td>" + udf(row.Telnumber) + "</td>");
    		html.push("<td>" + udf(row.Comtent) + "</td>");
    		html.push("<td>" + timeformat(row.Sendtime) + "</td>");
    		html.push("<td>" + udf(row.msgStatus) + "</td>");
    		html.push("<td>" + udf(row.INPUTUSER) + "</td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});

function getSms() {
	$.ajax({
		type: 'post',
		url: "/manage/message!getSms.action",
		dataType:"text",
		success: function(data){
			layer.alert(data, {icon: 1, title : '提示'});
		}
	});
}
</script>
</body>
</html>
