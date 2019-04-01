<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8"
	src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8"
	src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>

<style>
select {
	height: auto;
}
</style>
<script>
	
</script>
</head>

<body>
	<s:form action="product" namespace="/manage" theme="simple" id="form"
		name="form" method="post">
		<table class="table table-bordered">


			<tr>
				<th class="td_right">编号</th>
				<td style="text-align: left;"><s:textfield
						name="apploanapp.chno" id="chno" readonly="true" /></td>

				<th class="td_right">贷款产品id</th>
				<td style="text-align: left;"><s:textfield
						name="apploanapp.proid" id="proid" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">贷款机构id</th>
				<td style="text-align: left;"><s:textfield
						name="apploanapp.agencyid" id="agencyid" readonly="true" /></td>

				<th class="td_right">贷款主体</th>
				<td style="text-align: left;"><s:textfield
						name="apploanapp.genre" id="genre" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">贷款用途</th>
				<td style="text-align: left;"><s:textfield
						name="apploanapp.loanusage" id="loanusage" readonly="true" /></td>

				<th class="td_right">贷款金额（万元）</th>
				<td style="text-align: left;"><s:textfield
						name="apploanapp.amount" id="amount" readonly="true" /></td>
			</tr>
			<s:if test="apploanapp.genre=='个人贷款'">
				<tr>
					<th class="td_right">身份</th>
					<td style="text-align: left;"><s:textfield
							name="apploanapp.jobs" id="jobs" readonly="true" /></td>

					<th class="td_right">年收入（万元）</th>
					<td style="text-align: left;"><s:textfield
							name="apploanapp.income" id="income" readonly="true" /></td>
				</tr>
				<tr>
					<th class="td_right">有无房产</th>
					<td style="text-align: left;"><s:textfield
							name="apploanapp.ishouse" id="ishouse" readonly="true" /></td>

					<th class="td_right">学历</th>
					<td style="text-align: left;"><s:textfield
							name="apploanapp.education" id="education" readonly="true" /></td>
				</tr>
			</s:if>
			<s:else>
				<tr>
					<th class="td_right">抵押情况</th>
					<td style="text-align: left;"><s:textfield
							name="apploanapp.guaranty" id="guaranty" readonly="true" /></td>

					<th class="td_right">销售规模</th>
					<td style="text-align: left;"><s:textfield
							name="apploanapp.scale" id="scale" readonly="true" /></td>
				</tr>
			</s:else>

			<tr>
				<th class="td_right">申请人id</th>
				<td style="text-align: left;"><s:textfield
						name="apploanapp.userid" id="userid" readonly="true" />
						&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${apploanapp.userid }')" 
						class="btn btn-secondary round" type="button" value="查看详情"/></td>

				<th class="td_right">状态</th>
				<td style="text-align: left;"><s:textfield
						name="apploanapp.chstatus" id="chstatus" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">创建时间</th>
				<td style="text-align: left;" colspan="3"><s:textfield
						name="apploanapp.create_time" id="create_time" readonly="true" /></td>

			</tr>

			<tr>
				<th class="td_right">审核人id</th>
				<td style="text-align: left;"><s:textfield
						name="apploanapp.checkid" id="review_id" readonly="true" />
						&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${apploanapp.checkid }')" 
						class="btn btn-secondary round" type="button" value="查看详情"/></td>

				<th class="td_right">审核时间</th>
				<td style="text-align: left;"><s:textfield
						name="apploanapp.review_date" id="review_date" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">驳回原因</th>
				<td style="text-align: left;" colspan="3"><s:textfield
						name="apploanapp.return_reason" id="return_reason" readonly="true" /></td>
			</tr>

		</table>
	</s:form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/newlayer/layer.js"></script>
<script type="text/javascript">
	 function toUserinfo(userid) {
        layer.open({
            title: '用户详情',
            type: 2,
            skin: 'layui-layer-lan',
            area: ['1100px', '600px'],
            fix: false,
            maxmin: false,
            content: 'appCommon!toUserinfo.action?userid=' + userid
        });
    }
</script>
</html>
