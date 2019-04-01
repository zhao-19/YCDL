<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
    <style>
		.td_right{text-align: right;width: 130px;}
		select{height: auto;}
		.table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/js/artDialog/art_dialog1.js"></script>
	<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
	<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>
</head>
<body>
    <table class="table table-bordered">
    	<tr>
            <td colspan="4" class="table_title">机构详情</td>
        </tr>
    	<tr>
            <th class="td_right">用户名称</th>
            <td style="text-align: left;">${e.userid }</td>
            <th class="td_right">批次</th>
            <td style="text-align: left;">${e.pichi }</td>
        </tr>
        <tr>
            <th class="td_right">机构名称</th>
            <td style="text-align: left;">${e.org_name }</td>
            <th class="td_right">营业执照号</th>
            <td style="text-align: left;">${e.business_no }</td>
        </tr>
        <tr>
            <th class="td_right">成立时间</th>
            <td style="text-align: left;">${fn:substring(e.open_date, 0, 11)}</td>
            <th class="td_right">所属行业</th>
            <td style="text-align: left;"><% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("e.industry_owned")); if( o != null){out.print(o.getName());}%></td>
        </tr>
        <tr>
            <th class="td_right">工商注册地</th>
            <td style="text-align: left;" colspan="3">${e.regist_add }</td>
        </tr>
        <tr>
            <th class="td_right">实际经营地址</th>
            <td style="text-align: left;" colspan="3">${e.run_add }</td>
        </tr>
        <tr>
            <th class="td_right">注册资金（万元）</th>
            <td style="text-align: left;">${e.regist_amt }</td>
            <th class="td_right">目前到位资金（万元）</th>
            <td style="text-align: left;">${e.paid_amt }</td>
        </tr>
        <tr>
            <th class="td_right">负责人</th>
            <td style="text-align: left;">${e.chargeperson }</td>
            <th class="td_right">负责人职务</th>
            <td style="text-align: left;">${e.charge_duty }</td>
        </tr>
        <tr>
            <th class="td_right">负责人手机号码</th>
            <td style="text-align: left;">${e.charge_tele }</td>
            <th class="td_right">联系人</th>
            <td style="text-align: left;">${e.contacts }</td>
        </tr>
        <tr>
            <th class="td_right">联系人职务</th>
            <td style="text-align: left;">${e.contacts_duty }</td>
            <th class="td_right">联系人手机号码</th>
            <td style="text-align: left;">${e.contacts_tele }</td>
        </tr>
        <tr>
            <th class="td_right">统计关系所在地</th>
            <td style="text-align: left;">${e.rela_add }</td>
            <th class="td_right">国税关系所在地</th>
            <td style="text-align: left;">${e.rela_nation_tax_add }</td>
        </tr>
        <tr>
            <th class="td_right">地税关系所在地</th>
            <td style="text-align: left;">${e.rela_local_tax_add }</td>
            <th class="td_right">录入人</th>
            <td style="text-align: left;">${e.inputuser }</td>
        </tr>
        <tr>
            <th class="td_right">录入时间</th>
            <td style="text-align: left;">${fn:substring(e.lurushijian, 0, 19)}</td>
            <th class="td_right">最后修改时间</th>
            <td style="text-align: left;">${fn:substring(e.lastchgtime, 0, 19)}</td>
        </tr>
    </table>
    <table class="table table-bordered">
    	<tr>
            <td colspan="4" class="table_title">经营指标</td>
        </tr>
    	<tr>
            <th class="td_right">年份</th>
            <th class="td_right">${e.first_year }</th>
            <th class="td_right">${e.first_year + 1 }</th>
            <th class="td_right">${e.first_year + 2 }预计</th>
        </tr>
        <tr>
            <th class="td_right">营业收入（万元）</th>
            <td>${e.firstsell }</td>
            <td>${e.secondsell }</td>
            <td>${e.thirdsell }</td>
        </tr>
        <tr>
            <th class="td_right">利润（万元）</th>
            <td>${e.firstinte }</td>
            <td>${e.secondinte }</td>
            <td>${e.thirdinte }</td>
        </tr>
        <tr>
            <th class="td_right">营业税（万元）</th>
            <td>${e.first_income_tax }</td>
            <td>${e.second_income_tax }</td>
            <td>${e.third_income_tax }</td>
        </tr>
        <tr>
            <th class="td_right">增值税（万元）</th>
            <td>${e.first_added_tax }</td>
            <td>${e.second_added_tax }</td>
            <td>${e.third_added_tax }</td>
        </tr>
        <tr>
            <th class="td_right">企业所得税（万元）</th>
            <td>${e.first_sales_tax }</td>
            <td>${e.second_sales_tax }</td>
            <td>${e.third_sales_tax }</td>
        </tr>
        <tr>
            <th class="td_right">纳税总额（万元）</th>
            <td>${e.firsttax }</td>
            <td>${e.secondtax }</td>
            <td>${e.thirdtax }</td>
        </tr>
        <tr>
            <th class="td_right">员工人数（个）</th>
            <td>${e.first_stuff_count }</td>
            <td>${e.second_stuff_count }</td>
            <td>${e.third_stuff_count }</td>
        </tr>
        <tr>
            <th class="td_right">员工薪酬总额（万元）</th>
            <td>${e.first_salary_count }</td>
            <td>${e.second_salary_count }</td>
            <td>${e.third_salary_count }</td>
        </tr>
        <tr>
            <th class="td_right">固定资产折旧总额（万元）</th>
            <td>${e.first_depreciation_count }</td>
            <td>${e.second_depreciation_count }</td>
            <td>${e.third_depreciation_count }</td>
        </tr>
         <tr>
            <th class="td_right">三证合一</th>
            <td colspan="3">
                <s:iterator value="#request.list" status="index">
                	<a href="${picurl }" target="_blank">
                		<img style="max-width: 70px;max-height: 70px;" src="/image/pdf.jpg">
                	</a>
                </s:iterator>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                    <a href='javascript :;' onClick='javascript :history.back(-1);' class="btn">
                        <i class="icon-arrow-left icon-black"></i>返回
                    </a>
            </td>
        </tr>
   </table>
</body>
</html>