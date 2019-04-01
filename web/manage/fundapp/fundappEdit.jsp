<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href="/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">

 
  <link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css" />
<script language="JavaScript" type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>
<style>
	.td_right{text-align: right;}
	select{height:auto;}
</style>
<script type="text/javascript">
	$(function() {
		 $("#username").focus();
	});
</script>
</head>

<body>
 

	<s:form action="fundapp" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 					 
 				
 								<tr>
				<th class="td_right">基金名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.prodname" size="80" id="prodname" readonly="false" data-rule="基金名称:required;prodname;length[1~32]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">企业名称</th>
				<td style="text-align: left;">
				<s:textfield name="e.qiyemingcheng" size="80" id="qiyemingcheng" readonly="false" data-rule="企业名称:required;qiyemingcheng;length[1~128]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">申请金额(万元）</th>
				<td style="text-align: left;">
				<s:textfield name="e.loanamt" id="loanamt" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   readonly="false" data-rule="申请金额:required;loanamt"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">贷款期限（月）</th>
				<td style="text-align: left;">
				<s:textfield name="e.loanterm" id="loanterm" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   readonly="false" data-rule="贷款期限:required;loanterm"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">贷款利率（%）</th>
				<td style="text-align: left;">
				<s:textfield name="e.loanrate" id="loanrate" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   readonly="false" data-rule="贷款利率:required;loanrate"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">担保公司</th>
				<td style="text-align: left;">
				
				<s:select list="#{'无':'无','成都中小担':'成都中小担','成都小保':'成都小保','成都高投担':'成都高投担'}" id="dbgs" name="e.dbgs"  cssClass="input-medium" 
										listKey="key" listValue="value"  headerKey="" headerValue="" data-rule="担保公司:required;dbgs;length[1~32]" />
			
			
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">发放日期</th>
				
					<td style="text-align: left;" >
									 <input id="begindate" class="Wdate search-query" type="text" name="e.begindate"
									value="<s:property value="e.begindate" />"
									onFocus="WdatePicker({isShowClear:false,readOnly:true})" data-rule="起始日期;required"/> 
									</td>
										
										
				</tr>
 				
 								<tr>
				<th class="td_right">到期日期</th>
				
				
				<td style="text-align: left;" >
									 <input id="enddate" class="Wdate search-query" type="text" name="e.enddate"
									value="<s:property value="e.enddate" />"
									onFocus="WdatePicker({isShowClear:false,readOnly:true})" data-rule="起始日期;required"/> 
									</td>
				
				
				</tr>
 				
 							 
 				 
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="fundapp!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="fundapp!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
