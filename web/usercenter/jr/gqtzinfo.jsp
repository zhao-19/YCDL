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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jr/gqtzinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<style>
	.error{border: none; background:none;}
	label.error{border: 1px solid #f5694b!important; background:none;color: #f5694b;padding: 0 2px;display:inline-block;height: 20px; line-height: 20px;}
    #tbjrgqtzTable td:nth-child(odd){background-color: #f4f3f4;width: 230px;text-align: right;}
    #tbjrgqtzFormInfo input:not(.tbjrgqtzExcept),#tbjrgqtzFormInfo select{border: 2px inset !important;background-color: white !important;height: 25px;}
    textarea {border: 2px inset !important;background-color: white !important;width: 583px;}
}
</style>
<body>
<script type="text/javascript">
$(document).ready(function() {
	if ('${t}' == 'v') { //v 查看   u 修改  a 新增 o只读
		$("#tbjrgqtzFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbjrgqtzSub,#tbjrgqtzSave").remove();
	} else {
		gqtzinfo();
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
			<form id="tbjrgqtzFormInfo" action="/userextend/saveGqtzinfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">股权投资金融数据报送</span>
					</li>
				</div>
				<input type="hidden" name="tbjrgqtz.id" value="${tbjrgqtz.id }"/>
				<input type="hidden" name="tbjrgqtz.status" value="${tbjrgqtz.status }"/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">业务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrgqtzTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
						<td>数据时点：<span style="color:red">*</span></td>
						<td colspan="3"><s:select list="%{#request.shujushidian}" headerKey="" headerValue="" theme="simple" id="tbjrgqtz.time_port" name="tbjrgqtz.time_port"/></td>
					</tr>
					<tr>
						<td>填报人姓名：<span style="color:red">*</span></td>
						<td><input name="tbjrgqtz.contact_name" value="${tbjrgqtz.contact_name }" class="input" type="text"/></td>
						<td>填报人职务：<span style="color:red">*</span></td>
						<td><input name="tbjrgqtz.contact_duty" value="${tbjrgqtz.contact_duty }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrgqtz.contact_tele" value="${tbjrgqtz.contact_tele }" class="input" type="text"/></td>
						<td>负责人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrgqtz.leader_tele" value="${tbjrgqtz.leader_tele }" class="input" type="text"/></td>
					</tr>
					<tr>
 						<td>投资项目个数：<span style="color:red">*</span></td>
 						<td><input class="input" id="tbjrgqtz.project_count" name="tbjrgqtz.project_count" value="${tbjrgqtz.project_count }" class="input" type="text"/></td>
						<td>其中：高新区项目数：<span style="color:red">*</span></td>
						<td><input id="tbjrgqtz.project_ht_count" name="tbjrgqtz.project_ht_count" value="${tbjrgqtz.project_ht_count }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>投资总额：<span style="color:red">*</span></td>
						<td><input id="tbjrgqtz.invest_amt" name="tbjrgqtz.invest_amt" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrgqtz.invest_amt }" class="input" type="text"/></td>
						<td>其中：投放给高新区企业：<span style="color:red">*</span></td>
						<td><input id="tbjrgqtz.invets_ht_amt" name="tbjrgqtz.invets_ht_amt"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrgqtz.invets_ht_amt }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>累计募资、投资情况：<span style="color:red">*</span></td>
						<td colspan="3"><textarea id="tbjrgqtz.invest_info" name="tbjrgqtz.invest_info" rows="5" maxlength="512">${tbjrgqtz.invest_info }</textarea></td>
					</tr>
					<tr>
						<td>基金规模：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrgqtz.fund_scale" name="tbjrgqtz.fund_scale"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrgqtz.fund_scale }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>到位资金总额：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrgqtz.place_scale" name="tbjrgqtz.place_scale"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrgqtz.place_scale }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>累计投资总额：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrgqtz.invest_total_amt" name="tbjrgqtz.invest_total_amt" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrgqtz.invest_total_amt }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>职工人数：<span style="color:red">*</span></td>
						<td colspan="3"><input id="tbjrgqtz.staff_count" name="tbjrgqtz.staff_count" value="${tbjrgqtz.staff_count }" class="input" type="text"/></td>
					</tr>
				</table>
				<br/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">财务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrgqtzTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
 						<td>营业收入：<span style="color:red">*</span></td>
 						<td><input id="tbjrgqtz.business_income" name="tbjrgqtz.business_income"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrgqtz.business_income }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>净利润：<span style="color:red">*</span></td>
						<td><input id="tbjrgqtz.profit" name="tbjrgqtz.profit" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrgqtz.profit }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>固定资产折旧：<span style="color:red">*</span></td>
						<td><input id="tbjrgqtz.fixed_assets" name="tbjrgqtz.fixed_assets" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrgqtz.fixed_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>无形资产摊销：<span style="color:red">*</span></td>
						<td><input id="tbjrgqtz.intangible_assets" name="tbjrgqtz.intangible_assets" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrgqtz.intangible_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>人员薪酬及福利（含社保）：<span style="color:red">*</span></td>
						<td><input id="tbjrgqtz.salaries" name="tbjrgqtz.salaries"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrgqtz.salaries }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>增值税：<span style="color:red">*</span></td>
						<td><input id="tbjrgqtz.added_tax" name="tbjrgqtz.added_tax"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrgqtz.added_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>所得税：<span style="color:red">*</span></td>
						<td><input id="tbjrgqtz.income_tax" name="tbjrgqtz.income_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjrgqtz.income_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>其他税金及附加：<span style="color:red">*</span></td>
						<td><input id="tbjrgqtz.other_tax" name="tbjrgqtz.other_tax"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrgqtz.other_tax }" class="input" type="text"/></td>
					</tr>
				</table>
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbjrgqtzExcept" id="tbjrgqtzSave" type="button" onclick="tbjrgqtzSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="保存"/>
					<input class="shenqingdkt shenqingdkthide tbjrgqtzExcept" id="tbjrgqtzSub" type="button" onclick="tbjrgqtzSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081');" value="提交"/>
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
	
	function tbjrgqtzSubmit(val) {
		var status = $("input[name='tbjrgqtz.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083") {
			status.val(val);
		}
		$("#tbjrgqtzFormInfo").submit();
	}	
 </script>
 <script type="text/javascript" >
 	leftnav_init("gqtzinfo");
 </script>
</body>
</html>