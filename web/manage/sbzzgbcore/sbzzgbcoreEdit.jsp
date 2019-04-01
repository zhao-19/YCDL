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
<s:if test="e.id=='' or e.id==null">
	<s:set name="formAction" value="'insert'"/>
</s:if>
<s:else>
	<s:set name="formAction" value="111"/>
</s:else>

	<s:form action="sbzzgbcore" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 					<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.id" id="id" readonly="false" data-rule=":required;id;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.userid" id="userid" readonly="false" data-rule=":required;userid;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.rele_id" id="rele_id" readonly="false" data-rule=":required;rele_id;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.appname" id="appname" readonly="false" data-rule=":required;appname;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.idcard" id="idcard" readonly="false" data-rule=":required;idcard;length[2~18]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.duty" id="duty" readonly="false" data-rule=":required;duty;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.zzgbcount" id="zzgbcount" readonly="false" data-rule=":required;zzgbcount;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.stocks" id="stocks" readonly="false" data-rule=":required;stocks;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.incometax" id="incometax" readonly="false" data-rule=":required;incometax;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" data-rule=":required;lurushijian;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" data-rule=":required;inputuser;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="false" data-rule=":required;lastchgtime;length[2~8]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="sbzzgbcore!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ÐÂÔö
						</button>
					</s:if>
					<s:else>
						<button method="sbzzgbcore!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ±£´æ
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
