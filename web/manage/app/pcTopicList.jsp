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
<s:form action="appTopic!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
             <td style="text-align: right;">名称</td>
            <td style="text-align: left;" >
                <s:textfield name="e.title" id="title" readonly="false"/>
            </td>
        </tr>
        <tr>
                <td colspan="11">
                    <%
                        if (PrivilegeUtil.check(request.getSession(), "appTopic!selectList.action")) {
                    %>

                    <button method="appTopic!selectList.action"
                        class="btn btn-primary" onclick="selectList(this)">
                        <i class="icon-search icon-white"></i> 查询
                    </button> <%
     }
 %> <%
     if (PrivilegeUtil.check(request.getSession(), "appTopic!insert.action")) {
 %> <s:a method="toAdd" cssClass="btn btn-success">
                        <i class="icon-plus-sign icon-white"></i> 添加
                    </s:a> <%
     }
 %> <%
     if (PrivilegeUtil.check(request.getSession(), "appTopic!deletes.action")) {
 %>
                    <button method="appTopic!deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
                        <i class="icon-remove-sign icon-white"></i> 删除
                </button> <%
     }
 %> 
                    <div
                        style="float: right; vertical-align: middle; bottom: 0px; top: 10px;">
                        <%@ include file="/manage/system/pager.jsp"%>
                    </div>
                </td>
            </tr>
    </table>

    <!--列表部分-->
    <table class="table table-bordered table-hover">
        <thead>
        <tr style="background-color: #dff0d8">
            <th width="20"><input type="checkbox" id="firstCheckbox"/></th>
            <th>标题</th>
            <th>发起人</th>
            <th>发布人</th>
            <th>建立时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="pkid"/>"/></td>
                <td>&nbsp;${title }</td>
                <td>&nbsp;${userid }</td>
                <td>&nbsp;${createby }</td>
                <td>&nbsp;<s:date name="createdate"
                            format="yyyy-MM-dd  HH:mm:ss" /></td>
                <td>
                    <s:a href="appTopic!toEdit.action?e.pkid=%{pkid}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
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
