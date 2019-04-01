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

<link rel="stylesheet" href="../css/progressBar.css"/>
<link rel="stylesheet" href="../css/selectPbczdbase.css"/>
<script src="../js/selectPbczdbase.js"></script>
<style type="text/css">
.table TD{vertical-align:middle;}
INPUT[type='text']{margin-bottom:0px;}
.pageLink{padding-top:2px!important;}
.selectPageLink {padding-top:3px!important;}
select{margin-bottom:0px;height:auto;}
</style>
</head>

<body>
<s:form action="tbemaillog!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
			<td style="text-align: right;">项目名称</td>
			<td style="text-align: left;" >
				<s:textfield name="e.rele_name" id="rele_name" readonly="false" />
			</td>
			<td style="text-align: right;">邮件地址</td>
			<td style="text-align: left;" >
				<s:textfield name="e.dest_email" id="dest_email" readonly="false" />
			</td>
 				</tr>
		<!--按钮-->
		<tr>
			<td colspan="11">
				<button method="tbemaillog!selectList.action" class="btn btn-primary" onclick="selectList(this)">
					<i class="icon-search icon-white"></i> 查询
				</button>
 				<%-- <s:submit method="deletes" onclick="return deleteSelect()" value="删除" cssClass="btn btn-danger"/> --%> 
			</td>
		</tr>
	</table>
	<!--列表部分-->
	<table class="table table-bordered table-hover">
		<thead>
		<tr style="background-color: #dff0d8">
			<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
			<th style="display: none;">id</th>
			<th>邮件类型</th>
			<th>业务名称</th>
			<th>企业名称</th>
			<th>目标邮件地址</th>
			<th>目标名称</th>
			<th>邮件大小</th>
			<th>发送状态</th>
			<th>操作人</th>
			<th>发送时间</th>
		</tr>
		</thead>
		<s:iterator value="pager.list">
			<tr >
				<td><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
				<td style="display: none;">&nbsp;<s:property value="id"/></td>
				<td><s:if test="email_type==1">股权推广</s:if><s:else>其它</s:else></td>
				<td><s:property value="rele_name"/></td>
				<td><s:property value="company_name"/></td>
				<td><s:property value="dest_email"/></td>
				<td><s:property value="dest_name"/></td>
				<td><s:property value="email_size/1000"/>k</td>
				<td><s:if test="status==1">成功</s:if><s:else>失败</s:else></td>
				<td><s:property value="inputuser"/></td>
				<td><s:date name="inputtime" format="yyyy-MM-dd"/></td>
			</tr>
		</s:iterator>
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>