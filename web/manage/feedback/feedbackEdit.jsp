<%@ page contentType="text/html; charset=UTF-8"%>
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
 
	<s:form action="feedback" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			  
 								<tr>
				<th class="td_right">反馈类型</th>
				<td style="text-align: left;">
				<s:textfield name="e.feedtype" id="feedtype" readonly="false" data-rule="反馈类型:required;feedtype;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">反馈内容</th>
				<td style="text-align: left;">
				<s:textarea style="width:80%" name="e.feedcontent" id="feedcontent" readonly="false" data-rule="反馈内容:required;feedcontent;length[2~1024]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">回复内容</th>
				<td style="text-align: left;">
				<s:textarea style="width:80%" name="e.feedreply" id="feedreply" readonly="false" data-rule="回复内容:required;feedreply;length[2~1024]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">回复人</th>
				<td style="text-align: left;">
				<s:textfield name="e.replyuser" id="replyuser" readonly="false" data-rule="回复人:required;replyuser;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">电子邮件</th>
				<td style="text-align: left;">
				<s:textfield name="e.email" id="email" readonly="false" data-rule="电子邮件:required;email;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">电话</th>
				<td style="text-align: left;">
				<s:textfield name="e.cellphone" id="cellphone" readonly="false" data-rule="电话:required;cellphone;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">录入人</th>
				<td style="text-align: left;">
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" data-rule="录入人:required;inputuser;length[2~16]"/>
				</td>
				</tr>
 				
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="feedback!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="feedback!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
