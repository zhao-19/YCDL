<%@ page contentType="text/html; charset=utf-8"%>
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
	<s:form action="tbemaillog" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 					<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.id" id="id" readonly="false" data-rule=":required;id;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">邮件类型：1股权融资推广邮件2其</th>
				<td style="text-align: left;">
				<s:textfield name="e.email_type" id="email_type" readonly="false" data-rule="邮件类型：1股权融资推广邮件2其:required;email_type;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">关联业务表编号：如发送股权融资</th>
				<td style="text-align: left;">
				<s:textfield name="e.rele_id" id="rele_id" readonly="false" data-rule="关联业务表编号：如发送股权融资:required;rele_id;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">关联业务名称：如股权融资推广邮</th>
				<td style="text-align: left;">
				<s:textfield name="e.rele_name" id="rele_name" readonly="false" data-rule="关联业务名称：如股权融资推广邮:required;rele_name;length[2~128]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">企业名称：如股权融资推广邮件，</th>
				<td style="text-align: left;">
				<s:textfield name="e.company_name" id="company_name" readonly="false" data-rule="企业名称：如股权融资推广邮件，:required;company_name;length[2~128]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">目标邮件地址：存放管理员在div</th>
				<td style="text-align: left;">
				<s:textfield name="e.dest_email" id="dest_email" readonly="false" data-rule="目标邮件地址：存放管理员在div:required;dest_email;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">目标名称：存放管理员在div层录</th>
				<td style="text-align: left;">
				<s:textfield name="e.dest_name" id="dest_name" readonly="false" data-rule="目标名称：存放管理员在div层录:required;dest_name;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">邮件大小：单位是k</th>
				<td style="text-align: left;">
				<s:textfield name="e.email_size" id="email_size" readonly="false" data-rule="邮件大小：单位是k:required;email_size;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">发送状态：1成功0失败</th>
				<td style="text-align: left;">
				<s:textfield name="e.status" id="status" readonly="false" data-rule="发送状态：1成功0失败:required;status;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">操作人：操作人的账号</th>
				<td style="text-align: left;">
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" data-rule="操作人：操作人的账号:required;inputuser;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">发生时间：数据库函数取数据库日</th>
				<td style="text-align: left;">
				<s:textfield name="e.inputtime" id="inputtime" readonly="false" data-rule="发生时间：数据库函数取数据库日:required;inputtime;length[2~8]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="tbemaillog!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="tbemaillog!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
