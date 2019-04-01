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
	select{height:auto;}
</style>
<script type="text/javascript">
	$(function() {
		 $("#username").focus();
	});
</script>
</head>

<body>
	<s:form action="increapp" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			  	 
 				
 								<tr>
				<th class="td_right">增值业务产品编号</th>
				<td style="text-align: left;">
				<s:textfield name="e.increid" id="increid" readonly="true"  />
				</td>
				</tr>		
					<tr>
				<th class="td_right">增值业务名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.incename" id="incename" readonly="true"  />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">用户编号</th>
				<td style="text-align: left;">
				<s:textfield name="e.userid" id="userid" readonly="true" />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">申请状态</th>
				<td style="text-align: left;">
 					<s:select list="%{#request.xmshztlist}" listKey="id"  
                            listValue="name" name="e.status" label="申请状态"  
                            headerKey="" headerValue="" />  
                            
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">审核人</th>
				<td style="text-align: left;">
				<s:textfield name="e.checkuser" id="checkuser" value="%{#session.manage_session_user_info.username}"  readonly="true" data-rule="审核人:required;checkuser;length[2~16]"/>
				</td>
				</tr>
 				
 							 
 				
 				 
				<tr>
					<th class="td_right">备注</th>
					<td style="text-align: left;">
	 				<s:textarea name="e.memo" id="memo"  data-rule="备注:required;memo;length[2~128]"   rows="3" cols="80"  readonly="false"  />
	 				
					</td>
				</tr>			 
 				 
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="increapp!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="increapp!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
