<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
    <style>
		.td_right{text-align: right;}
		select{height: auto;}
    </style>
    <script type="text/javascript">
        $(function () {
            $("#username").focus();
        });
    </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<%--art提示--%>
<script type="text/javascript" src="/js/artDialog/art_dialog1.js"></script>
<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>

<s:form action="" namespace="/" theme="simple" id="form">
	<s:hidden name="e.id" id="id"/>
    <table class="table table-bordered">
        <tr>
            <th class="td_right">报表类型</th>
            <td style="text-align: left;">
            	<select class="select" name="e.report_type" id="report_type" data-rule="报表类型:required;report_type;">
					<option value="1">年报</option>
					<option value="2">半年报</option>
					<option value="3">季报</option>
					<option value="4">月报</option>
				</select>
            </td>
            <th class="td_right" style="width: 200px">报表时间</th>
            <td style="text-align: left;">
                <%-- <s:textfield name="e.report_time" id="report_time" class="Wdate" onfocus="WdatePicker()" readonly="readonly"
                             data-rule="required;"/> --%>
                <input type="text" name="e.report_time" value="${e.report_time.substring(0,10) }" id="report_time" onfocus="WdatePicker()" data-rule="required;">
            </td>
        </tr>
        <tr>
        	<th class="td_right">总资产</th>
            <td style="text-align: left;">
                <s:textfield onblur="calculate(4);" name="e.assets" id="assets" readonly="false" data-rule="required;"/>
            </td>
            <th class="td_right">总负债</th>
            <td style="text-align: left;">
                <s:textfield onblur="calculate(4);" name="e.liabilities" id="liabilities" readonly="false" data-rule="required;"/>
            </td>
        </tr>
        <tr>
        	<th class="td_right">所有者权益</th>
            <td style="text-align: left;">
                <s:textfield name="e.owner_equity" id="owner_equity" readonly="false" data-rule="required;"/>
            </td>
            <th class="td_right">实收资本</th>
            <td style="text-align: left;">
                <s:textfield name="e.paicl_up" id="paicl_up" readonly="false" data-rule="required;"/>
            </td>
        </tr>
        <tr>
        	<th class="td_right">未分配利润</th>
            <td style="text-align: left;">
                <s:textfield name="e.notallot_profit" id="notallot_profit" readonly="false" data-rule="required;"/>
            </td>
            <th class="td_right">银行借款</th>
            <td style="text-align: left;">
                <s:textfield name="e.bank_borrowings" id="bank_borrowings" readonly="false" data-rule="required;"/>
            </td>
        </tr>
        <tr>
        	<th class="td_right">营业收入</th>
            <td style="text-align: left;">
                <s:textfield onblur="calculate(2);calculate(3);" name="e.income" id="income" readonly="false" data-rule="required;"/>
            </td>
            <th class="td_right">主营业务收入</th>
            <td style="text-align: left;">
                <s:textfield name="e.main_income" id="main_income" readonly="false" data-rule="required;"/>
            </td>
        </tr>
        <tr>
        	<th class="td_right">应收账款</th>
            <td style="text-align: left;">
                <s:textfield onblur="calculate(2);" name="e.should_income" id="should_income" readonly="false" data-rule="required;"/>
            </td>
            <th class="td_right">营业成本</th>
            <td style="text-align: left;">
                <s:textfield onblur="calculate(1);calculate(3);" name="e.oper_cost" id="oper_cost" readonly="false" data-rule="required;"/>
            </td>
        </tr>
        <tr>
        	<th class="td_right">存货</th>
            <td style="text-align: left;">
                <s:textfield onblur="calculate(1);calculate(6);" name="e.goods_amt" id="goods_amt" readonly="false" data-rule="required;"/>
            </td>
            <th class="td_right">流动资产</th>
            <td style="text-align: left;">
                <s:textfield onblur="calculate(5);calculate(6);" name="e.flow_assets" id="flow_assets" readonly="false" data-rule="required;"/>
            </td>
        </tr>
        <tr>
        	<th class="td_right">流动负债</th>
            <td style="text-align: left;">
                <s:textfield onblur="calculate(5);calculate(6);" name="e.flow_liabilities" id="flow_liabilities" readonly="false" data-rule="required;"/>
            </td>
            <th class="td_right">利润总额</th>
            <td style="text-align: left;">
                <s:textfield name="e.total_profit" id="total_profit" readonly="false" data-rule="required;"/>
            </td>
        </tr>
        <tr>
        	<th class="td_right">净利润</th>
            <td style="text-align: left;">
                <s:textfield name="e.net_margin" id="net_margin" readonly="false" data-rule="required;"/>
            </td>
            <th class="td_right">纳税总额</th>
            <td style="text-align: left;">
                <s:textfield name="e.taxamt" id="taxamt" readonly="false" data-rule="required;"/>
            </td>
        </tr>
        <tr>
        	<th class="td_right">存货周转率</th>
            <td style="text-align: left;">
            	<span id="goods_rate_show"><fmt:formatNumber type="number" value="${e.goods_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
            	<s:hidden name="e.goods_rate"/>
            </td>
            <th class="td_right">应收账款周转率</th>
            <td style="text-align: left;">
	            <span id="income_rate_show"><fmt:formatNumber type="number" value="${e.income_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
	            <s:hidden name="e.income_rate"/>
            </td>
        </tr>
        <tr>
        	<th class="td_right">毛利率</th>
            <td style="text-align: left;">
            	<span id="margin_rate_show"><fmt:formatNumber type="number" value="${e.margin_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
	            <s:hidden name="e.margin_rate"/>
            </td>
            <th class="td_right">资产负债率</th>
            <td style="text-align: left;">
            	<span id="assets_rate_show"><fmt:formatNumber type="number" value="${e.assets_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
	            <s:hidden name="e.assets_rate"/>
            </td>
        </tr>
        <tr>
        	<th class="td_right">流动比率</th>
            <td style="text-align: left;">
            	<span id="total_rate_show"><fmt:formatNumber type="number" value="${e.total_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
	            <s:hidden name="e.total_rate"/>
            </td>
            <th class="td_right">速动比率</th>
            <td style="text-align: left;">
            	<span id="speed_rate_show"><fmt:formatNumber type="number" value="${e.speed_rate*1 }" pattern="0.00" maxFractionDigits="2"/>%</span>
	            <s:hidden name="e.speed_rate"/>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                <s:if test="e.id=='' or e.id==null">
                    <button type="button" onclick="check('manage/tbfinareport!insert.action');" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 新增
                    </button>
                </s:if>
                <s:else>
                    <button type="button" onclick="check('manage/tbfinareport!update.action');" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 保存
                    </button>
                </s:else>
            </td>
        </tr>
    </table>
</s:form>
<script type="text/javascript">
	$("[id='report_type']").val('${e.report_type}');

    function check(urlStr) {
    	for (var i = 1; i <= 6; i ++ ) {
    		calculate(i);
    	}
    	var fal = true;
     	var num = /^(\-|\+)?[0-9]+[.]{0,1}[0-9]{0,6}$/;
     	$("#form input,select").not("#id").not("#report_time").each(function(){
     		if(!num.test($(this).val())){
     			$(this).err("请输入数字");
     			fal = false;
     		}
     	});        
        if (fal) {
            $('#form').attr('action', urlStr);
            document.forms[0].submit();
        } else {
            msg.info("表单填写有错误，请检查后再重新提交！");
        }
    }
    
    function calculate(num) {	//计算
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
		var dividendval = $("input[name='e." + dividend + "']").val();
		var divisorval = $("input[name='e." + divisor + "']").val();
		var result = 0;
		var subtrahendval = 0;
		if (subtrahend != "") {
			subtrahendval = $("input[name='e." + subtrahend + "']").val();
			if (isNaN(subtrahendval)) {
				subtrahendval = 0;
			}
		}
		if (!isNaN(divisorval) && !isNaN(dividendval) && divisorval != 0) {
			result = ((dividendval - subtrahendval) / divisorval).toFixed(6);
		}
		$("#" + ratename + "_show").html((result * 100).toFixed(2) + "%");
		$("input[name='e." + ratename + "']").val((result * 100).toFixed(4));
	}
</script>
</body>
</html>