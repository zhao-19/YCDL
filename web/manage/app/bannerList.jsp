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
			<td style="text-align: right;">名称</td>
            <td style="text-align: left;">
                <s:textfield id="title" readonly="false" theme="simple"/>
            </td>
            <td style="text-align: right;">展示位置</td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.bannerlocation.childs}" listKey="id" listValue="name"
                	id="location" headerKey="" headerValue="" theme="simple"/>
            </td>
			<td colspan="2">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
				<a href="/manage/appBanner!toAdd.action" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
				<button method="/manage/appBanner!deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
                        <i class="icon-remove-sign icon-white"></i> 删除
                </button>
			</td>
		</tr>
	</table>
	<form>
	<table class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
 				<th>名称</th>
	            <th>是否生效</th>
	            <th>跳转类型</th>
	            <th>数据类型</th>
	            <th>展示位置</th>
	            <th>分站</th>
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
$('#pagebar').bPage({
    url : '/manage/appBanner!getBannerListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"appbanner.title" : $("#title").val(),
        	"appbanner.location" : $("#location").val(),
        	"appbanner.substation" : ""
        };
    },
    render : function(data) {
		var whether =  $.parseJSON('${application.diccode.whether}');
		var urlmethod =  $.parseJSON('${application.diccode.urlmethod}');
		var bannerdata =  $.parseJSON('${application.diccode.bannerdata}');
		var bannerlocation =  $.parseJSON('${application.diccode.bannerlocation}');
		var areamap =  $.parseJSON('${areamap}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.pkid + "'/></td>");
    		html.push("<td>" + udf(row.title) + "</td>");
    		html.push("<td>" + udf(whether[row.iseffective]) + "</td>");
    		html.push("<td>" + udf(urlmethod[row.jumptype]) + "</td>");
    		html.push("<td>" + udf(bannerdata[row.datatype]) + "</td>");
    		html.push("<td>" + udf(bannerlocation[row.location]) + "</td>");
    		html.push("<td>" + udf(areamap[row.substation]) + "</td>");
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
	    title: '详细信息',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: '/manage/appBanner!toEdit.action?e.pkid=' + id
	});
}
</script>
</body>
</html>
