<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/resource/common_html_meat.jsp"%>
	<%@ include file="/manage/system/common.jsp"%>
	<%@ include file="/resource/common_html_validator.jsp"%>
	<link rel="stylesheet" href="/resource/css/FZbase.css?${sysversion}">
	<style>
		.td_right{text-align: right;}
	</style>
</head>

<body class="FZbPageBody">
	<s:form action="message" id="form" name="form" namespace="/manage" theme="simple"  method="post">
 		<table class="table table-bordered" style="border-top:1px solid #ddd;">
 			<tr>
				<th class="td_right">目标电话号码
					<s:hidden name="message.substation" id="substation" value="%{#session.sessionsubcode }"/>
				</th>
				<td style="text-align: left;">
				<s:textarea rows="2" cols="100" name="message.telnumber" id="telnumber" readonly="false"  data-rule="电话号码:required;loancondition;length[11~1024]"/>
				</td>
			</tr>
 			<tr>
				<th class="td_right">短信内容</th>
				<td style="text-align: left;">
				<s:textarea  rows="6" cols="100"  name="message.comtent" id="comtent" readonly="false"  data-rule="短信内容:required;loancondition;length[2~256]"/>
				</td>
				</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<div onclick="sendMessage();" class="btn btn-success">
						<i class="icon-ok icon-white"></i> 发送
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					温馨提示<br/>
					1.多个手机号之间用英文状态的逗号(",")分隔。<br/>
					2.发送的短信自带签名【盈创动力】，短信内容请不要出现"【】"。<br/>
					3.短信有延时，一般1到10分钟，建议发送时添加自己的手机号码做测试。<br/>
					4.多次发送相同的内容到同一个手机号码的时候，该手机号码只能收到1次信息。<br/>
					5.每次最多发送10条。<br/>
					6.由于监管的原因，短信内容一定要为正常的话语。<br/>
					7.不能发送广告，内容不能包含贷款、股权、投资、融资等。<br/>
					8.如有其它问题联系028-85222651范波。
				</td>
			</tr>
		</table>
	</s:form>
</body>
<script type="text/javascript">
if ('${sessionsubcode}' == "") {
	window.parent.location.href = "/usermanage/loginout.html";
}
function sendMessage(){
	$.ajax({
		type: 'post',
		url: "/usermanage/sendMessage.html",
		data: {
			"message.telnumber": $("#telnumber").val(),
			"message.comtent": $("#comtent").val(),
			"message.substation": $("#substation").val()
		},
		dataType:"json",
		success: function(data){
			layer.alert(data.msg, {icon: 1, title : '提示', offset: ['20%', '35%']});
		}
	});
}
</script>
</html>
