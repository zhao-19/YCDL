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
		<tr class="searchshort">
			<td style="text-align: right;">帐号</td>
			<td style="text-align: left;" >
				<s:textfield id="username" readonly="false" theme="simple"/>
			</td>
			
			<td style="text-align: right;">名称</td>
			<td style="text-align: left;" >
				<s:textfield id="nickname" readonly="false" theme="simple"/>
			</td>
			<td>
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
				<a href="/manage/user!toAdd.action" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</a>
			</td>
		</tr>
	</table>
	<table class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
 				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th>帐号</th>
				<th>名称</th>
				<th>手机号</th>
				<th>座机号</th>
				<th style="width: 40%;">角色</th>
				<th>创建时间</th>
				<th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/user!getListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"e.username" : $("#username").val(),
        	"e.nickname" : $("#nickname").val()
        };
    },
    render : function(data) {
        console.log(data);
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.id + "'/></td>");
    		html.push("<td>" + udf(row.username) + "</td>");
    		html.push("<td>" + udf(row.nickname) + "</td>");
    		html.push("<td>" + udf(row.cellPhoneNum) + "</td>");
     		html.push("<td>" + udf(row.telephone) + "</td>");
 			html.push("<td>" + udf(row.role_name) + "</td>");
			html.push("<td>" + timeformat(row.createtime) + "</td>");
 			html.push("<td><a href='javascript:void(0);' onclick=\"toDetail('" + row.id + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a></td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});
function toDetail(id) {
	layer.open({
	    title: '用户信息',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: 'user!toEdit.action?e.id=' + id
	});
}
</script>
</body>
</html>
