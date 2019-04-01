<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
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

<s:form action="declare_yggqjl_core" namespace="/manage" theme="simple" id="form">
    <table class="table table-bordered">

        <tr style="display:none;">
            <th>id</th>
            <td> <input type="hidden" name="e.id" value="<s:property value="e.id" />"/></td>
        </tr>

        <tr>
            <th class="td_right">用户号</th>
            <td style="text-align: left;">
                <s:textfield name="e.userid" id="userid" readonly="false" data-rule="用户号;userid;"/>
            </td>
            <th class="td_right">持股平台持有公司股本数</th>
            <td style="text-align: left;">
                <s:textfield name="e.cgptcg" id="cgptcg" readonly="false"
                             data-rule="持股平台持有公司股本数;cgptcg;"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">持股平台总股本数</th>
            <td style="text-align: left;">
                <s:textfield name="e.cgptzgbs" id="cgptzgbs" readonly="false"
                             data-rule="持股平台总股本数;cgptzgbs;"/>
            </td>
            <th class="td_right">持股平台总股本中普通员工总股本</th>
            <td style="text-align: left;">
                <s:textfield name="e.cgptptgbs" id="cgptptgbs" readonly="false"
                             data-rule="持股平台总股本中普通员工总股本:required;cgptptgbs;"/>
            </td>
        </tr>
        
        <tr>
            <th class="td_right">持股平台名称</th>
            <td style="text-align: left;">
                <s:textfield name="e.cgptname" id="cgptname" readonly="false"
                             data-rule="持股平台名称;cgptname;"/>
            </td>
            <th class="td_right"></th>
            <td style="text-align: left;"></td>
        </tr>

        <tr>
            <td colspan="4" style="text-align: center;">
                <s:if test="e.id=='' or e.id==null">
                    <button method="declare_yggqjl_core!insert.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 新增
                    </button>
                </s:if>
                <s:else>
                    <a onclick="update()" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 保存
                    </a>
                </s:else>
            </td>
        </tr>
    </table>
</s:form>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/laydate/laydate.js"></script>
<%--art弹出框js--%>
<script type="text/javascript" src="/js/artDialog/art_dialog.js"></script>
<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>
<script type="text/javascript">
    $(function ($) {
        //点击其他地方关闭弹出层
        parent.$('.layui-layer-shade').click(function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        })
    });

    function update() {

        $.post('declare_yggqjl_core!updateCore.action', $('#form').serialize(), function (data) {

            if (data.msg == 'success') {
                msg.info("保存成功！");
                setTimeout('close()', 50);
            } else {
                msg.info("保存失败，请稍后重试！");
            }

        }, 'json')
    }

    function close() {
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
    }
</script>
</body>
</html>
