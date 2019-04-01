<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.winpow.services.common.TreeNode" %>   
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/newlayer/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/resource/drag/dragImg.js"></script>

<style>
	.td_right{text-align: right;width: 130px;}
	select{height: auto;}
	.table_title{text-align: left;font-weight: bold;font-size:16px;background-color: #dff0d8;}
	.intro{width: 100%;}
</style>
</head>

<body>
<div id="uploadbg">
    <div id="uploadbox"></div>
</div>
<s:form action="/manage/appCommon!saveAboutus.action" id="form" name="form" theme="simple" method="post">
	<table class="table table-bordered">
       	<tr>
            <td colspan="4" class="table_title">关于我们
            	<s:hidden name="pcaboutus.pkid"/>
            </td>
        </tr>
        <tr>
          <td class="td_right">标题</td>
          <td style="text-align: left;"><s:textfield theme="simple" name="pcaboutus.title" id="title" readonly="false"/></td>
		  <td class="td_right">分站</td>
          <td style="text-align: left;">
              	<s:select list="%{#request.areamap}" headerKey="all" headerValue="" theme="simple"
                      name="pcaboutus.substation" id="substation"/>
          </td>
		</tr>
		<tr>
			<td class="td_right">详细介绍</td>
			<td style="text-align: left;" colspan="3">
				<s:textarea name="pcaboutus.content" id="content" style="width:100%;height:400px;visibility:hidden;"></s:textarea>
			</td>
		</tr>
       	<tr>
       		<td class="td_right">创建人</td>
            <td style="text-align: left;" colspan="3">${pcaboutus.inputuser }</td>
       	</tr>
       	<tr>
            <td class="td_right">创建时间</td>
            <td style="text-align: left;">${fn:substring(pcaboutus.lurushijian, 0, 19)}</td>
       		<td class="td_right">修改时间</td>
            <td style="text-align: left;">${fn:substring(pcaboutus.lastchgtime, 0, 19)}</td>
       	</tr>
      	<tr>
      		<td colspan="4" style="text-align: center;">
      			<span onclick="$('#form').submit();" class="btn btn-success"><i class="icon-ok icon-white"></i>保存</span>
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
		editor = K.create('textarea[name="pcaboutus.content"]', {
			allowFileManager : true,
			filterMode : false,
            afterBlur:function(){this.sync();}
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