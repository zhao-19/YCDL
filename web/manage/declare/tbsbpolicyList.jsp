<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page import="com.winpow.services.common.TreeNode" %>

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
<s:form action="tbsbpolicy!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
            <td style="text-align: right;">政策名称</td>
            <td style="text-align: left;">
                <s:textfield name="tbsbpolicy.policy_name" id="policy_name" readonly="false"/>
            </td>
        </tr>
        <!--按钮-->
        <tr>
            <td colspan="11">
                <button method="tbsbpolicy!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <s:a method="toEdit.action" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
				</s:a>
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
           	<th>政策名称</th>
           	<th>大类编号</th>
           	<th>大类名称</th>
           	<th>小类编号</th>
           	<th>小类名称</th>
           	<th>开放申请</th>
            <th>申请类型</th>
            <th>创建时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list" var="alist">
            <tr>
                <td><input type="checkbox" name="ids" value="${id }"/></td>
				<td>&nbsp;${alist.policy_name }</td>
				<td>&nbsp;${alist.toptype_code }</td>
				<td>&nbsp;${alist.toptype_name }</td>
				<td>&nbsp;${alist.type_code }</td>
				<td>&nbsp;${alist.type_name }</td>
                <td>&nbsp;<s:if test="#alist.open_stat==1">是</s:if><s:else>否</s:else></td>
                <td>&nbsp;<s:if test="#alist.policy_type==1">企业</s:if>
                <s:elseif test="#alist.policy_type==2">机构</s:elseif>
                <s:elseif test="#alist.policy_type==4">全部</s:elseif>
                </td>
                <td>&nbsp;${fn:substring(alist.lurushijian, 0, 19)}</td>
                <td>
                    <s:a href="tbsbpolicy!toEdit.action?e.id=%{id}" class="btn btn-mini btn-success">详情</s:a>
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
	if ('${flag}' != "") {
		alert('${flag}');
	}
</script>
</body>
</html>
