<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>

<link rel="stylesheet" href="../resource/kindeditor-4.1.10/themes/default/default.css" />
<script src="../resource/kindeditor-4.1.10/kindeditor.js"></script>
<script src="../resource/kindeditor-4.1.10/lang/zh_CN.js"></script>

<script>
	 	KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#insertfile').click(function() {
					editor.loadPlugin('insertfile', function() {
						editor.plugin.fileDialog({
							insertfile : K('#fileurl').val(),
							clickFn : function(url, title) {
								K('#fileurl').val(url);
								editor.hideDialog();
							}
						});
					});
				});
			});
</script>
<style>
#insertOrUpdateMsg{
border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;
background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;
}
.btnCCC{
	background-image: url("../img/glyphicons-halflings-white.png");
	background-position: -288px 0;
}
</style>
 
</head>

<body>
	<div class="navbar navbar-inverse" >
		<div id="insertOrUpdateMsg">
			<s:property value="#session.insertOrUpdateMsg"/>
			<%request.getSession().setAttribute("insertOrUpdateMsg", "");//列表页面进行编辑文章的时候,需要清空信息 %>
		</div>
	</div>
	
	<s:form action="fileinfo" namespace="/manage" theme="simple" name="form" id="form" >

		<table class="table table-bordered">
			<tr>
				<td colspan="2" style="text-align: center;">
					<s:if test="e.id=='' or e.id==null">
						<button method="fileinfo!insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
						
					</s:if> 
					<s:else>
						文章ID：<span class="badge badge-success"><s:property value="e.id"/></span>

						<button method="fileinfo!update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
						
				
						<s:if test="e.status.equals(\"y\")">

							<s:a action="fileinfo" method="down" cssClass="btn btn-warning" onclick="return confirm(\"确定不显示此文章吗?\");">
							<s:param name="e.id" value="e.id"/>
							<i class="icon-arrow-down icon-white"></i> 不显示</s:a>
						</s:if>
						<s:else>
							<s:a action="fileinfo" method="up" cssClass="btn btn-warning" onclick="return confirm(\"确定显示此文章吗?\");">
							<s:param name="e.id" value="e.id"/>
							<i class="icon-arrow-up icon-white"></i> 显示</s:a>
						</s:else>
					</s:else>
				</td>
			</tr>
			
				<tr  style="display:none;">
					<th class="td_right">ID</th>
					<td style="text-align: left;">
					<s:textfield name="e.id" id="id" readonly="false" />
					</td>
				</tr>
				
				<tr>
                <th class="td_right">类别</th>
                <td style="text-align: left;">
                <s:select
                        list="%{#request.filetypeList}" listKey="id" listValue="name"
                        name="e.filetype" label="类别" headerKey="" headerValue="" data-rule="类别:required;sort;length[2~64]"/>
                </td>
                </tr>
                
                <tr>
               	<th class="td_right">分站</th>
           		<td style="text-align: left;" >
           			<s:select list="%{#request.areamap}" headerKey="all" headerValue="" theme="simple"
                   		name="e.substation" id="substation"/>
           		</td>
                </tr>
                
                <tr>
                <th class="td_right">优先级（数字越大优先级越高，超过100位hot）</th>
                <td style="text-align: left;">
                <s:textfield name="e.sort" id="sort" readonly="false" data-rule="优先级:required;sort;integer"/>
                </td>
                </tr>
                
				<tr>
				<th class="td_right">标题</th>
				<td style="text-align: left;">
				<s:textfield name="e.title" id="title" readonly="false" data-rule="标题:required;title;length[2~64]"/>
				</td>
				</tr>
 			 
 			 
 				<tr>
				<th class="td_right">简介</th>
				<td style="text-align: left;">
				<s:textarea rows="5" cols="80" name="e.contents" id="contents" readonly="false" data-rule="内容:required;contents;length[2~100]"/>
				
				</td>
				</tr>
 				
				<tr>
					<td  style="text-align: left;">
									<input type="button" name="e.insertfile"  id="insertfile"  value="选择文件" class="btn btn-success"/>
						</td>
						<td style="text-align: left;">
									<s:textfield type="text" id="fileurl" name="e.fileurl"   style="width: 600px;" 
									data-rule="小图;required;maxPicture;"/>
									 
					</td>
					
					
				</tr>
 				  
  	  
		</table>
	</s:form> 

  

</body>
</html>
