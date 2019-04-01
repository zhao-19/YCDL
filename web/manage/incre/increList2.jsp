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
<s:form action="incre!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
			 
			<td style="text-align: right;">增值业务名称</td>
			<td style="text-align: left;" >
				<s:textfield name="e.increname" id="increname" readonly="false" />
			</td>
 				
		 
			<td style="text-align: right;">增值业务类别</td>
			<td style="text-align: left;" >
				<s:textfield name="e.incretype" id="incretype" readonly="false" />
			</td>
 			  
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "incre!selectList.action")){%>

					<button method="incre!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "incre!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</s:a>
				<%} %>
				
					<button method="incre!deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
						<i class="icon-remove-sign icon-white"></i> 删除
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
  							<th>增值业务名称</th>
  							<th>点击量</th>
 							<th>关注量</th>
 						 
 							<th>价格</th>
 							 
  							<th>录入时间</th>
 							<th>录入人</th>
 							<th>最后修改时间</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td> <input type="checkbox" name="ids" value="<s:property value="id"/>"/> </td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
  								<td>&nbsp;<s:property value="increname"/></td>
 
 								<td>&nbsp;<s:property value="browsecount"/></td>
 								<td>&nbsp;<s:property value="markcount"/></td>
 							 
 							 
 								<td>&nbsp;<s:property value="increprice"/> 元</td>
 
    								<td>&nbsp;<s:date name="lurushijian" format="yyyy-MM-dd"/></td>
 								
 								<td>&nbsp;<s:property value="inputuser"/></td>
 								
   								<td>&nbsp;<s:date name="lastchgtime" format="yyyy-MM-dd"/></td>
	 
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="incre!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
