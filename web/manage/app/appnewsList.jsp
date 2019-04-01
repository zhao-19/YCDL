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
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/newlayer/layer.js"></script>
</head>

<body>
<s:form action="appCommon!getNewsList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
			<td style="text-align: right;">作者</td>
			<td style="text-align: left;" >
				<s:textfield name="appnews.author" id="author" readonly="false" />
			</td>
 		</tr>
		
		<tr>
			<td colspan="2">
					<button method="appCommon!getNewsList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
					<s:a method="getNewsDetail.action" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</s:a>
					<button method="appCommon!deleteNews.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
						<i class="icon-remove-sign icon-white"></i> 删除
					</button>
					
				<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
				</div>
			</td>
		</tr>
	</table>
	
	<!--列表部分-->
	<table class="table table-bordered table-hover">
		<thead>
		<tr style="background-color: #dff0d8">
			<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
				<th>资讯时间</th>
				<th>是否可见</th>
				<th>阅读次数</th>
				<th>标签</th>
				<th>录入人</th>
				<th>修改时间</th>
 				<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><input type="checkbox" name="ids" value="<s:property value="pkid"/>"/></td>
				<td>&nbsp;<s:property value="newstime"/></td>
				<td>&nbsp;<s:if test="enable=='10001'"><span style="color: orange;">是</span></s:if><s:else>否</s:else></td>
				<td>&nbsp;<s:property value="times"/></td>
				<td>&nbsp;<s:property value="label"/></td>
				<td>&nbsp;<s:property value="inputuser"/></td>
				<td>&nbsp;<s:date name="lastchgtime" format="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<s:a href="appCommon!getNewsDetail.action?appnews.pkid=%{pkid}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
<script type="text/javascript">
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 7, title : '提示'});
	}
</script>
</body>
</html>
