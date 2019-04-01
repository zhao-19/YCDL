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

	<s:form action="productczdcpxx" namespace="/manage" theme="simple" id="form">
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
				<th class="td_right">��Ҫ��Ʒ</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhuyaochanpin" id="zhuyaochanpin" readonly="false" data-rule="��Ҫ��Ʒ:required;zhuyaochanpin;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��Ҫ�����г�</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhuyaoxiaoshoushichang" id="zhuyaoxiaoshoushichang" readonly="false" data-rule="��Ҫ�����г�:required;zhuyaoxiaoshoushichang;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�����Ƚ���</th>
				<td style="text-align: left;">
				<s:textfield name="e.jishuxianjinxing" id="jishuxianjinxing" readonly="false" data-rule="�����Ƚ���:required;jishuxianjinxing;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�����г�ռ����</th>
				<td style="text-align: left;">
				<s:textfield name="e.guoneishichagnzhanyoulv" id="guoneishichagnzhanyoulv" readonly="false" data-rule="�����г�ռ����:required;guoneishichagnzhanyoulv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">�Ĵ�ռ����</th>
				<td style="text-align: left;">
				<s:textfield name="e.sichuanshichagnzhanyoulv" id="sichuanshichagnzhanyoulv" readonly="false" data-rule="�Ĵ�ռ����:required;sichuanshichagnzhanyoulv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">��������۶�</th>
				<td style="text-align: left;">
				<s:textfield name="e.shangnianduxiaoshoue" id="shangnianduxiaoshoue" readonly="false" data-rule="��������۶�:required;shangnianduxiaoshoue;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">ռ�������</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhanshourubili" id="zhanshourubili" readonly="false" data-rule="ռ�������:required;zhanshourubili;length[2~9]"/>
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
						<button method="productczdcpxx!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ����
						</button>
					</s:if>
					<s:else>
						<button method="productczdcpxx!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ����
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
