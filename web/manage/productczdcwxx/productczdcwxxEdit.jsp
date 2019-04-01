<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<style>
	.td_right{text-align: right;}
</style>
<script type="text/javascript">
	$(function() {
		 $("#username").focus();
	});
</script>
</head>

<body>
	<s:form action="productczdcwxx" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 					<tr>
				<th class="td_right">主键</th>
				<td style="text-align: left;">
				<s:textfield name="e.id" id="id" readonly="false" data-rule="主键:required;id;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">主表主键</th>
				<td style="text-align: left;">
				<s:textfield name="e.releid" id="releid" readonly="false" data-rule="主表主键:required;releid;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">最远一期的财务报表的年份</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdyear" id="thirdyear" readonly="false" data-rule="最远一期的财务报表的年份:required;thirdyear;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第三年总资产</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdzongzichan" id="thirdzongzichan" readonly="false" data-rule="第三年总资产:required;thirdzongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第三年总负债</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdzongfuzai" id="thirdzongfuzai" readonly="false" data-rule="第三年总负债:required;thirdzongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第三年所有者权益</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdsuoyouzequanyi" id="thirdsuoyouzequanyi" readonly="false" data-rule="第三年所有者权益:required;thirdsuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第三年实收资本</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdshishouzhiben" id="thirdshishouzhiben" readonly="false" data-rule="第三年实收资本:required;thirdshishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第三年银行借款</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdyinhangjiekuan" id="thirdyinhangjiekuan" readonly="false" data-rule="第三年银行借款:required;thirdyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第三年销售收入</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdxiaoshoushouru" id="thirdxiaoshoushouru" readonly="false" data-rule="第三年销售收入:required;thirdxiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第三年主营业务</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdzhuyinyewushouru" id="thirdzhuyinyewushouru" readonly="false" data-rule="第三年主营业务:required;thirdzhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第三年利润总额</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdlirunzonge" id="thirdlirunzonge" readonly="false" data-rule="第三年利润总额:required;thirdlirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第三年净利润</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdjinglirun" id="thirdjinglirun" readonly="false" data-rule="第三年净利润:required;thirdjinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第三年年度纳税</th>
				<td style="text-align: left;">
				<s:textfield name="e.thirdniandunashui" id="thirdniandunashui" readonly="false" data-rule="第三年年度纳税:required;thirdniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第二年总资产</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondzongzichan" id="secondzongzichan" readonly="false" data-rule="第二年总资产:required;secondzongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第二年总负债</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondzongfuzai" id="secondzongfuzai" readonly="false" data-rule="第二年总负债:required;secondzongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第二年所有者权益</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondsuoyouzequanyi" id="secondsuoyouzequanyi" readonly="false" data-rule="第二年所有者权益:required;secondsuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第二年实收资本</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondshishouzhiben" id="secondshishouzhiben" readonly="false" data-rule="第二年实收资本:required;secondshishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第二年银行借款</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondyinhangjiekuan" id="secondyinhangjiekuan" readonly="false" data-rule="第二年银行借款:required;secondyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第二年销售收入</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondxiaoshoushouru" id="secondxiaoshoushouru" readonly="false" data-rule="第二年销售收入:required;secondxiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第二年主营业务</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondzhuyinyewushouru" id="secondzhuyinyewushouru" readonly="false" data-rule="第二年主营业务:required;secondzhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第二年利润总额</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondlirunzonge" id="secondlirunzonge" readonly="false" data-rule="第二年利润总额:required;secondlirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第二年净利润</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondjinglirun" id="secondjinglirun" readonly="false" data-rule="第二年净利润:required;secondjinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第二年年度纳税</th>
				<td style="text-align: left;">
				<s:textfield name="e.secondniandunashui" id="secondniandunashui" readonly="false" data-rule="第二年年度纳税:required;secondniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第一年总资产</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstzongzichan" id="firstzongzichan" readonly="false" data-rule="第一年总资产:required;firstzongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第一年总负债</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstzongfuzai" id="firstzongfuzai" readonly="false" data-rule="第一年总负债:required;firstzongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第一年所有者权益</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstsuoyouzequanyi" id="firstsuoyouzequanyi" readonly="false" data-rule="第一年所有者权益:required;firstsuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第一年实收资本</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstshishouzhiben" id="firstshishouzhiben" readonly="false" data-rule="第一年实收资本:required;firstshishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第一年银行借款</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstyinhangjiekuan" id="firstyinhangjiekuan" readonly="false" data-rule="第一年银行借款:required;firstyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第一年销售收入</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstxiaoshoushouru" id="firstxiaoshoushouru" readonly="false" data-rule="第一年销售收入:required;firstxiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第一年主营业务</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstzhuyinyewushouru" id="firstzhuyinyewushouru" readonly="false" data-rule="第一年主营业务:required;firstzhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第一年利润总额</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstlirunzonge" id="firstlirunzonge" readonly="false" data-rule="第一年利润总额:required;firstlirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第一年净利润</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstjinglirun" id="firstjinglirun" readonly="false" data-rule="第一年净利润:required;firstjinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">第一年年度纳税</th>
				<td style="text-align: left;">
				<s:textfield name="e.firstniandunashui" id="firstniandunashui" readonly="false" data-rule="第一年年度纳税:required;firstniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">毛利率</th>
				<td style="text-align: left;">
				<s:textfield name="e.maolilv" id="maolilv" readonly="false" data-rule="毛利率:required;maolilv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">存货周转率</th>
				<td style="text-align: left;">
				<s:textfield name="e.cunhuozhouzhuanlv" id="cunhuozhouzhuanlv" readonly="false" data-rule="存货周转率:required;cunhuozhouzhuanlv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">流动比率</th>
				<td style="text-align: left;">
				<s:textfield name="e.liudongbilv" id="liudongbilv" readonly="false" data-rule="流动比率:required;liudongbilv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">应收账款周转率</th>
				<td style="text-align: left;">
				<s:textfield name="e.yingshouzhangkuanzhouzhuanlv" id="yingshouzhangkuanzhouzhuanlv" readonly="false" data-rule="应收账款周转率:required;yingshouzhangkuanzhouzhuanlv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">速动比率</th>
				<td style="text-align: left;">
				<s:textfield name="e.sudongbilv" id="sudongbilv" readonly="false" data-rule="速动比率:required;sudongbilv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">资产负债率</th>
				<td style="text-align: left;">
				<s:textfield name="e.zichanfuzhailv" id="zichanfuzhailv" readonly="false" data-rule="资产负债率:required;zichanfuzhailv;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">当前日期</th>
				<td style="text-align: left;">
				<s:textfield name="e.cudate" id="cudate" readonly="false" data-rule="当前日期:required;cudate;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">当前总资产</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuzongzichan" id="cuzongzichan" readonly="false" data-rule="当前总资产:required;cuzongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">当前总负债</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuzongfuzai" id="cuzongfuzai" readonly="false" data-rule="当前总负债:required;cuzongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">当前所有者权益</th>
				<td style="text-align: left;">
				<s:textfield name="e.cusuoyouzequanyi" id="cusuoyouzequanyi" readonly="false" data-rule="当前所有者权益:required;cusuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">当前实收资本</th>
				<td style="text-align: left;">
				<s:textfield name="e.cushishouzhiben" id="cushishouzhiben" readonly="false" data-rule="当前实收资本:required;cushishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">当前银行借款</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuyinhangjiekuan" id="cuyinhangjiekuan" readonly="false" data-rule="当前银行借款:required;cuyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">当前销售收入</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuxiaoshoushouru" id="cuxiaoshoushouru" readonly="false" data-rule="当前销售收入:required;cuxiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">当前主营业务</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuzhuyinyewushouru" id="cuzhuyinyewushouru" readonly="false" data-rule="当前主营业务:required;cuzhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">当前利润总额</th>
				<td style="text-align: left;">
				<s:textfield name="e.culirunzonge" id="culirunzonge" readonly="false" data-rule="当前利润总额:required;culirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">当前净利润</th>
				<td style="text-align: left;">
				<s:textfield name="e.cujinglirun" id="cujinglirun" readonly="false" data-rule="当前净利润:required;cujinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">当前年度纳税</th>
				<td style="text-align: left;">
				<s:textfield name="e.cuniandunashui" id="cuniandunashui" readonly="false" data-rule="当前年度纳税:required;cuniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">去年同期总资产</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastzongzichan" id="lastzongzichan" readonly="false" data-rule="去年同期总资产:required;lastzongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">去年同期总负债</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastzongfuzai" id="lastzongfuzai" readonly="false" data-rule="去年同期总负债:required;lastzongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">去年同期所有者权益</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastsuoyouzequanyi" id="lastsuoyouzequanyi" readonly="false" data-rule="去年同期所有者权益:required;lastsuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">去年同期实收资本</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastshishouzhiben" id="lastshishouzhiben" readonly="false" data-rule="去年同期实收资本:required;lastshishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">去年同期银行借款</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastyinhangjiekuan" id="lastyinhangjiekuan" readonly="false" data-rule="去年同期银行借款:required;lastyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">去年同期销售收入</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastxiaoshoushouru" id="lastxiaoshoushouru" readonly="false" data-rule="去年同期销售收入:required;lastxiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">去年同期主营业务</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastzhuyinyewushouru" id="lastzhuyinyewushouru" readonly="false" data-rule="去年同期主营业务:required;lastzhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">去年同期利润总额</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastlirunzonge" id="lastlirunzonge" readonly="false" data-rule="去年同期利润总额:required;lastlirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">去年同期净利润</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastjinglirun" id="lastjinglirun" readonly="false" data-rule="去年同期净利润:required;lastjinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">去年同期年度纳税</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastniandunashui" id="lastniandunashui" readonly="false" data-rule="去年同期年度纳税:required;lastniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">总资产增减量</th>
				<td style="text-align: left;">
				<s:textfield name="e.changezongzichan" id="changezongzichan" readonly="false" data-rule="总资产增减量:required;changezongzichan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">总负债增减量</th>
				<td style="text-align: left;">
				<s:textfield name="e.changezongfuzai" id="changezongfuzai" readonly="false" data-rule="总负债增减量:required;changezongfuzai;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">所有者权益增减量</th>
				<td style="text-align: left;">
				<s:textfield name="e.changesuoyouzequanyi" id="changesuoyouzequanyi" readonly="false" data-rule="所有者权益增减量:required;changesuoyouzequanyi;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">实收资本增减量</th>
				<td style="text-align: left;">
				<s:textfield name="e.changeshishouzhiben" id="changeshishouzhiben" readonly="false" data-rule="实收资本增减量:required;changeshishouzhiben;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">银行借款增减量</th>
				<td style="text-align: left;">
				<s:textfield name="e.changeyinhangjiekuan" id="changeyinhangjiekuan" readonly="false" data-rule="银行借款增减量:required;changeyinhangjiekuan;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">销售收入增减量</th>
				<td style="text-align: left;">
				<s:textfield name="e.changexiaoshoushouru" id="changexiaoshoushouru" readonly="false" data-rule="销售收入增减量:required;changexiaoshoushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">主营业务增减量</th>
				<td style="text-align: left;">
				<s:textfield name="e.changezhuyinyewushouru" id="changezhuyinyewushouru" readonly="false" data-rule="主营业务增减量:required;changezhuyinyewushouru;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">利润总额增减量</th>
				<td style="text-align: left;">
				<s:textfield name="e.changelirunzonge" id="changelirunzonge" readonly="false" data-rule="利润总额增减量:required;changelirunzonge;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">净利润增减量</th>
				<td style="text-align: left;">
				<s:textfield name="e.changejinglirun" id="changejinglirun" readonly="false" data-rule="净利润增减量:required;changejinglirun;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">年度纳税增减量</th>
				<td style="text-align: left;">
				<s:textfield name="e.changeniandunashui" id="changeniandunashui" readonly="false" data-rule="年度纳税增减量:required;changeniandunashui;length[2~9]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">录入时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" data-rule="录入时间:required;lurushijian;length[2~8]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">录入人</th>
				<td style="text-align: left;">
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" data-rule="录入人:required;inputuser;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">最后修改时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="false" data-rule="最后修改时间:required;lastchgtime;length[2~8]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="productczdcwxx!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="productczdcwxx!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
