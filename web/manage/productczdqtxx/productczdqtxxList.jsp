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
<s:form action="productczdqtxx!selectList.action" namespace="/" method="post" theme="simple">
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
 				
			<td style="text-align: right;">�з����ñ���</td>
			<td style="text-align: left;" >
				<s:textfield name="e.yanfafeiyongbili" id="yanfafeiyongbili" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�з���Ա����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.yanfarenyuanbili" id="yanfarenyuanbili" readonly="false" />
			</td>
 				
			<td style="text-align: right;">֪ʶ��Ȩ</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zhishichanquan1" id="zhishichanquan1" readonly="false" />
			</td>
 				
			<td style="text-align: right;">֪ʶ��Ȩ</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zhishichanquan2" id="zhishichanquan2" readonly="false" />
			</td>
 				
			<td style="text-align: right;">֪ʶ��Ȩ</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zhishichanquan3" id="zhishichanquan3" readonly="false" />
			</td>
 				
			<td style="text-align: right;">Ȩ���϶�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.quanweirending1" id="quanweirending1" readonly="false" />
			</td>
 				
			<td style="text-align: right;">Ȩ���϶�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.quanweirending2" id="quanweirending2" readonly="false" />
			</td>
 				
			<td style="text-align: right;">Ȩ���϶�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.quanweirending3" id="quanweirending3" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�г�ǰ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.shichangqianjing" id="shichangqianjing" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��չǰ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.fazhanqianjing" id="fazhanqianjing" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��Ʒ������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.chanpinjingzhengli" id="chanpinjingzhengli" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�߹��Ŷ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.gaoguantuandui" id="gaoguantuandui" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��չǰ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.tuozhanqianjing" id="tuozhanqianjing" readonly="false" />
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
				<%if(PrivilegeUtil.check(request.getSession(), "productczdqtxx!selectList.action")){%>

					<button method="productczdqtxx!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> ��ѯ
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "productczdqtxx!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> ���
					</s:a>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "productczdqtxx!deletes.action")){%>
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
 							<th>�з����ñ���</th>
 							<th>�з���Ա����</th>
 							<th>֪ʶ��Ȩ</th>
 							<th>֪ʶ��Ȩ</th>
 							<th>֪ʶ��Ȩ</th>
 							<th>Ȩ���϶�</th>
 							<th>Ȩ���϶�</th>
 							<th>Ȩ���϶�</th>
 							<th>�г�ǰ��</th>
 							<th>��չǰ��</th>
 							<th>��Ʒ������</th>
 							<th>�߹��Ŷ�</th>
 							<th>��չǰ��</th>
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
 								<td>&nbsp;<s:property value="yanfafeiyongbili"/></td>
 								<td>&nbsp;<s:property value="yanfarenyuanbili"/></td>
 								<td>&nbsp;<s:property value="zhishichanquan1"/></td>
 								<td>&nbsp;<s:property value="zhishichanquan2"/></td>
 								<td>&nbsp;<s:property value="zhishichanquan3"/></td>
 								<td>&nbsp;<s:property value="quanweirending1"/></td>
 								<td>&nbsp;<s:property value="quanweirending2"/></td>
 								<td>&nbsp;<s:property value="quanweirending3"/></td>
 								<td>&nbsp;<s:property value="shichangqianjing"/></td>
 								<td>&nbsp;<s:property value="fazhanqianjing"/></td>
 								<td>&nbsp;<s:property value="chanpinjingzhengli"/></td>
 								<td>&nbsp;<s:property value="gaoguantuandui"/></td>
 								<td>&nbsp;<s:property value="tuozhanqianjing"/></td>
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
					<s:a href="productczdqtxx!toEdit.action?e.id=%{id}">�༭</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
