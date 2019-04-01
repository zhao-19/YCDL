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
	<table class="table  table-condensed table-search">
		<tr class="searchshort">
			<td style="text-align: right;">用户名</td>
			<td style="text-align: left;" >
				<s:textfield id="userid" readonly="false" theme="simple"/>
			</td>
			
			<td style="text-align: right;">企业名称</td>
			<td style="text-align: left;" >
				<s:textfield id="qiyename" readonly="false" theme="simple"/>
			</td>
 					
			<td style="text-align: right;">电话号码</td>
			<td style="text-align: left;" >
				<s:textfield id="cellphone" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">客户类型</td>
			<td style="text-align: left;" >
                    <s:select list="%{#application.dic.khlx.childs}" headerKey="" headerValue="" theme="simple"
                          listKey="id" listValue="name" id="usertype"/>
            </td>
		</tr>
		<tr>
			<td style="text-align: right;">客户经理</td>
			<td style="text-align: left;" >
				<s:textfield id="custmanage" readonly="false" theme="simple"/>
			</td>
 				
			<td style="text-align: right;">是否融资导师</td>
			<td style="text-align: left;" >
				<select id="needcheck">
				    <option value=""></option>
				    <option value="10002">待审核</option>
				    <option value="10001">已通过</option>
				</select>
      		</td>
			<td style="text-align: right;">QQ微信用户</td>
			<td style="text-align: left;" >
				<select id="qq_openid">
					<option value=""></option>
					<option value="10000">所有</option>
					<option value="10001">未关联</option>
					<option value="10002">已关联</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="8">
				<button class="btn btn-warning" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button>
			</td>
		</tr>
	</table>
	<table class="table table-striped  table-hover table-condensed">
		<thead class="table_title">
			<tr>
				<th width="20"><label class="labelAll"><input type="checkbox" id="firstCheckbox"/></label></th>
				<th>用户名</th>
				<th style="width: 30%;">企业名称</th>
				<th>客户类型</th>
				<th>手机号码</th>
				<th>客户经理</th>
				<th>是否主账号</th>
				<th style="min-width: 115px;">注册时间</th>
				<th style="min-width: 115px;">上次登录时间</th>
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
    url : '/usermanage/getCustListData.html',
    asyncLoad : true,
    params : function() {
        return {
        	"cust.userid" : $("#userid").val(),
        	"cust.qiyename" : $("#qiyename").val(),
        	"cust.cellphone" : $("#cellphone").val(),
        	"cust.usertype" : $("#usertype").val(),
        	"cust.custmanage" : $("#custmanage").val(),
        	"cust.needcheck" : $("#needcheck").val(),
        	"cust.qq_openid" : $("#qq_openid").val(),
        	"cust.substation" : substation
        };
    },
    render : function(data) {
		var khlx =  $.parseJSON('${application.diccode.khlx}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><label class=\"labelContain\"><input type='checkbox' name='ids' value='" + row.ID + "'/></label></td>");
    		html.push("<td>" + udf(row.USERID) + "</td>");
    		html.push("<td>" + udf(row.qiyename) + "</td>");
    		html.push("<td>" + udf(khlx[row.USERTYPE]) + "</td>");
     		html.push("<td>" + udf(row.CELLPHONE) + "</td>");
    		html.push("<td>" + udf(row.CUSTMANAGE) + "</td>");
    		html.push("<td>" + (row.main_user_stat == 0 ? "子账号" : "<span style='color:red;''>主账号</span>") + "</td>");
    		html.push("<td>" + timeformat(row.ADDDATE) + "</td>");
    		html.push("<td>" + timeformat(row.LASTLOGINTIME) + "</td>");
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
	    content: '/usermanage/toCustEdit.html?cust.id=' + id
	});
}
</script>
</body>
</html>
