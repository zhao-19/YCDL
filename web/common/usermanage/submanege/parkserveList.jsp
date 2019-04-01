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
	<table class="table table-bordered table-condensed table-search">
		<tr class="searchshort">
			<td style="text-align: right;">园区名[%]</td>
			<td style="text-align: left;" >
				<s:textfield id="title" readonly="false" theme="simple"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="padding: 6px;">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
				<a href="/usermanage/parkEdit.html" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
			</td>
		</tr>
	</table>
	<table class="table table-striped  table-hover table-condensed">
		<thead class="table_title">
			<tr>
				<th width="20"><label class="labelAll"><input type="checkbox" id="firstCheckbox"/></label></th>
 				<th>园区名</th>
				<th>租金价格(元)</th>
				<th>占地面积(平方米)</th>
				<th>排序</th>
				<th>是否开放</th>
				<th style="width: 115px;">修改时间</th>
				<th>操作</th>
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
    url : '/usermanage/parkListData.html',
    asyncLoad : true,
    params : function() {
        return {
        	"parkserve.title" : $("#title").val(),
        	"parkserve.substation" : substation
        };
    },
    render : function(data) {
		var whether =  $.parseJSON('${application.diccode.whether}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><label class='labelContain'><input type='checkbox' name='ids' value='" + row.pkid + "'/></label></td>");
    		html.push("<td>" + udf(row.title) + "</td>");
    		html.push("<td>" + udf(row.price) + "</td>");
    		html.push("<td>" + udf(row.acreage) + "</td>");
    		html.push("<td>" + udf(row.sort) + "</td>");
    		html.push("<td>" + udf(whether[row.enable]) + "</td>");
    		html.push("<td>" + timeformat(row.lastchgtime) + "</td>");
 			html.push("<td>");
 			html.push("	<a href='javascript:void(0);' onclick=\"toDetail('" + row.pkid + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a>");
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
	    content: '/usermanage/parkEdit.html?pkid=' + id
	});
}
</script>
</body>
</html>
