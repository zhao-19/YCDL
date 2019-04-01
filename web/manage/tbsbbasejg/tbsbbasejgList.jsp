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
<s:form action="tbsbbasejg!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
            <td style="text-align: right;">机构名称</td>
            <td style="text-align: left;">
                <s:textfield name="tbsbbasejg.org_name" id="org_name" readonly="false"/>
            </td>
            <td style="text-align: right;">用户号</td>
            <td style="text-align: left;">
                <s:textfield name="tbsbbasejg.userid" id="userid" readonly="false"/>
            </td>
        </tr>
        <!--按钮-->
        <tr>
            <td colspan="11">
                <button method="tbsbbasejg!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
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
           	<th>批次</th>
           	<th>机构名称</th>
            <th>批次</th>
            <th>用户号</th>
            <th>所属行业</th>
            <th>录入时间</th>
            <th>是否完整</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="${id }"/></td>
                <td>&nbsp;${pichi }</td>
				<td>&nbsp;${org_name }</td>
                <td>&nbsp;${pichi }</td>
                <td>&nbsp;${userid }</td>
                <td>&nbsp;<% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("industry_owned")); if( o != null){out.print(o.getName());}%></td>
                <td>&nbsp;${fn:substring(lurushijian, 0, 19)}</td>
                <td>&nbsp;<s:if test="iscomplete==10001">已完善</s:if><s:else>未完善</s:else></td>
                <td>
                    <s:a href="tbsbbasejg!toEdit.action?e.id=%{id}" class="btn btn-mini btn-success">详情</s:a>
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
