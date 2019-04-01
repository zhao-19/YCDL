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
			<td style="text-align: right;">增值业务名称</td>
			<td style="text-align: left;" >
				<s:textfield id="increname" theme="simple"/>
			</td>
			<td style="text-align: right;">发布企业名称</td>
            <td style="text-align: left;" >
                <s:textfield id="cmpname" theme="simple"/>
            </td>
		</tr>
		<tr>
			<td colspan="4">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button>
				<a href="/usermanage/toProductEdit.html?type=2" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
			</td>
		</tr>
	</table>
	<table class="table table-striped table-hover table-condensed">
		<thead  class="table_title">
			<tr>
				<th width="20"><label class="labelAll"><input type="checkbox" id="firstCheckbox"/></label></th>
				<th>增值业务名称</th>
				<th>价格</th>
				<th>是否推荐</th>
				<th>点击量</th>
				<th>关注量</th>
				<th>优先级</th>
				<th>录入人</th>
				<th style="width: 115px;">最后修改时间</th>
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
    url : '/usermanage/increListData.html',
    asyncLoad : true,
    params : function() {
        return {
        	"incre.increname" : $("#increname").val(),
        	"incre.cmpname" : $("#cmpname").val(),
        	"incre.substation" : substation
        };
    },
    render : function(data) {
    	var whether =  $.parseJSON('${application.diccode.whether}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><label class=\"labelContain\"><input type='checkbox' name='ids' value='" + row.ID + "'/></label></td>");
    		html.push("<td>" + udf(row.INCRENAME) + "</td>");
    		html.push("<td>" + udf(row.INCREPRICE) + "元</td>");
    		html.push("<td>" + udf(whether[row.SHIFOUTUIJIAN]) + "</td>");
    		html.push("<td>" + udf(row.BROWSECOUNT) + "</td>");
    		html.push("<td>" + udf(row.MARKCOUNT) + "</td>");
    		html.push("<td>" + udf(row.sort) + "</td>");
    		html.push("<td>" + udf(row.INPUTUSER) + "</td>");
    		html.push("<td>" + timeformat(row.LASTCHGTIME) + "</td>");
 			html.push("<td><a href='javascript:void(0);' onclick=\"toDetail('" + row.ID + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a></td>");
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
	    content: '/usermanage/toProductEdit.html?type=2&incre.id=' + id
	});
}
</script>
</body>
</html>
