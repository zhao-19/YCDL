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

<link rel="stylesheet" href="/resource/css/base.css"  type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sbapp/adminDataCheck.js"></script>

<%--art弹出框js--%>
<script type="text/javascript" src="/js/artDialog/art_dialog.js"></script>
<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>
<style type="text/css">
.table td {
    vertical-align: middle;
}

input[type='text'] {
    margin-bottom: 0px;
}

.pageLink {
    padding-top: 2px !important;
}

.selectPageLink {
    padding-top: 3px !important;
}

#ldksq {
    display: none;
    width: 100%;
    height: 100%;
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    right: 0;
    margin: auto;
    z-index: 9999 !important;
    background: url("../img/lobg_03.png") repeat;
}

#ldksq_c {
    background-color: #fff;
    width: 95%;
    min-height: 410px;
    /*position: absolute;top:0;left:0;right:0;bottom: 0;*/
    margin: auto;
    border-radius: 5px;
    behavior: url(PIE.htc);
    padding: 10px;
}

#ldksq_c p {
    text-align: center;
}

#ldksq_c .qx {
    background: url("../img/delete.png") no-repeat;
}

#ldksq_c form {
    margin: 0;
    padding-top: 10px;;
}

#ldksq_c input.title, textarea.duanxin {
    width: 240px;;
}
.pbczdbaseTitle{font-size:20px;text-align:left!important;}
.pbczdbaseTable{height:320px;width:100%;overflow:auto;}
</style>
<s:form action="declare_zzgb!selectList.action" namespace="/" method="post" theme="simple" id="form" lang="isBank">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>

            <td style="text-align: right;">用户号</td>
            <td style="text-align: left;">
                <s:textfield name="e.userid" id="userid" readonly="false"/>
            </td>

            <td style="text-align: right;">审核状态</td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.zqsqzt.childs}" listKey="id"
                          listValue="name" name="e.status" label="状态"
                          headerKey="" headerValue="" />
            </td>

            <td style="text-align: right;">企业名称</td>
            <td style="text-align: left;">
                <s:textfield name="e.qiyemingcheng" readonly="false"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">申报时间</td>
            <td style="text-align: left;" colspan="5">
                <s:textfield name="e.startTime" cssStyle="width: 80px" id="startTime" readonly="false"/>-
                <s:textfield name="e.endTime" cssStyle="width: 80px" id="endTime" readonly="false"/>
            </td>
        </tr>

        <!--按钮-->

        <tr>
            <td colspan="11">
                <%if (PrivilegeUtil.check(request.getSession(), "declare_zzgb!selectList.action")) {%>

                <button method="declare_zzgb!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <%} %>
                <%--<%if (PrivilegeUtil.check(request.getSession(), "declare_zzgb!insert.action")) {%>--%>
                <%--<s:a method="toAdd" cssClass="btn btn-success">--%>
                    <%--<i class="icon-plus-sign icon-white"></i> 添加--%>
                <%--</s:a>--%>
                <%--<%} %>--%>
                <a href="manage/declare_base!exportExcel.action?type=zzgbbt" class="btn btn-success">
                    <i class="icon-white  icon-download-alt"></i>导出
                </a>
                <%if (PrivilegeUtil.check(request.getSession(), "declare_zzgb!delete.action")) {%>
                <a onclick="deletes()" class="btn btn-danger"><i class="icon-white icon-remove-sign"></i>删除</a>
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
            <th>用户号</th>
            <th>企业申请金额</th>
            <th>系统计算金额/建议支持金额</th>
            <th>企业名称</th>
            <th>申报时间</th>
            <th>资料是否完整</th>
            <th>审核状态</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <tbody id="zzgbtbody">
        <s:iterator value="pager.list" var="alist">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
                <td style="display: none;">&nbsp;<s:property value="id"/></td>

                <td>&nbsp;<s:property value="userid"/></td>
                <td>&nbsp;<s:property value="qysqje"/> 万元</td>
                <td>&nbsp;<s:property value="xtjsje"/> 万元</td>
                <td>&nbsp;<s:property value="qiyemingcheng"/></td>
                <td>&nbsp;<s:date name="lurushijian" format="yyyy-MM-dd"/></td>
                <td>&nbsp;<% TreeNode o1 = SystemManager.treeNodeMap.get(request.getAttribute("zlsfwz")); if( o1 != null){
                    out.print(o1.getName());}%></td>
                <td>&nbsp;<% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("status")); if( o != null){
                    out.print(o.getName());}%></td>

                <td>
                    <s:if test="username.equals(\"admin\")">

                    </s:if>
                    <s:a href="declare_zzgb!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-check"></i>审核</s:a>
                    <a href="javascript:showReviews('${alist.id}','6d00b081869f48bf9824124110b4258a')" class="btn btn-mini btn-success">查看审核记录</a>
                </td>
            </tr>
        </s:iterator>
		</tbody>
        <tr>
            <td colspan="16" style="text-align:center;">
                <%@ include file="/manage/system/pager.jsp" %>
            </td>
        </tr>
    </table>
</s:form>
<div id="ldksq">
        <div id="ldksq_c">
            <form action="" namespace="/" method="post" theme="simple">
                <!--列表部分-->
                <div class="pbczdbaseTable">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr style="background-color: #dff0d8">
                                <th>时间</th>
                                <th>动作</th>
                                <th>处理人</th>
                                <th>意见</th>
                            </tr>
                        </thead>
                        <tbody id="dataBody">

                        </tbody>
                    </table>
                </div>
                <p>
                    <button id="ldksq_lose2" type="reset" class="btn btn-inverse"
                        style="margin-left: 20px;">
                        <i class="icon-ok icon-white qx"></i>关闭
                    </button>
                </p>
            </form>
        </div>
    </div>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/laydate/laydate.js"></script>
<script type="text/javascript">
function showReviews(id,policyid) {
    $.post("allPolicyApply!getReviewLog.action", {
        "id" : id,
        "policyid" : policyid
    }, function(data) {
        var dataObj = eval("(" + data + ")");
        var htmlStr = "";
        $.each(dataObj, function(k, v) {
            htmlStr += '<tr>' + '<th>' + v.inputtime + '</th>' + '<th>'
                    + checkUndefined(v.result) + '</th>' + '<th>' + v.inputuser
                    + '</th>' + '<th>' + v.review_opinion + '</th></tr>'
        });
        $("#dataBody").html(htmlStr);
    });

    $("#ldksq").show();
    var divName = $("#ldksq_c");
    var top = ($(window).height() - $(divName).height()) / 2;
    var left = ($(window).width() - $(divName).width()) / 2;
    var scrollTop = $(document).scrollTop();
    var scrollLeft = $(document).scrollLeft();
    $(divName).css({
        position : 'absolute',
        'top' : top,
        left : left + scrollLeft
    }).show();
}
$("#ldksq_lose2").click(function(){
    $("#ldksq").hide();
});
function checkUndefined(a){
    var b = typeof(a) == "undefined" ? "" : a;
    return b;
}
    var start = {
        elem: '#startTime',
        format: 'YYYY/MM/DD',
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas;
        }
    };
    var end = {
        elem: '#endTime',
        format: 'YYYY/MM/DD',
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas;
        }
    };
    //时间插件初始化
    laydate(start);
    laydate(end);

    function deletes() {

        msg.confirm("是否要执行此操作？", function () {
            var ids = $('input:checkbox[name=ids]:checked');
            var checkLength = ids.length;

            if (checkLength <= 0) {
                msg.info("被勾选的条数不能等于0！");
            } else {
                $.post("/manage/declare_zzgb!delete.action", ids.serialize(), function (data) {

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
    
    $("#zzgbtbody tr").each(function(){
		var text = $(this).find("td:eq(6)").text();
		if (text.length == 11 && text.replace("-", "").substr(0, 7) < ${zcsbpichi}) {
			$(this).css("color","lightgray");
		}
	});
</script>
</body>
</html>
