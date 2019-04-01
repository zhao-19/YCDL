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
	<s:form action="enterPark" namespace="/manage" theme="simple" id="form"
		name="form" method="post">
		<table class="table table-bordered">
            <tr id="ids" style="display:none;"><td>
            <input type="checkbox" name="ids" value="<s:property value="pkid"/>" checked="checked" />
            </td>
        </tr>

			<tr>
				<th class="td_right">编号</th>
				<td style="text-align: left;"><s:textfield name="e.chno"
						id="chno" readonly="true" /></td>

				<th class="td_right">发起人id</th>
				<td style="text-align: left;"><s:textfield
						name="e.userid" id="userid" readonly="true" />
						&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${e.userid }')" 
						class="btn btn-secondary round" type="button" value="查看详情"/>
						</td>
			</tr>


            <tr>
                <th class="td_right">企业名称</th>
                <td style="text-align: left;"><s:textfield name="e.company_name"
                        id="company_name" readonly="true" /></td>

                <th class="td_right">联系人姓名</th>
                <td style="text-align: left;"><s:textfield
                        name="e.contact_name" id="contact_name" readonly="true" /></td>
            </tr>

 <tr>
                <th class="td_right">联系人职位</th>
                <td style="text-align: left;"><s:textfield name="e.contact_position"
                        id="contact_position" readonly="true" /></td>

                <th class="td_right">联系人电话</th>
                <td style="text-align: left;"><s:textfield
                        name="e.contact_mobile" id="contact_mobile" readonly="true" /></td>
            </tr>
			<tr>
				<th class="td_right">联系人邮箱</th>
                <td style="text-align: left;"><s:textfield name="e.contact_email"
                        id="contact_email" readonly="true" /></td>

                <th class="td_right">联系人电话</th>
                <td style="text-align: left;"><s:textfield
                        name="e.contact_mobile" id="contact_mobile" readonly="true" /></td>
			</tr>
<tr>
                <th class="td_right">审核人id</th>
                <td style="text-align: left;"><s:textfield name="e.reviwer_id"
                        id="reviwer_id" readonly="true" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${e.reviwer_id }')" 
						class="btn btn-secondary round" type="button" value="查看详情"/>
                        </td>

                <th class="td_right">状态</th>
                <td style="text-align: left;"><s:textfield
                        name="e.chstatus" id="chstatus" readonly="true" /></td>
            </tr>
			<tr>
				<th class="td_right">创建时间</th>
				<td style="text-align: left;"><s:textfield
						name="e.createdate" id="createdate" readonly="true" /></td>

				<th class="td_right">最近更新时间</th>
				<td style="text-align: left;"><s:textfield
						name="e.updatedate" id="updatedate" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">最后修改人</th>
				<td style="text-align: left;" colspan="3"><s:textfield
						name="e.updateby" id="updateby" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">备注</th>
				<td style="text-align: left;" colspan="3"><s:textarea
						name="e.remark" id="remark" readonly="true" rows="3" cols="80"/></td>
			</tr>

        <tr>
            <td colspan="11" style="text-align:center;">
                <button method="actCooApply!pass.action" class="btn btn-success" onclick="return submitIDs(this,'确定通过选择的记录?');"">
                    <i class="icon-ok-sign icon-white"></i> 通过
                </button>
                
                <button method="actCooApply!turnDown.action" class="btn btn-danger" onclick="return submitIDs(this,'确定驳回选择的记录?');"">
                    <i class="icon-remove-sign icon-white"></i>驳回
                </button>
            </td>
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
