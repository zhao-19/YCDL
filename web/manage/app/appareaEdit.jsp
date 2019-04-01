<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <%@ include file="/resource/common_html_meat.jsp"%>
    <%@ include file="/manage/system/common.jsp"%>
    <%@ include file="/resource/common_html_validator.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.qrcode.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/newlayer/layer.js"></script>
    <script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/resource/drag/dragImg.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js"></script>
    <script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/sbapp/DataCheck.js"></script>
    <style>
        .td_right {text-align: right;width: 130px;}
        select {height: auto;width: 184px;}
        .table_title {text-align: left;font-weight: bold;font-size: 16px;background-color: #dff0d8;}
        .intro {width: 100%;}
    </style>
</head>
<body>
<!--绝对定位元素放在最前-->
<div id="uploadbg">
    <div id="uploadbox"></div>
</div>
<s:form action="/manage/appCommon!saveApparea.action" id="form1" theme="simple" method="post">
    <table class="table table-bordered first">
        <tr>
            <td colspan="4" class="table_title">地区编辑<span style="color:red;font-size:12px;">（修改后需要刷新一下缓存才会生效）</span>
            </td>
        </tr>
        <tr>
            <td class="td_right">编号</td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="area.pkid" id="pkid"/>
            </td>
            <td class="td_right">地名</td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="area.name" id="name"/>
            </td>
        </tr>
        <tr>
            <td class="td_right">父编号</td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="area.parent" id="parent"/>
            </td>
            <td class="td_right">等级</td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="area.level" id="level"/>
            </td>
        </tr>
        <tr>
            <td class="td_right">是否启用</td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.whether.childs}" headerKey="" headerValue="" theme="simple"
                          listKey="id" listValue="name" id="enable" name="area.enable"/>
            </td>
            <td class="td_right">是否分站</td>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.whether.childs}" headerKey="" headerValue="" theme="simple"
                          listKey="id" listValue="name" id="subst" name="area.subst"/>
            </td>
        </tr>
        
        <tr>
            <td class="td_right">排序</td>
            <td style="text-align: left;">
                <s:textfield theme="simple" name="area.sort" id="sort"/>
            </td>
            <td class="td_right">录入人</td>
            <td style="text-align: left;">${area.inputuser }</td>
        </tr>
        <tr>
            <td class="td_right">录入时间</td>
            <td style="text-align: left;">${area.lurushijian }</td>
            <td class="td_right">修改时间</td>
            <td style="text-align: left;">${area.lastchgtime }</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                <span onclick="submit()" class="btn btn-success baocun"><i class="icon-ok icon-white"></i>保存</span>
            </td>
        </tr>
    </table>
</s:form>

<script type="text/javascript">
	function submit(){
		$("#form1").submit();
	}
</script>

</body>
</html>