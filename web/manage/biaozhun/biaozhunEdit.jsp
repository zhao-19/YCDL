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
	<s:form action="biaozhun" namespace="/manage" theme="simple" id="form">
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
				<th class="td_right">企业名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false" data-rule="企业名称:required;qiyemingcheng;length[2~256]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">标准名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.biaozhunmingcheng" id="biaozhunmingcheng" readonly="false" data-rule="标准名称:required;biaozhunmingcheng;length[2~512]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">性质</th>
				<td style="text-align: left;">
				<s:textfield name="e.xingzhi" id="xingzhi" readonly="false" data-rule="性质:required;xingzhi;length[2~512]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">职务</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhiwu" id="zhiwu" readonly="false" data-rule="职务:required;zhiwu;length[2~128]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">数据类别</th>
				<td style="text-align: left;">
				<s:textfield name="e.shujuleixing" id="shujuleixing" readonly="false" data-rule="数据类别:required;shujuleixing;length[2~1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">标准类型</th>
				<td style="text-align: left;">
				<s:textfield name="e.biaozhunleiing" id="biaozhunleiing" readonly="false" data-rule="标准类型:required;biaozhunleiing;length[2~512]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">增信权重</th>
				<td style="text-align: left;">
				<s:textfield name="e.zengxinquanzhong" id="zengxinquanzhong" readonly="false" data-rule="增信权重:required;zengxinquanzhong;length[2~128]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">授信额度</th>
				<td style="text-align: left;">
				<s:textfield name="e.shouxinedu" id="shouxinedu" readonly="false" data-rule="授信额度:required;shouxinedu;length[2~128]"/>
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
						<button method="biaozhun!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="biaozhun!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
