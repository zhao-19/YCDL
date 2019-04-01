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
		.content{min-width: 200px !important;max-width: 400px !important;word-wrap: break-word;}
    </style>
</head>
<body>
<s:form action="pushMessage!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
            <td style="text-align: right;">接收人</td>
            <td style="text-align: left;" >
                <s:textfield name="e.acceptid" id="acceptid" readonly="false"/>
            </td>
             <td style="text-align: right;">发送人</td>
            <td style="text-align: left;" >
                <s:textfield name="e.senderid" id="senderid" readonly="false"/>
            </td>
        </tr> 
        <tr>
                <td colspan="12">
                	<button method="pushMessage!selectList.action"
                        class="btn btn-primary" onclick="selectList(this)">
                        <i class="icon-search icon-white"></i> 查询</button>
                    <s:a href="pushMessage!pushMessage.action?init=y" method="pushMessage" cssClass="btn btn-success">
                        <i class="icon-envelope icon-white"></i> 发送消息
                    </s:a>
                    <div
                        style="float: right; vertical-align: middle; bottom: 0px; top: 10px;">
                        <%@ include file="/manage/system/pager.jsp"%>
                    </div>
                </td>
            </tr>
    </table>
    <div  class="table-wrap">
    <!--列表部分-->
    <table class="table table-bordered table-hover">
        <thead>
        <tr style="background-color: #dff0d8">
            <th class="content">内容</th>
           	<th>接收人</th>
            <th>发送人</th>
            <th>是否已读</th>
            <th>类型</th>
            <th>时间</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td class="content">${content }</td>
				<td>${not empty acceptid ? acceptid:"All User"}</td>
                <td>${senderid }</td>
                <td><% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("isread")); if( o != null){out.print(o.getName());}%></td>
                <td><% TreeNode x = SystemManager.treeNodeMap.get(request.getAttribute("msggener")); if( x != null){out.print(x.getName());}%></td>
                <td><s:date name="createdate" format="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
        </s:iterator>
        <tr>
            <td colspan="16" style="text-align:center;">
                <%@ include file="/manage/system/pager.jsp" %>
            </td>
        </tr>
    </table>
    </div>
</s:form>
<script type="text/javascript">
	if ('${flag}' != "") {
		alert('${flag}');
	}
</script>
</body>
</html>
