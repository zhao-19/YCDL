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
	};
	
	$(function() {
		$("#s_date").attr({ readonly: 'true' });
	});
	
	
	
	 
</script>
</head>        

<body>
	<s:form action="wprecode!dobatch.action" namespace="/manage" theme="simple" id="form" name="form">
	
		
		<table class="table table-bordered" style="width: 95%;margin: auto;">
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
	 					本息计算
	 					
				</td>
			</tr>
			
		
		
		 	<tr  >
			<td style="text-align: right;">本息计算开始日期：</td>
			<td style="text-align: left;"><s:textfield name="e.s_date"  id="s_date"    size="40" maxlength="40"/></td>
			</tr>
	 
			
			
				<tr  >
				<td style="text-align: right;">本息计算到期日期日期</td>
				<td style="text-align: left;">
				<input id="batchdate" class="Wdate search-query" type="text" name="e.batchdate"
				onFocus="WdatePicker({isShowClear:false,readOnly:false})"/></td>
			</tr>
			
			
		 
			<tr>
				<td colspan="2" style="text-align: center;"> 
						
					 
						<button method="wprecode!dobatch.action" onclick="wprecode!dobatch.action"  class="btn btn-success">
							<i class="icon-check icon-white"></i> 计算
						</button>
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
