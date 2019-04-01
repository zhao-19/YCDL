<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
	<link rel="stylesheet" href="/resource/css/FZbase.css?${sysversion}">
<script type="text/javascript">
	$(function() {
		 $("#password").focus();
	});

	function onSubmit() {
		if ($.trim($("#password").val()) == "") {
			alert("旧密码不能为空!");
			$("#password").focus();
			return false;
		}
		if ($.trim($("#newpassword").val()) == "") {
			alert("密码不能为空!");
			$("#newpassword").focus();
			return false;
		}
		if ($.trim($("#newpassword2").val()) == "") {
			alert("密码不能为空!");
			$("#newpassword2").focus();
			return false;
		}
		if ($.trim($("#newpassword2").val()) != $.trim($("#newpassword").val())) {
			alert("两次输入的密码不一致!");
			return false;
		}
	}
</script>
</head>

<body style="text-align: center;"  class="FZbPageBody">
	<s:form action="/usermanage/savePwd.html" namespace="/" theme="simple" onsubmit="onSubmit();">
		<table class="table table-bordered" >
			<tr class="table_title">
				<td colspan="2">
					<strong>修改密码</strong>
				</td>
			</tr>
			<tr>
				<th style="text-align: right;">旧密码</th>
				<td style="text-align: left;"><s:password name="password" data-rule="旧密码:required;password;length[6~20];" 
						id="password" /></td>
			</tr>
			<tr>
				<th style="text-align: right;">新密码</th>
				<td style="text-align: left;"><s:password name="newpassword" data-rule="新密码:required;newpassword;length[6~20];" 
						id="newpassword" /></td>
			</tr>
			<tr>
				<th style="text-align: right;">确认新密码</th>
				<td style="text-align: left;"><s:password name="newpassword2" data-rule="确认密码:required;match(e.newpassword)"  
						id="newpassword2" /></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button method="/usermanage/savePwd.html" class="btn btn-info">
						<i class="icon-ok icon-white"></i> 确认修改
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
