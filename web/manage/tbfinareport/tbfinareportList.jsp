<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <style type="text/css">
		.table td{vertical-align: middle;}
		input[type='text']{margin-bottom: 0px;}
		.pageLink{padding-top: 2px !important;}
		.selectPageLink{padding-top: 3px !important;}
    </style>
</head>

<body>
<s:form action="tbfinareport!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
            <td style="text-align: right;">帐号</td>
            <td style="text-align: left;">
                <s:textfield name="tbfinareport.userid" id="userid" readonly="false"/>
            </td>
            <%-- <td style="text-align: right;">组织机构代码（统一社会信用代码）</td>
            <td style="text-align: left;">
                <s:textfield name="e.org_credit_id" id="org_credit_id" readonly="false"/>
            </td>
            <td style="text-align: right;">客户经理</td>
            <td style="text-align: left;">
                <s:textfield name="e.custmanage" readonly="false"/>
            </td> --%>
        </tr>
        <!--按钮-->
        <tr>
            <td colspan="11">
                <%if (PrivilegeUtil.check(request.getSession(), "tbfinareport!selectList.action")) {%>
                <button method="tbfinareport!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <%} %>
               <%--  <%if (PrivilegeUtil.check(request.getSession(), "tbfinareport!insert.action")) {%>
                <s:a method="toAdd" cssClass="btn btn-success">
                    <i class="icon-plus-sign icon-white"></i> 添加
                </s:a>
                <%} %> --%>
                <%if (PrivilegeUtil.check(request.getSession(), "tbfinareport!deletes.action")) {%>
                <button method="tbfinareport!deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
						<i class="icon-remove-sign icon-white"></i> 删除
				</button>
                <%} %>
                <div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
                    <%@ include file="/manage/system/pager.jsp" %>
                </div>
            </td>
        </tr>
    </table>

    <!--列表部分-->
    <table class="table table-bordered table-hover">
        <thead>
        <tr style="background-color: #dff0d8">
            <th width="20"><input type="checkbox" id="firstCheckbox"/></th>
           	<th>报表时间</th>
            <th>报表类型</th>
            <th>总资产</th>
            <th>营业收入</th>
            <th>存货</th>
            <th>流动资产</th>
            <th>利润总额</th>
            <th>帐号</th>
            <th>录入时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
				<td>&nbsp;${fn:substring(report_time, 0, 10)}</td>
                <td>&nbsp;
					<s:if test="report_type==1">年报</s:if>
					<s:elseif test="report_type==2">半年报</s:elseif>
					<s:elseif test="report_type==3">季报</s:elseif>
					<s:elseif test="report_type==4">月报</s:elseif>
                </td>
                <td>&nbsp;<s:property value="assets"/></td>
                <td>&nbsp;<s:property value="income"/></td>
                <td>&nbsp;<s:property value="goods_amt"/></td>
                <td>&nbsp;<s:property value="flow_assets"/></td>
                <td>&nbsp;<s:property value="total_profit"/></td>
                <td>&nbsp;<s:property value="userid"/></td>
                <td>&nbsp;${fn:substring(lurushijian, 0, 19)}</td>
                <td>
                    <s:a href="tbfinareport!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
                </td>
            </tr>
        </s:iterator>
        <tr>
            <td colspan="16" style="text-align:center;">
                <%@ include file="/manage/system/pager.jsp" %>
            </td>
        </tr>
    </table>
</s:form>
<script type="text/javascript">
	function deletes() {
		msg.confirm("是否要执行此操作？", function() {
			var ids = $('input:checkbox[name=ids]:checked');
			var checkLength = ids.length;
			if (checkLength <= 0) {
				msg.info("被勾选的条数不能等于0！");
			} else {
				$("#deleteA").attr("href","/manage/tbfinareport!deletes.action?ids="+ids.serialize()).click(); 
			}
		})
	}
</script>
</body>
</html>
