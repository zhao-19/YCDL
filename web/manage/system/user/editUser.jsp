<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<style type="text/css">
	.td_right{text-align: right;}
	select{height:auto;}
	label{display: inline;}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/layer/layer.js"></script>
</head>

<body>
	<s:form action="user!" namespace="/" theme="simple" id="form">
		<table class="table table-bordered">
			<tr>
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>帐号编辑</strong>
				</td>
			</tr>
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			<tr>
				<th class="td_right">帐号</th>
				<td style="text-align: left;">
					<s:if test="e.id=='' or e.id==null">
						<s:textfield name="e.username" id="username" readonly="false" data-rule="帐号:required;length[4~22];remote[user!unique.action]"/>
					</s:if>
					<s:else>
						<s:property value="e.username"/>
					</s:else>
				</td>
			</tr>
			<s:if test="e.id=='' or e.id==null">
				<tr>
					<th class="td_right">密码</th>
					<td style="text-align: left;"><s:password name="e.password" data-rule="密码:required;password;length[6~20];"
							id="password" />
					</td>
				</tr>
				<tr>
					<th class="td_right">确认密码</th>
					<td style="text-align: left;"><s:password name="e.newpassword2" data-rule="确认密码:required;match(e.password)"
							id="newpassword2" />
					</td>
				</tr>
			</s:if>
			<s:else>
				<tr>
					<th class="td_right">密码</th>
					<td style="text-align: left;"><s:password name="e.password" data-rule="密码:password;length[6~20];"
							id="password" />
							<br>(不输入表示不修改密码)
					</td>
				</tr>
				<tr>
					<th class="td_right">确认密码</th>
					<td style="text-align: left;"><s:password name="e.newpassword2" data-rule="确认密码:match(e.password)"
							id="newpassword2" />
					</td>
				</tr>
			</s:else>
			
			<tr>
				<th class="td_right">名称</th>
				<td style="text-align: left;">
				<s:if test="e.id=='' or e.id==null">
				<s:textfield name="e.nickname" id="nickname" readonly="false" data-rule="名称:required;nickname;length[2~20];remote[user!unique.action]"/>
				</s:if>
                    <s:else>
                    <s:textfield name="e.nickname" id="nickname" readonly="false" data-rule="名称:required;nickname;length[2~20];"/>
                    </s:else>
					</td>
			</tr>
			<tr>
				<th class="td_right">手机号码</th>
				<td style="text-align: left;">
					<s:textfield name="e.cellPhoneNum" readonly="false" data-rule=";cellPhoneNum;length[11];"/>
				</td>
			</tr>
			<tr>
                <th class="td_right">座机号码</th>
                <td style="text-align: left;">
                    <s:textfield name="e.telephone" readonly="false" data-rule=";telephone;length[11~13];"/>
                </td>
            </tr>
			<tr>
				<th class="td_right">邮箱</th>
				<td style="text-align: left;">
					<s:textfield name="e.email"  readonly="false" autocomplete="off" data-rule=";email;length[0~50];"/>
				</td>
			</tr>
			
			
			<tr>
				<th class="td_right">选择角色</th>
				<td style="text-align: left;" id="rids">
					<s:checkboxlist name="e.rid" list="roleList" id="rid" value="%{#request.rids}"
						listKey="id" listValue="role_name"></s:checkboxlist>
				</td>
			</tr>
			<s:if test="e.username==null or e.username==''  or !e.username.equals(\"admin\")">
				<tr>
					<th class="td_right">状态</th>
					<td style="text-align: left;" >
						<s:select list="#{'y':'启用','n':'禁用'}" id="status" name="e.status"  cssClass="input-small" 
							listKey="key" listValue="value"  />
					</td>
				</tr>
			</s:if>
			<tr>
				<th class="td_right">是否分配</th>
				<td style="text-align: left;" >
					<s:select list="#{0:'否', 1:'是'}" name="e.allocation" cssClass="input-small" headerValue="e.allocation"></s:select>
				</td>
			</tr>
			<tr>
				<th class="td_right">分站</th>
				<td style="text-align: left;" >
					<s:select list="%{#request.areamap}" headerKey="all" headerValue="" theme="simple"
                   		name="e.substation" id="substation"/>
				</td>
			</tr>
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="user!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="user!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
<script type="text/javascript">
	if (window.location.href.indexOf("disable") != -1 ) {
		$(".table input,select").attr('disabled', true);
		$(".btn").remove();
	}
	$('#rids label:nth-child(12n)').after('<br/>');
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
	}
</script>
</body>
</html>
