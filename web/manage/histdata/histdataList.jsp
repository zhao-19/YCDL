<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<style type="text/css">
.table TD{vertical-align:middle;}
INPUT[type='text']{margin-bottom:0px;}
.pageLink{padding-top:2px!important;}
.selectPageLink {padding-top:3px!important;}
.table thead th {
    vertical-align:inherit!important;
}
</style>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
</head>

<body>
<s:form action="user!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
	 
		</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "histdata!selectList.action")){%>

					<button method="histdata!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				 
				
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
			<th style="display: none;">id</th>
							<th>编号</th>
 							<th>存量服务企业数量（家）</th>
 							<th>存量贷款金额（万元）</th>
 							<th>存量合作投资机构数量（家）</th>
 							<th>存量股权项目数（个）</th>
 							<th>存量股权项目金额（万元）</th>
 							<th>新增时间</th>
 							<th>录入人</th>
 							<th>上次修改时间</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><s:if test="id!=1"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></s:if></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
								<td>&nbsp;<s:property value="id"/></td>
 								<td>&nbsp;<s:property value="histcomp"/></td>
 								<td>&nbsp;<s:property value="histloanamt"/></td>
 								<td>&nbsp;<s:property value="histvccount"/></td>
 								<td>&nbsp;<s:property value="histguquancount"/></td>
 								<td>&nbsp;<s:property value="histguquanamt"/></td>
 								<td>&nbsp;<s:date name="addDate" format="yyyy-MM-dd HH:mm:ss"/></td>
 								<td>&nbsp;<s:property value="inputuser"/></td>
 								<td>&nbsp;<s:date name="lastchgtime"  format="yyyy-MM-dd HH:mm:ss"/></td>
 								
				 
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="histdata!toEdit.action?e.id=%{id}"  class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
