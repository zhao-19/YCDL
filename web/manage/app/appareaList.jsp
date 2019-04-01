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
<s:form action="appCommon!appareaList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
			<td style="text-align: right;">地名</td>
			<td style="text-align: left;" >
				<s:textfield name="apparea.name" id="name" readonly="false" />
			</td>
 		</tr>
		
		<tr>
			<td colspan="2">
				<button method="appCommon!appareaList.action" class="btn btn-primary" onclick="selectList(this)">
					<i class="icon-search icon-white"></i> 查询
				</button>
				<%-- <s:a method="appareaDetail.action" cssClass="btn btn-success">
					<i class="icon-plus-sign icon-white"></i> 添加
				</s:a> --%>
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
				<th>编号</th>
				<th>地名</th>
				<th>是否启用</th>
				<th>是否分站</th>
				<th>修改时间</th>
				<th>操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td>&nbsp;${pkid }</td>
				<td>&nbsp;${name }</td>
				<td>&nbsp;<% out.print(AppUtil.getCodeName(request.getAttribute("enable")));%></td>
				<td>&nbsp;
				<s:if test="subst=='10001'"><span style="color: orange;">是</span></s:if><s:else>否</s:else>
				</td>
				<td>&nbsp;<s:date name="lastchgtime" format="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<s:a href="appCommon!appareaDetail.action?pkid=%{pkid}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		<tr><td colspan="6" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
    <script type="text/javascript" src="/js/artDialog/art_dialog.js"></script>
    <script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>
<script type="text/javascript">
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 7, title : '提示'});
	}
</script>
</body>
</html>
