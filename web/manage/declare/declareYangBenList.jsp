<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
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
</head>

<body>
<%--art弹出框js--%>
<script type="text/javascript" src="/js/artDialog/art_dialog.js"></script>
<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>

<s:form action="declare_yangben!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
            <td style="text-align: right;width: 100px;">图片类型</td>
            <td style="text-align: left;">
                <s:textfield name="e.pictypename" readonly="false"/>
            </td>
        </tr>
        <!--按钮-->
        <tr>
            <td colspan="11">
                <%if (PrivilegeUtil.check(request.getSession(), "declare_yangben!selectList.action")) {%>

                <button method="declare_yangben!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "declare_yangben!insert.action")) {%>
                <s:a method="toAdd" cssClass="btn btn-success">
                    <i class="icon-plus-sign icon-white"></i> 添加
                </s:a>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "declare_yangben!delete.action")) {%>
                <a onclick="deletes()" class="btn btn-danger"><i class="icon-remove-sign icon-white"></i> 删除</a>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "declare_yangben!clear.action")) {%>
                <s:a method="clear" cssClass="btn btn-danger"><i class="icon-minus-sign icon-white"></i> 清空
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

            <th>图片类型</th>
            <th>图片路径</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
                <td style="display: none;">&nbsp;<s:property value="id"/></td>
                <td>&nbsp;<s:property value="pictypename"/></td>
                <td>&nbsp;<s:property value="picpath"/></td>
                <td>
                    <s:if test="username.equals(\"admin\")">
                    </s:if>
                    <s:a href="declare_yangben!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
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
                $.post("/manage/declare_yangben!delete.action", ids.serialize(), function (data) {

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
