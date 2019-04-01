<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8"
	src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8"
	src="<%=request.getContextPath()%>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<link
    href="../../resource/webuploader/css/webuploader.css"
    type="text/css" rel="stylesheet" />

<link rel="stylesheet" type="text/css"
    href="../../resource/webuploader/examples/image-upload/style.css" />
<style>
select {
	height: auto;
}
</style>
<script>
	KindEditor.ready(function(K) {
		var editor = K.editor({
			allowFileManager : false
		});

		
	K('#filemanager').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					insertfile : K('#logo').val(),
					clickFn : function(url, title) {
						K('#logo').val(url);
						editor.hideDialog();
					}
				});
			});
		});
		K('#filemanager2').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					insertfile : K('#logo2').val(),
					clickFn : function(url, title) {
						K('#logo2').val(url);
						editor.hideDialog();
					}
				});
			});
		});
		//项目图片：
		/* K('#logo').click(function() {
			if (t == 'v') {
				return;
			}
			var val = $(this).attr("id");
			//重新获取窗口宽高
			var inHeight = window.innerHeight;
			var inWidth = window.innerWidth;
			var outHeight = window.outerHeight;
			var outWidth = window.outerWidth;

			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					insertfile : K('#logo').val(),
					clickFn : function(url, title) {
						K('#logo').val(url);
						editor.hideDialog();
						removError(val)
					}
				});
				//重新定位上传图片弹出框在浏览器窗口中居中
				var dlgH = $(".ke-dialog-default").height();
				var dlgW = $(".ke-dialog-default").width();
				//以下公式是计算出浏览器的居中位置
				var nTop = (inHeight - dlgH) / 2;
				var nLeft = (inWidth - dlgW) / 2;
				$('.ke-dialog-default').css({
					"top" : nTop,
					"left" : nLeft
				});
			});
		}); */

	});
</script>
</head>

<body>
	<s:form action="product" namespace="/manage" theme="simple" id="form"
		name="form" method="post">
		<table class="table table-bordered">

			<tr style="display: none;">
				<th>id</th>
				<td colspan="3"><s:hidden name="e.id" /></td>
			</tr>




			<tr>
				<th class="td_right">银行名称</th>
				<td style="text-align: left;"><s:textfield name="e.bankname"
						id="bankname" readonly="false"
						data-rule="银行名称:required;prodid;length[1~32]" /></td>
			</tr>
			<tr>
				<div class="inputtest inputtestl">
					<td class="td_right"><span class="leftname leftnamel"><input
							type="button" name="filemanager" id="filemanager" value="PC端logo（30*30）"
							class="btn btn-success" /></span></td>
					<td style="text-align: left;"><span class="rightinfo"><input
							readonly="readonly" type="text" class="input" id="logo"
							name="e.logo_pc" value="<s:property value='e.logo_pc'/>" /> </span>
							<s:if test="e.logo_pc!=null">
                            <a target="_blank" href="<s:property value="e.logo_pc" />">
                                <img style="max-width: 50px;max-height: 50px;" src="<s:property value='e.logo_pc'/>">
                            </a>
                        </s:if></td>
				</div>
			</tr>
			<tr>
				<div class="inputtest inputtestl">
					<td class="td_right"><span class="leftname leftnamel"><input
							type="button" name="filemanager2" id="filemanager2" value="App端logo（300*300）"
							class="btn btn-success" /></span></td>
					<td style="text-align: left;"><span class="rightinfo"><input
							readonly="readonly" type="text" class="input" id="logo2"
							name="e.logo_app" value="<s:property value='e.logo_app'/>" /> </span>
							<s:if test="e.logo_app!=null">
                            <a target="_blank" href="<s:property value="e.logo_app" />">
                                <img style="max-width: 50px;max-height: 50px;" src="<s:property value='e.logo_app'/>">
                            </a>
                        </s:if></td>
				</div>
			</tr>
			<tr>
                <th class="td_right">录入时间</th>
                <td style="text-align: left;"><s:textfield name="e.lurushijian"
                        id="lurushijian" readonly="true"/></td>
            </tr>
            <tr>
                <th class="td_right">录入人</th>
                <td style="text-align: left;"><s:textfield name="e.inputuser"
                        id="inputuser" readonly="true" /></td>
            </tr>
            <tr>
                <th class="td_right">最后修改时间</th>
                <td style="text-align: left;"><s:textfield name="e.lastchgtime"
                        id="lastchgtime" readonly="true" /></td>
            </tr>
			<tr>
				<td colspan="4" style="text-align: center;"><s:if
						test="e.id=='' or e.id==null">
						<button method="productBank!insert.action" class="btn btn-success"
							onclick="checkloanamt(true)">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</s:if> <s:else>
						<button method="productBank!update.action" class="btn btn-success"
							onclick="checkloanamt(true)">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</s:else></td>
			</tr>
		</table>
	</s:form>
	<%-- <div id="wrapper">
        <div id="container">
            <!--头部，相册选择和格式选择-->

            <div id="uploader">
                <div class="queueList">
                    <div id="dndArea" class="placeholder">
                        <div id="filePicker"></div>
                        <p>或将照片拖到这里，单次最多可选300张</p>
                    </div>
                </div>
                <div class="statusBar" style="display: none;">
                    <div class="progress">
                        <span class="text">0%</span> <span class="percentage"></span>
                    </div>
                    <div class="info"></div>
                    <div class="btns">
                        <div id="filePicker2"></div>
                        <div class="uploadBtn">开始上传</div>
                    </div>
                </div>
            </div>
        </div>
    </div> --%>
    <script type="text/javascript"
        src="../../resource/webuploader/examples/image-upload/jquery.js"></script>
    <script type="text/javascript"
        src="../../resource/webuploader/examples/image-upload/upload.js"></script>
    <script type="text/javascript"
        src="../../resource/webuploader/dist/webuploader.js"></script>
</body>
</html>
