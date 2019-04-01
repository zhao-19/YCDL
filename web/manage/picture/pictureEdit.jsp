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
	<s:form action="picture" namespace="/manage" theme="simple" id="form">
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
				<th class="td_right">�����ı�</th>
				<td style="text-align: left;">
				<s:textfield name="e.rele_table" id="rele_table" readonly="false" data-rule="�����ı�:required;rele_table;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�����ı������</th>
				<td style="text-align: left;">
				<s:textfield name="e.rele_id" id="rele_id" readonly="false" data-rule="�����ı������:required;rele_id;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ͼƬ������</th>
				<td style="text-align: left;">
				<s:textfield name="e.leixing" id="leixing" readonly="false" data-rule="ͼƬ������:required;leixing;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ͼƬ·��</th>
				<td style="text-align: left;">
				<s:textfield name="e.picurl" id="picurl" readonly="false" data-rule="ͼƬ·��:required;picurl;length[2~128]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="picture!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ����
						</button>
					</s:if>
					<s:else>
						<button method="picture!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ����
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
