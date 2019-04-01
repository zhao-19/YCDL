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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jr/xdinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<style>
	.error{border: none; background:none;}
	label.error{border: 1px solid #f5694b!important; background:none;color: #f5694b;padding: 0 2px;display:inline-block;height: 20px; line-height: 20px;}
    #tbjrxdTable td:nth-child(odd){background-color: #f4f3f4;width: 230px;text-align: right;}
    #tbjrxdFormInfo input:not(.tbjrxdExcept),#tbjrxdFormInfo select{border: 2px inset !important;background-color: white !important;height: 25px;}
    textarea {border: 2px inset !important;background-color: white !important;width: 583px;}
}
</style>
<body>
<script type="text/javascript">
$(document).ready(function() {
	if ('${t}' == 'v') { //v 查看   u 修改  a 新增 o只读
		$("#tbjrxdFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbjrxdSub,#tbjrxdSave").remove();
	} else {
		xdinfo();
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
			<form id="tbjrxdFormInfo" action="/userextend/saveXdinfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">小额贷款数据报送</span>
					</li>
				</div>
				<input type="hidden" name="tbjrxd.id" value="${tbjrxd.id }"/>
				<input type="hidden" name="tbjrxd.status" value="${tbjrxd.status }"/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">业务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrxdTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
						<td>数据时点：<span style="color:red">*</span></td>
						<td><s:select list="%{#request.shujushidian}" headerKey="" headerValue="" theme="simple" id="tbjrxd.time_port" name="tbjrxd.time_port"/></td>
					</tr>
					<tr>
						<td>填报人姓名：<span style="color:red">*</span></td>
						<td><input name="tbjrxd.contact_name" value="${tbjrxd.contact_name }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人职务：<span style="color:red">*</span></td>
						<td><input name="tbjrxd.contact_duty" value="${tbjrxd.contact_duty }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrxd.contact_tele" value="${tbjrxd.contact_tele }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>负责人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrxd.leader_tele" value="${tbjrxd.leader_tele }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>当期再贷余额：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.loan_cu_amt" name="tbjrxd.loan_cu_amt" value="${tbjrxd.loan_cu_amt }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>当期新增贷款金额：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.loan_incre_amt" name="tbjrxd.loan_incre_amt" value="${tbjrxd.loan_incre_amt }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>当期贷款笔数：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.loan_cu_count" name="tbjrxd.loan_cu_count" value="${tbjrxd.loan_cu_count }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>总贷款金额：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.loan_count_amt" name="tbjrxd.loan_count_amt" value="${tbjrxd.loan_count_amt }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>总贷款笔数：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.loan_count" name="tbjrxd.loan_count" value="${tbjrxd.loan_count }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>贷款客户所属行业(前三位)：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.invest_industry" name="tbjrxd.invest_industry" value="${tbjrxd.invest_industry }" class="input" type="text" style="width: 450px;" maxlength="32"/></td>
					</tr>
				</table>
				<br/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">财务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrxdTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
 						<td>营业收入：<span style="color:red">*</span></td>
 						<td><input id="tbjrxd.business_income" name="tbjrxd.business_income" value="${tbjrxd.business_income }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>净利润：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.profit" name="tbjrxd.profit" value="${tbjrxd.profit }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>固定资产折旧：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.fixed_assets" name="tbjrxd.fixed_assets" value="${tbjrxd.fixed_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>无形资产摊销：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.intangible_assets" name="tbjrxd.intangible_assets" value="${tbjrxd.intangible_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>人员薪酬及福利（含社保）：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.salaries" name="tbjrxd.salaries" value="${tbjrxd.salaries }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>增值税：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.added_tax" name="tbjrxd.added_tax" value="${tbjrxd.added_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>所得税：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.income_tax" name="tbjrxd.income_tax" value="${tbjrxd.income_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>其他税金及附加：<span style="color:red">*</span></td>
						<td><input id="tbjrxd.other_tax" name="tbjrxd.other_tax" value="${tbjrxd.other_tax }" class="input" type="text"/></td>
					</tr>
				</table>
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbjrxdExcept" id="tbjrxdSave" type="button" onclick="tbjrxdSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="保存"/>
					<input class="shenqingdkt shenqingdkthide tbjrxdExcept" id="tbjrxdSub" type="button" onclick="tbjrxdSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081');" value="提交"/>
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
	
	function tbjrxdSubmit(val) {
		var status = $("input[name='tbjrxd.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083") {
			status.val(val);
		}
		$("#tbjrxdFormInfo").submit();
	}	
 </script>
 <script type="text/javascript" >
 	leftnav_init("xdinfo");
 </script>
</body>
</html>