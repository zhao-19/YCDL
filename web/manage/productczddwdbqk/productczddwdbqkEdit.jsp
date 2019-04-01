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
	<s:form action="productczddwdbqk" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 					<tr>
				<th class="td_right">主键</th>
				<td style="text-align: left;">
				<s:textfield name="e.id" id="id" readonly="false" data-rule="主键:required;id;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">主表主键</th>
				<td style="text-align: left;">
				<s:textfield name="e.releid" id="releid" readonly="false" data-rule="主表主键:required;releid;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">被担保人</th>
				<td style="text-align: left;">
				<s:textfield name="e.beidanbaoren" id="beidanbaoren" readonly="false" data-rule="被担保人:required;beidanbaoren;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">担保余额</th>
				<td style="text-align: left;">
				<s:textfield name="e.danbaoyue" id="danbaoyue" readonly="false" data-rule="担保余额:required;danbaoyue;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">担保方式</th>
				<td style="text-align: left;">
				<s:textfield name="e.danbaofangshi" id="danbaofangshi" readonly="false" data-rule="担保方式:required;danbaofangshi;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">担保开始日</th>
				<td style="text-align: left;">
				<s:textfield name="e.kaishiriqi" id="kaishiriqi" readonly="false" data-rule="担保开始日:required;kaishiriqi;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">担保到期日</th>
				<td style="text-align: left;">
				<s:textfield name="e.daoqiriqi" id="daoqiriqi" readonly="false" data-rule="担保到期日:required;daoqiriqi;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">录入时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" data-rule="录入时间:required;lurushijian;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">录入人</th>
				<td style="text-align: left;">
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" data-rule="录入人:required;inputuser;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">最后修改时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="false" data-rule="最后修改时间:required;lastchgtime;length[2~8]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="productczddwdbqk!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="productczddwdbqk!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
