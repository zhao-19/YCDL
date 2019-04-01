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
	<s:form action="zhengceshenbao" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			  
 				
 								<tr>
				<th class="td_right">政策名称</th>
				<td style="text-align: left;" colspan="3" >
				<s:textfield name="e.mingcheng" size="120" id="mingcheng" readonly="false" data-rule="政策名称:required;mingcheng;length[2~128]"/>
				</td>
				</tr>
 				
 			    <tr>
				<th class="td_right">指定的申报时间</th>
				<td style="text-align: left;"  colspan="3" >
				<s:textfield name="e.time"  size="120"  id="time" readonly="false" data-rule="length[2~24]"/>
				</td>
				</tr>
 				
 			   <tr>
				<th class="td_right">是否开放</th>
				<td style="text-align: left;"  colspan="3" >
 				
 					<s:select list="%{#application.dic.sf.childs}" listKey="id" listValue="name"   id="shifoukaifang"  name="e.shifoukaifang" label="状态"   />  
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">适应群体</th>
				<td style="text-align: left;"  colspan="3"  >
				<s:textfield name="e.shiyingqunti" size="120" id="shiyingqunti" readonly="false" data-rule="适应群体:required;shiyingqunti;length[2~512]"/>
				</td>
				</tr>
 				
 				 
				
				<tr>
  			 
				<td  style="text-align: left;"    >
				<input type="button" name="insertfile"  id="insertfile" value="操作指南" class="btn btn-success"/>
					</td>
					<td style="text-align: left;"  colspan="3">
								<s:textfield type="text" id="fujian" name="e.fujian"   style="width: 600px;"  />
								 
				</td>
					
					
				</tr>
 				
 								<tr>
				<th class="td_right">申报路径的链接</th>
				<td style="text-align: left;">
				<s:textfield name="e.shenbaolujing" size="120"  id="shenbaolujing" readonly="false" data-rule="关联政策文件下载:required;shenbaolujing;length[2~128]"/>
				</td>
				</tr>
 				 
 								<tr>
				<th class="td_right">政策核心内容</th>
				<td style="text-align: left;"  colspan="3"   >
				<s:textarea  rows="4" cols="120" name="e.hexinneirong"  id="hexinneirong" readonly="false" data-rule="政策核心内容:required;hexinneirong;length[2~1024]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">政策详细内容</th>
				<td style="text-align: left;">
 				<s:textarea name="e.xiangxineirong"  rows="3" cols="80" style="width:100%;height:400px;visibility:hidden;"   id="xiangxineirong" readonly="false"  />
				</td>
				</tr>
 				
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="zhengceshenbao!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="zhengceshenbao!update.action" class="btn btn-success">
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
		editor = K.create('textarea[name="e.xiangxineirong"]', {
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
