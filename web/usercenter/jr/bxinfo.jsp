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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jr/bxinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<style>
	.error{border: none; background:none;}
	label.error{border: 1px solid #f5694b!important; background:none;color: #f5694b;padding: 0 2px;display:inline-block;height: 20px; line-height: 20px;}
    #tbjrbxTable td:nth-child(odd){background-color: #f4f3f4;width: 230px;text-align: right;}
    #tbjrbxFormInfo input:not(.tbjrbxExcept),#tbjrbxFormInfo select{border: 1px solid #aaa;background-color: white !important;height: 25px;}
</style>
<body>
<script type="text/javascript">
$(document).ready(function() {
	if ('${t}' == 'v') { //v 查看   u 修改  a 新增 o只读
		$("#tbjrbxFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbjrbxSub,#tbjrbxSave").remove();
	} else {
		bxinfo();
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
			<form id="tbjrbxFormInfo" action="/userextend/saveBxinfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">保险公司数据报送</span>
					</li>
				</div>
				<input type="hidden" name="tbjrbx.id" value="${tbjrbx.id }"/>
				<input type="hidden" name="tbjrbx.status" value="${tbjrbx.status }"/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">业务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrbxTable" class="maintable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
						<td>数据时点：<span style="color:red">*</span></td>
						<td colspan="3"><s:select list="%{#request.shujushidian}" headerKey="" headerValue="" theme="simple" id="tbjrbx.time_port" name="tbjrbx.time_port"/></td>
					</tr>
					<tr>
						<td>员工数：<span style="color:red">*</span></td>
						<td><input name="tbjrbx.staff_count" value="${tbjrbx.staff_count }" class="input" type="text"/></td>
						<td>网点数：<span style="color:red">*</span></td>
						<td><input name="tbjrbx.branche_count" value="${tbjrbx.branche_count }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人姓名：<span style="color:red">*</span></td>
						<td><input name="tbjrbx.contact_name" value="${tbjrbx.contact_name }" class="input" type="text"/></td>
						<td>填报人职务：<span style="color:red">*</span></td>
						<td><input name="tbjrbx.contact_duty" value="${tbjrbx.contact_duty }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrbx.contact_tele" value="${tbjrbx.contact_tele }" class="input" type="text"/></td>
						<td>负责人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrbx.leader_tele" value="${tbjrbx.leader_tele }" class="input" type="text"/></td>
					</tr>
					<tr>
 						<td>全年保费收入：<span style="color:red">*</span></td>
 						<td colspan="3"><input class="input" id="tbjrbx.insurance_income" name="tbjrbx.insurance_income" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrbx.insurance_income }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>全年保险赔付（中介机构填0）：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrbx.insurance_payment" name="tbjrbx.insurance_payment" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrbx.insurance_payment }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>高新区企业保额：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrbx.sum_insurance" name="tbjrbx.sum_insurance" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrbx.sum_insurance }" class="input" type="text"/></td>
					</tr>
				</table>
				<br/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">财务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrbxTable" class="maintable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
 						<td>营业收入：<span style="color:red">*</span></td>
 						<td><input id="tbjrbx.business_income" name="tbjrbx.business_income" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrbx.business_income }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>净利润：<span style="color:red">*</span></td>
						<td><input id="tbjrbx.profit" name="tbjrbx.profit"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrbx.profit }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>固定资产折旧：<span style="color:red">*</span></td>
						<td><input id="tbjrbx.fixed_assets" name="tbjrbx.fixed_assets"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrbx.fixed_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>无形资产摊销：<span style="color:red">*</span></td>
						<td><input id="tbjrbx.intangible_assets" name="tbjrbx.intangible_assets"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrbx.intangible_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>人员薪酬及福利（含社保）：<span style="color:red">*</span></td>
						<td><input id="tbjrbx.salaries" name="tbjrbx.salaries"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrbx.salaries }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>增值税：<span style="color:red">*</span></td>
						<td><input id="tbjrbx.added_tax" name="tbjrbx.added_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrbx.added_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>所得税：<span style="color:red">*</span></td>
						<td><input id="tbjrbx.income_tax" name="tbjrbx.income_tax"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrbx.income_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>其他税金及附加：<span style="color:red">*</span></td>
						<td><input id="tbjrbx.other_tax" name="tbjrbx.other_tax"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrbx.other_tax }" class="input" type="text"/></td>
					</tr>
				</table>
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbjrbxExcept" id="tbjrbxSave" type="button" onclick="tbjrbxSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="保存"/>
					<input class="shenqingdkt shenqingdkthide tbjrbxExcept" id="tbjrbxSub" type="button" onclick="tbjrbxSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081');" value="提交"/>
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
	function tbjrbxSubmit(val) {
		var status = $("input[name='tbjrbx.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083") {
			status.val(val);
		}
		$("#tbjrbxFormInfo").submit();
	}	
 </script>
 <script type="text/javascript" >
 	leftnav_init("bxinfo");
 </script>
</body>
</html>