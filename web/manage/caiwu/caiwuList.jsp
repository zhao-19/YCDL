<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
</head>

<body>
<s:form action="caiwu!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
			<td style="text-align: right;">主键</td>
			<td style="text-align: left;" >
				<s:textfield name="e.id" id="id" readonly="false" />
			</td>
 				
			<td style="text-align: right;">关联的其他表的主键</td>
			<td style="text-align: left;" >
				<s:textfield name="e.rele_id" id="rele_id" readonly="false" />
			</td>
 				
			<td style="text-align: right;">关联的其他表的表明</td>
			<td style="text-align: left;" >
				<s:textfield name="e.rele_table" id="rele_table" readonly="false" />
			</td>
 				
			<td style="text-align: right;">类型</td>
			<td style="text-align: left;" >
				<s:textfield name="e.caiwutype" id="caiwutype" readonly="false" />
			</td>
 				
			<td style="text-align: right;">年份</td>
			<td style="text-align: left;" >
				<s:textfield name="e.nianfen" id="nianfen" readonly="false" />
			</td>
 				
			<td style="text-align: right;">金额（万）</td>
			<td style="text-align: left;" >
				<s:textfield name="e.amt" id="amt" readonly="false" />
			</td>
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "caiwu!selectList.action")){%>

					<button method="caiwu!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "caiwu!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</s:a>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "caiwu!deletes.action")){%>
 							<s:submit method="deletes" onclick="return deleteSelect()" value="删除" cssClass="btn btn-danger"/> 
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
							<th>主键</th>
 							<th>关联的其他表的主键</th>
 							<th>关联的其他表的表明</th>
 							<th>类型</th>
 							<th>年份</th>
 							<th>金额（万）</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><s:if test="id!=1"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></s:if></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
								<td>&nbsp;<s:property value="id"/></td>
 								<td>&nbsp;<s:property value="rele_id"/></td>
 								<td>&nbsp;<s:property value="rele_table"/></td>
 								<td>&nbsp;<s:property value="caiwutype"/></td>
 								<td>&nbsp;<s:property value="nianfen"/></td>
 								<td>&nbsp;<s:property value="amt"/></td>
 								
				<td>
					<s:if test="status.equals(\"y\")">
						<img src="<%=request.getContextPath() %>/resource/images/action_check.gif">
					</s:if>
					<s:elseif test="status.equals(\"n\")">
						<img src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
					</s:elseif>
				</td>
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="caiwu!toEdit.action?e.id=%{id}">编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
