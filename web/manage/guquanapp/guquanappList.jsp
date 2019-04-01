<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<style type="text/css">
.table TD{vertical-align:middle;}
INPUT[type='text']{margin-bottom:0px;}
.pageLink{padding-top:2px!important;}
.selectPageLink {padding-top:3px!important;}
select{margin-bottom:0px;height:auto;}
</style>
</head>

<body>
<s:form action="guquanapp!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
			 
			<td style="text-align: right;">股权融资项目编号</td>
			<td style="text-align: left;" >
				<s:textfield name="e.increid" id="increid" readonly="false" />
			</td>
 				
			<td style="text-align: right;">用户编号</td>
			<td style="text-align: left;" >
				<s:textfield name="e.userid" id="userid" readonly="false" />
			</td>
 				
			<td style="text-align: right;">申请状态</td>
			<td style="text-align: left;" >
				<%--<s:textfield name="e.status" id="status" readonly="false" />--%>
				<s:select list="%{#application.dic.sqzt.childs}" listKey="id"
						  listValue="name" name="e.status" label="申请状态"
						  headerKey="" headerValue=""   data-rule="申请状态:required;name" />
			</td>
 				
			<td style="text-align: right;">处理人</td>
			<td style="text-align: left;" >
				<s:textfield name="e.checkuser" id="checkuser" readonly="false" />
			</td>
 		 
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">
				 

					<button method="guquanapp!selectList.action" class="btn btn-primary" onclick="selectList(this)">
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
 							<th>项目名称</th>
 							<th>用户编号</th>
 							<th>申请状态</th>
 							<th>处理人</th>
 							<th>申请时间</th>
  						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td> <input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
  								<td>&nbsp;<s:property value="increname"/></td>
 								<td>&nbsp;<s:property value="userid"/></td>
 								<td class='checkcolor'>&nbsp;<s:property value="status"/></td>
 								<td>&nbsp;<s:property value="checkuser"/></td>
 								<td>&nbsp;<s:date name="lurushijian" format="yyyy-MM-dd HH:mm:ss"/> </td>
  								
			 
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="guquanapp!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
