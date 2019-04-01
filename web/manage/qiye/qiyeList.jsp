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
    </style>
</head>

<body>
<s:form action="qiye!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>


            <td style="text-align: right;">企业名称</td>
            <td style="text-align: left;">
                <s:textfield name="qiye.qiyemingcheng" id="qiyemingcheng" readonly="false"/>
            </td>


            <td style="text-align: right;">组织机构代码（统一社会信用代码</td>
            <td style="text-align: left;">
                <s:textfield name="qiye.zzjgdm" id="zzjgdm" readonly="false"/>
            </td>
            <td style="text-align: right;">客户经理</td>
            <td style="text-align: left;">
                <s:textfield name="qiye.custmanage" readonly="false"/>
            </td>


        </tr>

        <!--按钮-->

        <tr>
            <td colspan="11">
                <%if (PrivilegeUtil.check(request.getSession(), "qiye!selectList.action")) {%>

                <button method="qiye!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "qiye!insert.action")) {%>
                <s:a method="toAdd" cssClass="btn btn-success">
                    <i class="icon-plus-sign icon-white"></i> 添加
                </s:a>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "qiye!deletes.action")) {%>
                <s:submit method="deletes" onclick="return deleteSelect()" value="删除" cssClass="btn btn-danger"/>
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
            <th>企业名称</th>
            <th>组织机构代码</th>
            <th>成立日期</th>
            <th>办公地址</th>
            <th>注册资本(万元)</th>
            <th>法人代表姓名</th>
            <th>等级</th>
            <th>录入人</th>
            <th>客户经理</th>
            <th>数据来源</th>
            <th>录入时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="PK_QIYEID"/>"/></td>
                <td style="display: none;">&nbsp;<s:property value="PK_QIYEID"/></td>
                <td>&nbsp;${QIYEMINGCHENG }</td>
                <td>&nbsp;${ZZJGDM }</td>
                <td>&nbsp;${CHENGLIRIQI }</td>
                <td>&nbsp;${DIZHI }</td>
                <td>&nbsp;${ZHUCEZIBEN }</td>
                <td>&nbsp;${FAREN }</td>
                <td>&nbsp;${PINGJI }</td>
                <td>&nbsp;${INPUTUSER }</td>
                <td>&nbsp;<s:property value="custmanage"/></td>
                <td>&nbsp;<s:property value="custmanagesource"/></td>
                <td>&nbsp;<s:date name="LURUSHIJIAN" format="yyyy-MM-dd"/></td>
                <td>
                    <s:a href="qiye!toEdit.action?e.pk_qiyeid=%{PK_QIYEID}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
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
</body>
</html>
