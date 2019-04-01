<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>

<body>
<s:form action="tbotherorg!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
            <td style="text-align: right;">机构名称</td>
            <td style="text-align: left;">
                <s:textfield name="tbotherorg.org_name" id="org_name" readonly="false"/>
            </td>
            <td style="text-align: right;">组织机构代码（统一社会信用代码）</td>
            <td style="text-align: left;">
                <s:textfield name="tbotherorg.org_credit_id" id="org_credit_id" readonly="false"/>
            </td>
            <td style="text-align: right;">客户经理</td>
            <td style="text-align: left;">
                <s:textfield name="tbotherorg.custmanage" readonly="false"/>
            </td>
        </tr>
        <!--按钮-->
        <tr>
            <td colspan="11">
                <%if (PrivilegeUtil.check(request.getSession(), "tbotherorg!selectList.action")) {%>
                <button method="tbotherorg!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "tbotherorg!insert.action")) {%>
                <s:a method="toAdd" cssClass="btn btn-success">
                    <i class="icon-plus-sign icon-white"></i> 添加
                </s:a>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "tbotherorg!deletes.action")) {%>
                <button method="tbotherorg!deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
						<i class="icon-remove-sign icon-white"></i> 删除
				</button>
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
            <th>机构名称</th>
            <th>机构类型</th>
            <th>注册资本(万元)</th>
            <th>组织机构代码</th>
            <th>联系人</th>
            <th>联系人职位</th>
            <th>录入人</th>
            <th>客户经理</th>
            <th>录入时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
                <td style="display: none;">&nbsp;<s:property value="id"/></td>

                <td>&nbsp;<s:property value="org_name"/></td>
                <td>&nbsp;
					<%-- <s:if test="org_type==1">公司内部</s:if>
					<s:elseif test="org_type==2">银行</s:elseif>
					<s:elseif test="org_type==3">媒体</s:elseif>
					<s:elseif test="org_type==4">政府部门</s:elseif>
					<s:elseif test="org_type==10">担保公司</s:elseif>
					<s:elseif test="org_type==11">专家</s:elseif>
					<s:elseif test="org_type==12">保险公司</s:elseif>
					<s:elseif test="org_type==13">评级公司</s:elseif>
					<s:elseif test="org_type==14">其他</s:elseif> --%>
					<% TreeNode m = SystemManager.treeNodeMap.get(request.getAttribute("org_type")); if( m != null){out.print(m.getName());}%>                 
                </td>
                <td>&nbsp;<s:property value="regist_amt"/></td>
                <td>&nbsp;<s:property value="org_credit_id"/></td>
                <td>&nbsp;<s:property value="org_linkman"/></td>
                <td>&nbsp;<s:property value="org_linkduty"/></td>
                <td>&nbsp;<s:property value="inputuser"/></td>
                <td>&nbsp;<s:property value="custmanage"/></td>
                <td>&nbsp;<s:date name="inputtime" format="yyyy-MM-dd"/></td>
                <td>
                    <s:a href="tbotherorg!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
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
<script type="text/javascript">
	function deletes() {
		msg.confirm("是否要执行此操作？", function() {
			var ids = $('input:checkbox[name=ids]:checked');
			var checkLength = ids.length;
			if (checkLength <= 0) {
				msg.info("被勾选的条数不能等于0！");
			} else {
				$("#deleteA").attr("href","/manage/tbotherorg!deletes.action?ids="+ids.serialize()).click(); 
			}
		})
	}
</script>
</body>
</html>
