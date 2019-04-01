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
	<s:form action="pingshenhuimingxi" namespace="/manage" theme="simple" id="form">
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
				<th class="td_right">外键关联评审表</th>
				<td style="text-align: left;">
				<s:textfield name="e.rele_pingshenhui" id="rele_pingshenhui" readonly="false" data-rule="外键关联评审表:required;rele_pingshenhui;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">外键关联贷款表</th>
				<td style="text-align: left;">
				<s:textfield name="e.rele_product_base" id="rele_product_base" readonly="false" data-rule="外键关联贷款表:required;rele_product_base;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">序号</th>
				<td style="text-align: left;">
				<s:textfield name="e.xuhao" id="xuhao" readonly="false" data-rule="序号:required;xuhao;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">企业名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false" data-rule="企业名称:required;qiyemingcheng;length[2~128]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">行业</th>
				<td style="text-align: left;">
				<s:textfield name="e.hangye" id="hangye" readonly="false" data-rule="行业:required;hangye;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">申请金额</th>
				<td style="text-align: left;">
				<s:textfield name="e.shenqingjine" id="shenqingjine" readonly="false" data-rule="申请金额:required;shenqingjine;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">具体评审时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.pingshenshijian" id="pingshenshijian" readonly="false" data-rule="具体评审时间:required;pingshenshijian;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">产品名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.chanpingmingcheng" id="chanpingmingcheng" readonly="false" data-rule="产品名称:required;chanpingmingcheng;length[2~64]"/>
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
						<button method="pingshenhuimingxi!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="pingshenhuimingxi!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
