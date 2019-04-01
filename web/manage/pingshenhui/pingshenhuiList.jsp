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
<s:form action="pingshenhui!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
<!-- 			<td style="text-align: right;">主键</td> -->
<!-- 			<td style="text-align: left;" > -->
<%-- 				<s:textfield name="e.id" id="id" readonly="false" /> --%>
<!-- 			</td> -->
 				
			<td style="text-align: right;">评审时间</td>
			<td style="text-align: left;" >
				<s:textfield name="e.shijian" id="shijian" readonly="false" />
			</td>
 				
			<td style="text-align: right;">专家[%]</td>
			<td style="text-align: left;" >
				<s:textfield name="e.experts" id="experts" readonly="false" />
			</td>
 				
			<td style="text-align: right;">评审会名称</td>
			<td style="text-align: left;" >
				<s:textfield name="e.pmingcheng" id="pmingcheng" readonly="false" />
			</td>
 				
 			<td style="text-align: right;">企业名称</td>
			<td style="text-align: left;" >
				<s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false" />
			</td>
<!-- 			<td style="text-align: right;">评审要求</td> -->
<!-- 			<td style="text-align: left;" > -->
<%-- 				<s:textfield name="e.content" id="content" readonly="false" /> --%>
<!-- 			</td> -->
 				
<!-- 			<td style="text-align: right;">户数</td> -->
<!-- 			<td style="text-align: left;" > -->
<%-- 				<s:textfield name="e.hushu" id="hushu" readonly="false" /> --%>
<!-- 			</td> -->
 				
<!-- 			<td style="text-align: right;">申请总金额</td> -->
<!-- 			<td style="text-align: left;" > -->
<%-- 				<s:textfield name="e.shenqingzongjine" id="shenqingzongjine" readonly="false" /> --%>
<!-- 			</td> -->
 				
<!-- 			<td style="text-align: right;">录入时间</td> -->
<!-- 			<td style="text-align: left;" > -->
<%-- 				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" /> --%>
<!-- 			</td> -->
 				
<!-- 			<td style="text-align: right;">录入人</td> -->
<!-- 			<td style="text-align: left;" > -->
<%-- 				<s:textfield name="e.inputuser" id="inputuser" readonly="false" /> --%>
<!-- 			</td> -->
 				
<!-- 			<td style="text-align: right;">最后修改时间</td> -->
<!-- 			<td style="text-align: left;" > -->
<%-- 				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="false" /> --%>
<!-- 			</td> -->
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "pingshenhui!selectList.action")){%>

					<button method="pingshenhui!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "pingshenhui!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</s:a>
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
<!-- 							<th>主键</th> -->
 							<th>评审时间</th>
 							<th>批次</th>
 							<th>评审会名称</th>
 							<th>户数</th>
 							<th>申请总金额</th>
<!--  							<th>录入时间</th> -->
<!--  							<th>录入人</th> -->
<!--  							<th>最后修改时间</th> -->
 						    <th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><s:if test="id!=1"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></s:if></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
<%-- 				<td>&nbsp;<s:property value="id"/></td> --%>
				<td>&nbsp;<s:date name="shijian" format="yyyy-MM-dd"/></td>
				<td>&nbsp;<s:property value="pichi"/></td>
				<td>&nbsp;<s:property value="pmingcheng"/></td>
				<td>&nbsp;<s:property value="hushu"/></td>
				<td>&nbsp;<s:property value="shenqingzongjine"/> 万</td>
<%-- 				<td>&nbsp;<s:property value="lurushijian"/></td> --%>
<%-- 				<td>&nbsp;<s:property value="inputuser"/></td> --%>
<%-- 				<td>&nbsp;<s:property value="lastchgtime"/></td> --%>
				<!-- 
				<td>
					<s:if test="status.equals(\"y\")">
						<img src="<%=request.getContextPath() %>/resource/images/action_check.gif">
					</s:if>
					<s:elseif test="status.equals(\"n\")">
						<img src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
					</s:elseif>
				</td>
				 -->
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="pingshenhui!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
