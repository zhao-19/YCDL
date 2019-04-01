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
			<td style="text-align: right;">增值业务名称</td>
			<td style="text-align: left;" >
				<s:textfield id="increname" theme="simple"/>
			</td>
			<td style="text-align: right;">发布企业名称</td>
            <td style="text-align: left;" >
                <s:textfield id="cmpname" theme="simple"/>
            </td>
            <td style="text-align: right;">分站</td>
            <td style="text-align: left;">
                <s:select list="%{#application.areasubstmap}" listKey="key" 
                	listValue="value" id="substation" headerKey="" headerValue="" theme="simple"/>
			<td>
			<td>
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
				<a href="/manage/appGoods!toAdd.action?type=2" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
			</td>
		</tr>
	</table>
	<table class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
 				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th>增值业务名称</th>
				<th>发布企业名称</th>
				<th>价格</th>
				<th>点击量</th>
				<th>关注量</th>
				<th>优先级</th>
				<th>分站</th>
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
$('#pagebar').bPage({
    url : '/manage/incre!getincreListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"e.increname" : $("#increname").val(),
        	"e.cmpname" : $("#cmpname").val(),
        	"e.substation" : $("#substation").val()
        };
    },
    render : function(data) {
		var areamap =  $.parseJSON('${areamap}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.ID + "'/></td>");
    		html.push("<td>" + udf(row.INCRENAME) + "</td>");
    		html.push("<td>" + udf(row.cmpname) + "</td>");
    		html.push("<td>" + udf(row.INCREPRICE) + "元</td>");
    		html.push("<td>" + udf(row.BROWSECOUNT) + "</td>");
    		html.push("<td>" + udf(row.MARKCOUNT) + "</td>");
    		html.push("<td>" + udf(row.sort) + "</td>");
    		html.push("<td>" + udf(areamap[row.substation]) + "</td>");
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
	    title: '详细信息',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: 'appGoods!toEdit.action?type=2&incre.id=' + id
	});
}
</script>
</body>
</html>
