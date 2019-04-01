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

	<s:form action="histdata" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
 				
 				
					<tr>
					<td>存量服务企业数量（家）</td>
					<td style="text-align: left;">
					<s:textfield name="e.histcomp" id="histcomp" readonly="false" data-rule="存量服务企业数量（家）:required;histcomp;length[1~16]"/>
					</td>
					</tr>
 				
 				
					<tr>
					<td>存量债权融资金额（万元）</td>
					<td style="text-align: left;">
					<s:textfield name="e.histloanamt" id="histloanamt" readonly="false" data-rule="存量贷款金额（万元）:required;histloanamt;length[1~16]"/>
					</td>
					</tr>
 					<tr>
					<td>存量债权融资笔数（笔）</td>
					<td style="text-align: left;">
					<s:textfield name="e.histloancount" id="histloancount" readonly="false" data-rule="存量债权融资笔数:required;histloancount;length[1~16]"/>
					</td>
					</tr>
 				
 				
					<tr>
					<td>存量合作投资机构数量（家）</td>
					<td style="text-align: left;">
					<s:textfield name="e.histvccount" id="histvccount" readonly="false" data-rule="存量合作投资机构数量（家）:required;histvccount;length[1~16]"/>
					</td>
					</tr>
 				
 				
 					<tr>
					<td>存量股权项目数（个）</td>
					<td style="text-align: left;">
					<s:textfield name="e.histguquancount" id="histguquancount" readonly="false" data-rule="存量合作投资机构数量（家）:required;histguquancount;length[1~16]"/>
					</td>
					</tr>
					
						<tr>
					<td>存量股权项目金额（万元）</td>
					<td style="text-align: left;">
					<s:textfield name="e.histguquanamt" id="histguquanamt" readonly="false" data-rule="存量合作投资机构数量（家）:required;histguquanamt;length[1~16]"/>
					</td>
					</tr>				
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="histdata!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="histdata!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
