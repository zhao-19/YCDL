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
				<th class="td_right">产品编号</th>
				<td style="text-align: left;"><s:textfield
						name="apppostequityprojects.chno" id="chno" readonly="true" /></td>

				<th class="td_right">发布人</th>
				<td style="text-align: left;"><s:textfield
						name="apppostequityprojects.userid" id="userid" readonly="true" />
						&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${apppostequityprojects.userid }')" 
						class="btn btn-secondary round" type="button" value="查看详情"/>
						</td>
			</tr>


			<tr>
				<th class="td_right">项目名称</th>
				<td style="text-align: left;" colspan="3"><s:textarea
						name="apppostequityprojects.title" id="title" rows="3" cols="80"
						readonly="true" /></td>
			</tr>
			<tr>
                <th class="td_right">项目介绍</th>
                <td style="text-align: left;" colspan="3"><s:textarea
                        name="apppostequityprojects.bewrite" id="bewrite" rows="3" cols="80"
                        readonly="true" /></td>
            </tr>
            <tr>
                <th class="td_right">融资金额（万元）</th>
                <td style="text-align: left;"><s:textfield
                        name="apppostequityprojects.amount" id="amount" readonly="true" /></td>

                <th class="td_right">出让股份</th>
                <td style="text-align: left;"><s:textfield
                        name="apppostequityprojects.sellshares" id="sellshares" readonly="true" /></td>
            </tr>
            <tr>
                <th class="td_right">成立时间</th>
                <td style="text-align: left;"><s:textfield
                        name="apppostequityprojects.established" id="established" readonly="true" /></td>

                <th class="td_right">是否有收入</th>
                <td style="text-align: left;"><s:textfield
                        name="apppostequityprojects.isincome" id="isincome" readonly="true" /></td>
            </tr>
<tr>
                <th class="td_right">是否盈利</th>
                <td style="text-align: left;"><s:textfield
                        name="apppostequityprojects.isprofit" id="isprofit" readonly="true" /></td>

                <th class="td_right">状态</th>
                <td style="text-align: left;"><s:textfield
                        name="apppostequityprojects.chstatus" id="chstatus" readonly="true" /></td>

            </tr>

			<tr>
				<th class="td_right">创建时间</th>
				<td style="text-align: left;"><s:textfield
						name="apppostequityprojects.create_time" id="create_time"
						readonly="true" /></td>
						<th class="td_right">最近更新时间</th>
				<td style="text-align: left;"><s:textfield
                        name="apppostequityprojects.update_at" id="update_at" readonly="true" /></td>

			</tr>

			<tr>
				<th class="td_right">审核人</th>
				<td style="text-align: left;"><s:textfield
						name="apppostequityprojects.reviwer_id" id="reviwer_id"
						readonly="true" />
						&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${apppostequityprojects.reviwer_id }')" 
						class="btn btn-secondary round" type="button" value="查看详情"/>						
						</td>
				<th class="td_right">审核时间</th>
				<td style="text-align: left;"><s:textfield
						name="apppostequityprojects.review_date" id="review_date" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">驳回原因</th>
				<td style="text-align: left;" colspan="3"><s:textfield
						name="apppostequityprojects.return_reason" id="return_reason"
						readonly="true" /></td>
			</tr>
            <tr>
                <th class="td_right">pc端是否已发布</th>
                <td style="text-align: left;" colspan="3"><s:textfield name="e.ispost"
                        id="ispost" readonly="true" /></td>
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
