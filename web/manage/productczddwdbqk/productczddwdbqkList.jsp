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
<s:form action="productczddwdbqk!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
			<td style="text-align: right;">主键</td>
			<td style="text-align: left;" >
				<s:textfield name="e.id" id="id" readonly="false" />
			</td>
 				
			<td style="text-align: right;">主表主键</td>
			<td style="text-align: left;" >
				<s:textfield name="e.releid" id="releid" readonly="false" />
			</td>
 				
			<td style="text-align: right;">被担保人</td>
			<td style="text-align: left;" >
				<s:textfield name="e.beidanbaoren" id="beidanbaoren" readonly="false" />
			</td>
 				
			<td style="text-align: right;">担保余额</td>
			<td style="text-align: left;" >
				<s:textfield name="e.danbaoyue" id="danbaoyue" readonly="false" />
			</td>
 				
			<td style="text-align: right;">担保方式</td>
			<td style="text-align: left;" >
				<s:textfield name="e.danbaofangshi" id="danbaofangshi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">担保开始日</td>
			<td style="text-align: left;" >
				<s:textfield name="e.kaishiriqi" id="kaishiriqi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">担保到期日</td>
			<td style="text-align: left;" >
				<s:textfield name="e.daoqiriqi" id="daoqiriqi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">录入时间</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" />
			</td>
 				
			<td style="text-align: right;">录入人</td>
			<td style="text-align: left;" >
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" />
			</td>
 				
			<td style="text-align: right;">最后修改时间</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="false" />
			</td>
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "productczddwdbqk!selectList.action")){%>

					<button method="productczddwdbqk!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "productczddwdbqk!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</s:a>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "productczddwdbqk!deletes.action")){%>
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
 							<th>主表主键</th>
 							<th>被担保人</th>
 							<th>担保余额</th>
 							<th>担保方式</th>
 							<th>担保开始日</th>
 							<th>担保到期日</th>
 							<th>录入时间</th>
 							<th>录入人</th>
 							<th>最后修改时间</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><s:if test="id!=1"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></s:if></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
								<td>&nbsp;<s:property value="id"/></td>
 								<td>&nbsp;<s:property value="releid"/></td>
 								<td>&nbsp;<s:property value="beidanbaoren"/></td>
 								<td>&nbsp;<s:property value="danbaoyue"/></td>
 								<td>&nbsp;<s:property value="danbaofangshi"/></td>
 								<td>&nbsp;<s:property value="kaishiriqi"/></td>
 								<td>&nbsp;<s:property value="daoqiriqi"/></td>
 								<td>&nbsp;<s:property value="lurushijian"/></td>
 								<td>&nbsp;<s:property value="inputuser"/></td>
 								<td>&nbsp;<s:property value="lastchgtime"/></td>
 								
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
					<s:a href="productczddwdbqk!toEdit.action?e.id=%{id}">编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
