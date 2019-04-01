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
<s:form action="appGoods!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
            <td style="text-align: right;">用户名</td>
            <td style="text-align: left;" >
                <s:textfield name="e.userid" id="userid" readonly="false"/>
            </td>
             <td style="text-align: right;">内容</td>
            <td style="text-align: left;" >
                <s:textfield name="e.content" id="content" readonly="false"/>
            </td>
             <td style="text-align: right;">状态</td>
            <td style="text-align: left;" >
                <s:select list="permissionList"  name="e.monitor" label="类型" listKey="id" listValue="name"
                          headerKey="" headerValue="" />
                          </td>
              <td style="text-align: right;">类型</td>
            <td style="text-align: left;" >
                <s:select list="datatypeList"  name="e.genre" label="类型" listKey="id" listValue="name"
                          headerKey="" headerValue="" />
                          </td>
            <td style="text-align: right;">被举报</td>
            <td style="text-align: left;" >
                <s:select list="status2list"  name="e.iscensor" label="类型" listKey="id" listValue="name"
                          headerKey="" headerValue="" />
                          </td>
            <td style="text-align: right;">专家评论</td>
            <td style="text-align: left;" >
                <s:select list="status2list"  name="e.isexpert" label="类型" listKey="id" listValue="name"
                          headerKey="" headerValue="" />
                          </td>
        </tr>
        <tr>
                <td colspan="12">
                    <button method="comments!pass.action" class="btn btn-success" onclick="return submitIDs(this,'确定通过选择的评论?');">
                        <i class="icon-white icon-ok-circle"></i> 通过
                </button> 

                <button method="comments!turnDown.action" class="btn btn-warning" onclick="return submitIDs(this,'确定驳回选择的评论?');">
                        <i class="icon-white icon-ban-circle"></i> 驳回
                </button> 

                <button method="comments!selectList.action"
                        class="btn btn-primary" onclick="selectList(this)">
                        <i class="icon-white icon-search"></i> 查询</button>
                    
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
            <th width="20"><input type="checkbox" id="firstCheckbox"/></th>
            <th class="content">内容</th>
           	<th>用户名</th>
            <th>类型</th>
            <th>评论时间</th>
            <th>专家评论</th>
            <th>被举报</th>
            <th>状态</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="pkid"/>"/></td>
                <td class="content">${content }</td>
				<td>${userid }</td>
                <td>${genre }</td>
                <td><s:date name="create_time"
                            format="yyyy-MM-dd  HH:mm:ss" /></td>
                <td>&nbsp;${isexpert }</td>
                <td>&nbsp;${iscensor }</td>
                <td>${monitor }</td>
                <td>
                    <s:a href="comments!checkStatus.action?e.pkid=%{pkid}&monitor=11402&iscensor=10002"  class="btn btn-mini btn-success"><i class="icon-white  icon-ok-circle"></i>通过</s:a>
                    <s:a href="comments!checkStatus.action?e.pkid=%{pkid}&monitor=11403"  class="btn btn-mini btn-warning"><i class="icon-white  icon-ban-circle"></i>驳回</s:a>
                    <s:a href="comments!checkStatus.action?e.pkid=%{pkid}&monitor=11404"  class="btn btn-mini btn-danger"><i class="icon-white  icon-remove-circle"></i>删除</s:a>
                </td>
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
