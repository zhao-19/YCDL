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
				<s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">贷款产品</td>
			<td style="text-align: left;" >
				<s:select list="#{'成长贷':'成长贷','新创贷':'新创贷','壮大贷':'壮大贷','园保贷':'园保贷'}" id="daikuanpingz" name="e.daikuanpingz"  cssClass="input-medium" 
										listKey="key" listValue="value"  headerKey="" headerValue="" theme="simple"/>
			</td>
			<td style="text-align: right;">客户经理</td>
			<td style="text-align: left;" >
				<s:textfield name="e.checkuser" id="checkuser" readonly="false" theme="simple"/>
			</td>
			<td style="text-align: right;">状态</td>
			<td style="text-align: left;" >
				<s:select list="#{'0':'未提交','1':'基础资料驳回','10':'初审中','20':'请填写、提交详细资料','21':'驳回','30':'详细资料已提交待审核','40':'详细资料审查通过','50':'项目评审通过','60':'担保公司审批通过','70':'银行审批通过','80':'金融办审批通过','90':'银行放款完毕'}" 
				id="status" name="e.status"  cssClass="input-medium" 
				listKey="key" listValue="value"  headerKey="" headerValue="" theme="simple"/>
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
				<th style="display: none;">id</th>
				<th>申请人</th>
				<th style="width:18%;">企业名称</th>
				<th>申请金额</th>
				<th>贷款品种</th>
				<th>申请贷款期限</th>
				<th>审批状态</th>
				<th>审核人</th>
				<th style="min-width: 115px;">最后修改时间</th>
				<th nowrap="nowrap">操作</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/productczdbase!getListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"e.qiyemingcheng" : $("input[name='e.qiyemingcheng']").val(),
        	"e.daikuanpingz" : $("select[name='e.daikuanpingz']").val(),
        	"e.checkuser" : $("input[name='e.checkuser']").val(),
        	"e.status" : $("select[name='e.status']").val()
        };
    },
    render : function(data) {
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.id + "'/></td>");
    		html.push("<td style='display: none;'>" + row.id + "</td>");
    		html.push("<td>" + udf(row.userid) + "</td>");
    		html.push("<td>" + udf(row.qiyemingcheng) + "</td>");
    		html.push("<td>" + udf(row.shenqingjine) + "万</td>");
    		html.push("<td>" + udf(row.daikuanpingz) + "</td>");
    		html.push("<td>" + udf(row.daikuanqixian) + "月</td>");
    		var status_trans = "";
    		if (row.status_trans == "银行放款完毕" || row.status_trans == "请填写、提交详细资料" || row.status_trans == "详细资料审查通过"){
    			status_trans = "<td class='checkcolorok'>" + udf(row.status_trans) + "</td>";
    		} else {
    			status_trans = "<td class='checkcolor'>" + udf(row.status_trans) + "</td>";
    		}
    		html.push(status_trans);
    		html.push("<td>" + udf(row.checkuser) + "</td>");
    		html.push("<td>" + timeformat(row.lastchgtime) + "</td>");
    		html.push("<td nowrap='nowrap'>");
    		html.push("	<a href='javascript:void(0);' onclick=\"toDetail('" + row.id + "')\"  class='btn btn-mini btn-info'><i class='icon-white icon-edit'></i>编辑</a>");
    		html.push("	<span class='btn btn-mini btn-success moreoper'><i class='icon-white icon-download-alt'></i>导出 <i></i>");
    		html.push("		<ul class='moreoperlist'>");
    		html.push("			<li><a href='czddownloadword.action?czdbaseid=" + row.id + "'>导申请资料</a></li>");
    		html.push("			<li><a href='czddownloadword.action?czdbaseid=" + row.id + "&exportt=m'>导调查报告</a></li>");
    		html.push("			<li><a href='czddownloadword.action?czdbaseid=" + row.id + "&exportt=x'>导二合一</a></li>");
    		html.push("		</ul>");
    		html.push("	</span>");
    		html.push("	<a href='wploan!toAdd2.action?e.rele_id=" + row.id + "&e.rele_table=tb_product_base' class='btn btn-mini btn-warning'><i class='icon-white icon-book'></i>入账</a>");
    		html.push("</td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	window.scrollTo(0, 0);
    }
});
function toDetail(id) {
	layer.open({
	    title: '详细信息',
	    type: 2,
	    skin: 'layui-layer-lan bpagenarrowtitle',
	    area: ['100%', '100%'],
	    content: 'productczdbase!toEdit.action?e.id=' + id
	});
}
</script>
</body>
</html>
