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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jr/dbinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<style>
	.error{border: none; background:none;}
	label.error{border: 1px solid #f5694b!important; background:none;color: #f5694b;padding: 0 2px;display:inline-block;height: 20px; line-height: 20px;}
    #tbjrdbTable td:nth-child(odd){background-color: #f4f3f4;width: 230px;text-align: right;}
    #tbjrdbFormInfo input:not(.tbjrdbExcept),#tbjrdbFormInfo select{border: 2px inset !important;background-color: white !important;height: 25px;}
}
</style>
<body>
<script type="text/javascript">
$(document).ready(function() {
	if ('${t}' == 'v') { //v 查看   u 修改  a 新增 o只读
		$("#tbjrdbFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbjrdbSub,#tbjrdbSave").remove();
	} else {
		dbinfo();
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
			<form id="tbjrdbFormInfo" action="/userextend/saveDbinfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">担保公司数据报送</span>
					</li>
				</div>
				<input type="hidden" name="tbjrdb.id" value="${tbjrdb.id }"/>
				<input type="hidden" name="tbjrdb.status" value="${tbjrdb.status }"/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">业务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrdbTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
						<td>数据时点：<span style="color:red">*</span></td>
						<td><s:select list="%{#request.shujushidian}" headerKey="" headerValue="" theme="simple" id="tbjrdb.time_port" name="tbjrdb.time_port"/></td>
					</tr>
					<tr>
						<td>填报人姓名：<span style="color:red">*</span></td>
						<td><input name="tbjrdb.contact_name" value="${tbjrdb.contact_name }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人职务：<span style="color:red">*</span></td>
						<td><input name="tbjrdb.contact_duty" value="${tbjrdb.contact_duty }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrdb.contact_tele" value="${tbjrdb.contact_tele }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>负责人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrdb.leader_tele" value="${tbjrdb.leader_tele }" class="input" type="text"/></td>
					</tr>
					<tr>
 						<td>当期担保余额：<span style="color:red">*</span></td>
 						<td><input class="input" id="tbjrdb.guar_cu_amt" name="tbjrdb.guar_cu_amt" value="${tbjrdb.guar_cu_amt }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>总担保金额：<span style="color:red">*</span></td>
						<td><input id="tbjrdb.guar_total_amt" name="tbjrdb.guar_total_amt" value="${tbjrdb.guar_total_amt }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>当期代偿金额：<span style="color:red">*</span></td>
						<td><input id="tbjrdb.guar_cu_compen" name="tbjrdb.guar_cu_compen" value="${tbjrdb.guar_cu_compen }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>新增担保笔数：<span style="color:red">*</span></td>
						<td><input id="tbjrdb.guar_incre_count" name="tbjrdb.guar_incre_count" value="${tbjrdb.guar_incre_count }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>总担保笔数：<span style="color:red">*</span></td>
						<td><input id="tbjrdb.guar_total_count" name="tbjrdb.guar_total_count" value="${tbjrdb.guar_total_count }" class="input" type="text"/></td>
					</tr>
				</table>
				<br/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">财务数据</span><span style="color:red; font-size: 16px;">（金额单位：万元）</span>
				</div>
				<br/>
				<table id="tbjrdbTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
 						<td>营业收入：<span style="color:red">*</span></td>
 						<td><input id="tbjrdb.business_income" name="tbjrdb.business_income" value="${tbjrdb.business_income }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>净利润：<span style="color:red">*</span></td>
						<td><input id="tbjrdb.profit" name="tbjrdb.profit" value="${tbjrdb.profit }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>固定资产折旧：<span style="color:red">*</span></td>
						<td><input id="tbjrdb.fixed_assets" name="tbjrdb.fixed_assets" value="${tbjrdb.fixed_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>无形资产摊销：<span style="color:red">*</span></td>
						<td><input id="tbjrdb.intangible_assets" name="tbjrdb.intangible_assets" value="${tbjrdb.intangible_assets }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>人员薪酬及福利（含社保）：<span style="color:red">*</span></td>
						<td><input id="tbjrdb.salaries" name="tbjrdb.salaries" value="${tbjrdb.salaries }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>增值税：<span style="color:red">*</span></td>
						<td><input id="tbjrdb.added_tax" name="tbjrdb.added_tax" value="${tbjrdb.added_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>所得税：<span style="color:red">*</span></td>
						<td><input id="tbjrdb.income_tax" name="tbjrdb.income_tax" value="${tbjrdb.income_tax }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>其他税金及附加：<span style="color:red">*</span></td>
						<td><input id="tbjrdb.other_tax" name="tbjrdb.other_tax" value="${tbjrdb.other_tax }" class="input" type="text"/></td>
					</tr>
				</table>
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbjrdbExcept" id="tbjrdbSave" type="button" onclick="tbjrdbSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="保存"/>
					<input class="shenqingdkt shenqingdkthide tbjrdbExcept" id="tbjrdbSub" type="button" onclick="tbjrdbSubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081');" value="提交"/>
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
	
	function tbjrdbSubmit(val) {
		var status = $("input[name='tbjrdb.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083") {
			status.val(val);
		}
		$("#tbjrdbFormInfo").submit();
	}	
 </script>
 <script type="text/javascript" >
 	leftnav_init("dbinfo");
 </script>
</body>
</html>