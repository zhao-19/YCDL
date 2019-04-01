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
<s:form action="enterPark!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
             <td style="text-align: right;">企业名称</td>
            <td style="text-align: left;">
                <s:textfield name="e.cname" id="cname" readonly="false"/>
            </td>
            <td style="text-align: right;">审核状态</td>
            <td style="text-align: left;">
            	<s:select list="%{#request.status2list}" listKey="id"
                          listValue="name" name="e.chstatus" label="状态"
                          headerKey="" headerValue="" />
            </td>
        </tr>
        <!--按钮-->
        <tr>
            <td colspan="11">
                <button method="enterPark!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                
                <button method="enterPark!pass.action" class="btn btn-success" onclick="return submitIDs(this,'确定通过选择的记录?');"">
                    <i class="icon-ok-sign icon-white"></i> 通过
                </button>
                
                <button method="enterPark!turnDown.action" class="btn btn-danger" onclick="return submitIDs(this,'确定驳回选择的记录?');"">
                    <i class="icon-remove-sign icon-white"></i>驳回
                </button>
                
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
           	<th>用户id</th>
            <th>企业名称</th>
            <th>行业</th>
            <th>园区名称</th>
            <th>审核状态</th>
            <th>创建时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list" var="alist">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="pkid"/>"/></td>
				<td>&nbsp;${userid }</td>
                <td>&nbsp;${cname }</td>
                <td>&nbsp;${industry }</td>
                <td>&nbsp;${parkname }</td>
                <td>&nbsp;${chstatus }</td>
                <td>&nbsp;${createdate }</td>
                <td>
                    <s:a href="enterPark!toEdit.action?e.pkid=%{pkid}" escapeAmp="" class="btn btn-mini btn-success">申请详情</s:a>&nbsp;&nbsp;
                    <a href="javascript:showReviews('${alist.pkid}')" class="btn btn-mini btn-info">审核记录</a>
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
<div id="ldksq">
        <div id="ldksq_c">
                <!--列表部分-->
                <div class="pbczdbaseTable">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr style="background-color: #dff0d8">
                                <th>类别</th>
                                <th>编号</th>
                                <th>审核人</th>
                                <th>审核时间</th>
                                <th>审核意见</th>
                                <th>审核结果</th>
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
        </div>
    </div>
    <script type="text/javascript">
        if ('${flag}' != "") {
            alert('${flag}');
        }
        function showReviews(pkid) {
            //ajax异步请求查询贷款申请表审核通过数据返回到id为pbczdbaseTablec的table表里面
            //1.查询之后返回到当前
            $.post("enterPark!toReviewLog.action", {
                "pkid" : pkid
            }, function(data) {
                var dataObj = eval("(" + data + ")");
                var htmlStr = "";
                $.each(dataObj, function(k, v) {
                    htmlStr += '<tr>' + '<th>' + v.genre + '</th>' + '<th>'
                            + checkUndefined(v.chno) + '</th>' + '<th>' + v.reviewer_id
                            + '</th>' + '<th>' + v.review_date + '</th>'
                            + '<th>' + v.review_opinion + '</th>' + '<th>'
                            + v.result + '</th></tr>'
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
    </script>
</body>
</html>
