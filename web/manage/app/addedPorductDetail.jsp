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
				<th class="td_right">需求类型</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.genre" id="genre" readonly="true" /></td>
			</tr>


			<tr>
				<th class="td_right">产品编号</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.chno" id="chno" readonly="true" /></td>

				<th class="td_right">申请人id</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.userid" id="userid" readonly="true" />
						&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${appaddedproduct.userid }')" 
						class="btn btn-secondary round" type="button" value="查看详情"/></td>
			</tr>

			<tr>
				<th class="td_right">发起者</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.initiator" id="initiator" readonly="true" /></td>

				<th class="td_right">名称</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.title" id="title" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">简单描述</th>
				<td style="text-align: left;" colspan="3"><s:textarea
						name="appaddedproduct.bewrite" id="bewrite" rows="3" cols="80"
						readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">详细描述</th>
				<td style="text-align: left;" colspan="3"><s:textarea
						name="appaddedproduct.content" id="content" rows="3" cols="80"
						readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">所属行业</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.industry" id="industry" readonly="true" /></td>

				<th class="td_right">产品最低价格</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.price" id="price" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">创建时间</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.create_time" id="create_time"
						readonly="true" /></td>

				<th class="td_right">最近更新时间</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.update_at" id="update_at" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">状态</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.chstatus" id="chstatus" readonly="true" /></td>
				<th class="td_right">pc端是否已发布</th>
				<td style="text-align: left;"><s:textfield name="e.ispost"
						id="ispost" readonly="true" /></td>
			</tr>
			<tr>
				<th class="td_right">审核人id</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.reviwer_id" id="review_id" readonly="true" />
						&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${appaddedproduct.reviwer_id }')" 
						class="btn btn-secondary round" type="button" value="查看详情"/></td>

				<th class="td_right">审核时间</th>
				<td style="text-align: left;"><s:textfield
						name="appaddedproduct.review_date" id="review_date"
						readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">驳回原因</th>
				<td style="text-align: left;" colspan="3"><s:textarea
						name="appaddedproduct.return_reason" id="return_reason"
						readonly="true" /></td>
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
