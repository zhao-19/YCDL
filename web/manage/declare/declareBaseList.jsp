<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
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

        select {
            margin-bottom: 0px;
            height: auto;
        }
    </style>
</head>

<body>
<%--art弹出框js--%>
<script type="text/javascript" src="/js/artDialog/art_dialog.js"></script>
<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>

<s:form action="declare_base!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>

            <td style="text-align: right;">联系人</td>
            <td style="text-align: left;">
                <s:textfield name="e.lxr" readonly="false"/>
                    <%--<s:select list="%{#application.dic.zqsqzt.childs}" listKey="id"  --%>
                    <%--listValue="name" name="e.stat" label="状态"  --%>
                    <%--headerKey="" headerValue="" />  --%>
            </td>
            <td style="text-align: right;">联系人手机</td>
            <td style="text-align: left;">
                <s:textfield name="e.lxrsj" readonly="false"/>
            </td>
            <td style="text-align: right;">企业名称</td>
            <td style="text-align: left;">
                <s:textfield name="e.qiyemingcheng" readonly="false"/>
            </td>
            <td style="text-align: right;">用户号</td>
            <td style="text-align: left;">
                <s:textfield name="e.userid" readonly="false"/>
            </td>
        </tr>

        <!--按钮-->

        <tr>
            <td colspan="11">
                <%if(PrivilegeUtil.check(request.getSession(), "declare_base!selectList.action")){%>
                <button method="declare_base!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <% } %>
                <%--<%if(PrivilegeUtil.check(request.getSession(), "declare_base!insert.action")){%>--%>
                <%--<s:a method="toAdd" cssClass="btn btn-success">--%>
                    <%--<i class="icon-plus-sign icon-white"></i> 添加--%>
                <%--</s:a>--%>
                <%--<%} %>--%>
                <a onclick="export4batch()" class="btn btn-success"><i class=" icon-white  icon-download-alt"></i>生成所有异常资料</a>
                <%--<%if(PrivilegeUtil.check(request.getSession(), "declare_base!deletes.action")){%>--%>
                <%--<a onclick="deletes()" class="btn btn-danger">
                <i class="icon-white icon-remove-sign"></i> 删除</a>--%>
                <%--<%} %>--%>
                <%if(PrivilegeUtil.check(request.getSession(), "declare_base!clear.action")){%>
                <s:a method="clear" cssClass="btn btn-danger">
                   <i class="icon-white icon-minus-sign"></i> 清空
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
            <th>批次</th>
            <th>企业名称</th>
            <th>用户号</th>

            <th>录入时间</th>
            <th>联系人</th>
            <th>三证合一代码</th>
			<th>是否完整</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="${id }"/></td>
                <td style="display: none;">&nbsp;${id }</td>
                <td>&nbsp;${pichi }</td>
                <td>&nbsp;${qiyemingcheng }</td>
                <td>&nbsp;${userid }</td>
                <td>&nbsp;<s:date name="lurushijian" format="yyyy-MM-dd  HH:mm:ss"/></td>
                <td>&nbsp;${lxr }</td>
                <td>&nbsp;${zzjgdm }</td>
                <td>&nbsp;<s:if test="iscomplete==10001">已完善</s:if><s:else>未完善</s:else></td>
                <td>
                    <s:a href="declare_base!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
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
                $.post("/manage/declare_base!delete.action", ids.serialize(), function (data) {

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
    };
    
      function export4batch() {

        msg.confirm("是否要执行此操作？", function () {

           
            $.post("/manage/declare_base!exportWord4Batch.action", '', function (data) {

                if (data == '0') {
                    msg.info("生成成功");
                } else { 
                    msg.info(data);
                }
                setTimeout('location.reload()', 1000);
            }, 'json')
             
        })
    };
    
</script>
</body>
</html>
