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
<s:form action="productapp!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
		 
 				
			<td style="text-align: right;">申请人</td>
			<td style="text-align: left;" >
				<s:textfield name="e.userid" id="userid" readonly="false" />
			</td>
 			 
 				
			<td style="text-align: right;">产品名称</td>
			<td style="text-align: left;" >
				<s:textfield name="e.prodname" id="prodname" readonly="false" />
			</td>
 				
			<td style="text-align: right;">企业名称</td>
			<td style="text-align: left;" >
				<s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false" />
			</td>
 		 	
 		 	<td style="text-align: right;">状态</td>
 		 		<td style="text-align: left;" >
 		 	<s:select list="%{#application.dic.zqsqzt.childs}" listKey="id"  
                            listValue="name" name="e.status" label="申请状态"  
                            headerKey="" headerValue=""   data-rule="申请状态:required;name" />  
                 </td>     
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">

					<button method="productapp!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
					<!-- 之前不能情况查询条件是因为bean的clear函数清楚值的地方写错了 -->
				<!-- 	<a href="manage/productapp!clear.action" class="btn btn-primary">
						清空
					</a>
				 -->
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
						 
 						 
 							 
 							<th>产品名称</th>
 							<th>企业名称</th>
 							<th>申请金额</th>
 							 
 							<th>联系人</th>
 							<th>联系电话</th>
 							<th>状态</th>
 							<th>审核人</th>
 							<th>申请时间</th>
 						 
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td> <input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
							 
 						 
 								<td>&nbsp;<s:property value="prodname"/></td>
 								<td>&nbsp;<s:property value="qiyemingcheng"/></td>
 								<td>&nbsp;<s:property value="loanamt"/> 万元</td>
 							 
 								<td>&nbsp;<s:property value="lianxiren"/></td>
 								<td>&nbsp;<s:property value="lianxidianh"/></td>
 								<s:if test="status=='审批通过' or status=='驳回'">
 									<td class='checkcolorok'>&nbsp;<s:property value="status"/></td>
 								</s:if>
 								<s:else>
 									<td class='checkcolor'>&nbsp;<s:property value="status"/></td>
 								</s:else>
 								<td>&nbsp;<s:property value="checkuser"/></td>
 								<td>&nbsp;  <s:date name="lurushijian" format="yyyy-MM-dd"/>  </td>
 							 
 								
			 
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="productapp!toEdit2.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
