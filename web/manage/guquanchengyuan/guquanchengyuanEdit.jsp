<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<style>
	.td_right{text-align: right;}
</style>
 

<script src="../resource/kindeditor-4.1.7/kindeditor.js"></script>
<script src="../resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
 


  	KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#filemanager').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							insertfile : K('#tupian').val(),
							clickFn : function(url, title) {
								K('#tupian').val(url);
								editor.hideDialog();
							}
						});
					});
				});
			});
			
			
</script>


</head>

<body>
	<s:form action="guquanchengyuan" namespace="/manage" theme="simple" id="form">
		<table class="table table-bordered">
		 
			<tr style="display:none;">
				<th>id</th>
				<td><s:hidden name="e.id" /></td>
			</tr>
			 
			  
 								<tr>
				<th class="td_right">关联的股权项目编号</th>
				<td style="text-align: left;">
				<s:textfield name="e.guquanid" id="guquanid" readonly="false"  data-rule="关联的股权项目编号:required;guquanid;length[2~64]"/>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">姓名</th>
				<td style="text-align: left;">
				<s:textfield name="e.xingming" id="xingming" readonly="false" data-rule="姓名:required;xingming;length[2~32]"/>
				</td>
				</tr>
 				
				<tr>
			 
				 
							
				<td style="text-align: left;" colspan="3">
					<input type="button" name="filemanager" id="filemanager" value="照片" class="btn btn-success"/>
					<s:textfield type="text" id="tupian" name="e.tupian"  style="width: 600px;margin-bottom:0px;" 
					data-rule="小图;required;maxPicture;"/>
					<s:if test="e.activities_image!=null">
						<a target="_blank" href="<%=SystemManager.systemSetting.getImagerootpath()%><s:property value="e.tupian" />">
							<img style="max-width: 50px;max-height: 50px;" alt="" src="<%=SystemManager.systemSetting.getImagerootpath()%><s:property value="e.tupian" />">
						</a>
					</s:if>
				</td>
				</tr>
 				
 								<tr>
				<th class="td_right">简介</th>
				<td style="text-align: left;">
				<s:textarea rows="6" cols="80"  name="e.jianjie" id="jianjie" readonly="false" data-rule="简介:required;jianjie;length[2~512]"/>
				</td>
				</tr>
 				
 								 
 				
 								
				   
			<tr >
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="guquanchengyuan!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if>
					<s:else>
						<button method="guquanchengyuan!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else>
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
