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
			<td style="text-align: right;">标题[%]</td>
			<td style="text-align: left;" >
				<s:textfield id="title" readonly="false" theme="simple"/>
			</td>
			
			<td style="text-align: right;">网站名称[%]</td>
			<td style="text-align: left;" >
				<s:textfield id="info_source" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">状态</td>
			<td style="text-align: left;" >
				<s:select list="%{#application.dic.zqsqzt.childs}" listKey="id" listValue="name" 
            		headerKey="" headerValue="" id="checkresult" theme="simple"/>
			</td>
		</tr>
		<tr>
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
				<th style="width: 40%;">标题</th>
				<th>网站名称</th>
				<th>所属行业</th>
				<th>所属分类</th>
				<th>状态</th>
				<th>审核人</th>
				<th style="min-width: 115px;">公布时间</th>
 				<th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/appCommon!policyListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"spiderpolicy.title" : $("#title").val(),
        	"spiderpolicy.info_source" : $("#info_source").val(),
        	"spiderpolicy.checkresult" : $("#checkresult").val()
        };
    },
    render : function(data) {
		var industryclassify =  $.parseJSON('${application.diccode.industryclassify}');
		var typeclassify =  $.parseJSON('${application.diccode.typeclassify}');
		var zqsqzt =  $.parseJSON('${application.diccode.zqsqzt}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.pkid + "'/></td>");
    		html.push("<td>" + udf(row.title) + "</td>");
    		html.push("<td>" + udf(row.info_source) + "</td>");
     		html.push("<td>" + udf(industryclassify[row.domaintype]) + "</td>");
    		html.push("<td>" + udf(typeclassify[row.infotypes]) + "</td>");
    		html.push("<td>" + udf(zqsqzt[row.checkresult]) + "</td>");
    		html.push("<td>" + udf(row.checkuser) + "</td>");
    		html.push("<td>" + stimeformat(row.publishtime) + "</td>");
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
	    content: '/manage/appCommon!policyDetail.action?spiderpolicy.pkid=' + id
	});
}
</script>
</body>
</html>
