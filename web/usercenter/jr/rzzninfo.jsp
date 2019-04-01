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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jr/rzzninfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<style>
	.error{border: none; background:none;}
	label.error{border: 1px solid #f5694b!important; background:none;color: #f5694b;padding: 0 2px;display:inline-block;height: 20px; line-height: 20px;}
    #tbjrrzznTable td:nth-child(odd):not(.whitetd){background-color: #f4f3f4;width: 230px;text-align: right;}
    #tbjrrzznFormInfo input:not(.tbjrrzznExcept),#tbjrrzznFormInfo select{border: 2px inset !important;background-color: white !important;height: 25px;}
    textarea {border: 2px inset !important;background-color: white !important;width: 583px;}
    .whitetd{background-color: gray;height: 1px;padding: 0px;}
}
</style>
<body>
<script type="text/javascript">
$(document).ready(function() {
	if ('${t}' == 'v') { //v 查看   u 修改  a 新增 o只读
		$("#tbjrrzznFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbjrrzznSub,#tbjrrzznSave").remove();
	} else {
		rzzninfo();
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
			<form id="tbjrrzznFormInfo" action="/userextend/saveRzzninfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">融资租赁数据报送</span>
					</li>
				</div>
				<input type="hidden" name="tbjrrzzn.id" value="${tbjrrzzn.id }"/>
				<input type="hidden" name="tbjrrzzn.status" value="${tbjrrzzn.status }"/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">业务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrrzznTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
						<td>数据时点：<span style="color:red">*</span></td>
						<td colspan="3"><s:select list="%{#request.shujushidian}" headerKey="" headerValue="" theme="simple" id="tbjrrzzn.time_port" name="tbjrrzzn.time_port"/></td>
					</tr>
					<tr>
						<td>填报人姓名：<span style="color:red">*</span></td>
						<td><input name="tbjrrzzn.contact_name" value="${tbjrrzzn.contact_name }" class="input" type="text"/></td>
						<td>填报人职务：<span style="color:red">*</span></td>
						<td><input name="tbjrrzzn.contact_duty" value="${tbjrrzzn.contact_duty }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrrzzn.contact_tele" value="${tbjrrzzn.contact_tele }" class="input" type="text"/></td>
						<td>负责人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrrzzn.leader_tele" value="${tbjrrzzn.leader_tele }" class="input" type="text"/></td>
					</tr>
					<tr><td colspan="4" class="whitetd"></td></tr>
					<tr>
						<td>当期新签融资租赁合同金额：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrrzzn.contract_incre" name="tbjrrzzn.contract_incre"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrrzzn.contract_incre }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;投放总额：<span style="color:red">*</span></td>
						<td><input id="tbjrrzzn.contract_incre_amt" name="tbjrrzzn.contract_incre_amt" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjrrzzn.contract_incre_amt }" class="input" type="text"/></td>
						<td>其中：直接融资租赁：<span style="color:red">*</span></td>
						<td><input id="tbjrrzzn.contract_direct_incre" name="tbjrrzzn.contract_direct_incre" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjrrzzn.contract_direct_incre }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;售后回租：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrrzzn.sell_back_incre" name="tbjrrzzn.sell_back_incre" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjrrzzn.sell_back_incre }" class="input" type="text"/></td>
					</tr>
					<tr><td colspan="4" class="whitetd"></td></tr>
					<tr>
						<td>累计融资租赁合同金额：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrrzzn.contract_total" name="tbjrrzzn.contract_total"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrrzzn.contract_total }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;投放总额：<span style="color:red">*</span></td>
						<td><input id="tbjrrzzn.grant_total_amt" name="tbjrrzzn.grant_total_amt" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjrrzzn.grant_total_amt }" class="input" type="text"/></td>
						<td>其中：直接融资租赁：<span style="color:red">*</span></td>
						<td><input id="tbjrrzzn.contract_total_incre" name="tbjrrzzn.contract_total_incre"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrrzzn.contract_total_incre }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;出售回租：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrrzzn.sell_back_total" name="tbjrrzzn.sell_back_total"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrrzzn.sell_back_total }" class="input" type="text"/></td>
					</tr>
					<tr><td colspan="4" class="whitetd"></td></tr>
					<tr>
						<td>员工数：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrrzzn.staff_count" name="tbjrrzzn.staff_count"  value="${tbjrrzzn.staff_count }" class="input" type="text"/></td>
					</tr>
				</table>
				<br/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">财务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrrzznTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
 						<td>营业收入：<span style="color:red">*</span></td>
 						<td><input id="tbjrrzzn.business_income" name="tbjrrzzn.business_income"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrrzzn.business_income }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>净利润：<span style="color:red">*</span></td>
						<td><input id="tbjrrzzn.profit" name="tbjrrzzn.profit" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjrrzzn.profit }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>固定资产折旧：<span style="color:red">*</span></td>
						<td><input id="tbjrrzzn.fixed_assets" name="tbjrrzzn.fixed_assets"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrrzzn.fixed_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>无形资产摊销：<span style="color:red">*</span></td>
						<td><input id="tbjrrzzn.intangible_assets" name="tbjrrzzn.intangible_assets" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjrrzzn.intangible_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>人员薪酬及福利（含社保）：<span style="color:red">*</span></td>
						<td><input id="tbjrrzzn.salaries" name="tbjrrzzn.salaries" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjrrzzn.salaries }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>增值税：<span style="color:red">*</span></td>
						<td><input id="tbjrrzzn.added_tax" name="tbjrrzzn.added_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrrzzn.added_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>所得税：<span style="color:red">*</span></td>
						<td><input id="tbjrrzzn.income_tax" name="tbjrrzzn.income_tax"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrrzzn.income_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>其他税金及附加：<span style="color:red">*</span></td>
						<td><input id="tbjrrzzn.other_tax" name="tbjrrzzn.other_tax"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrrzzn.other_tax }" class="input" type="text"/></td>
					</tr>
				</table>
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbjrrzznExcept" id="tbjrrzznSaveTem" type="submit" formnovalidate onclick="tbjrrzznSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="暂存" />
					<input class="shenqingdkt shenqingdkthide tbjrrzznExcept" id="tbjrrzznSave" type="button" onclick="tbjrrzznSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="保存" />
					<input class="shenqingdkt shenqingdkthide tbjrrzznExcept" id="tbjrrzznSub" type="button" onclick="tbjrrzznSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081');" value="提交"/>
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
	
	function tbjrrzznSubmit(val) {
		var status = $("input[name='tbjrrzzn.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083") {
			status.val(val);
		}
		$("#tbjrrzznFormInfo").submit();
	}


 </script>
 <script type="text/javascript" >
 	leftnav_init("rzzninfo");
 </script>
</body>
</html>