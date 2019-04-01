<%@ page import="com.winpow.core.ManageContainer" %>
<%@ page import="com.winpow.core.system.bean.User" %>
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
    <script>
        KindEditor.ready(function (K) {
            var editor = K.create('textarea[name="e.content"]', {
                allowFileManager: true
            });
            K('input[name=getHtml]').click(function (e) {
                alert(editor.html());
            });
            K('input[name=isEmpty]').click(function (e) {
                alert(editor.isEmpty());
            });
            K('input[name=getText]').click(function (e) {
                alert(editor.text());
            });
            K('input[name=selectedHtml]').click(function (e) {
                alert(editor.selectedHtml());
            });
            K('input[name=setHtml]').click(function (e) {
                editor.html('<h3>Hello KindEditor</h3>');
            });
            K('input[name=setText]').click(function (e) {
                editor.text('<h3>Hello KindEditor</h3>');
            });
            K('input[name=insertHtml]').click(function (e) {
                editor.insertHtml('<strong>插入HTML</strong>');
            });
            K('input[name=appendHtml]').click(function (e) {
                editor.appendHtml('<strong>添加HTML</strong>');
            });
            K('input[name=clear]').click(function (e) {
                editor.html('');
            });
        });

        function changetuijian() {
            var _type = $("#shifoutuijian").val();
            if (_type == 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa005') { //否 就只读
                $("#tuijianpic").attr("disabled", "disabled");
                $("#tuijianpic").removeAttr("required");
                $("#tuijianpic").val('');
            } else {
                $("#tuijianpic").removeAttr("disabled");
                $("#tuijianpic").attr("required", "required");
            }
        }
    </script>
</head>
<body>
<s:form action="product" namespace="/manage" theme="simple" id="form" name="form" method="post">
    <table class="table table-bordered">
        <tr style="display:none;">
            <th>id</th>
            <td colspan="3"><s:hidden name="e.id"/></td>
        </tr>
        <tr>
            <th class="td_right" style="text-align: center;vertical-align: middle;">项目名称</th>
            <td style="text-align: left;">
                <select name="e.name">
                    <option value=""></option>
                    <option value="天使投资基金" <s:if test="%{e.name == '天使投资基金'}">selected</s:if>>天使投资基金</option>
                    <option value="创业投资基金" <s:if test="%{e.name == '创业投资基金'}">selected</s:if>>创业投资基金</option>
                    <option value="私募投资基金" <s:if test="%{e.name == '私募投资基金'}">selected</s:if>>私募投资基金</option>
                    <option value="产业投资基金" <s:if test="%{e.name == '产业投资基金'}">selected</s:if>>产业投资基金</option>
                </select>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;vertical-align: middle;font-weight:bold;">内容</td>
            <td style="text-align: left;">
                <s:textarea name="e.content" style="width:100%;height:400px;visibility:hidden;" id="contents"
                            data-rule="内容:required;contents;"></s:textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <s:if test="e.id=='' or e.id==null">
                    <input type="hidden" name="e.inputUser"
                           value="<%=((User)request.getSession().getAttribute(ManageContainer.manage_session_user_info)).getUsername() %>">
                    <button method="guquan_financing!insert.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 新增
                    </button>
                </s:if>
                <s:else>
                    <button method="guquan_financing!update.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 保存
                    </button>
                </s:else>
                <s:a action="guquan_financing!selectList.action?init=y" cssClass="btn btn-warning">
                    <i class="icon-arrow-down icon-white"></i> 返回</s:a>
            </td>
        </tr>
    </table>
</s:form>
</body>
</html>
