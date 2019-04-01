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
		<tr>
			<td style="text-align: right;width: 100px;">电话号码</td>
			<td style="text-align: left;" >
				<s:textfield id="telnumber" readonly="false" theme="simple"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button>
				<a href="/usermanage/messageEdit.html" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
			</td>
		</tr>
	</table>
	<table class="table table-striped table-hover table-condensed">
		<thead  class="table_title">
			<tr>
				<th width="20"><label class="labelAll"><input type="checkbox" id="firstCheckbox"/></label></th>
				<th>电话号码</th>
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
var substation = '${sessionsubcode}';
if (substation == "") {
	window.parent.location.href = "/usermanage/loginout.html";
}
$('#pagebar').bPage({
    url : '/usermanage/messageListData.html',
    asyncLoad : true,
    params : function() {
        return {
        	"message.telnumber" : $("#telnumber").val(),
        	"message.substation" : substation
        };
    },
    render : function(data) {
		var khlx =  $.parseJSON('${application.diccode.khlx}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><label class=\"labelContain\"><input type='checkbox' name='ids' value='" + row.ID + "'/></label></td>");
    		html.push("<td style='word-break:break-all;'>" + udf(row.Telnumber) + "</td>");
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
if ('${msg}' != "") {
	layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
}
</script>
</body>
</html>
