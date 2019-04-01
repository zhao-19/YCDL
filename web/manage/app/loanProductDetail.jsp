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
						name="apploanproduct.chno" id="chno" readonly="true" /></td>

				<th class="td_right">发布人</th>
				<td style="text-align: left;"><s:textfield
						name="apploanproduct.userid" id="userid" readonly="true" />
						&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="toUserinfo('${apploanproduct.userid }')" 
						class="btn btn-secondary round" type="button" value="查看详情"/>
						</td>
			</tr>


			<tr>
				<th class="td_right">产品名称</th>
				<td style="text-align: left;"><s:textfield
						name="apploanproduct.title" id="title" readonly="true" /></td>
				<th class="td_right">产品类型</th>
				<td style="text-align: left;"><s:textfield
						name="apploanproduct.genre" id="genre" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">贷款用途</th>
				<td style="text-align: left;"><s:textfield
						name="apploanproduct.loanusage" id="loanusage" readonly="true" /></td>
				<th class="td_right">贷款金额(万元)</th>
				<td style="text-align: left;"><s:textfield
						name="apploanproduct.price" id="price" readonly="true" /></td>
			</tr>
			<tr>
                <th class="td_right">贷款期限(月)</th>
                <td style="text-align: left;"><s:textfield
                        name="apploanproduct.deadline" id="deadline" readonly="true" /></td>
                        <th class="td_right">pc端是否已发布</th>
                <td style="text-align: left;"><s:textfield
                        name="e.ispost" id="ispost" readonly="true" /></td>
            </tr>

			<tr>
				<th class="td_right">创建时间</th>
				<td style="text-align: left;"><s:textfield
						name="apploanproduct.createtime" id="createtime" readonly="true" /></td>
				<th class="td_right">状态</th>
				<td style="text-align: left;"><s:textfield
						name="apploanproduct.chstatus" id="chstatus" readonly="true" /></td>

			</tr>

			<tr>
				<th class="td_right">最后修改人</th>
				<td style="text-align: left;"><s:textfield
						name="apploanproduct.updateby" id="updateby" readonly="true" /></td>
				<th class="td_right">最近更新时间</th>
				<td style="text-align: left;"><s:textfield
						name="apploanproduct.updatetime" id="updatetime" readonly="true" /></td>
			</tr>

			<tr>
				<th class="td_right">备注</th>
				<td style="text-align: left;" colspan="3"><s:textarea
						name="apploanproduct.remark" id="remark" readonly="true" /></td>
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
