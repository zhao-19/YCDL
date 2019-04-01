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
#insertOrUpdateMsg{
border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;
background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;
}
.btnCCC{
	background-image: url("../img/glyphicons-halflings-white.png");
	background-position: -288px 0;
}
.table TD{vertical-align:middle;}
INPUT[type='text']{margin-bottom:0px;}
select{height:auto;}
</style>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>

<script>
  

 	KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#filemanager').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							insertfile : K('#cover').val(),
							clickFn : function(url, title) {
								K('#cover').val(url);
								//图片压缩
								$.post('/manage/image!narrowImage.action', {path : url});
								editor.hideDialog();
							}
						});
					});
				});
			});
			
			
</script>
</head>

<body>
	<div class="navbar navbar-inverse" >
		<div id="insertOrUpdateMsg">
			<s:property value="#session.insertOrUpdateMsg"/>
			<%request.getSession().setAttribute("insertOrUpdateMsg", "");//列表页面进行编辑文章的时候,需要清空信息 %>
		</div>
	</div>
	<div id="newsmark" style="display: none;">newsmarks</div>
	<s:form action="news" namespace="/manage" theme="simple" name="form" id="form" >
<%-- 		<s:hidden name="type"/> --%>
		<s:hidden name="e.type"/>
		<input type="hidden" value="<s:property value="e.catalogID"/>" id="catalogID"/>
		<table class="table table-bordered">
			
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>文章内容编辑 </strong>
				</td>
			</tr>
			<tr style="display: none;">
				<td>id</td>
				<td><s:hidden name="e.id" label="id" /></td>
			</tr>
		 
			<tr>
				<td style="text-align: right;width: 80px;">标题</td>
				<td style="text-align: left;"><s:textfield name="e.title" style="width: 80%;" id="title" 
				data-rule="标题:required;title;length[1~256];"/></td>
			</tr>
			<tr>
			<td style="text-align: right;width: 80px;">来源</td>
				<td style="text-align: left;">
				
				<s:textfield name="e.source" style="width: 30%;" id="source"  	data-rule="来源:required;source;length[1~64];"/>
				
				
			</tr>
			
			<td style="text-align: right;width: 80px;">标签</td>
				<td style="text-align: left;">
				<s:textfield name="e.label" style="width: 30%;" id="label"	data-rule="标签:required;label;length[1~16];"/>
				</td>
			</tr>
			
			<tr>
				<td style="text-align: right;width: 80px;">发布时间</td>
			

				<td style="text-align: left;"> 
			<input id="d4311" class="Wdate search-query input-small" type="text" name="e.sendtime"
					value="<s:property value="e.sendtime" />"
					onFocus="WdatePicker()" />
				
			</td>				
				</tr>
				
				<tr>
					<td style="text-align: right;">是否审核通过</td>
					<td style="text-align: left;" >
						<s:select list="%{#application.dic.sf.childs}" listKey="id"  
	                            listValue="name" name="e.ischeck" label="状态"  
	                                />  
	            </td>    
			</tr>
  		<tr>
					<td style="text-align: right;">资讯类型</td>
					<td style="text-align: left;" >
						<s:select list="%{#application.dic.zxlx.childs}" listKey="id"  
	                            listValue="name" name="e.cataid" label="资讯类型"  
	                              />  
	            </td>    
			</tr>
			
			<tr>
					<td style="text-align: right;">展示位置</td>
					<td style="text-align: left;" >
						<s:select list="%{#application.dic.showlocation.childs}" listKey="id"  
	                            listValue="name" name="e.showlocation" label="展示位置"  
	                              />  
	            </td>    
			</tr>
			
			<tr>
				<td style="text-align: right;">分站</td>
           		<td style="text-align: left;" colspan="3">
           			<s:select list="%{#application.areasubstmap}" headerKey="all" headerValue="" theme="simple"
                   		name="e.substation" id="substation"/>
           		</td>
			</tr>
			
		 
			
				<tr>
				<td style="text-align: right;">封面图片</td>
				
					<td style="text-align: left;" colspan="3">
						<input type="button" name="filemanager" id="filemanager" value="浏览图片" class="btn btn-success"/>
						<s:textfield type="text" id="cover" name="e.cover" ccc="imagesInput" style="width: 600px;" 
						data-rule="小图;maxPicture;"/>
					 
						<s:if test="e.cover!=null">
							<a target="_blank" href="<s:property value="e.cover" />">
								<img style="max-width: 50px;max-height: 50px;" alt="" src="<s:property value="e.cover" />">
							</a>
						</s:if>
					</td>
								
			</tr>
			
			
			
			<tr>
				<td style="text-align: right;">内容</td>
				<td style="text-align: left;">
					<s:textarea name="e.contents" style="width:100%;height:400px;visibility:hidden;" id="contents"
					data-rule="内容:required;contents;"></s:textarea>
				</td>
			</tr>
			
			
			<tr>
				<td colspan="2" style="text-align: center;">
					
						文章ID：<span class="badge badge-success"><s:property value="e.id"/></span>
						<button method="news!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					
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
		editor = K.create('textarea[name="e.contents"]', {
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
	if ('${msg}' != "") {
		layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
	}
</script>
</body>
</html>
