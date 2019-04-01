<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/bPage/b.page.css">
	<script charset="utf-8" src="<%=request.getContextPath() %>/js/bPage/b.page.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/layer/layer.js"></script>
</head>
<body class="bPageBody">
	<div class="bodyBox">
		<table class="table table-bordered table-condensed table-search">
			<tr>
				<td style="text-align: right;">企业名称</td>
				<td style="text-align: left;" >
					<s:textfield id="qiyemingcheng" readonly="false" theme="simple"/>
				</td>
				<td style="text-align: right;">是否设立党支部</td>
				<td style="text-align: left;" >
					<s:select list="%{#application.dic.whether.childs}" listKey="id" headerKey="" headerValue=""
							  listValue="name" id="is_party_branch" theme="simple"/>
				</td>
				<td>
					<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
						<i class="icon-search icon-white"></i> 查询
					</button>
				</td>
			</tr>
		</table>
		<table
				class="table table-striped table-bordered table-hover table-condensed">
			<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th>企业名称</th>
				<th>产品名称</th>
				<th>是否设立党支部</th>
				<th>党员数</th>
				<th>高管党员人数</th>
				<th>申请金额</th>
				<th>评议时间</th>
				<th>党建增信得分</th>
				<th>放款金额</th>
				<th>放款时间</th>
				<th nowrap="nowrap">操作</th>
			</tr>
			</thead>
			<tbody id="bpagetbody"></tbody>
		</table>
		<div id="pagebar"></div>
	</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/qiye!PartyListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"qiyemingcheng" : $("#qiyemingcheng").val(),
        	"is_party_branch" : $("#is_party_branch").val()
        };
    },
    render : function(data) {
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.id + "'/></td>");
    		html.push("<td>" + udf(row.qiyemingcheng) + "</td>");
    		html.push("<td>" + udf(row.chanpingmingcheng) + "</td>");
    		html.push("<td>" + udf(row.is_party_branch) + "</td>");
    		html.push("<td>" + udf(row.party_num) + "</td>");
    		html.push("<td>" + udf(row.lead_party_num) + "</td>");
    		html.push("<td>" + udf(row.shenqingjine) + "</td>");
    		html.push("<td>" + udf(row.shijian) + "</td>");
    		html.push("<td>" + udf(row.party_score) + "</td>");
    		html.push("<td>" + udf(row.amt) + "</td>");
    		html.push("<td>" + udf(row.begindate) + "</td>");
    		html.push("<td><a href='javascript:void(0);' onclick=\"toDetail('" + row.id + "')\" class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>详情</a></td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});
function toDetail(id) {
	layer.open({
	    title: '党建增信详情',
	    type: 2,
	    skin: 'layui-layer-molv bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: 'qiye!selectPartyOne.action?id=' + id
	});
}
</script>
</body>
</html>
