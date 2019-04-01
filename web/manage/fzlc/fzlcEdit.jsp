<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>

<link rel="stylesheet" href="../resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="../resource/kindeditor-4.1.7/themes/default/default.css" />

<script src="../resource/kindeditor-4.1.7/kindeditor.js"></script>
<script src="../resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>

<style>
	.td_right{text-align: right;}
</style>
<script type="text/javascript">
 
	
		KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#insertfile1').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							insertfile : K('#pic').val(),
							clickFn : function(url, title) {
								K('#pic').val(url);
								editor.hideDialog();
							}
						});
					});
				});
			});
			
			
			
</script>




</head>

<body>
	<s:form action="fzlc" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			 
			 
 				
 								<tr>
				<th class="td_right">时间</th>
				<td style="text-align: left;">
				
				<input id="d4311" class="Wdate search-query input-small" type="text" name="e.shijian"	 id="shijian" value="<s:property value="e.shijian" />" onFocus="WdatePicker()" />
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">内容</th>
				<td style="text-align: left;">
				<s:textarea  rows="6" cols="100" name="e.neirong" id="neirong" readonly="false" data-rule="内容:required;neirong;length[2~512]"/>
				</td>
				</tr>
 				
 			 
				 
			 	<tr>
				<td  style="text-align: left;"   >
				<input type="button" name="insertfile1"  id="insertfile1" value="图片" class="btn btn-success"/>
					</td>
					<td style="text-align: left;"  colspan="3">
								<s:textfield type="text" id="pic" name="e.pic"   style="width: 574px;" 
								data-rule="小图;required;maxPicture;"/>
								 
				</td>
					
				</tr>
 				 
 				 		 
						
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="fzlc!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="fzlc!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
	
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
</body>
</html>
