<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page import="com.winpow.services.common.TreeNode"%>
<%@page import="com.winpow.core.appUtil.AppUtil"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
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

.pbczdbaseTitle {
	font-size: 20px;
	text-align: left !important;
}

.pbczdbaseTable {
	height: 320px;
	width: 100%;
	overflow: auto;
}
</style>
</head>
<body>
	<s:form action="appAccommdate!selectList.action" namespace="/"
		method="post" theme="simple">
		<table class="table table-bordered table-condensed">
			<!--查询条件-->
			<tr>
				<td style="text-align: right;">用户编号</td>
				<td style="text-align: left;"><s:textfield
						name="apploanproduct.userid" id="inputuser" readonly="false" /></td>
				<td style="text-align: right;">类别</td>
				<td style="text-align: left;"><s:select list="type2List"
						listKey="id" listValue="name" name="apploanproduct.genre"
						label="状态" headerKey="" headerValue="" /></td>
			</tr>
			<!--按钮-->
			<tr>
				<td colspan="11">
					<button method="appAccommdate!selectList.action"
						class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>

					<div
						style="float: right; vertical-align: middle; bottom: 0px; top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
					</div>
				</td>
			</tr>
		</table>

		<!--列表部分-->
		<table class="table table-bordered table-hover">
			<thead>
				<tr style="background-color: #dff0d8">
					<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
					<th>类别</th>
					<th>申请人</th>
					<th>所属公司</th>
					<th>标题</th>
					<th>状态</th>
					<th>申请时间</th>
					<th>审核人</th>
					<th>pc端是否发布</th>
					<th nowrap="nowrap">操作</th>
				</tr>
			</thead>
			<s:iterator value="pager.list" var="alist">
				<tr>
					<td><input type="checkbox" name="ids"
						value="<s:property value="id"/>" /></td>
					<td>&nbsp;${type }</td>
					<td>&nbsp;${userid }</td>
					<td>&nbsp;${cmpname }</td>
					<td>&nbsp;${title }</td>
					<td>&nbsp;<% out.print(AppUtil.getCodeName(request.getAttribute("chstatus")));%></td>
					<td>&nbsp;${createtime }</td>
					<td>&nbsp;${reviwer_id }</td>
					<td>&nbsp;<s:if test="#alist.ispost=='10001'">是</s:if><s:else>否</s:else></td>
					<td><s:a
							href="appAccommdate!toEdit.action?e.pkid=%{pkid}&e.genre=%{genre}&e.ispost=%{ispost}"
							escapeAmp=""  class="btn btn-mini btn-success">申请详情</s:a>&nbsp;&nbsp; <a
							href="javascript:showReviews('${alist.pkid}')"  class="btn btn-mini btn-info">审核记录</a>
					</td>
				</tr>
			</s:iterator>
			<tr>
				<td colspan="16" style="text-align: center;"><%@ include
						file="/manage/system/pager.jsp"%></td>
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
            </form>
        </div>
    </div>
	<script type="text/javascript">
		if ('${flag}' != "") {
			alert('${flag}');
		}
		function showReviews(pkid) {
            //ajax异步请求查询贷款申请表审核通过数据返回到id为pbczdbaseTablec的table表里面
            //1.查询之后返回到当前
            $.post("appAccommdate!toReviewLog.action", {
                "pkid" : pkid
            }, function(data) {
                var dataObj = eval("(" + data + ")");
                var htmlStr = "";
                $.each(dataObj, function(k, v) {
                    htmlStr += '<tr>' + '<th>' + v.genre + '</th>' + '<th>'
                            + v.chno + '</th>' + '<th>' + v.reviewer_id
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
	</script>
</body>
</html>
