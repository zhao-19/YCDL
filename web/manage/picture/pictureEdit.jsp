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
	<s:form action="picture" namespace="/manage" theme="simple" id="form">
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
				<th class="td_right">关联的表</th>
				<td style="text-align: left;">
				<s:textfield name="e.rele_table" id="rele_table" readonly="false" data-rule="关联的表:required;rele_table;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">关联的表的主键</th>
				<td style="text-align: left;">
				<s:textfield name="e.rele_id" id="rele_id" readonly="false" data-rule="关联的表的主键:required;rele_id;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">图片的类型</th>
				<td style="text-align: left;">
				<s:textfield name="e.leixing" id="leixing" readonly="false" data-rule="图片的类型:required;leixing;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">图片路径</th>
				<td style="text-align: left;">
				<s:textfield name="e.picurl" id="picurl" readonly="false" data-rule="图片路径:required;picurl;length[2~128]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="picture!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="picture!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
