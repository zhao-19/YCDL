<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<s:form action="caiwuzhaiyao!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
			<td style="text-align: right;">财务摘要ID</td>
			<td style="text-align: left;" >
				<s:textfield name="e.id" id="id" readonly="false" />
			</td>
 				
			<td style="text-align: right;">企业ID</td>
			<td style="text-align: left;" >
				<s:textfield name="e.qyid" id="qyid" readonly="false" />
			</td>
 				
			<td style="text-align: right;">财务摘要类型</td>
			<td style="text-align: left;" >
				<s:textfield name="e.type" id="type" readonly="false" />
			</td>
 				
			<td style="text-align: right;">年份</td>
			<td style="text-align: left;" >
				<s:textfield name="e.year" id="year" readonly="false" />
			</td>
 				
			<td style="text-align: right;">月份</td>
			<td style="text-align: left;" >
				<s:textfield name="e.month" id="month" readonly="false" />
			</td>
 				
			<td style="text-align: right;">总资产</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zongzichan" id="zongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">流动资产</td>
			<td style="text-align: left;" >
				<s:textfield name="e.liudongzichan" id="liudongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">固定资产</td>
			<td style="text-align: left;" >
				<s:textfield name="e.gudingzichan" id="gudingzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">总负债</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zongfuzhai" id="zongfuzhai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">流动负债</td>
			<td style="text-align: left;" >
				<s:textfield name="e.liudongfuzhai" id="liudongfuzhai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">营业收入</td>
			<td style="text-align: left;" >
				<s:textfield name="e.yingyeshouru" id="yingyeshouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">主营业务收入</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zyywsr" id="zyywsr" readonly="false" />
			</td>
 				
			<td style="text-align: right;">主营业务成本</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zyywcb" id="zyywcb" readonly="false" />
			</td>
 				
			<td style="text-align: right;">营业利润</td>
			<td style="text-align: left;" >
				<s:textfield name="e.yingyelirun" id="yingyelirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">利润总额</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lirunzonge" id="lirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">净利润</td>
			<td style="text-align: left;" >
				<s:textfield name="e.jinliren" id="jinliren" readonly="false" />
			</td>
 				
			<td style="text-align: right;">应收帐款</td>
			<td style="text-align: left;" >
				<s:textfield name="e.yingshouzhangkuan" id="yingshouzhangkuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">存货</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cunhuo" id="cunhuo" readonly="false" />
			</td>
 				
			<td style="text-align: right;">折旧</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zhejiu" id="zhejiu" readonly="false" />
			</td>
 				
			<td style="text-align: right;">资产负债率</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zichanfuzhailv" id="zichanfuzhailv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">销售净利率</td>
			<td style="text-align: left;" >
				<s:textfield name="e.xsjlv" id="xsjlv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">销售毛利率</td>
			<td style="text-align: left;" >
				<s:textfield name="e.xsmlv" id="xsmlv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">税收</td>
			<td style="text-align: left;" >
				<s:textfield name="e.shuishou" id="shuishou" readonly="false" />
			</td>
 				
			<td style="text-align: right;">净资产</td>
			<td style="text-align: left;" >
				<s:textfield name="e.jingzichan" id="jingzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">现金流量</td>
			<td style="text-align: left;" >
				<s:textfield name="e.xianjinliu" id="xianjinliu" readonly="false" />
			</td>
 				
			<td style="text-align: right;">速运比率</td>
			<td style="text-align: left;" >
				<s:textfield name="e.sudongbilv" id="sudongbilv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">净资产收益率</td>
			<td style="text-align: left;" >
				<s:textfield name="e.jinzichanshouyilv" id="jinzichanshouyilv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">是否是预测</td>
			<td style="text-align: left;" >
				<s:textfield name="e.shifouyuce" id="shifouyuce" readonly="false" />
			</td>
 				
			<td style="text-align: right;">录入人</td>
			<td style="text-align: left;" >
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" />
			</td>
 				
			<td style="text-align: right;">录入时间</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" />
			</td>
 				
			<td style="text-align: right;">上次修改时间</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="false" />
			</td>
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "caiwuzhaiyao!selectList.action")){%>

					<button method="caiwuzhaiyao!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "caiwuzhaiyao!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</s:a>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "caiwuzhaiyao!deletes.action")){%>
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
							<th>财务摘要ID</th>
 							<th>企业ID</th>
 							<th>财务摘要类型</th>
 							<th>年份</th>
 							<th>月份</th>
 							<th>总资产</th>
 							<th>流动资产</th>
 							<th>固定资产</th>
 							<th>总负债</th>
 							<th>流动负债</th>
 							<th>营业收入</th>
 							<th>主营业务收入</th>
 							<th>主营业务成本</th>
 							<th>营业利润</th>
 							<th>利润总额</th>
 							<th>净利润</th>
 							<th>应收帐款</th>
 							<th>存货</th>
 							<th>折旧</th>
 							<th>资产负债率</th>
 							<th>销售净利率</th>
 							<th>销售毛利率</th>
 							<th>税收</th>
 							<th>净资产</th>
 							<th>现金流量</th>
 							<th>速运比率</th>
 							<th>净资产收益率</th>
 							<th>是否是预测</th>
 							<th>录入人</th>
 							<th>录入时间</th>
 							<th>上次修改时间</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><s:if test="id!=1"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></s:if></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
								<td>&nbsp;<s:property value="id"/></td>
 								<td>&nbsp;<s:property value="qyid"/></td>
 								<td>&nbsp;<s:property value="type"/></td>
 								<td>&nbsp;<s:property value="year"/></td>
 								<td>&nbsp;<s:property value="month"/></td>
 								<td>&nbsp;<s:property value="zongzichan"/></td>
 								<td>&nbsp;<s:property value="liudongzichan"/></td>
 								<td>&nbsp;<s:property value="gudingzichan"/></td>
 								<td>&nbsp;<s:property value="zongfuzhai"/></td>
 								<td>&nbsp;<s:property value="liudongfuzhai"/></td>
 								<td>&nbsp;<s:property value="yingyeshouru"/></td>
 								<td>&nbsp;<s:property value="zyywsr"/></td>
 								<td>&nbsp;<s:property value="zyywcb"/></td>
 								<td>&nbsp;<s:property value="yingyelirun"/></td>
 								<td>&nbsp;<s:property value="lirunzonge"/></td>
 								<td>&nbsp;<s:property value="jinliren"/></td>
 								<td>&nbsp;<s:property value="yingshouzhangkuan"/></td>
 								<td>&nbsp;<s:property value="cunhuo"/></td>
 								<td>&nbsp;<s:property value="zhejiu"/></td>
 								<td>&nbsp;<s:property value="zichanfuzhailv"/></td>
 								<td>&nbsp;<s:property value="xsjlv"/></td>
 								<td>&nbsp;<s:property value="xsmlv"/></td>
 								<td>&nbsp;<s:property value="shuishou"/></td>
 								<td>&nbsp;<s:property value="jingzichan"/></td>
 								<td>&nbsp;<s:property value="xianjinliu"/></td>
 								<td>&nbsp;<s:property value="sudongbilv"/></td>
 								<td>&nbsp;<s:property value="jinzichanshouyilv"/></td>
 								<td>&nbsp;<s:property value="shifouyuce"/></td>
 								<td>&nbsp;<s:property value="inputuser"/></td>
 								<td>&nbsp;<s:property value="lurushijian"/></td>
 								<td>&nbsp;<s:property value="lastchgtime"/></td>
 								
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
					<s:a href="caiwuzhaiyao!toEdit.action?e.id=%{id}">编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
