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
</head>

<body>
<s:form action="fzlc!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
	 
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "fzlc!selectList.action")){%>

					<button method="fzlc!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "fzlc!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</s:a>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "fzlc!deletes.action")){%>
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
 							<th>时间</th>
 							<th>内容</th>
 							<th>录入时间</th>
 							<th>录入人</th>
 							<th>最后修改时间</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td> <input type="checkbox" name="ids" value="<s:property value="id"/>"/> </td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
 								<td>&nbsp;   <s:date name="shijian" format="yyyy-MM-dd"/></td>
 								<td>&nbsp;<s:property value="neirong"/></td>
  								<td>&nbsp;<s:date name="lurushijian" format="yyyy-MM-dd"/></td>
 								
 								<td>&nbsp;<s:property value="inputuser"/></td>
 								
  								<td>&nbsp;<s:date name="lastchgtime" format="yyyy-MM-dd"/></td>
 								
 								
			 
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="fzlc!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
