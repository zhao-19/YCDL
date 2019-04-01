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
<s:form action="declare_base_core" namespace="/manage" theme="simple" id="form">
    <table class="table table-bordered">

        <tr style="display:none;">
            <th>id</th>
            <td><s:hidden name="e.id"/></td>
        </tr>

        <tr>
            <th class="td_right">用户号</th>
            <td style="text-align: left;">
                <s:textfield name="e.userid" id="userid" readonly="true" data-rule="用户号;userid;"/>
            </td>
            <th class="td_right">机构名称</th>
            <td style="text-align: left;">
                <s:textfield name="e.jgmc" id="jgmc" readonly="false"
                             data-rule="机构名称:required;jgmc;"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">机构投资金额（万）</th>
            <td style="text-align: left;">
                <s:textfield name="e.jgtzje" id="jgtzje" readonly="false"
                             data-rule="机构投资金额:required;jgtzje;"/>
            </td>
            <th class="td_right">到账时间</th>
            <td style="text-align: left;">
                <s:textfield name="e.dzsj.substring(0,10)" id="dzsj" readonly="false"
                             data-rule="到账时间:required;dzsj;"/>
            </td>
        </tr>

        <tr>
            <td colspan="4" style="text-align: center;">
                <s:if test="e.id=='' or e.id==null">
                    <button method="declare_base_core!insert.action" class="btn btn-success">
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
        var dzsj = {
            elem: '#dzsj',
            format: 'YYYY/MM/DD hh:mm:ss',
            istime: true,
            istoday: false,
//        choose: function (datas) {
//            end.min = datas; //开始日选好后，重置结束日的最小日期
//        }
        };
        laydate(dzsj);

        //点击其他地方关闭弹出层
        parent.$('.layui-layer-shade').click(function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        })
    });

    function update() {

        $.post('manage/declare_base_core!updateCore.action', $('#form').serialize(), function (data) {

            if (data.msg == 'success') {
                msg.info("保存成功！");
                parent.$('#core<s:property value="e.id"/>').children('.jgmc').text($('#jgmc').val());
                parent.$('#core<s:property value="e.id"/>').children('.jgtzje').text($('#jgtzje').val());
                parent.$('#core<s:property value="e.id"/>').children('.dzsj').text($('#dzsj').val());
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
