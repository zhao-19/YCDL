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
	
	
	function statusset(flag) {
		if(flag=='1') {
			$("#status").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083");
		}else {
			$("#status").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa084");
		}
	};
	
</script>
</head>

<body>
	<s:form action="indexapp" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			  
 				
 								<tr>
				<th class="td_right">企业名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.studio" id="studio" readonly="false" data-rule="帐号:required;studio;length[2~32]"/>
				</td>
		 
				<th class="td_right">联系地址</th>
				<td style="text-align: left;">
				<s:textfield name="e.address" id="address" readonly="false" data-rule="联系地址:required;address;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">姓名</th>
				<td style="text-align: left;">
				<s:textfield name="e.xingming" id="xingming" readonly="false" data-rule="姓名:required;xingming;length[2~32]"/>
				</td>
		 
				<th class="td_right">电话</th>
				<td style="text-align: left;">
				<s:textfield name="e.dianhuan" id="dianhuan" readonly="false" data-rule="电话:required;dianhuan;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">类型</th>
				<td style="text-align: left;">
				<s:textfield name="e.leixing" id="leixing" readonly="false" data-rule="类型:required;leixing;length[2~32]"/>
				</td>
			 
				<th class="td_right">融资金额</th>
				<td style="text-align: left;">
				<s:textfield name="e.jine" id="jine" readonly="false" data-rule="融资金额:required;jine;length[1~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">成立日期</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield name="e.chegnliriqi" id="chegnliriqi" readonly="false" />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">企业情况</th>
				<td style="text-align: left;">
				<s:textarea   rows="3" cols="80" name="e.qiyeqingkuang" id="qiyeqingkuang" readonly="false" data-rule="企业情况:required;qiyeqingkuang;length[2~512]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">融资用途</th>
				<td style="text-align: left;">
				<s:textarea   rows="3" cols="80" name="e.rongziyongtu" id="rongziyongtu" readonly="false" data-rule="融资用途:required;rongziyongtu;length[2~512]"/>
				</td>
				</tr>
 				
 								 
 				 
 				
 								<tr>
				<th class="td_right">状态</th>
				<td style="text-align: left;" colspan="3">
				<s:select list="%{#application.dic.zqsqzt.childs}" id="status" listKey="id"  
                            listValue="name" name="e.status" label="申请状态"  
                            headerKey="" headerValue=""     />  
                            
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">备注</th>
				<td style="text-align: left;">
				<s:textarea   rows="3" cols="80" name="e.memo" id="memo" readonly="false" data-rule="备注:false;memo;length[1~256]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="indexapp!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						 
					
					
					
							<button method="indexapp!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
							</button>&nbsp;&nbsp;&nbsp;&nbsp;
							
								<button method="indexapp!update.action" onclick="statusset('0')"  class="btn btn-danger">
								<i class="icon-ok icon-white"></i> 驳回
							</button>&nbsp;&nbsp;&nbsp;&nbsp;
							
								<button method="indexapp!update.action" onclick="statusset('1')" class="btn btn-info">
								<i class="icon-ok icon-white"></i> 通过
							</button>&nbsp;&nbsp;&nbsp;&nbsp;
						</s:else>
						
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
