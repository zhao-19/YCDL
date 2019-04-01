<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
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
<s:form action="tbneweco!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
            <td style="text-align: right;">企业名称</td>
            <td style="text-align: left;">
                <s:textfield name="tbneweco.qiyemingcheng" readonly="false"/>
            </td>
            <td style="text-align: right;">审核状态</td>
            <td style="text-align: left;">
            	<s:select list="%{#application.dic.zqsqzt.childs}" listKey="id"
                          listValue="name" name="tbneweco.status" label="状态"
                          headerKey="" headerValue="" />
            </td>
            <td style="text-align: right;">录入人</td>
            <td style="text-align: left;">
                <s:textfield name="tbneweco.inputuser" readonly="false"/>
            </td>
        </tr>
        <!--按钮-->
        <tr>
            <td colspan="11">
                <%if (PrivilegeUtil.check(request.getSession(), "tbneweco!selectList.action")) {%>
                <button method="tbneweco!selectList.action" class="btn btn-primary" onclick="selectList(this)">
                    <i class="icon-search icon-white"></i> 查询
                </button>
                <%} %>
                <%if (PrivilegeUtil.check(request.getSession(), "tbneweco!deletes.action")) {%>
                <button method="tbneweco!deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
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
           	<th>企业名称</th>
            <th>所属行业</th>
            <th>2016年研发投入（万元）</th>
            <th>企业估值（万元）</th>
            <th>是否上规入库</th>
            <th>审核状态</th>
            <th>录入人</th>
            <th>修改时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
                <td><input type="checkbox" name="ids" value="<s:property value="id"/>"/></td>
				<td>&nbsp;<s:property value="qiyemingcheng"/></td>
                <td>&nbsp;
					<% TreeNode m = SystemManager.treeNodeMap.get(request.getAttribute("hangyeid")); if( m != null){out.print(m.getName());}%>
                </td>
                <td>&nbsp;<s:property value="rdinput2016"/></td>
                <td>&nbsp;<s:property value="valuation"/></td>
                <td>&nbsp;
					<s:if test="inbase==1">是</s:if>
					<s:elseif test="inbase==0">否</s:elseif>
                </td>
                <td>&nbsp;<% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("status")); if( o != null){out.print(o.getName());}%></td>
                <td>&nbsp;<s:property value="inputuser"/></td>
                <td>&nbsp;${fn:substring(lastchgtime, 0, 19)}</td>
                <td>
                    <s:a href="tbneweco!toEdit.action?e.id=%{id}"  class="btn btn-mini btn-info"><i class="icon-white icon-check"></i>审核</s:a>
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
				$("#deleteA").attr("href","/manage/tbneweco!deletes.action?ids="+ids.serialize()).click(); 
			}
		})
	}
</script>
</body>
</html>
