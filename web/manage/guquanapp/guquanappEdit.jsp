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
	<s:form action="guquanapp" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 			 
 				
 								<tr>
				<th class="td_right">股权融资项目编号</th>
				<td style="text-align: left;">
				<s:textfield name="e.increid" id="increid" readonly="true"  />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">用户编号</th>
				<td style="text-align: left;">
				<s:textfield name="e.userid" id="userid" readonly="true" />&nbsp;&nbsp;<a href="cust!guquanappInCustEdit.action?e.userid=<s:property value="e.userid"/> ">详情</a>&nbsp;&nbsp;
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">申请状态</th>
				<td style="text-align: left;">
				
				<s:select list="%{#request.sqztlist}" listKey="id"  
                         listValue="name" name="e.status"  
                         headerKey="" headerValue="" />  
 				</td>
 			 
 		 
 				
				</tr>
 				
 								<tr>
				<th class="td_right">处理人</th>
				<td style="text-align: left;">
				<s:textfield name="e.checkuser" value="%{#session.manage_session_user_info.username}" id="checkuser" readonly="true"  />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">备注</th>
				<td style="text-align: left;">
 				<s:textarea name="e.result" id="result"  data-rule="处理结果:required;result;length[2~128]"   rows="3" cols="80"  readonly="false"  />
 				
				</td>
				</tr>
 				 
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="guquanapp!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="guquanapp!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
