<%@page import="com.winpow.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=GBK"%>
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
<s:form action="productczdcwxx!selectList.action" namespace="/" method="post" theme="simple">
	<table class="table table-bordered table-condensed">
		<!--查询条件-->
		<tr>
				
			<td style="text-align: right;">主键</td>
			<td style="text-align: left;" >
				<s:textfield name="e.id" id="id" readonly="false" />
			</td>
 				
			<td style="text-align: right;">主表主键</td>
			<td style="text-align: left;" >
				<s:textfield name="e.releid" id="releid" readonly="false" />
			</td>
 				
			<td style="text-align: right;">最远一期的财务报表的年份</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdyear" id="thirdyear" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第三年总资产</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdzongzichan" id="thirdzongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第三年总负债</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdzongfuzai" id="thirdzongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第三年所有者权益</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdsuoyouzequanyi" id="thirdsuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第三年实收资本</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdshishouzhiben" id="thirdshishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第三年银行借款</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdyinhangjiekuan" id="thirdyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第三年销售收入</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdxiaoshoushouru" id="thirdxiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第三年主营业务</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdzhuyinyewushouru" id="thirdzhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第三年利润总额</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdlirunzonge" id="thirdlirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第三年净利润</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdjinglirun" id="thirdjinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第三年年度纳税</td>
			<td style="text-align: left;" >
				<s:textfield name="e.thirdniandunashui" id="thirdniandunashui" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第二年总资产</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondzongzichan" id="secondzongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第二年总负债</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondzongfuzai" id="secondzongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第二年所有者权益</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondsuoyouzequanyi" id="secondsuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第二年实收资本</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondshishouzhiben" id="secondshishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第二年银行借款</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondyinhangjiekuan" id="secondyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第二年销售收入</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondxiaoshoushouru" id="secondxiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第二年主营业务</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondzhuyinyewushouru" id="secondzhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第二年利润总额</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondlirunzonge" id="secondlirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第二年净利润</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondjinglirun" id="secondjinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第二年年度纳税</td>
			<td style="text-align: left;" >
				<s:textfield name="e.secondniandunashui" id="secondniandunashui" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第一年总资产</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstzongzichan" id="firstzongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第一年总负债</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstzongfuzai" id="firstzongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第一年所有者权益</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstsuoyouzequanyi" id="firstsuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第一年实收资本</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstshishouzhiben" id="firstshishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第一年银行借款</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstyinhangjiekuan" id="firstyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第一年销售收入</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstxiaoshoushouru" id="firstxiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第一年主营业务</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstzhuyinyewushouru" id="firstzhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第一年利润总额</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstlirunzonge" id="firstlirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第一年净利润</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstjinglirun" id="firstjinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">第一年年度纳税</td>
			<td style="text-align: left;" >
				<s:textfield name="e.firstniandunashui" id="firstniandunashui" readonly="false" />
			</td>
 				
			<td style="text-align: right;">毛利率</td>
			<td style="text-align: left;" >
				<s:textfield name="e.maolilv" id="maolilv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">存货周转率</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cunhuozhouzhuanlv" id="cunhuozhouzhuanlv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">流动比率</td>
			<td style="text-align: left;" >
				<s:textfield name="e.liudongbilv" id="liudongbilv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">应收账款周转率</td>
			<td style="text-align: left;" >
				<s:textfield name="e.yingshouzhangkuanzhouzhuanlv" id="yingshouzhangkuanzhouzhuanlv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">速动比率</td>
			<td style="text-align: left;" >
				<s:textfield name="e.sudongbilv" id="sudongbilv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">资产负债率</td>
			<td style="text-align: left;" >
				<s:textfield name="e.zichanfuzhailv" id="zichanfuzhailv" readonly="false" />
			</td>
 				
			<td style="text-align: right;">当前日期</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cudate" id="cudate" readonly="false" />
			</td>
 				
			<td style="text-align: right;">当前总资产</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuzongzichan" id="cuzongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">当前总负债</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuzongfuzai" id="cuzongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">当前所有者权益</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cusuoyouzequanyi" id="cusuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">当前实收资本</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cushishouzhiben" id="cushishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">当前银行借款</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuyinhangjiekuan" id="cuyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">当前销售收入</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuxiaoshoushouru" id="cuxiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">当前主营业务</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuzhuyinyewushouru" id="cuzhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">当前利润总额</td>
			<td style="text-align: left;" >
				<s:textfield name="e.culirunzonge" id="culirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">当前净利润</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cujinglirun" id="cujinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">当前年度纳税</td>
			<td style="text-align: left;" >
				<s:textfield name="e.cuniandunashui" id="cuniandunashui" readonly="false" />
			</td>
 				
			<td style="text-align: right;">去年同期总资产</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastzongzichan" id="lastzongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">去年同期总负债</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastzongfuzai" id="lastzongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">去年同期所有者权益</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastsuoyouzequanyi" id="lastsuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">去年同期实收资本</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastshishouzhiben" id="lastshishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">去年同期银行借款</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastyinhangjiekuan" id="lastyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">去年同期销售收入</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastxiaoshoushouru" id="lastxiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">去年同期主营业务</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastzhuyinyewushouru" id="lastzhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">去年同期利润总额</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastlirunzonge" id="lastlirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">去年同期净利润</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastjinglirun" id="lastjinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">去年同期年度纳税</td>
			<td style="text-align: left;" >
				<s:textfield name="e.lastniandunashui" id="lastniandunashui" readonly="false" />
			</td>
 				
			<td style="text-align: right;">总资产增减量</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changezongzichan" id="changezongzichan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">总负债增减量</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changezongfuzai" id="changezongfuzai" readonly="false" />
			</td>
 				
			<td style="text-align: right;">所有者权益增减量</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changesuoyouzequanyi" id="changesuoyouzequanyi" readonly="false" />
			</td>
 				
			<td style="text-align: right;">实收资本增减量</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changeshishouzhiben" id="changeshishouzhiben" readonly="false" />
			</td>
 				
			<td style="text-align: right;">银行借款增减量</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changeyinhangjiekuan" id="changeyinhangjiekuan" readonly="false" />
			</td>
 				
			<td style="text-align: right;">销售收入增减量</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changexiaoshoushouru" id="changexiaoshoushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">主营业务增减量</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changezhuyinyewushouru" id="changezhuyinyewushouru" readonly="false" />
			</td>
 				
			<td style="text-align: right;">利润总额增减量</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changelirunzonge" id="changelirunzonge" readonly="false" />
			</td>
 				
			<td style="text-align: right;">净利润增减量</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changejinglirun" id="changejinglirun" readonly="false" />
			</td>
 				
			<td style="text-align: right;">年度纳税增减量</td>
			<td style="text-align: left;" >
				<s:textfield name="e.changeniandunashui" id="changeniandunashui" readonly="false" />
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
 				</tr>
		
		<!--按钮-->
		
		<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "productczdcwxx!selectList.action")){%>

					<button method="productczdcwxx!selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "productczdcwxx!insert.action")){%>
					<s:a method="toAdd" cssClass="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</s:a>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "productczdcwxx!deletes.action")){%>
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
 							<th>主表主键</th>
 							<th>最远一期的财务报表的年份</th>
 							<th>第三年总资产</th>
 							<th>第三年总负债</th>
 							<th>第三年所有者权益</th>
 							<th>第三年实收资本</th>
 							<th>第三年银行借款</th>
 							<th>第三年销售收入</th>
 							<th>第三年主营业务</th>
 							<th>第三年利润总额</th>
 							<th>第三年净利润</th>
 							<th>第三年年度纳税</th>
 							<th>第二年总资产</th>
 							<th>第二年总负债</th>
 							<th>第二年所有者权益</th>
 							<th>第二年实收资本</th>
 							<th>第二年银行借款</th>
 							<th>第二年销售收入</th>
 							<th>第二年主营业务</th>
 							<th>第二年利润总额</th>
 							<th>第二年净利润</th>
 							<th>第二年年度纳税</th>
 							<th>第一年总资产</th>
 							<th>第一年总负债</th>
 							<th>第一年所有者权益</th>
 							<th>第一年实收资本</th>
 							<th>第一年银行借款</th>
 							<th>第一年销售收入</th>
 							<th>第一年主营业务</th>
 							<th>第一年利润总额</th>
 							<th>第一年净利润</th>
 							<th>第一年年度纳税</th>
 							<th>毛利率</th>
 							<th>存货周转率</th>
 							<th>流动比率</th>
 							<th>应收账款周转率</th>
 							<th>速动比率</th>
 							<th>资产负债率</th>
 							<th>当前日期</th>
 							<th>当前总资产</th>
 							<th>当前总负债</th>
 							<th>当前所有者权益</th>
 							<th>当前实收资本</th>
 							<th>当前银行借款</th>
 							<th>当前销售收入</th>
 							<th>当前主营业务</th>
 							<th>当前利润总额</th>
 							<th>当前净利润</th>
 							<th>当前年度纳税</th>
 							<th>去年同期总资产</th>
 							<th>去年同期总负债</th>
 							<th>去年同期所有者权益</th>
 							<th>去年同期实收资本</th>
 							<th>去年同期银行借款</th>
 							<th>去年同期销售收入</th>
 							<th>去年同期主营业务</th>
 							<th>去年同期利润总额</th>
 							<th>去年同期净利润</th>
 							<th>去年同期年度纳税</th>
 							<th>总资产增减量</th>
 							<th>总负债增减量</th>
 							<th>所有者权益增减量</th>
 							<th>实收资本增减量</th>
 							<th>银行借款增减量</th>
 							<th>销售收入增减量</th>
 							<th>主营业务增减量</th>
 							<th>利润总额增减量</th>
 							<th>净利润增减量</th>
 							<th>年度纳税增减量</th>
 							<th>录入时间</th>
 							<th>录入人</th>
 							<th>最后修改时间</th>
 						<th nowrap="nowrap">操作</th>
		</tr></thead>
		<s:iterator value="pager.list">
			<tr >
				<td><s:if test="id!=1"><input type="checkbox" name="ids" value="<s:property value="id"/>"/></s:if></td>
				<td  style="display: none;">&nbsp;<s:property value="id"/></td>
				
								<td>&nbsp;<s:property value="id"/></td>
 								<td>&nbsp;<s:property value="releid"/></td>
 								<td>&nbsp;<s:property value="thirdyear"/></td>
 								<td>&nbsp;<s:property value="thirdzongzichan"/></td>
 								<td>&nbsp;<s:property value="thirdzongfuzai"/></td>
 								<td>&nbsp;<s:property value="thirdsuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="thirdshishouzhiben"/></td>
 								<td>&nbsp;<s:property value="thirdyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="thirdxiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="thirdzhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="thirdlirunzonge"/></td>
 								<td>&nbsp;<s:property value="thirdjinglirun"/></td>
 								<td>&nbsp;<s:property value="thirdniandunashui"/></td>
 								<td>&nbsp;<s:property value="secondzongzichan"/></td>
 								<td>&nbsp;<s:property value="secondzongfuzai"/></td>
 								<td>&nbsp;<s:property value="secondsuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="secondshishouzhiben"/></td>
 								<td>&nbsp;<s:property value="secondyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="secondxiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="secondzhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="secondlirunzonge"/></td>
 								<td>&nbsp;<s:property value="secondjinglirun"/></td>
 								<td>&nbsp;<s:property value="secondniandunashui"/></td>
 								<td>&nbsp;<s:property value="firstzongzichan"/></td>
 								<td>&nbsp;<s:property value="firstzongfuzai"/></td>
 								<td>&nbsp;<s:property value="firstsuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="firstshishouzhiben"/></td>
 								<td>&nbsp;<s:property value="firstyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="firstxiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="firstzhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="firstlirunzonge"/></td>
 								<td>&nbsp;<s:property value="firstjinglirun"/></td>
 								<td>&nbsp;<s:property value="firstniandunashui"/></td>
 								<td>&nbsp;<s:property value="maolilv"/></td>
 								<td>&nbsp;<s:property value="cunhuozhouzhuanlv"/></td>
 								<td>&nbsp;<s:property value="liudongbilv"/></td>
 								<td>&nbsp;<s:property value="yingshouzhangkuanzhouzhuanlv"/></td>
 								<td>&nbsp;<s:property value="sudongbilv"/></td>
 								<td>&nbsp;<s:property value="zichanfuzhailv"/></td>
 								<td>&nbsp;<s:property value="cudate"/></td>
 								<td>&nbsp;<s:property value="cuzongzichan"/></td>
 								<td>&nbsp;<s:property value="cuzongfuzai"/></td>
 								<td>&nbsp;<s:property value="cusuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="cushishouzhiben"/></td>
 								<td>&nbsp;<s:property value="cuyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="cuxiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="cuzhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="culirunzonge"/></td>
 								<td>&nbsp;<s:property value="cujinglirun"/></td>
 								<td>&nbsp;<s:property value="cuniandunashui"/></td>
 								<td>&nbsp;<s:property value="lastzongzichan"/></td>
 								<td>&nbsp;<s:property value="lastzongfuzai"/></td>
 								<td>&nbsp;<s:property value="lastsuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="lastshishouzhiben"/></td>
 								<td>&nbsp;<s:property value="lastyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="lastxiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="lastzhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="lastlirunzonge"/></td>
 								<td>&nbsp;<s:property value="lastjinglirun"/></td>
 								<td>&nbsp;<s:property value="lastniandunashui"/></td>
 								<td>&nbsp;<s:property value="changezongzichan"/></td>
 								<td>&nbsp;<s:property value="changezongfuzai"/></td>
 								<td>&nbsp;<s:property value="changesuoyouzequanyi"/></td>
 								<td>&nbsp;<s:property value="changeshishouzhiben"/></td>
 								<td>&nbsp;<s:property value="changeyinhangjiekuan"/></td>
 								<td>&nbsp;<s:property value="changexiaoshoushouru"/></td>
 								<td>&nbsp;<s:property value="changezhuyinyewushouru"/></td>
 								<td>&nbsp;<s:property value="changelirunzonge"/></td>
 								<td>&nbsp;<s:property value="changejinglirun"/></td>
 								<td>&nbsp;<s:property value="changeniandunashui"/></td>
 								<td>&nbsp;<s:property value="lurushijian"/></td>
 								<td>&nbsp;<s:property value="inputuser"/></td>
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
					<s:a href="productczdcwxx!toEdit.action?e.id=%{id}">编辑</s:a>
				</td>
			</tr>
		</s:iterator>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</s:form>
</body>
</html>
