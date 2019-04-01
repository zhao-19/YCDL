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
select{height:auto;}
.pageLink{padding-top:2px!important;}
.selectPageLink {padding-top:3px!important;}
</style>
</head>

<body>
<s:form action="fileinfo!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
			<td style="text-align: right;">标题</td>
			<td style="text-align: left;" >
				<s:textfield name="e.title" id="title" readonly="false" />
			</td>
 				
	        <td style="text-align: left;">类型<s:select
                        list="%{#request.filetypeList}" listKey="id" listValue="name"
                        name="e.filetype" label="状态" headerKey="" headerValue="" />
                </td>
 		 
 				
			 
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="4">
				<%if(PrivilegeUtil.check(request.getSession(), "fileinfo!selectList.action")){%>

					<button method="fileinfo!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "fileinfo!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</s:a>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "fileinfo!deletes.action")){%>
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
				<th>类别</th>
							<th>编号</th>
 							<th>培训活动号</th>
 							<th>标题</th>
 							<th>下载次数</th>
 							<th>优先级</th>
 							<th>录入时间</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td> <input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				                <td>&nbsp;<s:property value="filetype"/></td>
								<td>&nbsp;<s:property value="id"/></td>
 								<td>&nbsp;<s:property value="activitiesid"/></td>
 								<td>&nbsp;<s:property value="title"/></td>
 								<td>&nbsp;<s:property value="downcount"/>次</td>
 								<td>&nbsp;<s:property value="sort"/></td>
  								<td>&nbsp;<s:date name="lurushijian" format="yyyy-MM-dd HH:mm:ss"/></td>
 								
 								
			 
				<td nowrap="nowrap">
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="fileinfo!toEdit.action?e.id=%{id}"  class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
					<a href="<s:property value="fileurl"/>" class="btn btn-mini btn-success"><i class="icon-white icon-download-alt"></i>下载文件</a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
