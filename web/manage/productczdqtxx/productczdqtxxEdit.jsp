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
	<s:form action="productczdqtxx" namespace="/manage" theme="simple" id="form">
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
				<th class="td_right">�з����ñ���</th>
				<td style="text-align: left;">
				<s:textfield name="e.yanfafeiyongbili" id="yanfafeiyongbili" readonly="false" data-rule="�з����ñ���:required;yanfafeiyongbili;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�з���Ա����</th>
				<td style="text-align: left;">
				<s:textfield name="e.yanfarenyuanbili" id="yanfarenyuanbili" readonly="false" data-rule="�з���Ա����:required;yanfarenyuanbili;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">֪ʶ��Ȩ</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhishichanquan1" id="zhishichanquan1" readonly="false" data-rule="֪ʶ��Ȩ:required;zhishichanquan1;length[2~256]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">֪ʶ��Ȩ</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhishichanquan2" id="zhishichanquan2" readonly="false" data-rule="֪ʶ��Ȩ:required;zhishichanquan2;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">֪ʶ��Ȩ</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhishichanquan3" id="zhishichanquan3" readonly="false" data-rule="֪ʶ��Ȩ:required;zhishichanquan3;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">Ȩ���϶�</th>
				<td style="text-align: left;">
				<s:textfield name="e.quanweirending1" id="quanweirending1" readonly="false" data-rule="Ȩ���϶�:required;quanweirending1;length[2~512]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">Ȩ���϶�</th>
				<td style="text-align: left;">
				<s:textfield name="e.quanweirending2" id="quanweirending2" readonly="false" data-rule="Ȩ���϶�:required;quanweirending2;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">Ȩ���϶�</th>
				<td style="text-align: left;">
				<s:textfield name="e.quanweirending3" id="quanweirending3" readonly="false" data-rule="Ȩ���϶�:required;quanweirending3;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�г�ǰ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.shichangqianjing" id="shichangqianjing" readonly="false" data-rule="�г�ǰ��:required;shichangqianjing;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��չǰ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.fazhanqianjing" id="fazhanqianjing" readonly="false" data-rule="��չǰ��:required;fazhanqianjing;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��Ʒ������</th>
				<td style="text-align: left;">
				<s:textfield name="e.chanpinjingzhengli" id="chanpinjingzhengli" readonly="false" data-rule="��Ʒ������:required;chanpinjingzhengli;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�߹��Ŷ�</th>
				<td style="text-align: left;">
				<s:textfield name="e.gaoguantuandui" id="gaoguantuandui" readonly="false" data-rule="�߹��Ŷ�:required;gaoguantuandui;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��չǰ��</th>
				<td style="text-align: left;">
				<s:textfield name="e.tuozhanqianjing" id="tuozhanqianjing" readonly="false" data-rule="��չǰ��:required;tuozhanqianjing;length[2~-1]"/>
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
						<button method="productczdqtxx!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ����
						</button>
					</s:if>
					<s:else>
						<button method="productczdqtxx!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ����
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
