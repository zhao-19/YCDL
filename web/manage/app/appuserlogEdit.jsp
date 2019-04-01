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

	<s:form action="appuserlog" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 					<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.pkid" id="pkid" readonly="false" data-rule=":required;pkid;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.operuserid" id="operuserid" readonly="false" data-rule=":required;operuserid;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.deluserid" id="deluserid" readonly="false" data-rule=":required;deluserid;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.delusertype" id="delusertype" readonly="false" data-rule=":required;delusertype;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.f_id" id="f_id" readonly="false" data-rule=":required;f_id;length[2~32]"/>
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
						<button method="appuserlog!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ÐÂÔö
						</button>
					</s:if>
					<s:else>
						<button method="appuserlog!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ±£´æ
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
