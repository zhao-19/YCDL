<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <style type="text/css">
        .table TD{vertical-align: middle;}
		INPUT[type='text']{margin-bottom: 0px;}
		.pageLink{padding-top: 2px !important;}
		.selectPageLink{padding-top: 3px !important;}
    </style>
</head>

<body>
<s:form action="person!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <tr>
        	<td style="text-align: right;">用户名</td>
            <td style="text-align: left;">
                <s:textfield name="person.userid" id="userid" readonly="false"/>
            </td>
            <td style="text-align: right;">姓名</td>
            <td style="text-align: left;">
                <s:textfield name="person.username" id="username" readonly="false"/>
            </td>
            <td style="text-align: right;">是否认证</td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.whether.childs}" listKey="id" headerKey="" headerValue=""
                    listValue="name" name="person.approve" id="approve"/>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <%if (PrivilegeUtil.check(request.getSession(), "person!selectList.action")) {%>

                <button method="person!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "person!insert.action")) {%>
                <s:a method="toAdd" cssClass="btn btn-success">
                    <i class="icon-plus-sign icon-white"></i> 添加
                </s:a>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "person!deletes.action")) {%>
                <button method="person!deletesByIds.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
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
            <th>用户名</th>
            <th>姓名</th>
            <th>学历</th>
            <th>类型</th>
            <th>机构名称</th>
            <th>标签</th>
            <th>是否完整</th>
            <th>是否认证</th>
            <th>认证优先级</th>
            <th>录入时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="${id }"/></td>
                <td>&nbsp;${userid }</td>
                <td>&nbsp;${username }</td>
                <td>&nbsp;${education }</td>
                <td>&nbsp;<% out.print(AppUtil.getCodeName(request.getAttribute("persontype")));%></td>
                <td>&nbsp;${org }</td>
                <td>&nbsp;${label }</td>
                <td>&nbsp;<% out.print(AppUtil.getCodeName(request.getAttribute("iscomplete")));%></td>
                <td>&nbsp;<% out.print(AppUtil.getCodeName(request.getAttribute("approve")));%></td>
                <td>&nbsp;${priority }</td>
                <td>&nbsp;${fn:substring(lurushijian, 0, 10)}</td>
                <td><s:a href="person!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a></td>
            </tr>
        </s:iterator>
        <tr>
            <td colspan="16" style="text-align:center;">
                <%@ include file="/manage/system/pager.jsp" %>
            </td>
        </tr>
    </table>
</s:form>
</body>
</html>
