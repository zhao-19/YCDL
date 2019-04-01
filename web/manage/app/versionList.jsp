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
    </style>
</head>
<body>
<s:form action="appCommon!selectList.action" namespace="/" method="post" theme="simple">
    <table class="table table-bordered table-condensed">
        <!--查询条件-->
        <tr>
             <td style="text-align: right; width: 90px">设备类型</td>
            <td style="text-align: left;" colspan="111">
                <select name="appversion.genre">
				    <option value=""></option>
				    <option value="android">android</option>
				    <option value="ios">ios</option>
				</select>
            </td>
        </tr>
        <tr>
                <td colspan="12">
                 
                    <button method="appCommon!selectList.action"
                        class="btn btn-primary" onclick="selectList(this)">
                        <i class="icon-search icon-white"></i> 查询
                    </button> 

					<s:a method="toAdd" cssClass="btn btn-success">
                        <i class="icon-plus-sign icon-white"></i> 添加
                    </s:a> 

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
           	<th>设备类型</th>
            <th>版本</th>
            <th>更新信息</th>
            <th>是否生效</th>
            <th>是否需要更新</th>
            <th>创建时间</th>
            <th nowrap="nowrap">操作</th>
        </tr>
        </thead>
        <s:iterator value="pager.list">
            <tr>
				<td>&nbsp;${genre }</td>
                <td>&nbsp;${version }</td>
                <td>&nbsp;${info }</td>
                <td>&nbsp;
                	<s:if test="chstatus==10001">是</s:if>
					<s:elseif test="chstatus==10002">否</s:elseif>
                </td>
                <td>&nbsp;
                	<s:if test="isupdate==10601">不需要</s:if>
					<s:elseif test="isupdate==10602"><span style="color:blue;">推荐更新</span></s:elseif>
					<s:elseif test="isupdate==10603"><span style="color:red;">强制更新</span></s:elseif>
                </td>
                <td>&nbsp;<s:date name="create_time" format="yyyy-MM-dd  HH:mm:ss" /></td>
                <td>
                    <s:a href="appCommon!toEdit.action?e.pkid=%{pkid}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
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
	if ('${flag}' != "") {
		alert('${flag}');
	}
</script>
</body>
</html>
