<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.appUtil.AppUtil"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.product-name {
	display: inline-block;
	width: 250px;
	overflow: hidden; /*注意不要写在最后了*/
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}
.table TD{vertical-align:middle;}
INPUT[type='text']{margin-bottom:0px;}
select{height:auto;}
</style>

</head>

<body>
	<s:form action="wploan" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered table-condensed">
			<tr>
				<td style="text-align: right;width:70px;">公司名称</td>
				<td style="text-align: left;"><s:textfield name="e.compname" cssClass="search-query input-small" id="compname" /></td>
				<td style="text-align: right;width:70px;">贷款产品</td>
				<td style="text-align: left;"><s:textfield name="e.prodname" cssClass="search-query input-small" id="prodname" /></td>
				<td style="text-align: right;width:70px;">区域</td>
				<td style="text-align: left;">
					<s:select list="#{'':'',1:'高新区内',2:'高新区外'}" id="area" name="e.area"  cssClass="input-small" 
						listKey="key" listValue="value"  />
				</td>				
				<td style="text-align: right;width:70px;">行业分类</td>
			  <td style="text-align: left;">
					<s:select list="#{'':'',1:'下一代信息技术',2:'节能环保',3:'高端装备',4:'生物产业',5:'生产性服务业',6:'其他'}" id="industry" name="e.industry"  cssClass="input-medium" listKey="key" listValue="value"  />
				</td>
				  <td style="text-align: right;width:70px;">担保平台</td>
				<td style="text-align: left;">
					<s:select list="#{'':'',1:'中小担',2:'高投担'}" id="guranplant" name="e.guranplant"  cssClass="input-small" 
						listKey="key" listValue="value"  />
				</td>
			</tr>
			<tr>
	 
				<td style="text-align: right;width:70px;">发放日期</td>
				<td style="text-align: left;" colspan="3">
					<input id="d4311" class="Wdate search-query input-small" type="text" name="e.begindate1"
					value="<s:property value="e.begindate1" />"
					onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
					~ 
					<input id="d4312" class="Wdate search-query input-small" type="text" name="e.begindate2" 
					value="<s:property value="e.begindate2" />"
					onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
				</td>

				<td style="text-align: right;width:70px;">到期日期	</td>
				
				<td style="text-align: left;" colspan="5">
					<input id="d4313" class="Wdate search-query input-small" type="text" name="e.enddate1"
					value="<s:property value="e.enddate1" />"
					onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4314\')||\'2020-10-01\'}'})"/>
					~ 
					<input id="d4314" class="Wdate search-query input-small" type="text" name="e.enddate2" 
					value="<s:property value="e.enddate2" />"
					onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4313\')}',maxDate:'2020-10-01'})"/>
				</td>

			</tr>
			<tr>
				<td colspan="20">
					<%if(PrivilegeUtil.check(request.getSession(), "product!selectList.action")){%>
						<button method="wploan!selectList.action" class="btn btn-primary" onclick="selectList(this)">
							<i class="icon-search icon-white"></i> 查询
						</button>
					<%} %>
					
						
						<s:a method="toAdd" cssClass="btn btn-success">
							<i class="icon-plus-sign icon-white"></i> 添加
						</s:a>
					 
				</td>
			</tr>
		</table>

		<table class="table table-bordered table-condensed table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th>公司名称</th>
				<th>贷款产品</th>
				<th>贷款金额(万元)</th>
				<th>发放日期</th>
				<th>到期日期</th>
				<th>执行利率(%)</th>
				<th>还款方式</th>
				<!-- <th>下次结息日</th>
				<th>利息是否逾期</th>
				<th>本金是否逾期</th> -->
				<th>状态</th>
				<th width="60">操作</th>
			</tr>
			<s:iterator value="pager.list">
				<tr>
					<td><input type="checkbox" name="ids"
						value="<s:property value="id"/>" /></td>
					 
					<td>&nbsp;<s:property value="compname" /></td>
					<td>&nbsp;<s:property value="prodname" /></td>
					<td>&nbsp;<s:property value="amt" /> 万</td>
					<td>&nbsp;<s:property value="begindate.substring(0,10)" /></td>
					<td>&nbsp;<s:property value="enddate.substring(0,10)" /></td>

					<td>&nbsp;<s:property value="rate" /> %</td>
					<td>&nbsp;<s:property value="retutype" /></td>
					<%-- <td>&nbsp;<s:property value="netxcalc_date.substring(0,10)" /></td>
					<td>&nbsp;<s:property value="inte_over" /></td>
					<td>&nbsp;<s:property value="amt_over" /></td> --%>
					<td>&nbsp;<% out.print(AppUtil.getCodeName(request.getAttribute("status")));%></td>
					<td ><s:a href="wploan!toEdit.action?e.id=%{id}" class="btn btn-mini btn-info"><i class="icon-white icon-edit"></i>编辑</s:a>
					</td>
				</tr>
			</s:iterator>

			<tr>
				<td colspan="70" style="text-align: center;"><%@ include
						file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
		 

	</s:form>
	
 
</body>
</html>
