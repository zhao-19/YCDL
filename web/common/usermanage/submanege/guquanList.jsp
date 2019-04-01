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
            <td style="text-align: right;">项目名称</td>
			<td style="text-align: left;" >
				<s:textfield id="mingcheng" theme="simple"/>
			</td>
			<td style="text-align: right;">录入人</td>
			<td style="text-align: left;" >
				<s:textfield id="inputuser" theme="simple"/>
			</td>
			<td style="text-align: right;">融资状态</td>
			<td style="text-align: left;" >
				<s:select list="%{#application.dic.xmrzzt.childs}" listKey="id" listValue="name" 
					id="rongzizhuangtai" headerKey="" headerValue="" theme="simple"/>  
 			</td>
			<td style="text-align: right;">审核状态</td>
			<td style="text-align: left;" >
				<s:select list="%{#application.dic.xmshzt.childs}" listKey="id" listValue="name" 
					id="shenhezhuangtai" headerKey="" headerValue="" theme="simple"/>  
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">是否推荐到APP</td>
			<td style="text-align: left;"  colspan="7">
                <s:select list="%{#application.dic.sf.childs}" listKey="id" listValue="name" 
                	id="shifoutuijian" headerKey="" headerValue=""  theme="simple"/>  
				</td>
 			</td>

		</tr>
		<tr>
			<td colspan="8">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button>
				<a href="/usermanage/guquanEdit.html" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
				<button method="/usermanage/guquanDelete.html" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
					<i class="icon-remove-sign icon-white"></i> 删除
				</button>
			</td>
		</tr>
	</table>
	<form>
	<table class="table table-striped  table-hover table-condensed">
		<thead>
			<tr  class="table_title">
				<th width="20"><label class="labelAll"><input type="checkbox" id="firstCheckbox"/></label></th>
				<th>项目名称</th>
				<th>发布企业</th>
				<th>行业</th>
				<th>点击量</th>
				<th>约谈量</th>
				<th>出让股权比例</th>
				<th>审核状态</th>
				<th>录入人</th>
				<th style="width:115px;">录入时间</th>
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
    url : '/usermanage/guquanListData.html',
    asyncLoad : true,
    params : function() {
        return {
        	"guquan.mingcheng" : $("#mingcheng").val(),
        	"guquan.rongzizhuangtai" : $("#rongzizhuangtai").val(),
        	"guquan.shenhezhuangtai" : $("#shenhezhuangtai").val(),
        	"guquan.inputuser" : $("#inputuser").val(),
        	"guquan.shifoutuijian" : $("#shifoutuijian").val(),
        	"guquan.substation" : substation
        };
    },
    render : function(data) {
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><label class=\"labelContain\"><input type='checkbox' name='ids' value='" + row.ID + "'/></label></td>");
    		html.push("<td>" + udf(row.MINGCHENG) + "</td>");
    		html.push("<td>" + udf(row.qiyename) + "</td>");
    		html.push("<td>" + udf(row.Hangye) + "</td>");
    		html.push("<td>" + udf(row.BROWSECOUNT) + "</td>");
    		html.push("<td>" + udf(row.appcount) + "</td>");
    		html.push("<td>" + udf(row.CRGQBL) + "%</td>");
    		html.push("<td>" + udf(row.SHENHEZHUANGTAI) + "</td>");
    		html.push("<td>" + udf(row.INPUTUSER) + "</td>");
    		html.push("<td>" + timeformat(row.LURUSHIJIAN) + "</td>");
    		html.push("<td nowrap='nowrap'>");
    		html.push("	<a href='javascript:void(0);' onclick=\"toDetail('/usermanage/guquanEdit.html?guquan.id=" + row.ID + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a>");
    		html.push("	<a target='_blank' href='/stockdetail/" + row.ID + ".html' class='btn btn-mini btn-border'>查看</a>");
    		html.push("</td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});
function toDetail(url) {
	layer.open({
	    title: '< 返回上一级',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: url
	});
}
</script>
</body>
</html>
