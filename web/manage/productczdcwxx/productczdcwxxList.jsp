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
<s:form action="productczdcwxx!selectList.action" namespace="/" method="post" theme="simple">
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
 				
			<td style="text-align: right;">��Զһ�ڵĲ��񱨱�����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdyear" id="thirdyear" readonly="false" />
			</td>
 				
			<td style="text-align: right;">���������ʲ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdzongzichan" id="thirdzongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�������ܸ�ծ</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdzongfuzai" id="thirdzongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">������������Ȩ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdsuoyouzequanyi" id="thirdsuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">������ʵ���ʱ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdshishouzhiben" id="thirdshishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">���������н��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdyinhangjiekuan" id="thirdyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��������������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdxiaoshoushouru" id="thirdxiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��������Ӫҵ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdzhuyinyewushouru" id="thirdzhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�����������ܶ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdlirunzonge" id="thirdlirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�����꾻����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdjinglirun" id="thirdjinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�����������˰</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdniandunashui" id="thirdniandunashui" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ڶ������ʲ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondzongzichan" id="secondzongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ڶ����ܸ�ծ</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondzongfuzai" id="secondzongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ڶ���������Ȩ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondsuoyouzequanyi" id="secondsuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ڶ���ʵ���ʱ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondshishouzhiben" id="secondshishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ڶ������н��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondyinhangjiekuan" id="secondyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ڶ�����������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondxiaoshoushouru" id="secondxiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ڶ�����Ӫҵ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondzhuyinyewushouru" id="secondzhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ڶ��������ܶ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondlirunzonge" id="secondlirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ڶ��꾻����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondjinglirun" id="secondjinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ڶ��������˰</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondniandunashui" id="secondniandunashui" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��һ�����ʲ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstzongzichan" id="firstzongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��һ���ܸ�ծ</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstzongfuzai" id="firstzongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��һ��������Ȩ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstsuoyouzequanyi" id="firstsuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��һ��ʵ���ʱ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstshishouzhiben" id="firstshishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��һ�����н��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstyinhangjiekuan" id="firstyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��һ����������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstxiaoshoushouru" id="firstxiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��һ����Ӫҵ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstzhuyinyewushouru" id="firstzhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��һ�������ܶ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstlirunzonge" id="firstlirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��һ�꾻����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstjinglirun" id="firstjinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��һ�������˰</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstniandunashui" id="firstniandunashui" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ë����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.maolilv" id="maolilv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�����ת��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cunhuozhouzhuanlv" id="cunhuozhouzhuanlv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.liudongbilv" id="liudongbilv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">Ӧ���˿���ת��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.yingshouzhangkuanzhouzhuanlv" id="yingshouzhangkuanzhouzhuanlv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ٶ�����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.sudongbilv" id="sudongbilv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ʲ���ծ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zichanfuzhailv" id="zichanfuzhailv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��ǰ����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cudate" id="cudate" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��ǰ���ʲ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuzongzichan" id="cuzongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��ǰ�ܸ�ծ</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuzongfuzai" id="cuzongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��ǰ������Ȩ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cusuoyouzequanyi" id="cusuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��ǰʵ���ʱ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cushishouzhiben" id="cushishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��ǰ���н��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuyinhangjiekuan" id="cuyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��ǰ��������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuxiaoshoushouru" id="cuxiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��ǰ��Ӫҵ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuzhuyinyewushouru" id="cuzhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��ǰ�����ܶ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.culirunzonge" id="culirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��ǰ������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cujinglirun" id="cujinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��ǰ�����˰</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuniandunashui" id="cuniandunashui" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ȥ��ͬ�����ʲ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastzongzichan" id="lastzongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ȥ��ͬ���ܸ�ծ</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastzongfuzai" id="lastzongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ȥ��ͬ��������Ȩ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastsuoyouzequanyi" id="lastsuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ȥ��ͬ��ʵ���ʱ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastshishouzhiben" id="lastshishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ȥ��ͬ�����н��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastyinhangjiekuan" id="lastyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ȥ��ͬ����������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastxiaoshoushouru" id="lastxiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ȥ��ͬ����Ӫҵ��</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastzhuyinyewushouru" id="lastzhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ȥ��ͬ�������ܶ�</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastlirunzonge" id="lastlirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ȥ��ͬ�ھ�����</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastjinglirun" id="lastjinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ȥ��ͬ�������˰</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastniandunashui" id="lastniandunashui" readonly="false" />
			</td>
 				
			<td style="text-align: right;">���ʲ�������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changezongzichan" id="changezongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�ܸ�ծ������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changezongfuzai" id="changezongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">������Ȩ��������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changesuoyouzequanyi" id="changesuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">ʵ���ʱ�������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changeshishouzhiben" id="changeshishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">���н��������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changeyinhangjiekuan" id="changeyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��������������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changexiaoshoushouru" id="changexiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">��Ӫҵ��������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changezhuyinyewushouru" id="changezhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�����ܶ�������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changelirunzonge" id="changelirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">������������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changejinglirun" id="changejinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">�����˰������</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changeniandunashui" id="changeniandunashui" readonly="false" />
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
				<%if(PrivilegeUtil.check(request.getSession(), "productczdcwxx!selectList.action")){%>

					<button method="productczdcwxx!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> ��ѯ
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "productczdcwxx!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> ���
					</s:a>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "productczdcwxx!deletes.action")){%>
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
 							<th>��Զһ�ڵĲ��񱨱�����</th>
 							<th>���������ʲ�</th>
 							<th>�������ܸ�ծ</th>
 							<th>������������Ȩ��</th>
 							<th>������ʵ���ʱ�</th>
 							<th>���������н��</th>
 							<th>��������������</th>
 							<th>��������Ӫҵ��</th>
 							<th>�����������ܶ�</th>
 							<th>�����꾻����</th>
 							<th>�����������˰</th>
 							<th>�ڶ������ʲ�</th>
 							<th>�ڶ����ܸ�ծ</th>
 							<th>�ڶ���������Ȩ��</th>
 							<th>�ڶ���ʵ���ʱ�</th>
 							<th>�ڶ������н��</th>
 							<th>�ڶ�����������</th>
 							<th>�ڶ�����Ӫҵ��</th>
 							<th>�ڶ��������ܶ�</th>
 							<th>�ڶ��꾻����</th>
 							<th>�ڶ��������˰</th>
 							<th>��һ�����ʲ�</th>
 							<th>��һ���ܸ�ծ</th>
 							<th>��һ��������Ȩ��</th>
 							<th>��һ��ʵ���ʱ�</th>
 							<th>��һ�����н��</th>
 							<th>��һ����������</th>
 							<th>��һ����Ӫҵ��</th>
 							<th>��һ�������ܶ�</th>
 							<th>��һ�꾻����</th>
 							<th>��һ�������˰</th>
 							<th>ë����</th>
 							<th>�����ת��</th>
 							<th>��������</th>
 							<th>Ӧ���˿���ת��</th>
 							<th>�ٶ�����</th>
 							<th>�ʲ���ծ��</th>
 							<th>��ǰ����</th>
 							<th>��ǰ���ʲ�</th>
 							<th>��ǰ�ܸ�ծ</th>
 							<th>��ǰ������Ȩ��</th>
 							<th>��ǰʵ���ʱ�</th>
 							<th>��ǰ���н��</th>
 							<th>��ǰ��������</th>
 							<th>��ǰ��Ӫҵ��</th>
 							<th>��ǰ�����ܶ�</th>
 							<th>��ǰ������</th>
 							<th>��ǰ�����˰</th>
 							<th>ȥ��ͬ�����ʲ�</th>
 							<th>ȥ��ͬ���ܸ�ծ</th>
 							<th>ȥ��ͬ��������Ȩ��</th>
 							<th>ȥ��ͬ��ʵ���ʱ�</th>
 							<th>ȥ��ͬ�����н��</th>
 							<th>ȥ��ͬ����������</th>
 							<th>ȥ��ͬ����Ӫҵ��</th>
 							<th>ȥ��ͬ�������ܶ�</th>
 							<th>ȥ��ͬ�ھ�����</th>
 							<th>ȥ��ͬ�������˰</th>
 							<th>���ʲ�������</th>
 							<th>�ܸ�ծ������</th>
 							<th>������Ȩ��������</th>
 							<th>ʵ���ʱ�������</th>
 							<th>���н��������</th>
 							<th>��������������</th>
 							<th>��Ӫҵ��������</th>
 							<th>�����ܶ�������</th>
 							<th>������������</th>
 							<th>�����˰������</th>
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
 								<td>&nbsp;<s:property value="thirdyear"/></td>
 								<td>&nbsp;<s:property value="thirdzongzichan"/></td>
 								<td>&nbsp;<s:property value="thirdzongfuzai"/></td>
 								<td>&nbsp;<s:property value="thirdsuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="thirdshishouzhiben"/></td>
 								<td>&nbsp;<s:property value="thirdyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="thirdxiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="thirdzhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="thirdlirunzonge"/></td>
 								<td>&nbsp;<s:property value="thirdjinglirun"/></td>
 								<td>&nbsp;<s:property value="thirdniandunashui"/></td>
 								<td>&nbsp;<s:property value="secondzongzichan"/></td>
 								<td>&nbsp;<s:property value="secondzongfuzai"/></td>
 								<td>&nbsp;<s:property value="secondsuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="secondshishouzhiben"/></td>
 								<td>&nbsp;<s:property value="secondyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="secondxiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="secondzhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="secondlirunzonge"/></td>
 								<td>&nbsp;<s:property value="secondjinglirun"/></td>
 								<td>&nbsp;<s:property value="secondniandunashui"/></td>
 								<td>&nbsp;<s:property value="firstzongzichan"/></td>
 								<td>&nbsp;<s:property value="firstzongfuzai"/></td>
 								<td>&nbsp;<s:property value="firstsuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="firstshishouzhiben"/></td>
 								<td>&nbsp;<s:property value="firstyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="firstxiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="firstzhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="firstlirunzonge"/></td>
 								<td>&nbsp;<s:property value="firstjinglirun"/></td>
 								<td>&nbsp;<s:property value="firstniandunashui"/></td>
 								<td>&nbsp;<s:property value="maolilv"/></td>
 								<td>&nbsp;<s:property value="cunhuozhouzhuanlv"/></td>
 								<td>&nbsp;<s:property value="liudongbilv"/></td>
 								<td>&nbsp;<s:property value="yingshouzhangkuanzhouzhuanlv"/></td>
 								<td>&nbsp;<s:property value="sudongbilv"/></td>
 								<td>&nbsp;<s:property value="zichanfuzhailv"/></td>
 								<td>&nbsp;<s:property value="cudate"/></td>
 								<td>&nbsp;<s:property value="cuzongzichan"/></td>
 								<td>&nbsp;<s:property value="cuzongfuzai"/></td>
 								<td>&nbsp;<s:property value="cusuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="cushishouzhiben"/></td>
 								<td>&nbsp;<s:property value="cuyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="cuxiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="cuzhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="culirunzonge"/></td>
 								<td>&nbsp;<s:property value="cujinglirun"/></td>
 								<td>&nbsp;<s:property value="cuniandunashui"/></td>
 								<td>&nbsp;<s:property value="lastzongzichan"/></td>
 								<td>&nbsp;<s:property value="lastzongfuzai"/></td>
 								<td>&nbsp;<s:property value="lastsuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="lastshishouzhiben"/></td>
 								<td>&nbsp;<s:property value="lastyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="lastxiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="lastzhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="lastlirunzonge"/></td>
 								<td>&nbsp;<s:property value="lastjinglirun"/></td>
 								<td>&nbsp;<s:property value="lastniandunashui"/></td>
 								<td>&nbsp;<s:property value="changezongzichan"/></td>
 								<td>&nbsp;<s:property value="changezongfuzai"/></td>
 								<td>&nbsp;<s:property value="changesuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="changeshishouzhiben"/></td>
 								<td>&nbsp;<s:property value="changeyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="changexiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="changezhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="changelirunzonge"/></td>
 								<td>&nbsp;<s:property value="changejinglirun"/></td>
 								<td>&nbsp;<s:property value="changeniandunashui"/></td>
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
					<s:a href="productczdcwxx!toEdit.action?e.id=%{id}">�༭</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
