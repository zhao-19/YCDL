<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<style>
	.td_right{text-align: right;}
</style>
<script type="text/javascript">
	$(function() {
		 $("#username").focus();
	});
</script>
</head>

<body>
	<s:form action="productczdcwxx" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 					<tr>
				<th class="td_right">����</th>
				<td style="text-align: left;">
				<s:textfield name="e.id" id="id" readonly="false" data-rule="����:required;id;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��������</th>
				<td style="text-align: left;">
				<s:textfield name="e.releid" id="releid" readonly="false" data-rule="��������:required;releid;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��Զһ�ڵĲ��񱨱�����</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdyear" id="thirdyear" readonly="false" data-rule="��Զһ�ڵĲ��񱨱�����:required;thirdyear;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">���������ʲ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdzongzichan" id="thirdzongzichan" readonly="false" data-rule="���������ʲ�:required;thirdzongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�������ܸ�ծ</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdzongfuzai" id="thirdzongfuzai" readonly="false" data-rule="�������ܸ�ծ:required;thirdzongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">������������Ȩ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdsuoyouzequanyi" id="thirdsuoyouzequanyi" readonly="false" data-rule="������������Ȩ��:required;thirdsuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">������ʵ���ʱ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdshishouzhiben" id="thirdshishouzhiben" readonly="false" data-rule="������ʵ���ʱ�:required;thirdshishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">���������н��</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdyinhangjiekuan" id="thirdyinhangjiekuan" readonly="false" data-rule="���������н��:required;thirdyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��������������</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdxiaoshoushouru" id="thirdxiaoshoushouru" readonly="false" data-rule="��������������:required;thirdxiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��������Ӫҵ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdzhuyinyewushouru" id="thirdzhuyinyewushouru" readonly="false" data-rule="��������Ӫҵ��:required;thirdzhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�����������ܶ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdlirunzonge" id="thirdlirunzonge" readonly="false" data-rule="�����������ܶ�:required;thirdlirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�����꾻����</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdjinglirun" id="thirdjinglirun" readonly="false" data-rule="�����꾻����:required;thirdjinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�����������˰</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdniandunashui" id="thirdniandunashui" readonly="false" data-rule="�����������˰:required;thirdniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ڶ������ʲ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondzongzichan" id="secondzongzichan" readonly="false" data-rule="�ڶ������ʲ�:required;secondzongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ڶ����ܸ�ծ</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondzongfuzai" id="secondzongfuzai" readonly="false" data-rule="�ڶ����ܸ�ծ:required;secondzongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ڶ���������Ȩ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondsuoyouzequanyi" id="secondsuoyouzequanyi" readonly="false" data-rule="�ڶ���������Ȩ��:required;secondsuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ڶ���ʵ���ʱ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondshishouzhiben" id="secondshishouzhiben" readonly="false" data-rule="�ڶ���ʵ���ʱ�:required;secondshishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ڶ������н��</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondyinhangjiekuan" id="secondyinhangjiekuan" readonly="false" data-rule="�ڶ������н��:required;secondyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ڶ�����������</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondxiaoshoushouru" id="secondxiaoshoushouru" readonly="false" data-rule="�ڶ�����������:required;secondxiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ڶ�����Ӫҵ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondzhuyinyewushouru" id="secondzhuyinyewushouru" readonly="false" data-rule="�ڶ�����Ӫҵ��:required;secondzhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ڶ��������ܶ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondlirunzonge" id="secondlirunzonge" readonly="false" data-rule="�ڶ��������ܶ�:required;secondlirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ڶ��꾻����</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondjinglirun" id="secondjinglirun" readonly="false" data-rule="�ڶ��꾻����:required;secondjinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ڶ��������˰</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondniandunashui" id="secondniandunashui" readonly="false" data-rule="�ڶ��������˰:required;secondniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��һ�����ʲ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstzongzichan" id="firstzongzichan" readonly="false" data-rule="��һ�����ʲ�:required;firstzongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��һ���ܸ�ծ</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstzongfuzai" id="firstzongfuzai" readonly="false" data-rule="��һ���ܸ�ծ:required;firstzongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��һ��������Ȩ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstsuoyouzequanyi" id="firstsuoyouzequanyi" readonly="false" data-rule="��һ��������Ȩ��:required;firstsuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��һ��ʵ���ʱ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstshishouzhiben" id="firstshishouzhiben" readonly="false" data-rule="��һ��ʵ���ʱ�:required;firstshishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��һ�����н��</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstyinhangjiekuan" id="firstyinhangjiekuan" readonly="false" data-rule="��һ�����н��:required;firstyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��һ����������</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstxiaoshoushouru" id="firstxiaoshoushouru" readonly="false" data-rule="��һ����������:required;firstxiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��һ����Ӫҵ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstzhuyinyewushouru" id="firstzhuyinyewushouru" readonly="false" data-rule="��һ����Ӫҵ��:required;firstzhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��һ�������ܶ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstlirunzonge" id="firstlirunzonge" readonly="false" data-rule="��һ�������ܶ�:required;firstlirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��һ�꾻����</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstjinglirun" id="firstjinglirun" readonly="false" data-rule="��һ�꾻����:required;firstjinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��һ�������˰</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstniandunashui" id="firstniandunashui" readonly="false" data-rule="��һ�������˰:required;firstniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ë����</th>
				<td style="text-align: left;">
				<s:textfield name="e.maolilv" id="maolilv" readonly="false" data-rule="ë����:required;maolilv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�����ת��</th>
				<td style="text-align: left;">
				<s:textfield name="e.cunhuozhouzhuanlv" id="cunhuozhouzhuanlv" readonly="false" data-rule="�����ת��:required;cunhuozhouzhuanlv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��������</th>
				<td style="text-align: left;">
				<s:textfield name="e.liudongbilv" id="liudongbilv" readonly="false" data-rule="��������:required;liudongbilv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">Ӧ���˿���ת��</th>
				<td style="text-align: left;">
				<s:textfield name="e.yingshouzhangkuanzhouzhuanlv" id="yingshouzhangkuanzhouzhuanlv" readonly="false" data-rule="Ӧ���˿���ת��:required;yingshouzhangkuanzhouzhuanlv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ٶ�����</th>
				<td style="text-align: left;">
				<s:textfield name="e.sudongbilv" id="sudongbilv" readonly="false" data-rule="�ٶ�����:required;sudongbilv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ʲ���ծ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.zichanfuzhailv" id="zichanfuzhailv" readonly="false" data-rule="�ʲ���ծ��:required;zichanfuzhailv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��ǰ����</th>
				<td style="text-align: left;">
				<s:textfield name="e.cudate" id="cudate" readonly="false" data-rule="��ǰ����:required;cudate;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��ǰ���ʲ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuzongzichan" id="cuzongzichan" readonly="false" data-rule="��ǰ���ʲ�:required;cuzongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��ǰ�ܸ�ծ</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuzongfuzai" id="cuzongfuzai" readonly="false" data-rule="��ǰ�ܸ�ծ:required;cuzongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��ǰ������Ȩ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.cusuoyouzequanyi" id="cusuoyouzequanyi" readonly="false" data-rule="��ǰ������Ȩ��:required;cusuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��ǰʵ���ʱ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.cushishouzhiben" id="cushishouzhiben" readonly="false" data-rule="��ǰʵ���ʱ�:required;cushishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��ǰ���н��</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuyinhangjiekuan" id="cuyinhangjiekuan" readonly="false" data-rule="��ǰ���н��:required;cuyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��ǰ��������</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuxiaoshoushouru" id="cuxiaoshoushouru" readonly="false" data-rule="��ǰ��������:required;cuxiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��ǰ��Ӫҵ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuzhuyinyewushouru" id="cuzhuyinyewushouru" readonly="false" data-rule="��ǰ��Ӫҵ��:required;cuzhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��ǰ�����ܶ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.culirunzonge" id="culirunzonge" readonly="false" data-rule="��ǰ�����ܶ�:required;culirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��ǰ������</th>
				<td style="text-align: left;">
				<s:textfield name="e.cujinglirun" id="cujinglirun" readonly="false" data-rule="��ǰ������:required;cujinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��ǰ�����˰</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuniandunashui" id="cuniandunashui" readonly="false" data-rule="��ǰ�����˰:required;cuniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ȥ��ͬ�����ʲ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastzongzichan" id="lastzongzichan" readonly="false" data-rule="ȥ��ͬ�����ʲ�:required;lastzongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ȥ��ͬ���ܸ�ծ</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastzongfuzai" id="lastzongfuzai" readonly="false" data-rule="ȥ��ͬ���ܸ�ծ:required;lastzongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ȥ��ͬ��������Ȩ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastsuoyouzequanyi" id="lastsuoyouzequanyi" readonly="false" data-rule="ȥ��ͬ��������Ȩ��:required;lastsuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ȥ��ͬ��ʵ���ʱ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastshishouzhiben" id="lastshishouzhiben" readonly="false" data-rule="ȥ��ͬ��ʵ���ʱ�:required;lastshishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ȥ��ͬ�����н��</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastyinhangjiekuan" id="lastyinhangjiekuan" readonly="false" data-rule="ȥ��ͬ�����н��:required;lastyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ȥ��ͬ����������</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastxiaoshoushouru" id="lastxiaoshoushouru" readonly="false" data-rule="ȥ��ͬ����������:required;lastxiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ȥ��ͬ����Ӫҵ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastzhuyinyewushouru" id="lastzhuyinyewushouru" readonly="false" data-rule="ȥ��ͬ����Ӫҵ��:required;lastzhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ȥ��ͬ�������ܶ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastlirunzonge" id="lastlirunzonge" readonly="false" data-rule="ȥ��ͬ�������ܶ�:required;lastlirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ȥ��ͬ�ھ�����</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastjinglirun" id="lastjinglirun" readonly="false" data-rule="ȥ��ͬ�ھ�����:required;lastjinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ȥ��ͬ�������˰</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastniandunashui" id="lastniandunashui" readonly="false" data-rule="ȥ��ͬ�������˰:required;lastniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">���ʲ�������</th>
				<td style="text-align: left;">
				<s:textfield name="e.changezongzichan" id="changezongzichan" readonly="false" data-rule="���ʲ�������:required;changezongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�ܸ�ծ������</th>
				<td style="text-align: left;">
				<s:textfield name="e.changezongfuzai" id="changezongfuzai" readonly="false" data-rule="�ܸ�ծ������:required;changezongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">������Ȩ��������</th>
				<td style="text-align: left;">
				<s:textfield name="e.changesuoyouzequanyi" id="changesuoyouzequanyi" readonly="false" data-rule="������Ȩ��������:required;changesuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ʵ���ʱ�������</th>
				<td style="text-align: left;">
				<s:textfield name="e.changeshishouzhiben" id="changeshishouzhiben" readonly="false" data-rule="ʵ���ʱ�������:required;changeshishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">���н��������</th>
				<td style="text-align: left;">
				<s:textfield name="e.changeyinhangjiekuan" id="changeyinhangjiekuan" readonly="false" data-rule="���н��������:required;changeyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��������������</th>
				<td style="text-align: left;">
				<s:textfield name="e.changexiaoshoushouru" id="changexiaoshoushouru" readonly="false" data-rule="��������������:required;changexiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��Ӫҵ��������</th>
				<td style="text-align: left;">
				<s:textfield name="e.changezhuyinyewushouru" id="changezhuyinyewushouru" readonly="false" data-rule="��Ӫҵ��������:required;changezhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�����ܶ�������</th>
				<td style="text-align: left;">
				<s:textfield name="e.changelirunzonge" id="changelirunzonge" readonly="false" data-rule="�����ܶ�������:required;changelirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">������������</th>
				<td style="text-align: left;">
				<s:textfield name="e.changejinglirun" id="changejinglirun" readonly="false" data-rule="������������:required;changejinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�����˰������</th>
				<td style="text-align: left;">
				<s:textfield name="e.changeniandunashui" id="changeniandunashui" readonly="false" data-rule="�����˰������:required;changeniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">¼��ʱ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" data-rule="¼��ʱ��:required;lurushijian;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">¼����</th>
				<td style="text-align: left;">
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" data-rule="¼����:required;inputuser;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">����޸�ʱ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="false" data-rule="����޸�ʱ��:required;lastchgtime;length[2~8]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="productczdcwxx!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ����
						</button>
					</s:if>
					<s:else>
						<button method="productczdcwxx!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ����
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
