<%@page import="com.winpow.core.appUtil.AppUtil"%>
<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/newlayer/layer.js"></script>
</head>

<body>
<s:form action="appCommon!delQiyeList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
			<td style="text-align: right;">操作人</td>
			<td style="text-align: left;" >
				<s:textfield name="appuserlog.operuserid" id="operuserid" readonly="false" />
			</td>
			<td style="text-align: right;">被操作人</td>
			<td style="text-align: left;" >
				<s:textfield name="appuserlog.deluserid" id="deluserid" readonly="false" />
			</td>
 		</tr>
		
		<tr>
			<td colspan="4">
					<button method="appCommon!delQiyeList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
				</div>
			</td>
		</tr>
	</table>
	
	<!--列表部分-->
	<table class="table table-bordered table-hover">
		<thead>
		<tr style="background-color: #dff0d8">
			<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th>操作人</th>
				<th>被操作人</th>
				<th>被操作人用户类型</th>
				<th>被操作人原企业名称</th>
				<th>操作时间</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><input type="checkbox" name="ids" value="<s:property value="pkid"/>"/></td>
				<td>&nbsp;${operuserid }</td>
				<td>&nbsp;${deluserid }</td>
				<td>&nbsp;<% out.print(AppUtil.getCodeName(request.getAttribute("delusertype")));%></td>
				<td>&nbsp;${qiyename }</td>
				<td>&nbsp;<s:date name="lurushijian" format="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
		</s:iterator>
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
<script type="text/javascript">
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 7, title : '提示'});
	}
</script>
</body>
</html>
