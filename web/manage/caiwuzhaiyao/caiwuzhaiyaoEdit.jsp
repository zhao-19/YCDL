<%@ page contentType="text/html; charset=UTF-8"%>
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
	<s:form action="caiwuzhaiyao!" namespace="/" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 					<tr>
				<th class="td_right">财务摘要ID</th>
				<td style="text-align: left;">
				<s:textfield name="e.id" id="id" readonly="false" data-rule="财务摘要ID:required;id;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">企业ID</th>
				<td style="text-align: left;">
				<s:textfield name="e.qyid" id="qyid" readonly="false" data-rule="企业ID:required;qyid;length[2~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">财务摘要类型</th>
				<td style="text-align: left;">
				<s:textfield name="e.type" id="type" readonly="false" data-rule="财务摘要类型:required;type;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">年份</th>
				<td style="text-align: left;">
				<s:textfield name="e.year" id="year" readonly="false" data-rule="年份:required;year;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">月份</th>
				<td style="text-align: left;">
				<s:textfield name="e.month" id="month" readonly="false" data-rule="月份:required;month;length[2~4]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">总资产</th>
				<td style="text-align: left;">
				<s:textfield name="e.zongzichan" id="zongzichan" readonly="false" data-rule="总资产:required;zongzichan;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">流动资产</th>
				<td style="text-align: left;">
				<s:textfield name="e.liudongzichan" id="liudongzichan" readonly="false" data-rule="流动资产:required;liudongzichan;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">固定资产</th>
				<td style="text-align: left;">
				<s:textfield name="e.gudingzichan" id="gudingzichan" readonly="false" data-rule="固定资产:required;gudingzichan;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">总负债</th>
				<td style="text-align: left;">
				<s:textfield name="e.zongfuzhai" id="zongfuzhai" readonly="false" data-rule="总负债:required;zongfuzhai;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">流动负债</th>
				<td style="text-align: left;">
				<s:textfield name="e.liudongfuzhai" id="liudongfuzhai" readonly="false" data-rule="流动负债:required;liudongfuzhai;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">营业收入</th>
				<td style="text-align: left;">
				<s:textfield name="e.yingyeshouru" id="yingyeshouru" readonly="false" data-rule="营业收入:required;yingyeshouru;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">主营业务收入</th>
				<td style="text-align: left;">
				<s:textfield name="e.zyywsr" id="zyywsr" readonly="false" data-rule="主营业务收入:required;zyywsr;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">主营业务成本</th>
				<td style="text-align: left;">
				<s:textfield name="e.zyywcb" id="zyywcb" readonly="false" data-rule="主营业务成本:required;zyywcb;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">营业利润</th>
				<td style="text-align: left;">
				<s:textfield name="e.yingyelirun" id="yingyelirun" readonly="false" data-rule="营业利润:required;yingyelirun;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">利润总额</th>
				<td style="text-align: left;">
				<s:textfield name="e.lirunzonge" id="lirunzonge" readonly="false" data-rule="利润总额:required;lirunzonge;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">净利润</th>
				<td style="text-align: left;">
				<s:textfield name="e.jinliren" id="jinliren" readonly="false" data-rule="净利润:required;jinliren;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">应收帐款</th>
				<td style="text-align: left;">
				<s:textfield name="e.yingshouzhangkuan" id="yingshouzhangkuan" readonly="false" data-rule="应收帐款:required;yingshouzhangkuan;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">存货</th>
				<td style="text-align: left;">
				<s:textfield name="e.cunhuo" id="cunhuo" readonly="false" data-rule="存货:required;cunhuo;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">折旧</th>
				<td style="text-align: left;">
				<s:textfield name="e.zhejiu" id="zhejiu" readonly="false" data-rule="折旧:required;zhejiu;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">资产负债率</th>
				<td style="text-align: left;">
				<s:textfield name="e.zichanfuzhailv" id="zichanfuzhailv" readonly="false" data-rule="资产负债率:required;zichanfuzhailv;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">销售净利率</th>
				<td style="text-align: left;">
				<s:textfield name="e.xsjlv" id="xsjlv" readonly="false" data-rule="销售净利率:required;xsjlv;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">销售毛利率</th>
				<td style="text-align: left;">
				<s:textfield name="e.xsmlv" id="xsmlv" readonly="false" data-rule="销售毛利率:required;xsmlv;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">税收</th>
				<td style="text-align: left;">
				<s:textfield name="e.shuishou" id="shuishou" readonly="false" data-rule="税收:required;shuishou;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">净资产</th>
				<td style="text-align: left;">
				<s:textfield name="e.jingzichan" id="jingzichan" readonly="false" data-rule="净资产:required;jingzichan;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">现金流量</th>
				<td style="text-align: left;">
				<s:textfield name="e.xianjinliu" id="xianjinliu" readonly="false" data-rule="现金流量:required;xianjinliu;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">速运比率</th>
				<td style="text-align: left;">
				<s:textfield name="e.sudongbilv" id="sudongbilv" readonly="false" data-rule="速运比率:required;sudongbilv;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">净资产收益率</th>
				<td style="text-align: left;">
				<s:textfield name="e.jinzichanshouyilv" id="jinzichanshouyilv" readonly="false" data-rule="净资产收益率:required;jinzichanshouyilv;length[2~20]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">是否是预测</th>
				<td style="text-align: left;">
				<s:textfield name="e.shifouyuce" id="shifouyuce" readonly="false" data-rule="是否是预测:required;shifouyuce;length[2~1]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">录入人</th>
				<td style="text-align: left;">
				<s:textfield name="e.inputuser" id="inputuser" readonly="false" data-rule="录入人:required;inputuser;length[2~16]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">录入时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.lurushijian" id="lurushijian" readonly="false" data-rule="录入时间:required;lurushijian;length[2~5]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">上次修改时间</th>
				<td style="text-align: left;">
				<s:textfield name="e.lastchgtime" id="lastchgtime" readonly="false" data-rule="上次修改时间:required;lastchgtime;length[2~3]"/>
				</td>
				</tr>
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="user!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="user!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
