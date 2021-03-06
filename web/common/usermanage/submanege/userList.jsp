<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
	<link rel="stylesheet" href="/resource/css/FZbase.css?${sysversion}">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bPage/b.page.css">
	<script charset="utf-8" src="<%=request.getContextPath() %>/js/bPage/b.page.js"></script>
</head>
<body class="bPageBody FZbPageBody">
	<div class="bodyBox">
	<table class="table table-condensed table-search">
		<tr class="searchshort">
			<td style="text-align: right;">帐号</td>
			<td style="text-align: left;" >
				<s:textfield id="username" readonly="false" theme="simple"/>
			</td>
			
			<td style="text-align: right;">名称</td>
			<td style="text-align: left;" >
				<s:textfield id="nickname" readonly="false" theme="simple"/>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<button class="btn btn-warning" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button>
			</td>
		</tr>

	</table>
	<table class="table table-striped table-hover table-condensed">
		<thead class="table_title">
			<tr>
				<th width="20"><label class="labelAll"><input type="checkbox" id="firstCheckbox"/></label></th>
				<th>帐号</th>
				<th>名称</th>
				<th>手机号</th>
				<th>座机号</th>
				<th style="width: 40%;">角色</th>
				<th>创建时间</th>
				<!-- <th nowrap="nowrap">操作</th> -->
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
    url : '/usermanage/getUserListData.html',
    asyncLoad : true,
    params : function() {
        return {
        	"user.username" : $("#username").val(),
        	"user.nickname" : $("#nickname").val(),
        	"user.substation" : substation
        };
    },
    render : function(data) {
        console.log(data);
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><label class=\"labelContain\"><input type='checkbox' name='ids' value='" + row.id + "'/></label></td>");
    		html.push("<td>" + udf(row.username) + "</td>");
    		html.push("<td>" + udf(row.nickname) + "</td>");
    		html.push("<td>" + udf(row.cellPhoneNum) + "</td>");
     		html.push("<td>" + udf(row.telephone) + "</td>");
 			html.push("<td>" + udf(row.role_name) + "</td>");
			html.push("<td>" + timeformat(row.createtime) + "</td>");
 			//html.push("<td><a href='javascript:void(0);' onclick=\"toDetail('" + row.id + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a></td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});
/* function toDetail(id) {
	layer.open({
	    title: '用户信息',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: 'user!toEdit.action?e.id=' + id
	});
} */
</script>
</body>
</html>
