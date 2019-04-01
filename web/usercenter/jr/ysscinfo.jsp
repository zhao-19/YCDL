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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jr/ysscinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<style>
	.error{border: none; background:none;}
	label.error{border: 1px solid #f5694b!important; background:none;color: #f5694b;padding: 0 2px;display:inline-block;height: 20px; line-height: 20px;}
    #tbjrysscTable td:nth-child(odd){background-color: #f4f3f4;width: 230px;text-align: right;}
    #tbjrysscFormInfo input:not(.tbjrysscExcept),#tbjrysscFormInfo select{border: 2px inset !important;background-color: white !important;height: 25px;}
    textarea {border: 2px inset !important;background-color: white !important;width: 583px;}
}
</style>
<body>
<script type="text/javascript">
$(document).ready(function() {
	if ('${t}' == 'v') { //v 查看   u 修改  a 新增 o只读
		$("#tbjrysscFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbjrysscSub,#tbjrysscSave").remove();
	} else {
		ysscinfo();
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
			<form id="tbjrysscFormInfo" action="/userextend/saveYsscinfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">要素市场数据报送</span>
					</li>
				</div>
				<input type="hidden" name="tbjryssc.id" value="${tbjryssc.id }"/>
				<input type="hidden" name="tbjryssc.status" value="${tbjryssc.status }"/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">业务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrysscTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
						<td>数据时点：<span style="color:red">*</span></td>
						<td colspan="3"><s:select list="%{#request.shujushidian}" headerKey="" headerValue="" theme="simple" id="tbjryssc.time_port" name="tbjryssc.time_port"/></td>
					</tr>
					<tr>
						<td>填报人姓名：<span style="color:red">*</span></td>
						<td><input name="tbjryssc.contact_name" value="${tbjryssc.contact_name }" class="input" type="text"/></td>
						<td>填报人职务：<span style="color:red">*</span></td>
						<td><input name="tbjryssc.contact_duty" value="${tbjryssc.contact_duty }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人手机：<span style="color:red">*</span></td>
						<td><input name="tbjryssc.contact_tele" value="${tbjryssc.contact_tele }" class="input" type="text"/></td>
						<td>负责人手机：<span style="color:red">*</span></td>
						<td><input name="tbjryssc.leader_tele" value="${tbjryssc.leader_tele }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>全年交易额：<span style="color:red">*</span></td>
						<td><input id="tbjryssc.transaction_amount" name="tbjryssc.transaction_amount" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjryssc.transaction_amount }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>职工人数：<span style="color:red">*</span></td>
						<td><input id="tbjryssc.staff_count" name="tbjryssc.staff_count" value="${tbjryssc.staff_count }" class="input" type="text"/></td>
					</tr>
				</table>
				<br/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">财务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrysscTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
 						<td>营业收入：<span style="color:red">*</span></td>
 						<td><input id="tbjryssc.business_income" name="tbjryssc.business_income" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjryssc.business_income }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>净利润：<span style="color:red">*</span></td>
						<td><input id="tbjryssc.profit" name="tbjryssc.profit" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjryssc.profit }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>固定资产折旧：<span style="color:red">*</span></td>
						<td><input id="tbjryssc.fixed_assets" name="tbjryssc.fixed_assets"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"value="${tbjryssc.fixed_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>无形资产摊销：<span style="color:red">*</span></td>
						<td><input id="tbjryssc.intangible_assets" name="tbjryssc.intangible_assets"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"value="${tbjryssc.intangible_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>人员薪酬及福利（含社保）：<span style="color:red">*</span></td>
						<td><input id="tbjryssc.salaries" name="tbjryssc.salaries"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"value="${tbjryssc.salaries }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>增值税：<span style="color:red">*</span></td>
						<td><input id="tbjryssc.added_tax" name="tbjryssc.added_tax"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"value="${tbjryssc.added_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>所得税：<span style="color:red">*</span></td>
						<td><input id="tbjryssc.income_tax" name="tbjryssc.income_tax"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"value="${tbjryssc.income_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>其他税金及附加：<span style="color:red">*</span></td>
						<td><input id="tbjryssc.other_tax" name="tbjryssc.other_tax"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"value="${tbjryssc.other_tax }" class="input" type="text"/></td>
					</tr>
				</table>
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbjrysscExcept" id="tbjrysscSave" type="button" onclick="tbjrysscSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="保存"/>
					<input class="shenqingdkt shenqingdkthide tbjrysscExcept" id="tbjrysscSub" type="button" onclick="tbjrysscSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081');" value="提交"/>
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
	
	function tbjrysscSubmit(val) {
		var status = $("input[name='tbjryssc.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083") {
			status.val(val);
		}
		$("#tbjrysscFormInfo").submit();
	}	
 </script>
 <script type="text/javascript" >
 	leftnav_init("ysscinfo");
 </script>
</body>
</html>