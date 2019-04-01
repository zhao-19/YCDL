<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>

<link rel="stylesheet" href=/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css" />

<script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>
<style>
	.td_right{text-align: right;}
</style>
<script type="text/javascript">
	$(function() {
		 $("#username").focus();
	});
</script>



<script>
	 	KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#insertfile').click(function() {
					editor.loadPlugin('insertfile', function() {
						editor.plugin.fileDialog({
							insertfile : K('#fujian').val(),
							clickFn : function(url, title) {
								K('#fujian').val(url);
								editor.hideDialog();
							}
						});
					});
				});
				
			});
</script>

</head>

<body>
	<s:form action="fuchizhengce" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 					 
 				
 								<tr>
				<th class="td_right">扶持政策名称</th>
				<td style="text-align: left;" colspan="3">
				<s:textfield size="120" name="e.mingcheng" id="mingcheng" readonly="false" data-rule="扶持政策名称:required;mingcheng;length[2~128]"/>
				</td>
				</tr>
 					<tr>
				<th class="td_right">扶持政策来源</th>
				<td style="text-align: left;"  colspan="3">
				<s:textfield name="e.laiyuan" id="laiyuan" readonly="false" data-rule="扶持政策来源:required;laiyuan;length[2~24]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">政策类别</th>
				<td style="text-align: left;"  colspan="3">
				
			    <s:select list="#{'高新区政策':'高新区政策','成都市政策':'成都市政策','四川省政策':'四川省政策','国家部委政策':'国家部委政策'}" id="leibie" name="e.leibie"  cssClass="input-medium" 
										listKey="key" listValue="value"  headerKey="" headerValue=""  data-rule="政策类别:required;leibie"/>
			
			
			
			
				</td>
				</tr>
 					
 								<tr>
 			 
				<td  style="text-align: left;"    >
				<input type="button" name="insertfile"  id="insertfile" value="关联政策文件下载" class="btn btn-success"/>
					</td>
					<td style="text-align: left;"  colspan="3">
								<s:textfield type="text" id="fujian" name="e.fujian"   style="width: 600px;"  />
								 
				</td>
					
					
				</tr>
 								<tr>
				<th class="td_right">政策内容</th>
				<td style="text-align: left;"  colspan="3">
 					<s:textarea rows="3" cols="80" name="e.neirong" style="width:100%;height:400px;visibility:hidden;" id="neirong" readonly="false"/>
				</td>
				</tr>
 				
 						
 				 
 				 
 				 
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="fuchizhengce!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="fuchizhengce!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
	
	
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="e.neirong"]', {
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
