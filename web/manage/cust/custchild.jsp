<%@page import="com.winpow.services.manage.catalog.bean.Catalog" %>
<%@page import="java.util.List" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<style>
	.table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
	.msg{color:red;display: none;}
</style>

<body>
<table id="ycacti" align="center" border="1" cellpadding="1" cellspacing="1" style="width: 100%;height: 100%">
	<thead>
	<tr class="TT">
		<td>账号类型</td>
		<td>登录名</td>
		<td>客户类型</td>
		<td>手机号</td>
		<td>关联状态</td>
		<td>注册时间</td>
		<td>操作(${custList.size() })</td>
	</tr>
	</thead>
	<tbody>
	<s:iterator value="custList">
		<tr>
			<td>
				<s:if test="main_user_stat==1"><span style="color:red">父账号</span></s:if>
				<s:elseif test="main_user_stat==0"><span style="color:">子账号</span></s:elseif>
				<s:else><span style="color:">无</span></s:else>
			</td>
			<td><s:property value="userid"/></td>
			<td>
				<s:if test="usertype=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa001'">企业客户</s:if>
				<s:elseif test="usertype=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa002'">个人客户</s:elseif>
				<s:elseif test="usertype=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa003'">投资机构</s:elseif>
				<s:elseif test="usertype=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa008'">其它机构</s:elseif>
			</td>
			<td><s:property value="cellphone"/></td>
			<td>
				<s:if test="main_user_stat==1"><span style="color:blue">已关联</span></s:if>
				<s:else>
					<s:if test="status=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa006'"><span style="color:blue">已关联</span></s:if>
					<s:else><span style="color:red">未关联</span></s:else>
				</s:else>
			</td>
			<td><s:property value="adddate.substring(0,10)"/></td>
			<td>
				<a href="javascript:void(0);" onclick="relaChild(this);" name="${id }" fid="${f_id }">设为主账号</a>
			</td>
		</tr>
	</s:iterator>
	</tbody>
</table>

<script type="text/javascript">
	function relaChild(obj) {
		var fid = $(obj).attr("fid");
		if (fid == "") {
			alert("该用户未关联，无法设置主账号！");
			return;
		} 
		$.ajax({
				type: 'post',
				url: "/manage/cust!relaChild.action",
				data: {"id": $(obj).attr("name"),"fid": fid},
				dataType:"json",
				success: function(data){
					if (data.msg = "succ") {
						alert("设置成功!");
						location.reload();
					} else {
						alert(data.msg)
					}
				}
			});
	
	}
</script>
</body>
</html>