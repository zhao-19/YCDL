<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=GBK"%>
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
<s:form action="productczdcpxx!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--��ѯ����-->
		<tr>
				
			<td style="text-align: right;">����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.id" id="id" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.releid" id="releid" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��Ҫ��Ʒ</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zhuyaochanpin" id="zhuyaochanpin" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��Ҫ�����г�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zhuyaoxiaoshoushichang" id="zhuyaoxiaoshoushichang" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�����Ƚ���</td>
			<td style="text-align: left;" >
				<s:textfield name="e.jishuxianjinxing" id="jishuxianjinxing" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�����г�ռ����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.guoneishichagnzhanyoulv" id="guoneishichagnzhanyoulv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�Ĵ�ռ����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.sichuanshichagnzhanyoulv" id="sichuanshichagnzhanyoulv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��������۶�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.shangnianduxiaoshoue" id="shangnianduxiaoshoue" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ռ�������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zhanshourubili" id="zhanshourubili" readonly="false" />
			</td>
 				
			<td style="text-align: right;">¼��ʱ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" />
			</td>
 				
			<td style="text-align: right;">¼����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" />
			</td>
 				
			<td style="text-align: right;">����޸�ʱ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="false" />
			</td>
 				</tr>
		
		<!--��ť-->
		
		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "productczdcpxx!selectList.action")){%>

					<button method="productczdcpxx!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> ��ѯ
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "productczdcpxx!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> ���
					</s:a>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "productczdcpxx!deletes.action")){%>
 							<s:submit method="deletes" onclick="return deleteSelect()" value="ɾ��" cssClass="btn btn-danger"/> 
				<%} %>
				
				
				<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
				</div>
			</td>
		</tr>
	</table>
	
	<!--�б���-->
	<table class="table table-bordered table-hover">
		<thead>
		<tr style="background-color: #dff0d8">
			<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
			<th style="display: none;">id</th>
							<th>����</th>
 							<th>��������</th>
 							<th>��Ҫ��Ʒ</th>
 							<th>��Ҫ�����г�</th>
 							<th>�����Ƚ���</th>
 							<th>�����г�ռ����</th>
 							<th>�Ĵ�ռ����</th>
 							<th>��������۶�</th>
 							<th>ռ�������</th>
 							<th>¼��ʱ��</th>
 							<th>¼����</th>
 							<th>����޸�ʱ��</th>
 						<th nowrap="nowrap">����</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><s:if test="id!=1"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></s:if></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
								<td>&nbsp;<s:property value="id"/></td>
 								<td>&nbsp;<s:property value="releid"/></td>
 								<td>&nbsp;<s:property value="zhuyaochanpin"/></td>
 								<td>&nbsp;<s:property value="zhuyaoxiaoshoushichang"/></td>
 								<td>&nbsp;<s:property value="jishuxianjinxing"/></td>
 								<td>&nbsp;<s:property value="guoneishichagnzhanyoulv"/></td>
 								<td>&nbsp;<s:property value="sichuanshichagnzhanyoulv"/></td>
 								<td>&nbsp;<s:property value="shangnianduxiaoshoue"/></td>
 								<td>&nbsp;<s:property value="zhanshourubili"/></td>
 								<td>&nbsp;<s:property value="lurushijian"/></td>
 								<td>&nbsp;<s:property value="inputuser"/></td>
 								<td>&nbsp;<s:property value="lastchgtime"/></td>
 								
				<td>
					<s:if test="status.equals(\"y\")">
						<img src="<%=request.getContextPath() %>/resource/images/action_check.gif">
					</s:if>
					<s:elseif test="status.equals(\"n\")">
						<img src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
					</s:elseif>
				</td>
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="productczdcpxx!toEdit.action?e.id=%{id}">�༭</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
