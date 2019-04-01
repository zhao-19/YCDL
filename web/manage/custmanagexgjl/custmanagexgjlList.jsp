<%@page import="com.winpow.core.PrivilegeUtil" %>
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
    <link rel="stylesheet" href="/js/bPage/b.page.css?${sysversion}">
	<script type="text/javascript" src="/js/bPage/b.page.js?${sysversion}"></script>
    <style type="text/css">
        .table TD{vertical-align: middle;}
		INPUT[type='text']{margin-bottom: 0px;}
		SELECT{margin-bottom: 0px !;}
		select, textarea, input[type='text'], input[type='password'], input[type='datetime'], input[type='datetime-local'], input[type='date'], input[type='month'], input[type='time'], input[type='week'], input[type='number'], input[type='email'], input[type='url'], input[type='search'], input[type='tel'], input[type='color'], .uneditable-input{margin-bottom: 0px;height: auto;}
		.pageLink{padding-top: 2px !important;}
		.selectPageLink{padding-top: 3px !important;}
		.searchshort input{width: 90px;}
		.messcontent, .tcustomer, .sendAll{border: 1px solid #ddd;padding: 15px;}
		.sendbutton{margin-top: 15px;}
		.messcontent textarea{width: 1024px;height: 80px;}
		.tcustomer label{width: 244px;margin-right: 15px;float: left;}
		.tcustomer input{width: 200px;float: left;}
		.tcustomer span{font-size: 22px;padding: 5px;background-color: #ccc;float: right;}
		.table_title {text-align: left;font-weight: bold;font-size: 16px;background-color: #dff0d8;}
    </style>
</head>

<body class="bPageBody">
<%--art弹出框js--%>
<script type="text/javascript" src="/js/artDialog/art_dialog1.js"></script>
<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>

<s:form action="custmanagexgjl!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr class="searchshort">
            <td style="text-align: right;width: 100px">企业名称</td>
            <td style="text-align: left;">
                <s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false"/>
            </td>

            <!--按钮-->
        <tr>
            <td colspan="11">
                <%if (PrivilegeUtil.check(request.getSession(), "custmanagexgjl!selectList.action")) {%>

                <button method="custmanagexgjl!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <%} %>

                <div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
                    <%@ include file="/manage/system/pager.jsp" %>
                </div>
            </td>
        </tr>
    </table>
</s:form>
<form id="qiyeIdForm">
    <!--列表部分-->
    <table class="table table-bordered table-hover">
        <thead>
        <tr style="background-color: #dff0d8">
            <th width="20"><!-- <input type="checkbox" id="firstCheckbox"/> --></th>
            <th style="display: none;">id</th>
            <th>用户名</th>
            <th>企业名称</th>
            <th>客户经理</th>
            <th>数据来源</th>
            <th>组织机构代码</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" onclick="addIdAndUserId(this)" userid="<s:property value="userid"/>" value="<s:property value="id"/>"/></td>
                <td style="display: none;"><s:property value="id"/></td>
                <td><s:property value="userid"/></td>
                <td><s:property value="qiyemingcheng"/></td>
                <td><s:property value="custmanage"/></td>
                <td><s:property value="custmanagesource"/></td>
                <td><s:property value="zzjgdm"/></td>
            </tr>
        </s:iterator>
        <tr>
            <td colspan="16" style="text-align:center;">
                <%@ include file="/manage/system/pager.jsp" %>
            </td>
        </tr>
    </table>
    <div class="sendAll">
        <table>
            <tr>
                <th class="td_right">客户经理：</th>
                <td style="text-align: left;">
                    <select name="custManage">
                        <option></option>
                        <c:forEach items="${userList}" var="datas">
                            <option value="${datas.username}">${datas.nickname}</option>
                        </c:forEach>
                    </select>
                </td>
                <th class="td_right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数据来源：</th>
                <td style="text-align: left;">
                    <select name="manageSource">
                        <option></option>
                        <option value="系统分配">系统分配</option>
                        <option value="主动营销">主动营销</option>
                    </select>
                </td>
            </tr>
        </table>
        <div class="sendbutton">
            <button id="suresend" type="button" class="btn btn-primary" onclick="changeCustManage()"><i
                    class="icon-ok icon-white"></i>修改
            </button>
        </div>
    </div>
</form>
<script type="text/javascript">

    function addIdAndUserId(obj) {
        var obj = $(obj);
        if (obj.is(':checked')) {
        	obj.parent().append('<input type="hidden" name="ids" value="'+ obj.val() +'"/>');
        } else {
            obj.next().remove();
        }
    }

    function changeCustManage() {
        var ids = $('input:checkbox:checked');
        var checkLength = ids.length;

        if (checkLength <= 0) {
            msg.info("被勾选的条数不能等于0！");
        } else {
            var fal = true;
            var custManage = $('[name=custManage]');

            if(custManage.val() == '') {
                custManage.err('客户经理不能为空！');
                fal = false;
            } else {
                custManage.closeErr();
            }

            var manageSource = $('[name=manageSource]');

            if(manageSource.val() == '') {
                manageSource.err('数据来源不能为空！');
                fal = false;
            } else{
                manageSource.closeErr();
            }

            if(fal) {
                $.post('/manage/custmanagexgjl!changeCustManage.action', $('#qiyeIdForm').serialize(), function (data) {

                    if (data.msg == 'success') {
                        msg.info('修改成功！');
                        setTimeout("location.reload()", 1000);
                    } else {
                        msg.info('修改失败，请稍后再尝试！')
                    }
                }, 'json')
            }
       }
    }
</script>


<div class="bodyBox">
	<table class="table table-bordered table-condensed table-search">
		<tr>
			<td colspan="4" class="table_title">
				客户经理修改日志
			</td>
		</tr>
		<tr class="searchshort">
			<td style="text-align: right;">用户名</td>
			<td style="text-align: left;" >
				<s:textfield id="userid" readonly="false" theme="simple"/>
			</td>
			
			<td style="text-align: right;">企业名称[%]</td>
			<td style="text-align: left;" >
				<s:textfield id="qiyename" readonly="false" theme="simple"/>
			</td>
		</tr>
		<tr>
		<td colspan="4" style="padding: 6px;">
				<button class="btn btn-primary" onclick="$('#pagebar').bPageSwitch(1);">
					<i class="icon-search icon-white"></i> 查询
				</button> 
			</td>
		</tr>
	</table>
	<table class="table table-striped table-bordered table-hover table-condensed">
		<thead>
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th>用户名</th>
				<th>企业名称</th>
				<th>原客户类型</th>
				<th>原客户来源</th>
				<th>新客户类型</th>
				<th>新客户来源</th>
				<th>修改人</th>
				<th>修改时间</th>
			</tr>
		</thead>
		<tbody id="bpagetbody"></tbody>
	</table>
	<div id="pagebar"></div>
</div>
<script type="text/javascript">
$('#pagebar').bPage({
    url : '/manage/custmanagexgjl!custmanagelogListListData.action',
    asyncLoad : true,
    params : function() {
        return {
        	"custmanagelog.userid" : $("#userid").val(),
        	"custmanagelog.qiyename" : $("#qiyename").val()
        };
    },
    render : function(data) {
		var khlx =  $.parseJSON('${application.diccode.khlx}');
    	var html = new Array();
    	for (var i = 0; i < data.list.length; i ++ ) {
    		var row = data.list[i];
    		html.push("<tr>");
    		html.push("<td><input type='checkbox' name='ids' value='" + row.pkid + "'/></td>");
    		html.push("<td>" + udf(row.userid) + "</td>");
    		html.push("<td>" + udf(row.qiyename) + "</td>");
    		html.push("<td>" + udf(row.oldcustmanage) + "</td>");
    		html.push("<td>" + udf(row.oldcustmanagesource) + "</td>");
    		html.push("<td>" + udf(row.newcustmanage) + "</td>");
    		html.push("<td>" + udf(row.newcustmanagesource) + "</td>");
    		html.push("<td>" + udf(row.inputuser) + "</td>");
    		html.push("<td>" + timeformat(row.inputtime) + "</td>");
    		html.push("</tr>");
    	}
    	$('#bpagetbody').html(html.join(""));
    	//window.scrollTo(0, 0);
    }
});
</script>
</body>
</html>
