<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<s:form action="activitieslinkuser" namespace="/manage" theme="simple" id="form">
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
				<th class="td_right">关联的用户编号</th>
				<td style="text-align: left;">
				<s:textfield name="e.userid" id="userid" readonly="false" data-rule="关联的用户编号:required;userid;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">关联的用户名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.username" id="username" readonly="false" data-rule="关联的用户名称:required;username;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">名字</th>
				<td style="text-align: left;">
				<s:textfield name="e.attendname" id="attendname" readonly="false" data-rule="名字:required;attendname;length[2~128]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">电话</th>
				<td style="text-align: left;">
				<s:textfield name="e.attendcell" id="attendcell" readonly="false" data-rule="电话:required;attendcell;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">岗位</th>
				<td style="text-align: left;">
				<s:textfield name="e.attendduty" id="attendduty" readonly="false" data-rule="岗位:required;attendduty;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">录入时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" data-rule="录入时间:required;lurushijian;length[2~8]"/>
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
						<button method="activitieslinkuser!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="activitieslinkuser!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
