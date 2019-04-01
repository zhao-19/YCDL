<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>

<script type="text/javascript">

	function onSubmit() {
		if ($.trim($("#name").val()) == "") {
			alert("名称不能为空!");
			$("#title").focus();
			return false;
		}
	}
</script>
</head>        

<body>
	<s:form action="wpcfg" namespace="/manage" theme="simple" id="form" name="form">
	
		
		<table class="table table-bordered" style="width: 95%;margin: auto;">
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
	 					贷款利率配置
	 					
				</td>
			</tr>
			<tr  >
				<td style="text-align: right;">生效日期</td>
				<td style="text-align: left;">
				<input id="eff_day" class="Wdate search-query" type="text" name="e.eff_day"
				value="<s:property value="e.eff_day" />"
				onFocus="WdatePicker({isShowClear:false,readOnly:true})"/></td>
			</tr>
			
		 
			
			<tr  >
			<td style="text-align: right;">半年期利率</td>
			<td style="text-align: left;"><s:textfield name="e.rate_m_6" value=""  id="rate_m_6" data-rule="半年期利率;required;rate_m_6;" size="10" maxlength="10"/></td>
			</tr>
	 
			<tr>
				<td style="text-align: right;">一年期利率：</td>
				<td style="text-align: left;"><s:textfield name="e.rate_y_1" value=""  id="rate_y_1" data-rule="一年期利率;required;rate_y_1;" size="10" maxlength="10"/></td>
			</tr>
			 
			 <tr>
				<td style="text-align: right;">三年期利率：</td>
				<td style="text-align: left;"><s:textfield name="e.rate_y_3" value=""  id="rate_y_3" data-rule="三年期利率;required;rate_y_3;" size="10" maxlength="10"/></td>
			</tr>
			 <tr>
				<td style="text-align: right;">五年期利率：</td>
				<td style="text-align: left;"><s:textfield name="e.rate_y_5" value=""  id="rate_y_5" data-rule="五年期利率;required;rate_y_5;" size="10" maxlength="10"/></td>
	
			</tr>
			<tr>
				<td style="text-align: right;">五年期以上：</td>
				<td style="text-align: left;"><s:textfield name="e.rate_y_99" value=""  id="rate_y_99" data-rule="五年期以上;required;rate_y_99;" size="10" maxlength="10"/></td>
	
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><s:if test="e.eff_day=='' or e.eff_day==null">
						
						<button method="wpcfg!insert.action" onclick="setaction('wpcfg!insert.action')" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if> 
					<s:else>
						<button method="wpcfg!update.action" onclick="setaction('wpcfg!update.action')"  class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
	
 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script language="JavaScript" type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-all.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
 
	
<script type="text/javascript">
	$(function() {
		$("#title").focus();
		
		var ccc = $("#insertOrUpdateMsg").html();
		//console.log("insertOrUpdateMsg="+insertOrUpdateMsg);
		if(ccc!='' && ccc.trim().length>0){
			$("#insertOrUpdateMsg").slideDown(1000).delay(1500).slideUp(1000);
		};
	});
	
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="e.html"]', {
			allowFileManager : true
		});
		K('input[name=getHtml]').click(function(e) {
			alert(editor.html());
		});
		K('input[name=isEmpty]').click(function(e) {
			alert(editor.isEmpty());
		});
		K('input[name=getText]').click(function(e) {
			alert(editor.text());
		});
		K('input[name=selectedHtml]').click(function(e) {
			alert(editor.selectedHtml());
		});
		K('input[name=setHtml]').click(function(e) {
			editor.html('<h3>Hello KindEditor</h3>');
		});
		K('input[name=setText]').click(function(e) {
			editor.text('<h3>Hello KindEditor</h3>');
		});
		K('input[name=insertHtml]').click(function(e) {
			editor.insertHtml('<strong>插入HTML</strong>');
		});
		K('input[name=appendHtml]').click(function(e) {
			editor.appendHtml('<strong>添加HTML</strong>');
		});
		K('input[name=clear]').click(function(e) {
			editor.html('');
		});
	});
</script>
</body>
</html>
