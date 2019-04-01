<%@ page import="com.winpow.core.ManageContainer" %>
<%@ page import="com.winpow.core.system.bean.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
    <link rel="stylesheet"
          href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css"/>
    <script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>

    <style>
        select {
            height: auto;
        }
    </style>
</head>
<body>

<s:form action="product" namespace="/manage" theme="simple" id="form" name="form" method="post">
    <table class="table table-bordered">
        <tr style="display:none;">
            <th>id</th>
            <td colspan="3"><s:hidden name="e.id"/></td>
        </tr>
        <tr>
            <th class="td_right" style="text-align: center;vertical-align: middle;">开关key</th>
            <td style="text-align: left;">
              <s:textfield name="e.configName" readonly="false"  />
            </td>
        </tr>
        <tr>
            <th class="td_right" style="text-align: center;vertical-align: middle;">开关value</th>
            <td style="text-align: left;">
                <s:textfield name="e.configValue" readonly="false" data-rule="开关value:required;configValue;"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;vertical-align: middle;font-weight:bold;">开关描述</td>
            <td style="text-align: left;">
                <s:textarea cols="80" name="e.configDetail" readonly="false" data-rule=";configDetail"
                            style="width:600px;height:100px"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <s:if test="e.id=='' or e.id==null">
                    <input type="hidden" name="e.inputUser"
                           value="<%=((User)request.getSession().getAttribute(ManageContainer.manage_session_user_info)).getUsername() %>">
                    <button method="config!insert.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 新增
                    </button>
                </s:if>
                <s:else>
                    <button method="config!update.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 保存
                    </button>
                </s:else>
                <s:a action="config!selectList.action?init=y" cssClass="btn btn-warning">
                    <i class="icon-arrow-down icon-white"></i> 返回</s:a>
            </td>
        </tr>
    </table>
</s:form>
</body>
</html>
