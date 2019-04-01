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
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jr/qyinfo.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<style>
	.error{border: none; background:none;}
	label.error{border: 1px solid #f5694b!important; background:none;color: #f5694b;padding: 0 2px;display:inline-block;height: 20px; line-height: 20px;}
    #tbjrqyTable td:nth-child(odd){background-color: #f4f3f4;width: 230px;text-align: right;}
    #tbjrqyFormInfo input:not(.tbjrqyExcept),#tbjrqyFormInfo select{border:1px solid #aaa;background-color: white !important;height: 25px;}
    #tbjrqyFormInfo textarea {border:1px solid #aaa;background-color: white !important;width: 583px;}
</style>
<body>
<script type="text/javascript">
$(document).ready(function() {
	if ('${t}' == 'v') { //v 查看   u 修改  a 新增 o只读
		$("#tbjrqyFormInfo input,radio,select,textarea,checkbox").attr('disabled', true);
		$("#tbjrqySub,#tbjrqySave").remove();
	} else {
		qyinfo();
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
			<form id="tbjrqyFormInfo" action="/userextend/saveQyinfo.html" method="post">
				<div class="title">
					<li>
						<span class="t">自贸区企业数据报送</span>
					</li>
				</div>
				<input type="hidden" name="tbjrqy.id" value="${tbjrqy.id }"/>
				<input type="hidden" name="tbjrqy.status" value="${tbjrqy.status }"/>
				<div>
					<span style="background-color: red;">&nbsp;</span>&nbsp;&nbsp;<span style="font-weight:bold;">业务数据</span>
				</div>
				<br/>
				<table id="tbjrqyTable" style="width: 100%;border: 1px solid #e4e4e4" cellpadding="0" cellspacing="0">
					<tr>
						<td>数据时点：<span style="color:red">*</span></td>
						<td><s:select list="%{#request.shujushidian}" headerKey="" headerValue="" theme="simple" id="tbjrqy.time_port" name="tbjrqy.time_port"/></td>
					</tr>
					<tr>
						<td>填报人姓名：<span style="color:red">*</span></td>
						<td><input name="tbjrqy.contact_name" value="${tbjrqy.contact_name }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人职务：<span style="color:red">*</span></td>
						<td><input name="tbjrqy.contact_duty" value="${tbjrqy.contact_duty }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>填报人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrqy.contact_tele" value="${tbjrqy.contact_tele }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>负责人手机：<span style="color:red">*</span></td>
						<td><input name="tbjrqy.leader_tele" value="${tbjrqy.leader_tele }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>业务经营额（亿元）：<span style="color:red">*</span></td>
						<td><input id="tbjrqy.business_income" name="tbjrqy.business_income"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrqy.business_income }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>人民币贷款余额（亿元）：<span style="color:red">*</span></td>
						<td><input id="tbjrqy.deposit_total" name="tbjrqy.deposit_total"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrqy.deposit_total }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>人民币资金池业务结算量（万元）：<span style="color:red">*</span></td>
						<td><input id="tbjrqy.deposit_sett" name="tbjrqy.deposit_sett"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrqy.deposit_sett }" class="input" type="text"/></td>
					</tr>
					<tr>
						<td>跨境人民币结算金额（万元）：<span style="color:red">*</span></td>
						<td><input id="tbjrqy.cross_sett" name="tbjrqy.cross_sett"  isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value="${tbjrqy.cross_sett }" class="input" type="text"/></td>
					</tr>
				</table>
				<div class="revise readOnly" id="zqxxxgbtn">
					<input class="shenqingdkt shenqingdkthide tbjrqyExcept" id="tbjrqySave" type="button" onclick="tbjrqySubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa080');" value="保存"/>
					<input class="shenqingdkt shenqingdkthide tbjrqyExcept" id="tbjrqySub" type="button" onclick="tbjrqySubmit('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa081');" value="提交"/>
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
	
	function tbjrqySubmit(val) {
		var status = $("input[name='tbjrqy.status']");
		if (status.val() != "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083") {
			status.val(val);
		}
		$("#tbjrqyFormInfo").submit();
	}	
 </script>
 <script type="text/javascript" >
 	leftnav_init("qyinfo");
 </script>
</body>
</html>