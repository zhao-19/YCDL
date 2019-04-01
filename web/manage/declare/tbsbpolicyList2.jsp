<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bPage/b.page.css">
	<script charset="utf-8" src="<%=request.getContextPath() %>/js/bPage/b.page.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/layer/layer.js"></script>
</head>
<body class="bPageBody">
	<div class="bodyBox">
	<table class="table table-bordered table-condensed table-search">
		<tr>
			<td style="text-align: right;">政策名称</td>
			<td style="text-align: left;">
				<s:textfield name="tbsbpolicy.policy_name" theme="simple" />
			</td>
			<td>
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
				<s:a method="toEdit.action" cssClass="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</s:a>
			</td>
		</tr>
	</table>
	<table
		class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th style='width:20%;'>政策名称</th>
				<th>大类编号</th>
				<th style='width:20%;'>大类名称</th>
				<th>小类编号</th>
				<th style='width:20%;'>小类名称</th>
				<th>开放申请</th>
				<th>申请类型</th>
				<th>修改时间</th>
				<th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/tbsbpolicy!getListData.action',
    asyncLoad : true,
    params : function() {
        return {"tbsbpolicy.policy_name" : $("#policy_name").val()};
    },
    render : function(data) {
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		var ptype = {"1" : "企业", "2" : "机构", "4" : "全部"}
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.id + "'/></td>");
    		html.push("<td>" + udf(row.policy_name) + "</td>");
    		html.push("<td>" + udf(row.toptype_code) + "</td>");
    		html.push("<td>" + udf(row.toptype_name) + "</td>");
    		html.push("<td>" + udf(row.type_code) + "</td>");
    		html.push("<td>" + udf(row.type_name) + "</td>");
    		html.push("<td>" + (row.open_stat == 1 ? "是" : "否") + "</td>");
    		html.push("<td>" + udf(ptype[row.policy_type]) + "</td>");
    		html.push("<td>" + timeformat(row.lastchgtime) + "</td>");
    		html.push("<td><a href='javascript:void(0);' onclick=\"toDetail('" + row.id + "')\" class='btn btn-mini btn-success'>详情</a></td>");
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
	    content: 'tbsbpolicy!toEdit.action?e.id=' + id
	});
}
</script>
</body>
</html>
