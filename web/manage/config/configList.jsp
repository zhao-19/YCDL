<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>

    <%--art弹出框js--%>
    <script type="text/javascript" src="/js/artDialog/art_dialog.js"></script>
    <script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>
    <style type="text/css">
        .table TD {
            vertical-align: middle;
        }

        INPUT[type='text'] {
            margin-bottom: 0px;
        }

        .pageLink {
            padding-top: 2px !important;
        }

        .selectPageLink {
            padding-top: 3px !important;
        }
    </style>
</head>

<body>
<s:form action="config!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
            <td style="text-align: center;width:80px">关键词：</td>
            <td style="text-align: left;">
                <input type="text" name="e.configName" placeholder="关键词" value="<s:property value="e.configName"/>">
            </td>
        </tr>
        <!--按钮-->
        <tr>
            <td colspan="11">
                <%if (PrivilegeUtil.check(request.getSession(), "config!selectList.action")) {%>
                <button method="config!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "config!insert.action")) {%>
                <s:a method="toAdd" cssClass="btn btn-success">
                    <i class="icon-plus-sign icon-white"></i> 添加
                </s:a>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "config!deletes.action")) {%>
                <s:a href="javascript:void(0)" onclick="deletes();" cssClass="btn btn-danger">删除
                </s:a>
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
            <th style="display: none;">id</th>
            <th>开关key</th>
            <th>开关描述</th>
            <th>开关value</th>
            <th>最后修改时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="ID"/>"/></td>
                <td style="display: none;">&nbsp;<s:property value="ID"/></td>
                <td>&nbsp;<s:property value="CONFIGNAME"/></td>
                <td>&nbsp;<s:property value="CONFIGDETAIL"/></td>
                <td>&nbsp;<s:property value="CONFIGVALUE"/></td>
                <td>&nbsp;<s:date name="LASTCHGTIME" format="yyyy-MM-dd  HH:mm:ss"/></td>
                <td>
                    <s:a href="config!toEdit.action?e.id=%{ID}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
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

        msg.confirm("是否要执行此操作？", function () {
            var ids = $('input:checkbox[name=ids]:checked');
            var checkLength = ids.length;

            if (checkLength <= 0) {
                msg.info("被勾选的条数不能等于0！");
            } else {
                $.post("/manage/config!delete.action", ids.serialize(), function (data) {

                    if (data.msg == 'success') {
                        msg.info("删除成功");
                    } else if (data.msg == 'erro') {
                        msg.info("删除失败，请稍后重新尝试！");
                    } else {
                        msg.info("未知错误，请联系管理员吧！");
                    }
                    setTimeout('location.reload()', 1000);
                }, 'json')
            }
        })
    }
</script>
</body>
</html>
