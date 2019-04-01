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
	<s:form action="caiwu" namespace="/manage" theme="simple" id="form">
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
				<th class="td_right">�����������������</th>
				<td style="text-align: left;">
				<s:textfield name="e.rele_id" id="rele_id" readonly="false" data-rule="�����������������:required;rele_id;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">������������ı���</th>
				<td style="text-align: left;">
				<s:textfield name="e.rele_table" id="rele_table" readonly="false" data-rule="������������ı���:required;rele_table;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">����</th>
				<td style="text-align: left;">
				<s:textfield name="e.caiwutype" id="caiwutype" readonly="false" data-rule="����:required;caiwutype;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">���</th>
				<td style="text-align: left;">
				<s:textfield name="e.nianfen" id="nianfen" readonly="false" data-rule="���:required;nianfen;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">����</th>
				<td style="text-align: left;">
				<s:textfield name="e.amt" id="amt" readonly="false" data-rule="����:required;amt;length[2~9]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="caiwu!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ����
						</button>
					</s:if>
					<s:else>
						<button method="caiwu!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ����
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
