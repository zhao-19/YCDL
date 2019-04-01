<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!DOCTYPE html>
<html>
<head>
    <title>盈创动力</title> 
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css"/>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
	<script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>
<style>
#tbfinareportUpdate input:not(.inputexcept){border: 2px inset !important;background-color: white !important;height: 25px;padding-left:3px;}
#tbfinareportUpdate input{width: 100px;}
#tbfinareportUpdate input.shenqingdkt {display:inline-block;width: 145px;height: 41px;border-radius: 5px;cursor: pointer;background-color: #ea5d49;text-align: center;font-size: 16px;color:#fff;}
#tbfinareportUpdate input.shenqingdkt:hover{background:#FE9485!important;}
.cheFinaForm{color:red;}
#tbfinareportUpdate table{border-collapse:collapse;    min-width: 100%;}
#tbfinareportUpdate table tr.firstRow td,#tbfinareportUpdate table tr.firstRow td input,#tbfinareportUpdate table tr td:first-child{background:#ea5504;color:#fff;}
#tbfinareportUpdate td{padding: 5px!important;min-width: 70px!important; border-collapse:collapse;text-align: center;}
.finamsg{color: red;display: none;line-height: 20px;font-weight: bold;}
#finaloan{display: none;margin-right: 10px;margin-top: 8px;width: 141px;height: 34px;background-image: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/applyloan.gif");float: right;border-radius:4px;cursor:pointer}
</style>
</head>
<body>
<!--公共提示框-->
<div id="ggts2"></div>
<!-- 网站头部 -->
<%@ include file="../header.jsp"%>
<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="leftnav.jsp"%>
	</div>
	<div class="list fr">
		<div class="rightbox">
			<div id="tbfinareportUpdate" class="vipinfo" >
				<div class="title">
					<li>
						<span class="t">财务报表（单位：万元）</span>
						<a href="/usercenter/getFinareportinfo.html?t=u" class="finahide">
							<span id="CreateTBpxhd" class="update finahide">修改</span>
						</a>
						<!-- <a href="/usercenter/getProductapplist2.html" id="finaloan"></a> -->
					</li>
					<div id="finareadonly" class="finamsg">
						<br/>${qiyeName}你好，当前登录用户不是主账号，如要修改财务报表数据请用主账号登录，该公司的主账号为：${mainUserid}。
					</div>
					<div id="finaskim" class="finamsg">
						<br/>当前为浏览模式，如果要进行修改，请点击右边的“修改”按钮。
					</div>
					<div id="finamodify" class="finamsg">
						<br/>当前为修改模式，如果要保存数据，请点击底部的“保存”按钮。
					</div>
				</div>
				<div style="height: 20px;display: none;" class="childmsg">&nbsp;</div>
				<div style="overflow:auto;">
				<table id="finaTable" class="table table-bordered table-hover" border="0" cellspacing="0" cellpadding="1">
					<tr style="display: none;">
						<td></td>
						<s:iterator value="finaList" var="tbfinareport">
 							<td><input type="hidden" name="tbfinareport.id" value="${id }"></td> 
 						</s:iterator>
					</tr>
					<tr class="firstRow">
					   <td style="width: 75px;">报表时间</td>
					   	<s:iterator value="finaList" var="tbfinareport">
						   	<c:if test='${report_type==1}'>
						   		<td class="input"><input type="text" name="tbfinareport.report_time" value="${fn:substring(report_time, 0, 4)}" readonly="readonly" class="inputexcept"/></td>
						   	</c:if>
						   	<c:if test='${report_type!=1}'>
								<td class="input"><input type="text" name="tbfinareport.report_time" value="${fn:substring(report_time, 0, 7)}" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM',isShowClear:false,readOnly:true})"/></td>					   	
						   	</c:if>
        				</s:iterator>
					</tr>
					<tr>
					   <td>报表类型</td>
					   	<s:iterator value="finaList" var="tbfinareport">
                			<td class="input">
                				<select class="select" name="tbfinareport.report_type" val="${report_type }">
									<option value="1">年报</option>
									<option value="2">半年报</option>
									<option value="3">季报</option>
									<option value="4">月报</option>
								</select>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>总资产</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input onblur="calculate(${sta.index },4);" type="text" name="tbfinareport.assets" value="${assets }" id="assets${sta.index }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>总负债</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input onblur="calculate(${sta.index },4);" type="text" name="tbfinareport.liabilities" value="${liabilities }" id="liabilities${sta.index }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>所有者权益</td>
					   	<s:iterator value="finaList" var="tbfinareport">
                			<td class="input"><input type="text" name="tbfinareport.owner_equity" value="${owner_equity }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>实收资本</td>
					   	<s:iterator value="finaList" var="tbfinareport">
                			<td class="input"><input type="text" name="tbfinareport.paicl_up" value="${paicl_up }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>未分配利润</td>
					   	<s:iterator value="finaList" var="tbfinareport">
                			<td class="input"><input type="text" name="tbfinareport.notallot_profit" value="${notallot_profit }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>银行借款 </td>
					   	<s:iterator value="finaList" var="tbfinareport">
                			<td class="input"><input type="text" name="tbfinareport.bank_borrowings" value="${bank_borrowings }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>营业收入 </td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input onblur="calculate(${sta.index },2);calculate(${sta.index },3);" type="text" name="tbfinareport.income" value="${income }" id="income${sta.index }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>主营业务收入 </td>
					   	<s:iterator value="finaList" var="tbfinareport">
                			<td class="input"><input type="text" name="tbfinareport.main_income" value="${main_income }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>应收账款</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input onblur="calculate(${sta.index },2);" type="text" name="tbfinareport.should_income" value="${should_income }" id="should_income${sta.index }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>营业成本</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input onblur="calculate(${sta.index },1);calculate(${sta.index },3);" type="text" name="tbfinareport.oper_cost" value="${oper_cost }" id="oper_cost${sta.index }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>存货</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input onblur="calculate(${sta.index },1);calculate(${sta.index },6);" type="text" name="tbfinareport.goods_amt" value="${goods_amt }" id="goods_amt${sta.index }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>流动资产</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input onblur="calculate(${sta.index },5);calculate(${sta.index },6);" type="text" name="tbfinareport.flow_assets" value="${flow_assets }" id="flow_assets${sta.index }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>流动负债</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><input onblur="calculate(${sta.index },5);calculate(${sta.index },6);" type="text" name="tbfinareport.flow_liabilities" value="${flow_liabilities }" id="flow_liabilities${sta.index }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>利润总额</td>
					   	<s:iterator value="finaList" var="tbfinareport">
                			<td class="input"><input type="text" name="tbfinareport.total_profit" value="${total_profit }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>净利润</td>
					   	<s:iterator value="finaList" var="tbfinareport">
                			<td class="input"><input type="text" name="tbfinareport.net_margin" value="${net_margin }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>纳税总额</td>
					   	<s:iterator value="finaList" var="tbfinareport">
                			<td class="input"><input type="text" name="tbfinareport.taxamt" value="${taxamt }"/></td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>存货周转率</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><span id="goods_rate_show${sta.index }"><fmt:formatNumber type="number" value="${goods_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
                				<input type="hidden" name="tbfinareport.goods_rate" value="${goods_rate }" id="goods_rate${sta.index }"/>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>应收账款周转率</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><span id="income_rate_show${sta.index }"><fmt:formatNumber type="number" value="${income_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
                				<input type="hidden" name="tbfinareport.income_rate" value="${income_rate }" id="income_rate${sta.index }"/>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>毛利率</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><span id="margin_rate_show${sta.index }"><fmt:formatNumber type="number" value="${margin_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
                				<input type="hidden" name="tbfinareport.margin_rate" value="${margin_rate }" id="margin_rate${sta.index }"/>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>资产负债率</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><span id="assets_rate_show${sta.index }"><fmt:formatNumber type="number" value="${assets_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
                				<input type="hidden" name="tbfinareport.assets_rate" value="${assets_rate }" id="assets_rate${sta.index }"/>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>流动比率</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><span id="total_rate_show${sta.index }"><fmt:formatNumber type="number" value="${total_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
                				<input type="hidden" name="tbfinareport.total_rate" value="${total_rate }" id="total_rate${sta.index }"/>
                			</td>
        				</s:iterator>
					</tr>
					<tr>
					   <td>速动比率</td>
					   	<s:iterator value="finaList" var="tbfinareport" status="sta">
                			<td class="input"><span id="speed_rate_show${sta.index }"><fmt:formatNumber type="number" value="${speed_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
                				<input type="hidden" name="tbfinareport.speed_rate" value="${speed_rate }" id="speed_rate${sta.index }"/>
                			</td>
        				</s:iterator>
					</tr>
				</table>
				</div>
				<br/>
				<div style="text-align: center;"><input class="shenqingdkt shenqingdkthide inputexcept finahide finareportS" type="button" onclick="finareportSubmit();" value="保存"/></div>
			</div>
		</div>	
	</div>
</div>
<%@ include file="../footer.jsp"%>


<script type="text/javascript">
var finaSub = true;
function finareportSubmit() {
	$(".cheFinaForm").remove();
	finaSub = true;
	var arr = new Array();
	for (var i = 0; i < '${finaList.size()}'; i++ ) {
		var data = new Object();
		arr[i] = data;
	}
	var field = new Array("assets","liabilities","owner_equity","paicl_up","notallot_profit","bank_borrowings","income","main_income","should_income","oper_cost","goods_amt","flow_assets","flow_liabilities","total_profit","net_margin","taxamt");
	for (var i = 0; i < field.length; i++) {
		$("input[name='tbfinareport." + field[i] + "']").each(function(j){
			arr[j][field[i]] = cheNum(this);
		});
	}
	field = new Array("id","report_type","goods_rate","income_rate","margin_rate","assets_rate","total_rate","speed_rate");
	for (var i = 0; i < field.length; i++) {
		$("input[name='tbfinareport." + field[i] + "']").each(function(j){
			arr[j][field[i]] = $(this).val();
		});
	}
	$("select[name='tbfinareport.report_type']").each(function(j){
		arr[j]["report_type"] = $(this).val();
	});
	$("input[name='tbfinareport.report_time']").each(function(j){
			var val = $(this).val()
			if (val.length == 4) {
				val = val + "-12-01"
			} else if(val.length == 7){
				val = val + "-01"
			}
			arr[j]["report_time"] = val;
	});
	if (finaSub) {
		$.ajax({
			type: 'post',
			url: "/usercenter/modifyFinareport.html",
			data: {"arr":JSON.stringify(arr) },
			dataType:"json",
			success: function(data){
				if (data.msg = "succ") {
					alert("保存成功");
					$("#finareportinfo a")[0].click();
				} else {
					alert(data.msg)
				}
			}
		});
	} else {
		alert("验证失败，请检查后重新提交");
	}
}

function cheNum (obj){
	var val = $(obj).val();
	if (val == "" && $(obj).attr("placeholder") == "0.00") {
		return "0.00";
	}
	var num = /^(\-|\+)?[0-9]+[.]{0,1}[0-9]{0,2}$/;
	if (!num.test(val)) {
		$(obj).after("<span class='cheFinaForm'><br/>请输入数字，保留2位小数</span>")
		finaSub = false;
	} else if (val > 10000000000 || val < -10000000000) {
		$(obj).after("<span class='cheFinaForm'><br/>数字太长</span>");
		finaSub = false;
	}
	return val;
}
</script>

<script type="text/javascript" >
	leftnav_init("finareportinfo");
</script>
<script type="text/javascript">
	var loan = 0;
	$("input[name='tbfinareport.id']").each(function(){
		if ($(this).val() == "") {
			loan = 1;
		}
	});
	if (loan == 0) {
		$("#finaloan").show();
	}
	$("select[name^='tbfinareport.report_type']").each(function(){
		var val = $(this).attr("val");
		$(this).val(val);
		if (val == 1) {
			$(this).attr("disabled", true);
		}
	});
	if ('${flag}' != "") {
		alert('${flag}');
	}
	$("#finaTable input").not("input[name='tbfinareport.id']").each(function(){
		if ($(this).val() == "") {
			$(this).val("0.00");
		}
	});
	if ('${t}' == "o") {
		$(".finahide").hide();
		$("#finareadonly,.childmsg").show();
		$("#finaTable input").not("input[name='tbfinareport.id']").each(function(){
			if ($(this).val() == "0.000") {
				$(this).val("0.00");
			}
		});
		changeinput();
	} else if ('${t}' != "u"){
		$(".finareportS").remove();
		$("#finaskim,.childmsg").show();
		$("#finaTable input").not("input[name='tbfinareport.id']").each(function(){
			if ($(this).val() == "0.000") {
				$(this).val("0.00");
			}
		});
		changeinput();
	} else {
		$("#finamodify,.childmsg").show();
		$("#finaTable input").not("input[name='tbfinareport.id']").each(function(){
			if ($(this).val() == "0.000") {
				$(this).val("");
				$(this).attr("placeholder", "0.00");
			}
		});
	}
	
	function changeinput() {
		$("#finaTable select").each(function(){
			$(this).parent("td").html($(this).find("option:selected").text());
		});
		$("#finaTable input").each(function(){
			var val = $(this).val();
			var obj = $(this).parent("td");
			var re = /[%]/gi;  
		    if (re.test(obj.html())) {
		    	if (val == "0E-8") {
		    		val = "0.00";
		    	} else {
		    		val = parseFloat(val).toFixed(2);
		    	}
		       obj.html(val + "%" )
		    } else {
		    	obj.html($(this).val());
		    } 
		});
	}
	
	function calculate(index, num) {	//计算
		var dividend = "";
		var subtrahend = "";
		var divisor = "";
		var ratename = "";
		if (num == 1) {	//存货周转率
			dividend = "oper_cost";
			divisor = "goods_amt";
			ratename = "goods_rate";
		} else if (num == 2) { //应收账款周转率
			dividend = "income";
			divisor = "should_income";
			ratename = "income_rate";
		} else if (num == 3) { //毛利率
			dividend = "income";
			subtrahend = "oper_cost"
			divisor = "income";
			ratename = "margin_rate";
		} else if (num == 4) { //资产负债率
			dividend = "liabilities";
			divisor = "assets";
			ratename = "assets_rate";
		} else if (num == 5) { //流动比率
			dividend = "flow_assets";
			divisor = "flow_liabilities";
			ratename = "total_rate";
		} else if (num == 6) { //速动比率
			dividend = "flow_assets";
			subtrahend = "goods_amt"
			divisor = "flow_liabilities";
			ratename = "speed_rate";
		}
		var dividendval = $("input[id='" + dividend + index + "']").val();
		var divisorval = $("input[id='" + divisor + index + "']").val();
		var result = 0;
		var subtrahendval = 0;
		if (subtrahend != "") {
			subtrahendval = $("input[id='" + subtrahend + index +"']").val();
			if (isNaN(subtrahendval)) {
				subtrahendval = 0;
			}
		}
		if (!isNaN(divisorval) && !isNaN(dividendval) && divisorval != 0) {
			result = ((dividendval - subtrahendval) / divisorval).toFixed(6);
		}
		$("#" + ratename + "_show" + index ).html((result * 100).toFixed(2) + "%");
		$("input[id='" + ratename + index + "']").val((result * 100).toFixed(4));
	}
</script>

</body>
</html>