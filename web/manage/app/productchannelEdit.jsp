<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<head>
    <%@ include file="/resource/common_html_meat.jsp"%>
    <%@ include file="/manage/system/common.jsp"%>
    <%@ include file="/resource/common_html_validator.jsp"%>
    <style>
        .td_right {text-align: right;width: 130px;}
        select {height: auto;}
        .table_title {text-align: left;font-weight: bold;font-size: 16px;background-color: #dff0d8;}
    </style>
</head>
<body>
<s:form action="" id="form" name="form" theme="simple" method="post">
    <table class="table table-bordered">
        <tr>
            <td colspan="4" class="table_title">渠道贷款申请
                <s:hidden name="productchannel.pkid" value="%{#request.productchannel.pkid }"/>
                <s:hidden name="productchannel.serno" value="%{#request.productchannel.serno }"/>
                <s:hidden name="productchannel.channel" value="%{#request.productchannel.channel }"/>
            </td>
        </tr>
        <tr>
            <td class="td_right">产品名称</td>
            <td style="text-align: left;">${productchannel.prodname }</td>
            <td class="td_right">企业名称</td>
            <td style="text-align: left;">${productchannel.company_name }</td>
        </tr>
        <tr>
            <td class="td_right">统一社会性用代码</td>
            <td style="text-align: left;">${productchannel.org_no }</td>
            <td class="td_right">申请金额(万元)</td>
            <td style="text-align: left;">${productchannel.app_amt }</td>
        </tr>
        <tr>
            <td class="td_right">贷款用途</td>
            <td style="text-align: left;">${productchannel.loan_use }</td>
            <td class="td_right">法定代表人</td>
            <td style="text-align: left;">${productchannel.representative }</td>
        </tr>
        <tr>
            <td class="td_right">成立日期</td>
            <td style="text-align: left;">${productchannel.establishment_date }</td>
            <td class="td_right">注册资本(万元)</td>
            <td style="text-align: left;">${productchannel.capital }</td>
        </tr>
        <tr>
            <td class="td_right">工商注册地</td>
            <td style="text-align: left;">${productchannel.registry_area }</td>
            <td class="td_right">所属行业</td>
            <td style="text-align: left;">${productchannel.industry }</td>
       	</tr>
        <tr>
            <td class="td_right">专利个数</td>
            <td style="text-align: left;">${productchannel.patent }</td>
            <td class="td_right">贷款联系人</td>
            <td style="text-align: left;">${productchannel.contact_name }</td>
        </tr>
        <tr>
            <td class="td_right">联系电话</td>
            <td style="text-align: left;">${productchannel.contact_cellphone }</td>
            <td class="td_right">审批人</td>
            <td style="text-align: left;">${productchannel.approver }</td>
        </tr>
        <tr>
            <td class="td_right">状态</td>
            <td style="text-align: left;" id="statustd">
                <s:select list="%{#application.dic.wfstatus.childs}" listKey="id" listValue="name" headerKey=""
                          headerValue="" name="productchannel.status" id="status" disabled="disabled" readonly="readonly"  value="%{#request.productchannel.status }"/>
            </td>
            <td class="td_right">创建人</td>
            <td style="text-align: left;">${productchannel.inputuser }</td>
        </tr>
        <tr>
            <td class="td_right">创建时间</td>
            <td style="text-align: left;">${fn:substring(productchannel.inputtime, 0, 19)}</td>
            <td class="td_right">修改时间</td>
            <td style="text-align: left;">${fn:substring(productchannel.lastchgtime, 0, 19)}</td>
       	</tr>
	</table>
</s:form>
<script type="text/javascript">
	$("#statustd").html($("#status").find("option:selected").text());
</script>
</body>
</html>