<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page session="false"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<style type="text/css">
.titleCss {
	background-color: #e6e6e6;
	border: solid 1px #e6e6e6;
	position: relative;
	margin: -1px 0 0 0;
	line-height: 32px;
	text-align: left;
}

.aCss {
	overflow: hidden;
	word-break: keep-all;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-align: left;
	font-size: 12px;
}

.liCss {
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	height: 30px;
	text-align: left;
	margin-left: 10px;
	margin-right: 10px;
}
.table TD{vertical-align:middle;}
INPUT[type='text']{margin-bottom:0px;}
.pageLink{padding-top:2px!important;}
.selectPageLink {padding-top:3px!important;}
select{margin-bottom:0px;height:auto;}
</style>
</head>

<body style="font-size: 12px;">
	<s:form action="systemlog!selectList.action" namespace="/" method="post" theme="simple">
	
				<table class="table table-bordered">
					<tr>
					 
						<td>登陆账号</td>
						<td><s:textfield  name="e.account" id="e.account"/></td>
						
						<td>用户类型</td>
						<td><s:select list="{'管理员','用户','平台用户'}"  headerKey="" headerValue="" 
                             name="e.logintype" label="用户类型"  id="e.logintype"  />  
                            </td>
						
					</tr>
				</table>
				
				<table class="table table-bordered">
					<tr>
						<td colspan="16">
<%-- 							<s:submit method="selectList" value="查询" cssClass="btn btn-primary" /> --%>
<%-- 							<s:a method="selectList" cssClass="btn btn-primary"> --%>
<!-- 								<i class="icon-search icon-white"></i> 查询 -->
<%-- 							</s:a> --%>
							
							<button method="systemlog!selectList.action" class="btn btn-primary" onclick="selectList(this)">
								<i class="icon-search icon-white"></i> 查询
							</button>

							
							
							<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
								<%@ include file="/manage/system/pager.jsp"%>
							</div>
<%-- 							<s:submit method="toAdd" value="添加" cssClass="btn btn-success" /> --%>
<%-- 						<s:submit method="deletes" onclick="return deleteSelect();" value="删除" cssClass="btn btn-danger" /> --%>
						</td>
					</tr>
				</table>
				<table class="table table-bordered">
					<tr style="background-color: #dff0d8">
						<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
						<th style="display: none;">编号</th>
						<th >标题</th>
						<th >账号</th>
<!-- 						<th >类型</th> -->
						<th >登陆时间</th>
						<th >登陆IP</th>
						<th >用户类型</th>
						
<!-- 						<th >操作</th> -->
					</tr>
					<s:iterator value="pager.list">
						<tr>
							<td><input type="checkbox" name="ids"
								value="<s:property value="id"/>" /></td>
							<td style="display: none;">&nbsp;<s:property value="id" /></td>
							<td>&nbsp;<s:property value="title" /></td>
							<td>&nbsp;<s:property value="account" /></td>
<%-- 							<td>&nbsp;<s:property value="type" /></td> --%>
								<td>&nbsp;<s:date name="logintime"  format="yyyy-MM-dd HH:mm:ss"/></td>
							
							<td>&nbsp;<s:property value="loginIP" /></td>
							<td>&nbsp;<s:property value="logintype" /></td>
						</tr>
					</s:iterator>

					<tr>
						<td colspan="17" style="text-align: center;"><%@ include file="/manage/system/pager.jsp"%></td>
					</tr>
				</table>
	</s:form>
</body>
</html>
