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
	<s:form action="message" id="form" name="form" namespace="/manage" theme="simple"  method="post">

 		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			  
 				
 			
 								<tr>
				<th class="td_right">目标电话号码</th>
				<td style="text-align: left;">
				<s:textarea   rows="6" cols="100"   name="e.telnumber" id="telnumber" readonly="false"  data-rule="电话号码:required;loancondition;length[11~10000]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">短信内容</th>
				<td style="text-align: left;">
				<s:textarea  rows="6" cols="100"    name="e.comtent" id="comtent" readonly="false"  data-rule="短信内容:required;loancondition;length[2~512]"/>
				</td>
				</tr>
 				
 							<s:if test="e.id=='' or e.id==null">
							</s:if>
 							<s:else>
							
							
							<tr>
 				

					<th class="td_right">短信接收用户的编号</th>
					<td style="text-align: left;">
					<s:textfield name="e.userid" id="userid" readonly="false" data-rule="短信接收用户的编号:required;userid;length[2~32]"/>
					</td>
					</tr>
	 				
	 								<tr>
					<th class="td_right">短信接收用户的用户名</th>
					<td style="text-align: left;">
					<s:textfield name="e.username" id="username" readonly="false" data-rule="短信接收用户的用户名:required;username;length[2~128]"/>
					</td>
					</tr>
			

	
	 				
	 								<tr>
					<th class="td_right">发送时间</th>
					<td style="text-align: left;">
					<s:textfield name="e.sendtime" id="sendtime" readonly="false" data-rule="发送时间:required;sendtime;length[2~5]"/>
					</td>
					</tr>
	 				
	 								<tr>
					<th class="td_right">状态</th>
					<td style="text-align: left;">
					<s:textfield name="e.msgstatus" id="msgstatus" readonly="false" data-rule="状态:required;msgstatus;length[2~64]"/>
					</td>
					</tr>
	 				
	 								<tr>
					<th class="td_right">录入时间</th>
					<td style="text-align: left;">
					<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" data-rule="录入时间:required;lurushijian;length[2~5]"/>
					</td>
					</tr>
	 				
	 								<tr>
					<th class="td_right">录入人</th>
					<td style="text-align: left;">
					<s:textfield name="e.inputuser" id="inputuser" readonly="false" data-rule="录入人:required;inputuser;length[2~1]"/>
					</td>
					
					
					
				</tr>
 				</s:else>
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="message!newInsert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 发送
						</button>
					</s:if>
					<s:else>
						<button method="message!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
