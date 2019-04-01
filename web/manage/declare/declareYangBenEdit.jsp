<%@ page import="com.winpow.services.common.TreeNode" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
    <link rel="stylesheet" href="../css/massage.css"/>
    <style>
        .td_right {
            text-align: right;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#username").focus();
        });
    </script>
</head>

<body>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/laydate/laydate.js"></script>
<script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href=/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css"/>

<s:form action="declare_yangben" namespace="/manage" theme="simple" id="form">
    <table class="table table-bordered">

        <tr style="display:none;">
            <th>id</th>
            <td> <input type="hidden" name="e.id" value="<s:property value="e.id" />"/></td>
        </tr>

        <tr>
            <th class="td_right">图片类型</th>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.tplx.childs}" listKey="id"
                          listValue="name" name="e.pictype" id="pictype" label="图片类型"
                          headerKey="" headerValue=""/>
                <input type="hidden" name="e.pictypename" id="pictypename">
            </td>


        </tr>
        <td class="td_right" colspan="1"><input type="button" id="insertfile" value="选择图片"
                                                class="btn btn-success"/></td>
        <td class="td_right" colspan="3"><input type="button" id="insertPdf" value="选择文件"
                                                class="btn btn-success"/></td>
        <tr>

        </tr>

        <tr>
            <th class="td_right">图片路径</th>
            <td style="text-align: left;" colspan="3">
                <s:textfield name="e.picpath" id="picpath" readonly="true" data-rule="图片路径:required;userid"/>
                <img src="" id="test">
            </td>
                <%--<th class="td_right">压缩后的图片路径</th>--%>
                <%--<td style="text-align: left;" >--%>
                <%--<s:textfield name="e.picpathsmall" id="picpathsmall" readonly="false" data-rule="压缩后的图片路径:required;slsj;"/>--%>
                <%--</td>--%>
        </tr>

        <tr>
            <td colspan="4" style="text-align: center;">
                <s:if test="e.id=='' or e.id==null">
                    <button method="declare_yangben!insert.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 新增
                    </button>
                </s:if>
                <s:else>
                    <button method="declare_yangben!update.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 保存
                    </button>
                </s:else>
            </td>
        </tr>
    </table>
</s:form>
<script type="text/javascript">
    $(function () {
        $('#pictype').change(function () {
            $('#pictypename').val($(this).find("option:selected").text());
        })

        KindEditor.ready(function (K) {
            var editor = K.editor({
                allowFileManager: true
            });

            K('#insertfile').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        insertfile: K('#picpath').val(),
                        clickFn: function (url, title) {
                            K('#picpath').val(url);
                            //压缩图片
//                            $.post('/manage/image!narrowImage.action', {path : url});
                            editor.hideDialog();
                        }
                    });
                });
            });
        });

        KindEditor.ready(function (K) {
            var editor = K.editor({
                allowFileManager: true
            });

            K('#insertPdf').click(function () {
                editor.loadPlugin('insertfile', function () {
                    editor.plugin.fileDialog({
                        insertfile: K('#picpath').val(),
                        clickFn: function (url, title) {
                            K('#picpath').val(url);
                            //压缩图片
//                            $.post('/manage/image!narrowImage.action', {path : url});
                            editor.hideDialog();
                        }
                    });
                });
            });
        });
    })
    ;
</script>
</body>
</html>
