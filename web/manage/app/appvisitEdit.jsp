<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
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
        label{display: inline;}
    </style>
</head>
<body>
    <table class="table table-bordered first">
        <tr>
            <td colspan="4" class="table_title">外出拜访企业登记表
            </td>
        </tr>
        <tr>
            <td class="td_right">外出日期</td>
            <td style="text-align: left;">${fn:substring(visitqiye.visitdate, 0, 19)}</td>
            <td class="td_right">姓名</td>
            <td style="text-align: left;">${visitqiye.username }</td>
        </tr>
        <tr>
            <td class="td_right">拜访企业名称</td>
            <td style="text-align: left;">${visitqiye.qiyename }</td>
            <td class="td_right">企业地址</td>
            <td style="text-align: left;">${visitqiye.address }</td>
        </tr>
        <tr>
            <td class="td_right">主营业务</td>
            <td style="text-align: left;">${visitqiye.mainbusiness }</td>
            <td class="td_right">收入</td>
            <td style="text-align: left;">${visitqiye.income }</td>
        </tr>
        <tr>
            <td class="td_right">净利润(万元)</td>
            <td style="text-align: left;">${visitqiye.netprofit }</td>
            <td class="td_right">员工规模</td>
            <td style="text-align: left;">${visitqiye.staffsize }</td>
        </tr>
        <tr>
            <td class="td_right">融资需求</td>
            <td style="text-align: left;"><% out.print(AppUtil.getCodeName(request.getAttribute("visitqiye.findemand")));%></td>
            <td class="td_right">APP服务需求</td>
            <td style="text-align: left;width: 42%;">
            	<s:checkboxlist theme="simple" name="visitqiye.servedemands" list="%{#application.dic.servedemand.childs}"
            		id="rid" value="%{#request.servedemands}" listKey="id" listValue="name" disabled="true"></s:checkboxlist>
            </td>
        </tr>
        <tr>
            <td class="td_right">企业联系人</td>
            <td style="text-align: left;">${visitqiye.linkman }</td>
            <td class="td_right">联系电话</td>
            <td style="text-align: left;">${visitqiye.linktel }</td>
        </tr>
        <tr>
            <td class="td_right">上传照片</td>
            <td style="text-align: left;" colspan="3" id="imgback">
                <!--${visitqiye.pictures}-->
            </td>
        </tr>
        <tr>
            <td class="td_right">备注</td>
            <td style="text-align: left;" colspan="3">${visitqiye.remark }</td>
        </tr>
        <tr>
            <td class="td_right">录入人</td>
            <td style="text-align: left;">${visitqiye.inputuser}</td>
            <td class="td_right"></td>
            <td style="text-align: left;"></td>
        </tr>
        <tr>
            <td class="td_right">创建时间</td>
            <td style="text-align: left;">${fn:substring(visitqiye.lurushijian, 0, 19)}</td>
            <td class="td_right">修改时间</td>
            <td style="text-align: left;">${fn:substring(visitqiye.lastchgtime, 0, 19)}</td>
        </tr>
    </table>
    <script>
        var imgs='${visitqiye.pictures}';
        if(imgs!=""){
            var imgarr= imgs.split(',');
            console.log(imgarr);
            $.each(imgarr,function (i,v) {
                $('#imgback').append('<img src="'+v+'" class="smallpic">')
            });
        }
    </script>
</body>
</html>