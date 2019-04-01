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
</style>
</head>

<body>
<s:form action="productczdbase!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
			<td style="text-align: right;">企业名称</td>
			<td style="text-align: left;" >
				<s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false" />
			</td>
 		 
 		 
 	 
		</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "productczdbase!selectList.action")){%>

					<button method="productczdbase!selectkkList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
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
						 
 							<th>申请人</th>
 							 
 							<th>企业名称</th>
 							 
 							<th>申请金额</th>
 							<th>贷款品种</th>
 							<th>申请贷款期限</th>
 							 
 							<th>审批状态</th>
 							<th>审核人</th>
  
 							<th>最后修改时间</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><s:if test="id!=1"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></s:if></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
								 
 								<td>&nbsp;<s:property value="userid"/></td>
 								 
 								<td>&nbsp;<s:property value="qiyemingcheng"/></td>
 								 
 								<td>&nbsp;<s:property value="shenqingjine"/> 万</td>
 								<td>&nbsp;<s:property value="daikuanpingz"/></td>
 								<td>&nbsp;<s:property value="daikuanqixian"/>  月</td>
 							 
 								
 								<s:if test="status_trans=='银行放款完毕' or status_trans=='详细资料审查通过'">
 									<td class='checkcolorok'>&nbsp;<s:property value="status_trans"/></td>
 								</s:if>
 								<s:else>
 									<td class='checkcolor'>&nbsp;<s:property value="status_trans"/></td>
 								</s:else>
 								
 								<td>&nbsp;<s:property value="checkuser"/></td>
 
  								<td>&nbsp;<s:date name="lastchgtime" format="yyyy-MM-dd  HH:mm:ss"/></td>
						
			 
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="productczdbase!toEdit2.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				<!-- 	<s:a href="czddownloadword.action?id=%{id}">导申请资料</s:a>
					<s:a href="czddownloadword.action?id=%{id}&t=m">导调查报告</s:a>-->
					<s:a href="wploan!toAdd2.action?e.rele_id=%{id}&e.rele_table=tb_product_base" class="btn btn-mini btn-warning"><i class="icon-white icon-book"></i>入账</s:a>
					
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
