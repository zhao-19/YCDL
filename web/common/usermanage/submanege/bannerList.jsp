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
			<td style="text-align: right;">名称</td>
            <td style="text-align: left;">
                <s:textfield id="title" readonly="false" theme="simple"/>
            </td>
            <td style="text-align: right;">展示位置</td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.bannerlocation.childs}" listKey="id" listValue="name"
                	id="location" headerKey="" headerValue="" theme="simple"/>
            </td>
		</tr>
		<tr>
			<td colspan="4">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button>
				<a href="/usermanage/bannerEdit.html" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
				<button method="/manage/appBanner!deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
					<i class="icon-remove-sign icon-white"></i> 删除
				</button>
			</td>
		</tr>
	</table>
	<form>
	<table class="table table-striped  table-hover table-condensed">
		<thead>
			<tr class="table_title">
				<th width="20">
					<label class="labelAll"><input type="checkbox" id="firstCheckbox"/></label>
				</th>
 				<th>名称</th>
	            <th>是否生效</th>
	            <th>跳转类型</th>
	            <th>数据类型</th>
	            <th>展示位置</th>
	            <th>优先级</th>
	            <th style="min-width: 115px;">修改时间</th>
	            <th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	</form>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
var substation = '${sessionsubcode}';
if (substation == "") {
	window.parent.location.href = "/usermanage/loginout.html";
}
$('#pagebar').bPage({
    url : '/usermanage/bannerListData.html',
    asyncLoad : true,
    params : function() {
        return {
        	"appbanner.title" : $("#title").val(),
        	"appbanner.location" : $("#location").val(),
        	"appbanner.substation" : substation
        };
    },
    render : function(data) {
		var whether =  $.parseJSON('${application.diccode.whether}');
		var urlmethod =  $.parseJSON('${application.diccode.urlmethod}');
		var bannerdata =  $.parseJSON('${application.diccode.bannerdata}');
		var bannerlocation =  $.parseJSON('${application.diccode.bannerlocation}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><label class=\"labelContain\"><input type='checkbox' name='ids' value='" + row.pkid + "'/></label></td>");
    		html.push("<td>" + udf(row.title) + "</td>");
    		html.push("<td>" + udf(whether[row.iseffective]) + "</td>");
    		html.push("<td>" + udf(urlmethod[row.jumptype]) + "</td>");
    		html.push("<td>" + udf(bannerdata[row.datatype]) + "</td>");
    		html.push("<td>" + udf(bannerlocation[row.location]) + "</td>");
    		html.push("<td>" + udf(row.sort) + "</td>");
    		html.push("<td>" + timeformat(row.updatedate) + "</td>");
    		html.push("<td><a href='javascript:void(0);' onclick=\"toDetail('" + row.pkid + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a></td>");
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
	    content: '/usermanage/bannerEdit.html?appbanner.pkid=' + id
	});
}
</script>
</body>
</html>
