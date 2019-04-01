<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
</head>

<body>
<s:form action="zoufang!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
			<td style="text-align: right;">主键</td>
			<td style="text-align: left;" >
				<s:textfield name="e.id" id="id" readonly="false" />
			</td>
 				
			<td style="text-align: right;">企业名称</td>
			<td style="text-align: left;" >
				<s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false" />
			</td>
 				
			<td style="text-align: right;">企业性质</td>
			<td style="text-align: left;" >
				<s:textfield name="e.qiyexingzhi" id="qiyexingzhi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">所在地址</td>
			<td style="text-align: left;" >
				<s:textfield name="e.suozaidizhi" id="suozaidizhi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">成立日期</td>
			<td style="text-align: left;" >
				<s:textfield name="e.chengliriqi" id="chengliriqi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">行业归属</td>
			<td style="text-align: left;" >
				<s:textfield name="e.hangyeguishu" id="hangyeguishu" readonly="false" />
			</td>
 				
			<td style="text-align: right;">注册资本</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zhuceziben" id="zhuceziben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">法人</td>
			<td style="text-align: left;" >
				<s:textfield name="e.faren" id="faren" readonly="false" />
			</td>
 				
			<td style="text-align: right;">法人电话</td>
			<td style="text-align: left;" >
				<s:textfield name="e.farentele" id="farentele" readonly="false" />
			</td>
 				
			<td style="text-align: right;">联系人</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lianxiren" id="lianxiren" readonly="false" />
			</td>
 				
			<td style="text-align: right;">联系人电话</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lianxirentele" id="lianxirentele" readonly="false" />
			</td>
 				
			<td style="text-align: right;">公司简介</td>
			<td style="text-align: left;" >
				<s:textfield name="e.gongsijianjie" id="gongsijianjie" readonly="false" />
			</td>
 				
			<td style="text-align: right;">主要产品</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zhuyaochanpin" id="zhuyaochanpin" readonly="false" />
			</td>
 				
			<td style="text-align: right;">最远的那一年</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdyear" id="thirdyear" readonly="false" />
			</td>
 				
			<td style="text-align: right;">销售收入</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdsell" id="thirdsell" readonly="false" />
			</td>
 				
			<td style="text-align: right;">利润</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdinte" id="thirdinte" readonly="false" />
			</td>
 				
			<td style="text-align: right;">销售收入</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondsell" id="secondsell" readonly="false" />
			</td>
 				
			<td style="text-align: right;">利润</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondinte" id="secondinte" readonly="false" />
			</td>
 				
			<td style="text-align: right;">销售收入</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstsell" id="firstsell" readonly="false" />
			</td>
 				
			<td style="text-align: right;">利润</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstinte" id="firstinte" readonly="false" />
			</td>
 				
			<td style="text-align: right;">其他关注内容</td>
			<td style="text-align: left;" >
				<s:textfield name="e.qitaguanzhuneirong" id="qitaguanzhuneirong" readonly="false" />
			</td>
 				
			<td style="text-align: right;">企业融资需求</td>
			<td style="text-align: left;" >
				<s:textfield name="e.qiyerongzixuqiu" id="qiyerongzixuqiu" readonly="false" />
			</td>
 				
			<td style="text-align: right;">是否跟进</td>
			<td style="text-align: left;" >
				<s:textfield name="e.shifougenjin" id="shifougenjin" readonly="false" />
			</td>
 				
			<td style="text-align: right;">跟进意见</td>
			<td style="text-align: left;" >
				<s:textfield name="e.memo" id="memo" readonly="false" />
			</td>
 				
			<td style="text-align: right;">拜访时间</td>
			<td style="text-align: left;" >
				<s:textfield name="e.baifangshijian" id="baifangshijian" readonly="false" />
			</td>
 				
			<td style="text-align: right;">拜访人</td>
			<td style="text-align: left;" >
				<s:textfield name="e.baifangren" id="baifangren" readonly="false" />
			</td>
 				
			<td style="text-align: right;">录入时间</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" />
			</td>
 				
			<td style="text-align: right;">录入人</td>
			<td style="text-align: left;" >
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" />
			</td>
 				
			<td style="text-align: right;">最后修改时间</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="false" />
			</td>
 				
			<td style="text-align: right;"></td>
			<td style="text-align: left;" >
				<s:textfield name="e.yixiangchanpin" id="yixiangchanpin" readonly="false" />
			</td>
 				
			<td style="text-align: right;"></td>
			<td style="text-align: left;" >
				<s:textfield name="e.genzongdongtai" id="genzongdongtai" readonly="false" />
			</td>
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "zoufang!selectList.action")){%>

					<button method="zoufang!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "zoufang!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</s:a>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "zoufang!deletes.action")){%>
 							<s:submit method="deletes" onclick="return deleteSelect()" value="删除" cssClass="btn btn-danger"/> 
				<%} %>
				
				
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
			<th style="display: none;">id</th>
							<th>主键</th>
 							<th>企业名称</th>
 							<th>企业性质</th>
 							<th>所在地址</th>
 							<th>成立日期</th>
 							<th>行业归属</th>
 							<th>注册资本</th>
 							<th>法人</th>
 							<th>法人电话</th>
 							<th>联系人</th>
 							<th>联系人电话</th>
 							<th>公司简介</th>
 							<th>主要产品</th>
 							<th>最远的那一年</th>
 							<th>销售收入</th>
 							<th>利润</th>
 							<th>销售收入</th>
 							<th>利润</th>
 							<th>销售收入</th>
 							<th>利润</th>
 							<th>其他关注内容</th>
 							<th>企业融资需求</th>
 							<th>是否跟进</th>
 							<th>跟进意见</th>
 							<th>拜访时间</th>
 							<th>拜访人</th>
 							<th>录入时间</th>
 							<th>录入人</th>
 							<th>最后修改时间</th>
 							<th></th>
 							<th></th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><s:if test="id!=1"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></s:if></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
								<td>&nbsp;<s:property value="id"/></td>
 								<td>&nbsp;<s:property value="qiyemingcheng"/></td>
 								<td>&nbsp;<s:property value="qiyexingzhi"/></td>
 								<td>&nbsp;<s:property value="suozaidizhi"/></td>
 								<td>&nbsp;<s:property value="chengliriqi"/></td>
 								<td>&nbsp;<s:property value="hangyeguishu"/></td>
 								<td>&nbsp;<s:property value="zhuceziben"/></td>
 								<td>&nbsp;<s:property value="faren"/></td>
 								<td>&nbsp;<s:property value="farentele"/></td>
 								<td>&nbsp;<s:property value="lianxiren"/></td>
 								<td>&nbsp;<s:property value="lianxirentele"/></td>
 								<td>&nbsp;<s:property value="gongsijianjie"/></td>
 								<td>&nbsp;<s:property value="zhuyaochanpin"/></td>
 								<td>&nbsp;<s:property value="thirdyear"/></td>
 								<td>&nbsp;<s:property value="thirdsell"/></td>
 								<td>&nbsp;<s:property value="thirdinte"/></td>
 								<td>&nbsp;<s:property value="secondsell"/></td>
 								<td>&nbsp;<s:property value="secondinte"/></td>
 								<td>&nbsp;<s:property value="firstsell"/></td>
 								<td>&nbsp;<s:property value="firstinte"/></td>
 								<td>&nbsp;<s:property value="qitaguanzhuneirong"/></td>
 								<td>&nbsp;<s:property value="qiyerongzixuqiu"/></td>
 								<td>&nbsp;<s:property value="shifougenjin"/></td>
 								<td>&nbsp;<s:property value="memo"/></td>
 								<td>&nbsp;<s:property value="baifangshijian"/></td>
 								<td>&nbsp;<s:property value="baifangren"/></td>
 								<td>&nbsp;<s:property value="lurushijian"/></td>
 								<td>&nbsp;<s:property value="inputuser"/></td>
 								<td>&nbsp;<s:property value="lastchgtime"/></td>
 								<td>&nbsp;<s:property value="yixiangchanpin"/></td>
 								<td>&nbsp;<s:property value="genzongdongtai"/></td>
 								
				<td>
					<s:if test="status.equals(\"y\")">
						<img src="<%=request.getContextPath() %>/resource/images/action_check.gif">
					</s:if>
					<s:elseif test="status.equals(\"n\")">
						<img src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
					</s:elseif>
				</td>
				<td>
					<s:if test="username.equals(\"admin\")">
						
					</s:if>
					<s:a href="zoufang!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
