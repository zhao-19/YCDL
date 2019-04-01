<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page import="com.winpow.services.common.TreeNode" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <style type="text/css">
		.table td{vertical-align: middle;}
		input[type='text']{margin-bottom: 0px;}
		.pageLink{padding-top: 2px !important;}
		.selectPageLink{padding-top: 3px !important;}
    </style>
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
</head>
<body>
<s:form action="tbsbcommon!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
            <td style="text-align: right;">用户名</td>
            <td style="text-align: left;">
                <s:textfield name="tbsbcommon.userid" id="userid" readonly="false"/>
            </td>
            <td style="text-align: right;">企业名称</td>
            <td style="text-align: left;"><!-- 用toptype_name代替企业名称 -->
                <s:textfield name="tbsbcommon.toptype_name" id="toptype_name" readonly="false"/>
            </td>
            <td style="text-align: right;">政策名称</td>
            <td style="text-align: left;">
                <s:textfield name="tbsbcommon.policy_name" id="policy_name" readonly="false"/>
            </td>
            <td style="text-align: right;">审核状态</td>
            <td style="text-align: left;">
            	<s:select list="%{#application.dic.zqsqzt.childs}" listKey="id"
                          listValue="name" name="tbsbcommon.status" label="状态"
                          headerKey="" headerValue="" />
            </td>
        </tr>
        <!--按钮-->
        <tr>
            <td colspan="11">
                <button method="tbsbcommon!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
				<a href="tbsbcommon!exportExcel.action" class="btn btn-success"><i class="icon-white  icon-download-alt"></i>导出</a>
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
            <!-- <th width="20"><input type="checkbox" id="firstCheckbox"/></th> -->
            <th>企业名称</th>
           	<th>数据时点</th>
           	<th>用户名</th>
           	<th>政策名称</th>
            <!-- <th>大类</th> -->
            <th>小类</th>
            <th>状态</th>
            <th>资料是否完整</th>
            <th>修改时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <tbody id="tbcommonbody">
        <s:iterator value="pager.list" var="alist">
            <tr>
                <%-- <td><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td> --%>
				<td>&nbsp;${name }</td>
				<td>&nbsp;${pichi }</td>
                <td>&nbsp;${userid }</td>
                <td>&nbsp;${policy_name }</td>
                <%-- <td>&nbsp;${toptype_name }</td> --%>
                <td>&nbsp;${type_name }</td>
                <td>&nbsp;<% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("status")); if( o != null){out.print(o.getName());}%></td>
                <td>&nbsp;<% o = SystemManager.treeNodeMap.get(request.getAttribute("zlsfwz")); if( o != null){out.print(o.getName());}%></td>
                <td>&nbsp;${fn:substring(lastchgtime, 0, 10)}</td>
                <td nowrap="nowrap">
                    <s:a href="tbsbcommon!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-check"></i>审核</s:a>
<a href="javascript:showReviews('${alist.id}','${alist.policy_id}')" class="btn btn-mini btn-success">查看审核记录</a>
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
	if ('${flag}' != "") {
		alert('${flag}');
	}
	$("#tbcommonbody tr").each(function(){
        var text = $(this).find("td:eq(7)").text();
        if (text.length == 11 && text.replace("-", "").substr(0, 7) < 201803) {
            $(this).css("color","lightgray");
        }
    });
</script>
</body>
</html>
