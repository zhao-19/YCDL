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
	<s:form action="code!" namespace="/" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 					<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.pk_codeid" id="pk_codeid" readonly="false" data-rule=":required;pk_codeid;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.code_name" id="code_name" readonly="false" data-rule=":required;code_name;length[2~50]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.code_parentid" id="code_parentid" readonly="false" data-rule=":required;code_parentid;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.code_remark" id="code_remark" readonly="false" data-rule=":required;code_remark;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.code_state" id="code_state" readonly="false" data-rule=":required;code_state;length[2~1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right"></th>
				<td style="text-align: left;">
				<s:textfield name="e.level" id="level" readonly="false" data-rule=":required;level;length[2~4]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="user!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ÐÂÔö
						</button>
					</s:if>
					<s:else>
						<button method="user!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> ±£´æ
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
