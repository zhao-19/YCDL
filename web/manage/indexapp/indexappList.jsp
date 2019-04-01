<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>

<script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.table TD{vertical-align:middle;}
INPUT[type='text']{margin-bottom:0px;}
.pageLink{padding-top:2px!important;}
.selectPageLink {padding-top:3px!important;}
</style>
</head>

<body>
<s:form action="indexapp!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
		 
			<td style="text-align: right;">姓名</td>
			<td style="text-align: left;" >
				<s:textfield name="e.xingming" id="xingming" readonly="false" />
			</td>
 				
			<td style="text-align: right;">电话</td>
			<td style="text-align: left;" >
				<s:textfield name="e.dianhuan" id="dianhuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">类型</td>
			<td style="text-align: left;" >
				<s:textfield name="e.leixing" id="leixing" readonly="false" />
			</td>
 				 
			<td style="text-align: right;">录入时间</td>
			<td style="text-align: left;" >
									<input type="text" class="Wdate" id="lurushijian"  value="<s:property value="e.lurushijian"/>" name="e.lurushijian" onfocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd'  })"  />
				
			</td>
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">

					<button method="indexapp!selectList.action" class="btn btn-primary" onclick="selectList(this)">
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
 						 	<th>企业名称</th>
 							<th>姓名</th>
 							<th>电话</th>
 							<th>类型</th>
 							<th>融资金额</th>
 						 
 							<th>状态</th>
 					 
 							<th>录入时间</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><s:if test="id!=1"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></s:if></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
						 
  								<td>&nbsp;<s:property value="studio"/></td>
 							 
 								<td>&nbsp;<s:property value="xingming"/></td>
 								<td>&nbsp;<s:property value="dianhuan"/></td>
 								<td>&nbsp;<s:property value="leixing"/></td>
 								<td>&nbsp;<s:property value="jine"/> 万元</td>
 								 
 								<td class='checkcolor'>&nbsp;<s:property value="status"/></td>
  								<td>&nbsp;<s:date name="lurushijian" format="yyyy-MM-dd HH:mm:ss"/></td>
 						 
 								
				 
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="indexapp!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
