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
<s:form action="tbjrbx!selectList.action" namespace="/" method="post" theme="simple">
    <!--列表部分-->
    <table class="table table-bordered table-hover">
        <thead>
        <tr style="background-color: #dff0d8">
            <th width="20"><input type="checkbox" id="firstCheckbox"/></th>
           	<th>类别</th>
            <th>编号</th>
            <th>审核人</th>
            <th>审核时间</th>
            <th>审核意见</th>
            <th>审核结果</th>
        </tr>
        </thead>
        <s:iterator value="logList">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
				<td>&nbsp;${genre }</td>
                <td>&nbsp;${chno }</td>
                <td>&nbsp;${reviewer_id }</td>
                <td>&nbsp;${review_date }</td>
                <td>&nbsp;${review_opinion }</td>
                <td>&nbsp;${result }</td>
            </tr>
        </s:iterator>
    </table>
</s:form>
</body>
</html>
