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
	<table class="table  table-condensed table-search">
		<tr class="searchshort">
			<td style="text-align: right;">标题</td>
			<td style="text-align: left;" >
				<s:textfield id="title" readonly="false" theme="simple"/>
			</td>
		
			<td style="text-align: right;">是否审核</td>
				<td style="text-align: left;" >
					<s:select list="%{#application.dic.sf.childs}" listKey="id"  
                            listValue="name" id="ischeck" label="状态"  theme="simple"
                            headerKey="" headerValue="" />  
            </td>

		</tr>
		<tr>
			<td colspan="4">
				<button class="btn btn-warning" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button>
				<a href="/usermanage/newsEdit.html" class="btn btn-info">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
				<button method="/usermanage/newsDeletes.html" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
					<i class="icon-remove-sign icon-white"></i> 删除
				</button>
			</td>
		</tr>
	</table>
	<form>
	<table class="table table-striped  table-hover table-condensed">
		<thead class="table_title">
			<tr>
				<th width="20"><label class="labelAll"><input type="checkbox" id="firstCheckbox"/></label></th>
 				<th>编号</th>
				<th>标题</th>
				<th>展示位置</th>
				<th>点击量</th>
				<th>是否审核</th>
				<th>录入人</th>
				<th style="width: 64px;">发布时间</th>
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
    url : '/usermanage/newsListData.html',
    asyncLoad : true,
    params : function() {
        return {
        	"news.ischeck" : $("#ischeck").val(),
        	"news.title" : $("#title").val(),
        	"news.substation" : substation
        };
    },
    render : function(data) {
		var showlocation =  $.parseJSON('${application.diccode.showlocation}');
		var sf =  $.parseJSON('${application.diccode.sf}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><label class=\"labelContain\"><input type='checkbox' name='ids' value='" + row.ID + "'/></label></td>");
    		html.push("<td>" + udf(row.ID) + "</td>");
    		html.push("<td>" + udf(row.TITLE) + "</td>");
    		html.push("<td>" + udf(showlocation[row.showlocation]) + "</td>");
    		html.push("<td>" + udf(row.HITS) + "</td>");
    		html.push("<td>" + udf(sf[row.ISCHECK]) + "</td>");
    		html.push("<td>" + udf(row.INPUTUSER) + "</td>");
    		html.push("<td>" + stimeformat(row.SENDTIME) + "</td>");
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
	    content: '/usermanage/newsEdit.html?news.id=' + id
	});
}
</script>
</body>
</html>
