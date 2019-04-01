<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
<s:form action="activitieslinkuser!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
			 
			<td style="text-align: right;">关联的用户编号</td>
			<td style="text-align: left;" >
				<s:textfield name="e.userid" id="userid" readonly="false" />
			</td>
 				
			<td style="text-align: right;">关联的用户名称</td>
			<td style="text-align: left;" >
				<s:textfield name="e.username" id="username" readonly="false" />
			</td>
 				
			<td style="text-align: right;">名字</td>
			<td style="text-align: left;" >
				<s:textfield name="e.attendname" id="attendname" readonly="false" />
			</td>
 				
			<td style="text-align: right;">电话</td>
			<td style="text-align: left;" >
				<s:textfield name="e.attendcell" id="attendcell" readonly="false" />
			</td>
 				
		 
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">

					<button method="activitieslinkuser!selectList.action" class="btn btn-primary" onclick="selectList(this)">
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
			<th style="display: none;">id</th>
  							<th>关联的用户编号</th>
 							<th>关联的用户名称</th>
 							<th>名字</th>
 							<th>电话</th>
 							<th>岗位</th>
 							<th>录入时间</th>
 							<th>最后修改时间</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td> <input type="checkbox" name="ids" value="<s:property value="id"/>"/> </td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
  								<td>&nbsp;<s:property value="userid"/></td>
 								<td>&nbsp;<s:property value="username"/></td>
 								<td>&nbsp;<s:property value="attendname"/></td>
 								<td>&nbsp;<s:property value="attendcell"/></td>
 								<td>&nbsp;<s:property value="attendduty"/></td>
 								<td>&nbsp;<s:property value="lurushijian"/></td>
 								<td>&nbsp;<s:property value="lastchgtime"/></td>
 								
				<%-- <td>
					<s:if test="status.equals(\"y\")">
						<img src="<%=request.getContextPath() %>/resource/images/action_check.gif">
					</s:if>
					<s:elseif test="status.equals(\"n\")">
						<img src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
					</s:elseif>
				</td> --%>
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="activitieslinkuser!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
