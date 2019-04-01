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
		 $("#activitiesappname").focus();
	});
</script>
</head>

<body>
	<s:form action="activitiesapp!" namespace="/" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
				<th></th>
				<td></td>
			</tr>
			 
			  
 				
 			<tr>
				<th class="td_right">培训活动编号</th>
				<td style="text-align: left;">
				<s:textfield name="e.activitiid" id="activitiid" readonly="true" />
				</td>
				<th class="td_right">培训活动名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.activities_name" id="activities_name" readonly="true"  />
				</td>
			</tr>
 				
 			<tr>
				<th class="td_right">用户编号</th>
				<td style="text-align: left;">
				<s:textfield name="e.userid" id="userid" readonly="true"  />
				</td>
				
				<th class="td_right">企业名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.username" id="username" readonly="true" />
				</td>
			</tr>
 			<tr>
				<th class="td_right">参加人的名字</th>
				<td style="text-align: left;">
				<s:textfield name="e.attendname" id="attendname" readonly="false" data-rule="参加人的名字:required;attendname;length[1~128]"/>
				</td>
				<th class="td_right">参加人电话</th>
				<td style="text-align: left;">
				<s:textfield name="e.attendcell" id="attendcell" readonly="false" data-rule="参加人电话:required;attendcell;length[2~16]"/>
				</td>
			</tr>
 			<tr>
				<th class="td_right">参加人职务</th>
				<td style="text-align: left;">
				<s:textfield name="e.attendduty" id="attendduty" readonly="false" data-rule="参加人职务:required;attendduty;length[2~32]"/>
				</td>
				<th class="td_right">报名状态</th>
				<td style="text-align: left;">
				<s:select list="%{#application.dic.bmzt.childs}" listKey="id" listValue="name" name="e.stat" id="stat"   value="#request.e.stat"   />   
				</td>
			</tr>
 			<tr>
				<th class="td_right">数据来源</th>
				<td style="text-align: left;">
					<s:select list="%{#application.dic.datasources.childs}" listKey="id" headerKey="" headerValue="" 
            		listValue="name" name="e.datasource" id="datasource" data-rule="数据来源:required;datasource;"/>
				</td>
				<th class="td_right">是否签到</th>
				<td style="text-align: left;">
					<s:select list="%{#application.dic.whether.childs}" listKey="id" headerKey="" headerValue="" 
            		listValue="name" name="e.checked" id="checked" readonly="true"/>
				</td>
			</tr>
			<tr>
				<th class="td_right">签到时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.checktime" id="checktime" readonly="true"  />
				</td>
				<th class="td_right">生成二维码用户ID</th>
				<td style="text-align: left;">
					<s:textfield name="e.qruserid" id="qruserid" readonly="true"  />
				</td>
			</tr>
 			<tr>
 				<th class="td_right">录入时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="true"  />
				</td>
				<th class="td_right">最后修改时间</th>
				<td style="text-align: left;">
					<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="true"  />
				</td>
			</tr>
			<tr >
				<td colspan="4" style="text-align: center;">
					<button method="activitiesapp!update.action" class="btn btn-success">
						<i class="icon-ok icon-white"></i> 保存
					</button>
				</td>
			</tr>
		</table>
	</s:form>
<script type="text/javascript">
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
	}
</script>	
</body>
</html>
