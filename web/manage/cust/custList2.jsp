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
			<td style="text-align: right;">用户名</td>
			<td style="text-align: left;" >
				<s:textfield id="userid" readonly="false" theme="simple"/>
			</td>
			
			<td style="text-align: right;">企业名称[%]</td>
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
			<td colspan="2">
			</td>
		</tr>
		<tr>
		<td colspan="8" style="padding: 6px;">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
				<a href="/manage/cust!toAdd.action" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 新增用户
				</a>
				<a href="javascript:void(0);" onclick="AddQiye();" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 新增企业
				</a>
			</td>
		</tr>
	</table>
	<table class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th>用户名</th>
				<th style="width: 30%;">企业名称</th>
				<th>客户类型</th>
				<th>手机号码</th>
				<th>客户经理</th>
				<th>是否主账号</th>
				<th style="width: 64px;">评审时间</th>
				<th style="width: 80px;">营销时间</th>
				<th style="width: 115px;">登录时间</th>
 				<th nowrap="nowrap" style="width: 116px;">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/cust!getListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"cust.userid" : $("#userid").val(),
        	"cust.qiyename" : $("#qiyename").val(),
        	"cust.cellphone" : $("#cellphone").val(),
        	"cust.usertype" : $("#usertype").val(),
        	"cust.custmanage" : $("#custmanage").val(),
        	"cust.needcheck" : $("#needcheck").val(),
        	"cust.qq_openid" : $("#qq_openid").val()
        };
    },
    render : function(data) {
		var khlx =  $.parseJSON('${application.diccode.khlx}');
		var lockhtml = "<i class='icon-lock'></i>";
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.ID + "'/></td>");
    		html.push("<td>" + udf(row.USERID) + "</td>");
    		var zzjgdm = udf(row.zzjgdm);
    		html.push("<td>" + udf(row.qiyename) + (zzjgdm == "" ? "" : "(" + zzjgdm + ")") + "</td>");
    		html.push("<td>" + udf(khlx[row.USERTYPE]) + "</td>");
     		html.push("<td>" + udf(row.CELLPHONE) + "</td>");
    		html.push("<td>" + udf(row.CUSTMANAGE) + "</td>");
    		html.push("<td>" + (row.main_user_stat == 0 ? "子账号" : "<span style='color:red;''>主账号</span>") + "</td>");
    		var shijian = stimeformat(row.shijian);
    		var lock = udf(row.lock);
    		html.push("<td>" + shijian + "</td>");
    		html.push("<td style='text-align: center;'>" + (lock == "10001" ? lockhtml : "") + stimeformat(row.marketetime) + "</td>");
    		html.push("<td>" + timeformat(row.LASTLOGINTIME) + "</td>");
 			html.push("<td>");
 			html.push("	<a href='javascript:void(0);' onclick=\"toDetail('" + row.ID + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a>");
 			html.push("	<a href='javascript:void(0);' onclick=\"markete('" + row.USERTYPE + "','" + row.f_id + "','" + lock + "','" + row.CUSTMANAGE + "','" + row.qiyename + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>营销</a>");
 			html.push("</td>");
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
	    content: 'cust!toEdit.action?e.id=' + id
	});
}
function AddQiye() {
	layer.open({
	    title: '新增企业',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['80%', '80%'],
	    content: '/manage/cust!addQiye.action'
	});
}
function markete(USERTYPE, f_id, lock, custmanage, qiyename) {
	if (USERTYPE != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001" || f_id == "") {
		layer.alert('该用户未成功关联企业，请稍候重试！', {icon: 2, title : '提示'});
		return;
	}
	layer.open({
	    // title: '营销记录',
	    title:false,
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: '/manage/cust!custMarketeList.action?qiyeid=' + f_id + "&lock=" + lock + "&custmanage=" + custmanage + "&qiyename=" + encodeURI(encodeURI(qiyename))
	});
}

</script>
</body>
</html>
