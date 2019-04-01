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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jr/yhinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<style>
	.error{border: none; background:none;}
	label.error{border: 1px solid #f5694b!important; background:none;color: #f5694b;padding: 0 2px;display:inline-block;height: 20px; line-height: 20px;}
    #tbjryhTable td:nth-child(odd):not(.whitetd){background-color: #f4f3f4;width: 230px;text-align: right;}
    #tbjryhFormInfo input:not(.tbjryhExcept),#tbjryhFormInfo select{border: 2px inset !important;background-color: white !important;height: 25px;}
    textarea {border: 2px inset !important;background-color: white !important;width: 583px;}
    .whitetd{background-color: gray;height: 1px;padding: 0px;}
}
</style>
<body>
<script type="text/javascript">
$(document).ready(function() {
	if ('${t}' == 'v') { //v 查看   u 修改  a 新增 o只读
		$("#tbjryhFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbjryhSub,#tbjryhSave").remove();
	} else {
		yhinfo();
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
			<form id="tbjryhFormInfo" action="/userextend/saveYhinfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">银行数据报送</span>
					</li>
				</div><%@ include file="notemsg.jsp"%> <br>
				<input type="hidden" name="tbjryh.id" value="${tbjryh.id }"/>
				<input type="hidden" name="tbjryh.status" value="${tbjryh.status }"/>
				<br/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">业务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjryhTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
						<td>机构名称：<span style="color:red">*</span></td>
						<td><input name="tbjryh.org_name" value="${tbjryh.org_name }" auto-complete auto-complete-data="autoCompleteData" id="org_name" class="input" type="text"/></td>
						<td>数据时点：<span style="color:red">*</span></td>
						<td><s:select list="%{#request.shujushidian}" headerKey="" headerValue="" theme="simple" id="tbjryh.time_port" name="tbjryh.time_port" onchange="showdetail($(this).val());"/></td>
					</tr>
					<tr>
						<td>员工数：<span style="color:red">*</span></td>
						<td><input name="tbjryh.staff_count" value="${tbjryh.staff_count }" class="input" type="text"/></td>
						<td>网点数：<span style="color:red">*</span></td>
						<td><input name="tbjryh.branche_count" value="${tbjryh.branche_count }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人姓名：<span style="color:red">*</span></td>
						<td><input name="tbjryh.contact_name" value="${tbjryh.contact_name }" class="input" type="text"/></td>
						<td>填报人职务：<span style="color:red">*</span></td>
						<td><input name="tbjryh.contact_duty" value="${tbjryh.contact_duty }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人手机：<span style="color:red">*</span></td>
						<td><input name="tbjryh.contact_tele" value="${tbjryh.contact_tele }" class="input" type="text"/></td>
						<td>负责人手机：<span style="color:red">*</span></td>
						<td><input name="tbjryh.leader_tele" value="${tbjryh.leader_tele }" class="input" type="text"/></td>
					</tr>
					<tr><td colspan="4" class="whitetd"></td></tr>
					<tr>
						<td>高新区内存款余额：<span style="color:red">*</span></td>
						<td><input name="tbjryh.deposit_total" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.deposit_total }" class="input" type="text"/></td>
						<td>其中：企业存款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.company_deposit" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.company_deposit }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;城乡居民储蓄存款：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.person_deposit"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjryh.person_deposit }" class="input" type="text"/></td>
					</tr>
					<tr><td colspan="4" class="whitetd"></td></tr>
					<tr>
						<td>高新区内贷款余额：<span style="color:red">*</span></td>
						<td><input name="tbjryh.loan_total" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.loan_total }" class="input" type="text"/></td>
						<td>其中：国有企业贷款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.company_so_loan" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.company_so_loan }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;中小企业贷款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.company_small_loan" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.company_small_loan }" class="input" type="text"/></td>
						<td>外资企业贷款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.loan_total_forgign" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.loan_total_forgign }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;中短期贷款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.loan_total_shot" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.loan_total_shot }" class="input" type="text"/></td>
						<td>长期贷款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.loan_total_long" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.loan_total_long }" class="input" type="text"/></td>
					</tr>
					<tr><td colspan="4" class="whitetd"></td></tr>
					<tr>
						<td>高新区本年新增贷款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.incre_loan" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.incre_loan }" class="input" type="text"/></td>
						<td>其中：国有企业贷款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.company_so_incre_loan"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjryh.company_so_incre_loan }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;中小企业贷款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.company_small_incre_loan" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.company_small_incre_loan }" class="input" type="text"/></td>
						<td>外资企业贷款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.incre_loan_forgign"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjryh.incre_loan_forgign }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;中短期贷款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.forgign_shot" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.forgign_shot }" class="input" type="text"/></td>
						<td>长期贷款：<span style="color:red">*</span></td>
						<td><input name="tbjryh.forgign_long" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.forgign_long }" class="input" type="text"/></td>
					</tr>
					<tr><td colspan="4" class="whitetd"></td></tr>
					<tr>
						<td>表外为企业提供融资额：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.obs_loan" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.obs_loan }" class="input" type="text"/></td>
					</tr>
					<tbody id="tbjryhTbody">
					<tr>
						<td>存贷比：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.loan_deposit_rate"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.loan_deposit_rate }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>总贷款余额：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.all_loan_sum" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjryh.all_loan_sum }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>当期贷款新增：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.current_loan_add"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.current_loan_add }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>当期贷款增幅：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.current_loan_add_rate" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjryh.current_loan_add_rate }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>高新区贷款余额在本行全市占比：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.loan_sum_city_rate"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.loan_sum_city_rate }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>高新区新增贷款金额在本行全市占比：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.add_loan_city_rate"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.add_loan_city_rate }" class="input" type="text"/></td>
					</tr>
					<%-- <tr>
						<td>高新区三大主导行业新增贷款：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.three_add_loan" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjryh.three_add_loan }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>高新区三大主导行业贷款增幅：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.three_loan_add_rate"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.three_loan_add_rate }" class="input" type="text"/></td>
					</tr> --%>
					<tr>
						<td>高新区中小微企业新增贷款：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.company_add_load"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.company_add_load }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>高新区中小微企业贷款增幅：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.company_add_load_rate" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"   value="${tbjryh.company_add_load_rate }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>加权平均贷款成本与基准利率比较：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.cost_rate_compare" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.cost_rate_compare }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>高新区股权投资规模：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.investment_scale" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.investment_scale }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>高新区非信贷债权投资规模：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.bond_investment_scale" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.bond_investment_scale }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>高新区其他投资规模：<span style="color:red">*</span></td>
						<td colspan="3"><input name="tbjryh.other_investment_scale" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.other_investment_scale }" class="input" type="text"/></td>
					</tr>
					</tbody>
				</table>
				<br/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">财务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjryhTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
 						<td>营业收入：<span style="color:red">*</span></td>
 						<td><input id="tbjryh.business_income" name="tbjryh.business_income" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.business_income }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>净利润：<span style="color:red">*</span></td>
						<td><input id="tbjryh.profit" name="tbjryh.profit" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.profit }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>固定资产折旧：<span style="color:red">*</span></td>
						<td><input id="tbjryh.fixed_assets" name="tbjryh.fixed_assets" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjryh.fixed_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>无形资产摊销：<span style="color:red">*</span></td>
						<td><input id="tbjryh.intangible_assets" name="tbjryh.intangible_assets" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.intangible_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>人员薪酬及福利（含社保）：<span style="color:red">*</span></td>
						<td><input id="tbjryh.salaries" name="tbjryh.salaries" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.salaries }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>增值税：<span style="color:red">*</span></td>
						<td><input id="tbjryh.added_tax" name="tbjryh.added_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.added_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>所得税：<span style="color:red">*</span></td>
						<td><input id="tbjryh.income_tax" name="tbjryh.income_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.income_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>其他税金及附加：<span style="color:red">*</span></td>
						<td><input id="tbjryh.other_tax" name="tbjryh.other_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  value="${tbjryh.other_tax }" class="input" type="text"/></td>
					</tr>
				</table>
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbjryhExcept" id="tbjryhSave" type="button" onclick="tbjryhSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="保存"/>
					<input class="shenqingdkt shenqingdkthide tbjryhExcept" id="tbjryhSub" type="button" onclick="tbjryhSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081');" value="提交"/>
				</div>
			</form>
				</div>
		</div>	
	</div>
</div>

<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery-ui.min.css"/>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-ui.min.js"></script>
	<script>
        $('#org_name').autocomplete({
            source: function(request, response) {
                var key = $("#org_name").val();
                if ($.trim(key) == "") {
                    return;
                }
                $.ajax({
                    type: 'post',
                    url: "/userextend/creditsearch.html",
                    dataType: "json",
                    data: {
                        "key": key
                    },
                    success: function(data) {
                        var reg = /<span style='color:red'>|<\/span>/ig;
                        $.each(data.data,
                            function(i, v) {
                                v.company_name = v.company_name.replace(reg, '')
                            })
						response($.map(data.data,
                            function(item) {
                                return {
                                    label: item.company_name,
                                    value: item.company_name,
                                    code: item.credit_code
                                }
                            }));
                    }
                });
            },
            minLength: 2
        })
	</script>

 <%@ include file="../../footer.jsp"%>
 <script type="text/javascript">
	if ('${flag}' != "") {
		alert('${flag}');
	}
	function tbjryhSubmit(val) {
		var status = $("input[name='tbjryh.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083") {
			status.val(val);
		}
		$("#tbjryhFormInfo").submit();
	}
	function showdetail(port) {
		if (port.substring(port.length - 2, port.length) != 12) {
			$("#tbjryhTbody input").attr('disabled', true);
			$("#tbjryhTbody").hide();
		} else {
			$("#tbjryhTbody input").attr('disabled', false);
			$("#tbjryhTbody").show();
		}
	}
	showdetail('${tbjryh.time_port}');
 </script>
 <script type="text/javascript" >
 	leftnav_init("yhinfo");
 </script>
</body>
</html>