<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!DOCTYPE html>
<html>
<head >
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jr/qsqhinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<style>
	.error{border: none; background:none;}
	label.error{border: 1px solid #f5694b!important; background:none;color: #f5694b;padding: 0 2px;display:inline-block;height: 20px; line-height: 20px;}
    #tbjrqsqhTable td:nth-child(odd){background-color: #f4f3f4;width: 230px;text-align: right;white-space:nowrap;}
    #tbjrqsqhFormInfo input:not(.tbjrqsqhExcept),#tbjrqsqhFormInfo select{border: 2px inset !important;background-color: white !important;height: 25px;}
    textarea {border: 2px inset !important;background-color: white !important;width: 583px;}
}
</style>
<body>
<script type="text/javascript">
$(document).ready(function() {
	if ('${t}' == 'v') { //v 查看   u 修改  a 新增 o只读
		$("#tbjrqsqhFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbjrqsqhSub,#tbjrqsqhSave").remove();
	} else {
		qsqhinfo();
	}
});
</script>

<!-- 网站头部 -->
	<%@ include file="../../header.jsp"%>
<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="../leftnav.jsp"%>
	</div>
	<div class="list fr">
		<div class="rightbox">
			<div id="zaiquanxinxi-update" class="vipinfo" >
			<form id="tbjrqsqhFormInfo" action="/userextend/saveQsqhinfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">券商期货数据报送</span>
					</li>
				</div>
				<input type="hidden" name="tbjrqsqh.id" value="${tbjrqsqh.id }"/>
				<input type="hidden" name="tbjrqsqh.status" value="${tbjrqsqh.status }"/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">业务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrqsqhTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
						<td>数据时点：<span style="color:red">*</span></td>
						<td colspan="3"><s:select list="%{#request.shujushidian}" headerKey="" headerValue="" theme="simple" id="tbjrqsqh.time_port" name="tbjrqsqh.time_port"/></td>
					</tr>
					<tr>
						<td>填报人姓名：<span style="color:red">*</span></td>
						<td><input name="tbjrqsqh.contact_name" value="${tbjrqsqh.contact_name }" class="input" type="text"/></td>
						<td>填报人职务：<span style="color:red">*</span></td>
						<td><input name="tbjrqsqh.contact_duty" value="${tbjrqsqh.contact_duty }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrqsqh.contact_tele" value="${tbjrqsqh.contact_tele }" class="input" type="text"/></td>
						<td>负责人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrqsqh.leader_tele" value="${tbjrqsqh.leader_tele }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>全年证券交易量（期货交易量）：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrqsqh.transaction_amount" name="tbjrqsqh.transaction_amount" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrqsqh.transaction_amount }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>高新区内网点数：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrqsqh.point_count" name="tbjrqsqh.point_count" value="${tbjrqsqh.point_count }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>员工数：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrqsqh.staff_count" name="tbjrqsqh.staff_count" value="${tbjrqsqh.staff_count }" class="input" type="text"/></td>
					</tr>
				</table>
				<br/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">财务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrqsqhTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
 						<td>营业收入：<span style="color:red">*</span></td>
 						<td><input id="tbjrqsqh.business_income" name="tbjrqsqh.business_income" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrqsqh.business_income }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>净利润：<span style="color:red">*</span></td>
						<td><input id="tbjrqsqh.profit" name="tbjrqsqh.profit" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrqsqh.profit }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>固定资产折旧：<span style="color:red">*</span></td>
						<td><input id="tbjrqsqh.fixed_assets" name="tbjrqsqh.fixed_assets" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrqsqh.fixed_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>无形资产摊销：<span style="color:red">*</span></td>
						<td><input id="tbjrqsqh.intangible_assets" name="tbjrqsqh.intangible_assets" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjrqsqh.intangible_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>人员薪酬及福利（含社保）：<span style="color:red">*</span></td>
						<td><input id="tbjrqsqh.salaries" name="tbjrqsqh.salaries" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrqsqh.salaries }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>增值税：<span style="color:red">*</span></td>
						<td><input id="tbjrqsqh.added_tax" name="tbjrqsqh.added_tax"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrqsqh.added_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>所得税：<span style="color:red">*</span></td>
						<td><input id="tbjrqsqh.income_tax" name="tbjrqsqh.income_tax"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrqsqh.income_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>其他税金及附加：<span style="color:red">*</span></td>
						<td><input id="tbjrqsqh.other_tax" name="tbjrqsqh.other_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrqsqh.other_tax }" class="input" type="text"/></td>
					</tr>
				</table>
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbjrqsqhExcept" id="tbjrqsqhSave" type="button" onclick="tbjrqsqhSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="保存"/>
					<input class="shenqingdkt shenqingdkthide tbjrqsqhExcept" id="tbjrqsqhSub" type="button" onclick="tbjrqsqhSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081');" value="提交"/>
				</div>
			</form>
				</div>
		</div>	
	</div>
</div>
 <%@ include file="../../footer.jsp"%>
 <script type="text/javascript">
	if ('${flag}' != "") {
		alert('${flag}');
	}
	
	function tbjrqsqhSubmit(val) {
		var status = $("input[name='tbjrqsqh.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083") {
			status.val(val);
		}
		$("#tbjrqsqhFormInfo").submit();
	}	
 </script>
 <script type="text/javascript" >
 	leftnav_init("qsqhinfo");
 </script>
</body>
</html>