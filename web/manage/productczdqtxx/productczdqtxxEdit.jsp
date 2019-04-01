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
	<s:form action="productczdqtxx" namespace="/manage" theme="simple" id="form">
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
				<th class="td_right">研发费用比例</th>
				<td style="text-align: left;">
				<s:textfield name="e.yanfafeiyongbili" id="yanfafeiyongbili" readonly="false" data-rule="研发费用比例:required;yanfafeiyongbili;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">研发人员比例</th>
				<td style="text-align: left;">
				<s:textfield name="e.yanfarenyuanbili" id="yanfarenyuanbili" readonly="false" data-rule="研发人员比例:required;yanfarenyuanbili;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">知识产权</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhishichanquan1" id="zhishichanquan1" readonly="false" data-rule="知识产权:required;zhishichanquan1;length[2~256]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">知识产权</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhishichanquan2" id="zhishichanquan2" readonly="false" data-rule="知识产权:required;zhishichanquan2;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">知识产权</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhishichanquan3" id="zhishichanquan3" readonly="false" data-rule="知识产权:required;zhishichanquan3;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">权威认定</th>
				<td style="text-align: left;">
				<s:textfield name="e.quanweirending1" id="quanweirending1" readonly="false" data-rule="权威认定:required;quanweirending1;length[2~512]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">权威认定</th>
				<td style="text-align: left;">
				<s:textfield name="e.quanweirending2" id="quanweirending2" readonly="false" data-rule="权威认定:required;quanweirending2;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">权威认定</th>
				<td style="text-align: left;">
				<s:textfield name="e.quanweirending3" id="quanweirending3" readonly="false" data-rule="权威认定:required;quanweirending3;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">市场前景</th>
				<td style="text-align: left;">
				<s:textfield name="e.shichangqianjing" id="shichangqianjing" readonly="false" data-rule="市场前景:required;shichangqianjing;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">发展前景</th>
				<td style="text-align: left;">
				<s:textfield name="e.fazhanqianjing" id="fazhanqianjing" readonly="false" data-rule="发展前景:required;fazhanqianjing;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">产品竞争力</th>
				<td style="text-align: left;">
				<s:textfield name="e.chanpinjingzhengli" id="chanpinjingzhengli" readonly="false" data-rule="产品竞争力:required;chanpinjingzhengli;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">高管团队</th>
				<td style="text-align: left;">
				<s:textfield name="e.gaoguantuandui" id="gaoguantuandui" readonly="false" data-rule="高管团队:required;gaoguantuandui;length[2~-1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">拓展前景</th>
				<td style="text-align: left;">
				<s:textfield name="e.tuozhanqianjing" id="tuozhanqianjing" readonly="false" data-rule="拓展前景:required;tuozhanqianjing;length[2~-1]"/>
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
						<button method="productczdqtxx!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="productczdqtxx!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
